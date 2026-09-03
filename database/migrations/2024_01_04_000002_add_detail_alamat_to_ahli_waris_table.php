<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ahli_waris', function (Blueprint $table) {
            // Kolom 'alamat' lama TETAP ADA (tidak dihapus, supaya data lama tidak hilang),
            // ini tambahan biar bisa diisi sedetail Almarhum kalau dibutuhkan.
            $table->string('alamat_jalan')->nullable()->after('alamat');
            $table->string('no_rumah')->nullable()->after('alamat_jalan');
            $table->string('rt', 5)->nullable()->after('no_rumah');
            $table->string('rw', 5)->nullable()->after('rt');
            $table->string('kelurahan')->nullable()->after('rw');
            $table->string('kecamatan')->nullable()->after('kelurahan');
            $table->string('kota_kabupaten')->nullable()->after('kecamatan');
            $table->string('provinsi')->nullable()->after('kota_kabupaten');
        });
    }

    public function down(): void
    {
        Schema::table('ahli_waris', function (Blueprint $table) {
            $table->dropColumn([
                'alamat_jalan', 'no_rumah', 'rt', 'rw',
                'kelurahan', 'kecamatan', 'kota_kabupaten', 'provinsi',
            ]);
        });
    }
};
