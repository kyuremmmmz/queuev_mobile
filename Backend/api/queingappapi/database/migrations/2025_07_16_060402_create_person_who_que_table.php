<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('person_who_que', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('full_name');
            $table->enum('queing_type', ['Enrollment', 'Appointment', 'Walk-in']);
            $table->string('queue_number');
            $table->string('room_name');
            $table->enum('status', ['pending', 'serving', 'completed', 'canceled'])->default('pending');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
            $table->unique(['queue_number', 'room_name']);
        });
        Schema::create('current_queue', function (Blueprint $table) {
            $table->id();
            $table->string('room_name')->unique();
            $table->string('current_number')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('person_who_que');
        Schema::dropIfExists('current_queue');
    }
};
