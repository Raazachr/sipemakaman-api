<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('makams', function (Blueprint $table) {
            // status (enum kosong/terisi) tetap dipakai untuk logika internal (cek ketersediaan
            // saat verifikasi pengajuan). status_petak untuk teks tampilan yang lebih deskriptif,
            // sesuai kebutuhan tampilan di peta (statusPetak).
            $table->string('status_petak')->nullable()->after('status');
        });
    }

    public function down(): void
    {
        Schema::table('makams', function (Blueprint $table) {
            $table->dropColumn('status_petak');
        });
    }
};
