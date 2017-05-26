<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class travelform extends Model
{
    protected $table = 'travelforms';
    public $fillable = ['operator', 'jenis_kendaraan', 'no_pol', 'asal', 'tujuan', 'name', 'email', 'handphone', 'tgl_keberangkatan', 'jadwal_keberangkatan', 'tgl_datang', 'jadwal_datang', 'jml_orang', 'total', 'note'];
}
