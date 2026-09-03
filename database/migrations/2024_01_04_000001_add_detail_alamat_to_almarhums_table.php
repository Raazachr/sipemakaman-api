<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            $table->string('no_rumah')->nullable()->after('alamat_jalan');
            $table->string('rt', 5)->nullable()->after('no_rumah');
            $table->string('rw', 5)->nullable()->after('rt');
            $table->string('kota_kabupaten')->nullable()->after('kecamatan');
            $table->string('provinsi')->nullable()->after('kota_kabupaten');
        });
    }

    public function down(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            $table->dropColumn(['no_rumah', 'rt', 'rw', 'kota_kabupaten', 'provinsi']);
        });
    }
};
