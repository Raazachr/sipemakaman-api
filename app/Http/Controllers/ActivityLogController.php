<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use App\Models\AdminTpu;
use App\Models\Uptd;
use Illuminate\Http\Request;

class ActivityLogController extends Controller
{
    /**
     * GET /api/activity-logs?per_page=&page=&action=&user_type=
     *
     * SuperAdmin melihat seluruh aktivitas admin; AdminUptd hanya melihat
     * aktivitas AdminTPU di wilayahnya beserta aktivitasnya sendiri.
     */
    public function index(Request $request)
    {
        $query = ActivityLog::latest('id');

        // AdminUptd hanya boleh melihat aktivitas di wilayahnya sendiri, yaitu
        // aktivitas AdminTPU binaannya + aktivitasnya sendiri. Aktivitas
        // SuperAdmin tidak boleh terlihat sama sekali: saring uptd_id saja tidak
        // cukup, karena aktivitas SuperAdmin juga dapat terisi uptd_id (mis. saat
        // SuperAdmin menambah/mengubah UPTD atau TPU), sehingga tanpa batasan
        // user_type log SuperAdmin ikut terbawa.
        if ($request->user() instanceof Uptd) {
            $query->where('uptd_id', $request->user()->getKey())
                ->whereIn('user_type', [class_basename(AdminTpu::class), class_basename(Uptd::class)]);
        }

        if ($request->filled('action')) {
            $query->where('action', $request->action);
        }
        if ($request->filled('user_type')) {
            $query->where('user_type', $request->user_type);
        }

        // Pencarian umum: nama pengguna / deskripsi
        if ($request->filled('q')) {
            $like = '%'.$request->q.'%';
            $query->where(function ($w) use ($like) {
                $w->where('user_name', 'like', $like)
                    ->orWhere('description', 'like', $like);
            });
        }

        // Sort (whitelist kolom yang aman)
        $sortable = ['id', 'created_at', 'action', 'user_type', 'user_name', 'description'];
        $sortBy = in_array($request->input('sort_by'), $sortable, true) ? $request->input('sort_by') : 'id';
        $sortDir = strtolower($request->input('sort_dir', 'desc')) === 'asc' ? 'asc' : 'desc';
        $query->orderBy($sortBy, $sortDir);

        $perPage = min((int) $request->input('per_page', 15), 100);

        return response()->json($query->paginate($perPage));
    }
}