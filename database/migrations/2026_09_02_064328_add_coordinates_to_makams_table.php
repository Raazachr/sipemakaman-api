<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * Catatan: Migrasi ini sengaja tidak melakukan apa-apa karena koordinat
     * makam sudah ditangani oleh tabel terpisah `koordinat_makams` (lihat
     * migrasi 2024_01_01_000008_create_koordinat_makams_table).
     * Relasi sudah terdefinisi di Makam::koordinat() -> HasOne KoordinatMakam.
     */
    public function up(): void
    {
        // intentionally empty — coordinates live in koordinat_makams table
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // intentionally empty
    }
};
