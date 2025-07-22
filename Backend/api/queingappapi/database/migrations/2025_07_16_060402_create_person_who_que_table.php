<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('person_who_que', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->enum('queing_type', ['Enrollment', 'Appointment', 'Walk-in']);
            $table->integer('queue_number')->unique();
            $table->string('room_name');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('person_who_que');
    }
};
