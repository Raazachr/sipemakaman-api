<?php

namespace App\Http\Controllers;

use App\Models\AdminTpu;
use App\Models\AhliWaris;
use App\Models\Almarhum;
use App\Models\Blok;
use App\Models\DeleteRequest;
use App\Models\Fasilitas;
use App\Models\Makam;
use App\Models\SuperAdmin;
use App\Models\Uptd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Services\ActivityLogger;

class DeleteRequestController extends Controller
{
    private const MODELS = [
        'almarhum' => Almarhum::class,
        'makam' => Makam::class,
        'blok' => Blok::class,
        'fasilitas' => Fasilitas::class,
        'ahli-waris' => AhliWaris::class,
    ];

    public function index(Request $request)
    {
        $query = DeleteRequest::with(['requestable', 'requestedBy'])
            ->latest('id');

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Pencarian umum: alasan / nama pengaju / tipe data
        if ($request->filled('q')) {
            $like = '%'.$request->q.'%';
            $query->where(function ($w) use ($like) {
                $w->where('reason', 'like', $like)
                    ->orWhere('requestable_type', 'like', $like)
                    ->orWhereHas('requestedBy', fn ($u) => $u->where('nama_lengkap', 'like', $like)->orWhere('nama_uptd', 'like', $like)->orWhere('username', 'like', $like));
            });
        }

        $sortable = ['id', 'created_at', 'status', 'reason'];
        $sortBy = in_array($request->input('sort_by'), $sortable, true) ? $request->input('sort_by') : 'id';
        $sortDir = strtolower($request->input('sort_dir', 'desc')) === 'asc' ? 'asc' : 'desc';
        $query->orderBy($sortBy, $sortDir);

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }

    public function store(Request $request)
    {
        $user = $request->user();

        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'type' => ['required', 'in:' . implode(',', array_keys(self::MODELS))],
            'id' => ['required', 'integer'],
            'reason' => ['required', 'string', 'max:500'],
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data tidak valid', 'errors' => $validator->errors()], 422);
        }

        $modelClass = self::MODELS[$request->type];
        $target = $modelClass::findOrFail($request->id);

        if (! $this->authorizeTarget($user, $target)) {
            return response()->json(['message' => 'Target tidak berada di wilayah Anda'], 403);
        }

        if ($target instanceof Almarhum && ! $target->makam_id) {
            // almarhum yang belum ditempatkan tidak perlu approval (aman)
            $target->delete();

            ActivityLogger::log($user, 'delete', 'Menghapus almarhum ' . $target->nama_lengkap, ['tpu_id' => $user->tpu_id]);

            return response()->json(['message' => 'Data berhasil dihapus langsung (belum ditempatkan)']);
        }

        $deleteRequest = DeleteRequest::create([
            'requestable_type' => $modelClass,
            'requestable_id' => $target->id,
            'reason' => $request->reason,
            'status' => 'menunggu',
            'requested_by_type' => get_class($user),
            'requested_by_id' => $user->id,
            'uptd_id' => $user instanceof AdminTpu ? $this->uptdOf($user) : $user->id,
            'tpu_id' => $user instanceof AdminTpu ? $user->tpu_id : null,
        ]);

        ActivityLogger::log($user, 'approve', 'Mengajukan permintaan hapus');

        return response()->json([
            'message' => 'Permintaan penghapusan dikirim ke atasan untuk disetujui',
            'data' => $deleteRequest,
        ], 201);
    }

    public function approve(Request $request, DeleteRequest $deleteRequest)
    {
        if (! $this->authorizeReview($request->user(), $deleteRequest)) {
            return response()->json(['message' => 'Anda tidak memiliki akses'], 403);
        }

        if ($deleteRequest->status !== 'menunggu') {
            return response()->json(['message' => 'Permintaan sudah diproses'], 422);
        }

        DB::transaction(function () use ($request, $deleteRequest) {
            $target = $deleteRequest->requestable;

            // Makam: kembalikan status & koordinatnya
            if ($target instanceof Makam) {
                $target->update(['status' => 'kosong', 'status_petak' => 'Kosong (Tersedia)']);
                $target->koordinat()?->delete();
            }

            // Almarhum: kosongkan makam yang ditempatinya
            if ($target instanceof Almarhum && $target->makam_id) {
                \App\Models\Makam::where('id', $target->makam_id)->update([
                    'status' => 'kosong',
                    'status_petak' => 'Kosong (Tersedia)',
                ]);
            }

            $target->delete();

            $deleteRequest->update([
                'status' => 'disetujui',
                'reviewed_by_type' => get_class($request->user()),
                'reviewed_by_id' => $request->user()->id,
                'review_note' => $request->note,
                'reviewed_at' => now(),
            ]);

            ActivityLogger::log($request->user(), 'delete', 'Menyetujui & menghapus ' . class_basename($target));
        });

        return response()->json(['message' => 'Permintaan disetujui & data dihapus']);
    }

    public function reject(Request $request, DeleteRequest $deleteRequest)
    {
        if (! $this->authorizeReview($request->user(), $deleteRequest)) {
            return response()->json(['message' => 'Anda tidak memiliki akses'], 403);
        }

        if ($deleteRequest->status !== 'menunggu') {
            return response()->json(['message' => 'Permintaan sudah diproses'], 422);
        }

        $deleteRequest->update([
            'status' => 'ditolak',
            'reviewed_by_type' => get_class($request->user()),
            'reviewed_by_id' => $request->user()->id,
            'review_note' => $request->note,
            'reviewed_at' => now(),
        ]);

        ActivityLogger::log($request->user(), 'reject', 'Menolak permintaan hapus');

        return response()->json(['message' => 'Permintaan ditolak']);
    }

    private function authorizeTarget($user, $target): bool
    {
        if ($user instanceof SuperAdmin) {
            return true;
        }

        if ($user instanceof AdminTpu) {
            if ($target instanceof Almarhum) {
                if (! $target->makam_id) {
                    return true;
                }

                return $target->makam->blok->tpu_id === $user->tpu_id;
            }

            if ($target instanceof Fasilitas) {
                return $target->tpu_id === $user->tpu_id;
            }

            if ($target instanceof AhliWaris) {
                return $target->almarhum?->makam
                    ? $target->almarhum->makam->blok->tpu_id === $user->tpu_id
                    : true;
            }

            if ($target instanceof Blok) {
                return $target->tpu_id === $user->tpu_id;
            }

            return $target->blok ? $target->blok->tpu_id === $user->tpu_id : false;
        }

        return false;
    }

    private function authorizeReview($user, DeleteRequest $deleteRequest): bool
    {
        if ($user instanceof SuperAdmin || $user instanceof Uptd) {
            // Semua akun AdminUptd boleh menyetujui/menolak permintaan hapus
            return true;
        }

        return false;
    }

    private function uptdOf(AdminTpu $admin): ?int
    {
        return \App\Models\Tpu::find($admin->tpu_id)?->uptd_id;
    }
}