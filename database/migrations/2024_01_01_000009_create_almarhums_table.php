<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('almarhums', function (Blueprint $table) {
            $table->id();
            // nullable: almarhum bisa didaftarkan dulu sebelum makam ditentukan
            // (misal saat pengajuan masih menunggu verifikasi)
            $table->foreignId('makam_id')->nullable()->unique()->constrained('makams')->nullOnDelete();
            $table->string('nik', 20)->nullable();
            $table->string('nama_lengkap');
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->date('tanggal_lahir')->nullable();
            $table->date('tanggal_wafat');
            $table->string('agama')->nullable();
            $table->string('alamat')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('almarhums');
    }
};
