<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class travel extends Model
{
    protected $guarded = ['operator_id'];

    function operator()
    {
        return $this->belongsTo(operator::class);
    }

    protected $fillable = [
        'operator_id', 'asal', 'tujuan', 'tgl_berangkat', 'jadwal_berangkat', 'tgl_datang', 'jadwal_datang', 'harga',
    ];
}
