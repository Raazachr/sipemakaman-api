<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('bloks', function (Blueprint $table) {
            // Sub-blok mengacu ke Blok Utama (1 level saja, sesuai keputusan)
            $table->foreignId('parent_blok_id')->nullable()->after('tpu_id')
                  ->constrained('bloks')->nullOnDelete();

            // Poligon area blok di peta: array titik [{lat, lng}, ...]
            $table->json('corners')->nullable()->after('keterangan');

            // Status ketersediaan di level Blok/Zona (bukan per-makam lagi)
            $table->string('status_ketersediaan')->default('Kosong (Tersedia)')->after('corners');
        });
    }

    public function down(): void
    {
        Schema::table('bloks', function (Blueprint $table) {
            $table->dropConstrainedForeignId('parent_blok_id');
            $table->dropColumn(['corners', 'status_ketersediaan']);
        });
    }
};
