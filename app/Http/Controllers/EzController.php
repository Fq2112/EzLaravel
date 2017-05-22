<?php

namespace App\Http\Controllers;

use App\City;
use App\contact;
use App\Http\Requests;
use App\Marker;
use App\operator;
use App\Tour;
use App\tourform;
use App\travel;
use App\travelform;
use Illuminate\Support\Facades\App;
use PDF;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class EzController extends Controller
{
    public function index()
    {
        $ez = City::all();
        $data = [
            'city' => $ez
        ];
        $location = DB::table('markers')->get();
        $sql = DB::table('tours')->select('cities.name', 'tours.id', 'tours.paket', 'tours.durasi', 'tours.harga', 'tours.keterangan', 'tours.url')->leftjoin('cities', 'tours.city_id', '=', 'cities.id')->get();
        return view('ez/home', $data, compact('sql', 'location'));
    }

    public function contact(Request $request)
    {
        contact::create($request->all());
        return redirect('/ez');
    }

    public function location(Marker $location)
    {
        return view('ez/location', compact('location'));
    }

    public function showtour()
    {
        $ez = City::all();
        $data = [
            'city' => $ez
        ];
        $sql = DB::table('tours')->get();
        $kotaID = Input::get('kota');
        $kota = City::find($kotaID);
        return view('ez/tour/tour', $data, compact('sql', 'kota'));
    }

    public function showtourdetail(Tour $tour)
    {
        $ez = City::all();
        $data = [
            'city' => $ez
        ];
        $sql = DB::table('tourpicts')->select('tourpicts.url', 'tourpicts.caption', 'tours.id', 'tourpicts.tour_id')->leftjoin('tours', 'tourpicts.tour_id', '=', 'tours.id')->get();
        return view('ez/tour/detail', $data, compact('tour', 'sql'));
    }

    public function showTourForm(Tour $tour, Request $request)
    {
        $ez = City::all();
        $data = [
            'city' => $ez
        ];
        $request->all();
        return view('ez/tour/form', $data, compact('tour'));
    }

    public function showReviewTourForm(Request $request)
    {
        $request->all();
        $sql = DB::table('tourforms')->ORDERBY('id', 'desc')->LIMIT(1)->get();
        return view('ez/tour/review', compact('request', 'sql'));
    }

    public function showPaymentTourForm(Request $request)
    {
        $request->all();
        return view('ez/tour/payment', compact('request'));
    }

    public function tourstore(Request $request)
    {
        tourform::create($request->all());
        return redirect('ez/tour/process');
    }

    public function showProcessTourForm()
    {
        $sql = DB::table('tourforms')->ORDERBY('id', 'desc')->LIMIT(1)->get();
        return view('ez/tour/proses', compact('sql'));
    }

    public function eticket(tourform $tourform)
    {
        return view('ez/tour/report', compact('tourform'));
    }

    public function printTicketTour(tourform $tourform)
    {
        $kode = sprintf("%010d", $tourform->id);
        $html = '<center><h2 class="tittle">Tour E-Ticket</h2>
                <span>Ez Travel - Easier to Get Travel!</span><hr><br></center>
                <table>
                                    <tr>
                                        <td>Kode Booking</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $kode . '</strong></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                                    </tr>
                                    <tr>
                                        <td>Destinasi</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $tourform->destination . '</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Nama Lengkap</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $tourform->name . '</strong></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>Tanggal Keberangkatan</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $tourform->tgl_keberangkatan . '</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Jumlah Peserta</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $tourform->jml_orang . ' Orang</strong></td>
                                    </tr>
                </table>';
        $pdf = PDF::loadHTML($html);
//        $pdf = PDF::loadView('ez/tour/report', ['tourform' => $tourform]);
        return $pdf->download('TourTicket_' . $tourform->name . '_' . $tourform->tgl_keberangkatan . '.pdf');
    }


    public function showTravel(travel $travel)
    {
        $asal = Input::get('asal');
        $tgl_berangkat = Input::get('tgl_berangkat');
        $tujuan = Input::get('tujuan');
        $sql = DB::table('travels')->select('travels.id', 'travels.asal', 'travels.tujuan', 'travels.tgl_berangkat', 'travels.jadwal_berangkat', 'travels.tgl_datang', 'travels.jadwal_datang', 'travels.harga', 'operators.nama', 'operators.no_pol', 'operators.jenis_kendaraan', 'operators.kapasitas')->leftjoin('operators', 'travels.operator_id', '=', 'operators.id')->WHERE('asal', $asal)->where('tujuan', $tujuan)->where('tgl_berangkat', $tgl_berangkat)->get();
        return view('ez/travel/travel', compact('sql', 'asal', 'tgl_berangkat', 'tujuan', 'travel'));
    }

    public function showTravelForm(travel $travel, Request $request)
    {
        $nama = Input::get('nama');
        $no_pol = Input::get('no_pol');
        $jenis_kendaraan = Input::get('jenis_kendaraan');
        $kapasitas = Input::get('kapasitas');
        $request->all();
        return view('ez/travel/form', compact('travel', 'nama', 'no_pol', 'jenis_kendaraan', 'kapasitas'));
    }

    public function showReviewTravelForm(Request $request)
    {
        $request->all();
        $sql = DB::table('travelforms')->ORDERBY('id', 'desc')->LIMIT(1)->get();
        return view('ez/travel/review', compact('request', 'sql'));
    }

    public function showPaymentTravelForm(Request $request)
    {
        $request->all();
        return view('ez/travel/payment', compact('request'));
    }

    public function travelstore(Request $request)
    {
        travelform::create($request->all());
        return redirect('ez/travel/process');
    }

    public function showProcessTravelForm()
    {
        $sql = DB::table('travelforms')->ORDERBY('id', 'desc')->LIMIT(1)->get();
        return view('ez/travel/proses', compact('sql'));
    }

    public function eticketTravel(travelform $travelform)
    {
        return view('ez/travel/report', compact('travelform'));
    }

    public function printTicketTravel(travelform $travelform)
    {
        $kode = sprintf("%010d", $travelform->id);
        $html = '<center><h2 class="tittle">Travel E-Ticket</h2>
                <span>Ez Travel - Easier to Get Travel!</span><hr><br></center>
                <table>
                                    <tr>
                                        <td>Kode Booking</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $kode . '</strong></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>Nama Lengkap</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->name . '</strong></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>Operator</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->operator . ' &mdash; ' . $travelform->jenis_kendaraan . '
                                                (' . $travelform->no_pol . ')</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Keberangkatan</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->asal . '
                                                (' . $travelform->tgl_keberangkatan . ' &ndash; ' . $travelform->jadwal_keberangkatan . '
                                                )</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Kedatangan</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->tujuan . '
                                                (' . $travelform->tgl_datang . ' &ndash; ' . $travelform->jadwal_datang . '
                                                )</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Jumlah Penumpang</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->jml_orang . ' Orang</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Catatan Khusus</td>
                                        <td>&nbsp;:&nbsp;&nbsp;</td>
                                        <td><strong>' . $travelform->note . '</strong></td>
                                    </tr>
                </table>';
        $pdf = PDF::loadHTML($html);
        return $pdf->download('TravelTicket_' . $travelform->name . '_' . $travelform->tgl_keberangkatan . '.pdf');
    }
}
