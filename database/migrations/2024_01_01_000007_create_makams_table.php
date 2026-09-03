<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('makams', function (Blueprint $table) {
            $table->id();
            $table->foreignId('blok_id')->constrained('bloks')->cascadeOnDelete();
            $table->string('kode_makam');
            $table->string('nomor_makam');
            $table->enum('status', ['kosong', 'terisi'])->default('kosong');
            $table->text('keterangan')->nullable();
            $table->timestamps();

            $table->unique(['blok_id', 'kode_makam']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('makams');
    }
};
