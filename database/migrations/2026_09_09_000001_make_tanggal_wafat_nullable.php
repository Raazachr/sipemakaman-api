<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            // Data hasil import Excel kadang belum lengkap — jangan sampai
            // satu baris gagal masuk cuma gara-gara tanggal wafat belum diisi.
            $table->date('tanggal_wafat')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('almarhums', function (Blueprint $table) {
            $table->date('tanggal_wafat')->nullable(false)->change();
        });
    }
};
