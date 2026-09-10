<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ahli_waris', function (Blueprint $table) {
            $table->string('nik', 20)->nullable()->after('nama_lengkap');
        });
    }

    public function down(): void
    {
        Schema::table('ahli_waris', function (Blueprint $table) {
            $table->dropColumn('nik');
        });
    }
};
