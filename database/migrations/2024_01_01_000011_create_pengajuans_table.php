<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pengajuans', function (Blueprint $table) {
            $table->id();
            $table->string('kode_pengajuan')->unique();
            $table->foreignId('pemohon_id')->constrained('pemohons')->cascadeOnDelete();
            $table->foreignId('tpu_id')->constrained('tpus')->cascadeOnDelete();
            $table->foreignId('almarhum_id')->nullable()->constrained('almarhums')->nullOnDelete();
            // admin yang melakukan verifikasi, null selama masih berstatus menunggu
            $table->foreignId('admin_tpu_id')->nullable()->constrained('admin_tpus')->nullOnDelete();
            $table->enum('status', ['menunggu_verifikasi', 'disetujui', 'ditolak'])
                  ->default('menunggu_verifikasi');
            $table->text('catatan_verifikasi')->nullable();
            $table->timestamp('tanggal_pengajuan')->useCurrent();
            $table->timestamp('tanggal_verifikasi')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pengajuans');
    }
};
