<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('activity_logs', function (Blueprint $table) {
            $table->id();
            $table->string('user_type')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('user_name')->nullable();
            $table->string('action');         // create | update | delete | import | approve | reject | login
            $table->string('model')->nullable(); // Almarhum, Makam, dst.
            $table->unsignedBigInteger('model_id')->nullable();
            $table->text('description')->nullable();
            $table->unsignedBigInteger('uptd_id')->nullable();
            $table->unsignedBigInteger('tpu_id')->nullable();
            $table->string('ip_address', 45)->nullable();
            $table->timestamps();
        });

        Schema::create('delete_requests', function (Blueprint $table) {
            $table->id();
            $table->morphs('requestable');    // objek yang diminta dihapus (Almarhum/Makam/dll)
            $table->string('reason')->nullable();
            $table->string('status')->default('menunggu'); // menunggu | disetujui | ditolak
            $table->string('requested_by_type')->nullable();
            $table->unsignedBigInteger('requested_by_id')->nullable();
            $table->string('reviewed_by_type')->nullable();
            $table->unsignedBigInteger('reviewed_by_id')->nullable();
            $table->text('review_note')->nullable();
            $table->timestamp('reviewed_at')->nullable();
            $table->unsignedBigInteger('uptd_id')->nullable();
            $table->unsignedBigInteger('tpu_id')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('delete_requests');
        Schema::dropIfExists('activity_logs');
    }
};
