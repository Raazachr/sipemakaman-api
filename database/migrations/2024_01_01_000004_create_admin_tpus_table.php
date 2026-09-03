<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('admin_tpus', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tpu_id')->constrained('tpus')->cascadeOnDelete();
            $table->string('nip')->unique();
            $table->string('username')->unique();
            $table->string('password');
            $table->string('nama_lengkap');
            $table->string('email')->unique();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('admin_tpus');
    }
};
