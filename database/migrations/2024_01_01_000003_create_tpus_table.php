<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tpus', function (Blueprint $table) {
            $table->id();
            $table->foreignId('uptd_id')->nullable()->constrained('uptds')->nullOnDelete();
            $table->string('kode_tpu')->unique();
            $table->string('nama_tpu');
            $table->string('alamat')->nullable();
            $table->string('kelurahan')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kota')->nullable();
            $table->string('provinsi')->nullable();
            $table->enum('status', ['aktif', 'tidak_aktif'])->default('aktif');
            // Untuk kebutuhan PetaTPU: titik tengah peta & zoom default
            $table->decimal('center_lat', 10, 7)->nullable();
            $table->decimal('center_lng', 10, 7)->nullable();
            $table->unsignedTinyInteger('zoom_level')->default(15);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tpus');
    }
};
