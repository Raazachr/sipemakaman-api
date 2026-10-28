<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Kapasitas makam per TPU.
     *
     * Dipakai untuk kartu "Kapasitas Makam" di dashboard. Satu TPU = satu baris,
     * jadi angka kapasitas tiap TPU bisa berbeda dan bisa ditambah/diubah/
     * dihapus sendiri tanpa menyentuh kode.
     */
    public function up(): void
    {
        Schema::create('makam_kapasitas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tpu_id')->constrained('tpus')->cascadeOnDelete();
            $table->unsignedInteger('jumlah')->default(0);
            $table->string('keterangan')->nullable();
            $table->timestamps();

            // Satu TPU hanya boleh punya satu angka kapasitas.
            $table->unique('tpu_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('makam_kapasitas');
    }
};
