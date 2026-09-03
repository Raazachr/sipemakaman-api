<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('uptds', function (Blueprint $table) {
            $table->id();
            $table->string('nip')->unique();
            $table->string('nama_uptd');
            $table->string('alamat')->nullable();
            $table->string('no_telepon')->nullable();
            $table->string('username')->unique();
            $table->string('password');
            $table->string('email')->unique();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('uptds');
    }
};
