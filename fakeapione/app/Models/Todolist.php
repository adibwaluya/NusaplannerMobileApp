<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Todolist extends Model
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'planning_language_one',
        'planning_language_two',
        'planning_language_three',
        'planning_document_one',
        'planning_document_two',
        'planning_document_three',
        'planning_bankAccount_one',
        'planning_visa_one',
        'planning_visa_two',
        'planning_anp_one',
        'planning_anp_two',
        'planning_departure_one',
        'planning_departure_two',
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
}


