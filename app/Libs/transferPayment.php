<?php

namespace App\Libs;


class TransferPayment extends PaymentMethod
{
    private $bca;
    private $bri;
    private $bni;
    private $mandiri;
    private $alfamart;

    public function unique_code()
    {
        if ($this->bca || $this->bri || $this->bni || $this->mandiri) {
            $kode = 10;
        } elseif ($this->alfamart) {
            $kode = str_random();
        } else {
            $kode = 0;
        }
        return $kode;
    }

    public static function alfamartPayment()
    {
        return str_random();
    }
}