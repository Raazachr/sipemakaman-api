<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ahli_waris', function (Blueprint $table) {
            $table->id();
            $table->foreignId('almarhum_id')->constrained('almarhums')->cascadeOnDelete();
            $table->string('nama_lengkap');
            $table->string('hubungan'); // contoh: anak, istri, suami, orang tua
            $table->string('alamat')->nullable();
            $table->string('no_telepon')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ahli_waris');
    }
};
