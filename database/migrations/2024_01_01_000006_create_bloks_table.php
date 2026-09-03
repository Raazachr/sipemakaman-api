<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('bloks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tpu_id')->constrained('tpus')->cascadeOnDelete();
            $table->string('kode_blok');
            $table->string('nama_blok');
            $table->text('keterangan')->nullable();
            $table->timestamps();

            // kode blok harus unik di dalam satu TPU, tapi boleh sama antar TPU berbeda
            $table->unique(['tpu_id', 'kode_blok']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('bloks');
    }
};
