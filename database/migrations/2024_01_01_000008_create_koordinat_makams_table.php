<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('koordinat_makams', function (Blueprint $table) {
            $table->id();
            // 1 makam hanya punya 1 titik koordinat (relasi one-to-one sesuai class diagram)
            $table->foreignId('makam_id')->unique()->constrained('makams')->cascadeOnDelete();
            $table->decimal('latitude', 10, 8);
            $table->decimal('longitude', 10, 8);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('koordinat_makams');
    }
};
