<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            $table->string('no_registrasi')->nullable()->unique()->after('id');
            $table->string('bin_binti')->nullable()->after('nama_lengkap');
            $table->date('tanggal_dimakamkan')->nullable()->after('tanggal_wafat');

            // Pecah alamat jadi lebih detail (alamat lama tetap ada untuk kompatibilitas)
            $table->string('alamat_jalan')->nullable()->after('alamat');
            $table->string('kelurahan')->nullable()->after('alamat_jalan');
            $table->string('kecamatan')->nullable()->after('kelurahan');
        });
    }

    public function down(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            $table->dropColumn([
                'no_registrasi',
                'bin_binti',
                'tanggal_dimakamkan',
                'alamat_jalan',
                'kelurahan',
                'kecamatan',
            ]);
        });
    }
};
