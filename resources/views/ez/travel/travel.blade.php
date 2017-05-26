@extends('layouts.master')

@section('title', 'Ez Travel - Travels')

@section('content')
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav cl-effect-11">
            <li><a data-hover="Kembali" href="/ez">Kembali</a></li>
            @if (Auth::guest())
                <li>
                    <a data-hover="Login/Register" href="{{ route('login') }}">
                        Login/Register
                    </a>
                </li>
            @else
                <li class="dropdown">
                    <a data-hover="{{Auth::user()->email}}" href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false" style="text-transform: lowercase">
                        {{ Auth::user()->email}} <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="{{url('ez/member/'.Auth::user()->id.'/history')}}"><i
                                        class="fa fa-shopping-cart"></i> Riwayat Pemesanan</a>
                        </li>
                        <li>
                            <a href="{{url('ez/member/'.Auth::user()->id.'/edit')}}"><i class="fa fa-edit"></i> Edit
                                Profile</a>
                        </li>
                        <li>
                            <a href="{{ route('logout') }}"
                               onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                <i class="fa fa-sign-out"></i> Logout
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                  style="display: none;">
                                {{ csrf_field() }}
                            </form>
                        </li>
                    </ul>
                </li>
            @endif
        </ul>
    </div>
    </div><!-- /.container-fluid -->
    </nav>
    </div>
    </div>
    </div>
    </nav>
    <br><br><br><br><br><br><br><br><br><br><br>
    <div class="search-form">
        <div class="container">
            <div class="row">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#hotel" aria-controls="hotel" role="tab"
                                                              data-toggle="tab">TRAVEL</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="hotel">
                        <form id="form_flight_search" method="get" action="/ez/travel">
                            <div class="col-xs-4">
                                <div class="col-xs-12 form-group">
                                    <label for="departCity">Kota Keberangkatan</label>
                                    <select class="form-control" name="asal" id="sel1" required
                                            onchange="giveSelection(this.value)">
                                        <option disabled selected>-- Pilih Kota --</option>
                                        <?php $asal = (isset($_GET['asal']) ? strtolower($_GET['asal']) : NULL); ?>
                                        <option value="Blitar" <?php if ($asal == 'blitar') {
                                            echo 'selected';
                                        } ?>>Blitar
                                        </option>
                                        <option value="Kediri" <?php if ($asal == 'kediri') {
                                            echo 'selected';
                                        } ?>>Kediri
                                        </option>
                                        <option value="Malang" <?php if ($asal == 'malang') {
                                            echo 'selected';
                                        } ?>>Malang
                                        </option>
                                        <option value="Sidoarjo" <?php if ($asal == 'sidoarjo') {
                                            echo 'selected';
                                        } ?>>Sidoarjo
                                        </option>
                                        <option value="Surabaya" <?php if ($asal == 'surabaya') {
                                            echo 'selected';
                                        } ?>>Surabaya
                                        </option>
                                    </select>
                                </div>
                                <div id="calendar-container" class="col-xs-12 form-group">
                                    <label for="departDate">Tanggal Berangkat</label>
                                    <input value="{{$tgl_berangkat}}" type="date" class="form-control"
                                           name="tgl_berangkat"
                                           style="background-color:white" required>
                                </div>
                                <!-- /.form group -->
                            </div>
                            <div class="col-xs-4">
                                <div class="col-xs-12 form-group">
                                    <label for="returnCity">Kota Tujuan</label>
                                    <select class="form-control" name="tujuan" id="sel2">
                                        <?php $tujuan = (isset($_GET['tujuan']) ? strtolower($_GET['tujuan']) : NULL); ?>
                                        <option data-option="Blitar" value="Kediri" <?php if ($tujuan == 'kediri') {
                                            echo 'selected';
                                        } ?>>Kediri
                                        </option>
                                        <option data-option="Blitar" value="Malang" <?php if ($tujuan == 'malang') {
                                            echo 'selected';
                                        } ?>>Malang
                                        </option>
                                        <option data-option="Blitar" value="Sidoarjo" <?php if ($tujuan == 'sidoarjo') {
                                            echo 'selected';
                                        } ?>>Sidoarjo
                                        </option>
                                        <option data-option="Blitar" value="Surabaya" <?php if ($tujuan == 'surabaya') {
                                            echo 'selected';
                                        } ?>>Surabaya
                                        </option>

                                        <option data-option="Kediri" value="Blitar" <?php if ($tujuan == 'blitar') {
                                            echo 'selected';
                                        } ?>>Blitar
                                        </option>
                                        <option data-option="Kediri" value="Malang" <?php if ($tujuan == 'malang') {
                                            echo 'selected';
                                        } ?>>Malang
                                        </option>
                                        <option data-option="Kediri" value="Sidoarjo" <?php if ($tujuan == 'sidoarjo') {
                                            echo 'selected';
                                        } ?>>Sidoarjo
                                        </option>
                                        <option data-option="Kediri" value="Surabaya" <?php if ($tujuan == 'surabaya') {
                                            echo 'selected';
                                        } ?>>Surabaya
                                        </option>

                                        <option data-option="Malang" value="Blitar" <?php if ($tujuan == 'blitar') {
                                            echo 'selected';
                                        } ?>>Blitar
                                        </option>
                                        <option data-option="Malang" value="Kediri" <?php if ($tujuan == 'kediri') {
                                            echo 'selected';
                                        } ?>>Kediri
                                        </option>
                                        <option data-option="Malang" value="Sidoarjo" <?php if ($tujuan == 'sidoarjo') {
                                            echo 'selected';
                                        } ?>>Sidoarjo
                                        </option>
                                        <option data-option="Malang" value="Surabaya" <?php if ($tujuan == 'surabaya') {
                                            echo 'selected';
                                        } ?>>Surabaya
                                        </option>

                                        <option data-option="Sidoarjo" value="Blitar" <?php if ($tujuan == 'blitar') {
                                            echo 'selected';
                                        } ?>>Blitar
                                        </option>
                                        <option data-option="Sidoarjo" value="Kediri" <?php if ($tujuan == 'kediri') {
                                            echo 'selected';
                                        } ?>>Kediri
                                        </option>
                                        <option data-option="Sidoarjo" value="Malang" <?php if ($tujuan == 'malang') {
                                            echo 'selected';
                                        } ?>>Malang
                                        </option>
                                        <option data-option="Sidoarjo"
                                                value="Surabaya" <?php if ($tujuan == 'surabaya') {
                                            echo 'selected';
                                        } ?>>Surabaya
                                        </option>

                                        <option data-option="Surabaya" value="Blitar" <?php if ($tujuan == 'blitar') {
                                            echo 'selected';
                                        } ?>>Blitar
                                        </option>
                                        <option data-option="Surabaya" value="Kediri" <?php if ($tujuan == 'kediri') {
                                            echo 'selected';
                                        } ?>>Kediri
                                        </option>
                                        <option data-option="Surabaya" value="Malang" <?php if ($tujuan == 'malang') {
                                            echo 'selected';
                                        } ?>>Malang
                                        </option>
                                        <option data-option="Surabaya"
                                                value="Sidoarjo" <?php if ($tujuan == 'sidoarjo') {
                                            echo 'selected';
                                        } ?>>Sidoarjo
                                        </option>
                                    </select>
                                </div>
                                <button type="submit" class="col-xs-12 btn btn-primary btn-block">CARI TRAVEL<i
                                            class="glyphicon glyphicon-chevron-right"></i></button>
                            </div>
                            <script>
                                var sel1 = document.querySelector('#sel1');
                                var sel2 = document.querySelector('#sel2');
                                var options2 = document.querySelectorAll('option');

                                function giveSelection(selValue) {
                                    sel2.innerHTML = '';
                                    for (var i = 0; i < options2.length; i++) {
                                        if (options2[i].dataset.option === selValue) {
                                            sel2.appendChild(options2[i]);
                                        }
                                    }
                                }

                                giveSelection(sel1.value);
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="promotions">
                <div class="container">
                    <h2 class="tittle">Hasil Pencarian</h2>
                    <span style="text-transform: capitalize"><i class="fa fa-road"> {{$asal}} <i
                                    class="fa fa-long-arrow-right"></i> {{$tujuan}}</i> &nbsp;<i
                                class="fa fa-arrows-v"></i>&nbsp; <i
                                class="fa fa-calendar"> {{$tgl_berangkat}}</i>
                    </span>
                    <div class="promotion-grids">
                        <div class="w3-container -align-center center-block">
                            <div class="w3-panel w3-card">
                                <br>
                                <br>
                                <style>
                                    #example1 th {
                                        text-align: center;
                                        vertical-align: middle;
                                    }

                                    #example1 td {
                                        text-align: center;
                                        vertical-align: middle;
                                    }
                                </style>
                                <table class="table table-responsive table-bordered table-hover" width="100%"
                                       id="example1" cellspacing="0">
                                    <thead>
                                    <tr class="bg-primary">
                                        <th>Operator</th>
                                        <th>Tipe</th>
                                        <th>Keberangkatan</th>
                                        <th>Kedatangan</th>
                                        <th>Harga</th>
                                        <th>Tautan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($sql as $row)
                                        <tr>
                                            <td><strong><h3>{{$row->nama}}</h3></strong>
                                                <strong><h5>Nomor Polisi: {{$row->no_pol}}</h5></strong>
                                                <a href="#" id="image" title="Gallery" data-toggle="modal"
                                                   data-target="#myModal1"><i class="fa fa-image"> Lihat
                                                        Kendaraan</i></a>
                                            </td>
                                            <td>
                                                <span class="fa fa-bus"></span>
                                                <strong><h4>{{$row->jenis_kendaraan}}</h4></strong>
                                                Max. {{$row->kapasitas}} Penumpang
                                            </td>
                                            <td>
                                                {{$row->tgl_berangkat}}<br>
                                                <strong><h3>{{$row->jadwal_berangkat}}</h3></strong>
                                                <strong><h4>{{$row->asal}}</h4></strong>
                                            </td>
                                            <td>{{$row->tgl_datang}}<br>
                                                <strong><h3>{{$row->jadwal_datang}}</h3></strong>
                                                <strong><h4>{{$row->tujuan}}</h4></strong></td>
                                            <?php $rupiah = number_format($row->harga, 2, ",", ".");?>
                                            <td>Rp{{$rupiah}}</td>
                                            <td>
                                                <form role="form" method="get" action="/ez/travel/{{$row->id}}/form">
                                                    <input type="hidden" name="nama" value="{{$row->nama}}">
                                                    <input type="hidden" name="no_pol" value="{{$row->no_pol}}">
                                                    <input type="hidden" name="jenis_kendaraan"
                                                           value="{{$row->jenis_kendaraan}}">
                                                    <input type="hidden" name="kapasitas" value="{{$row->kapasitas}}">
                                                    <button type="submit" class="btn btn-primary">Pilih</button>
                                                </form>
                                                {{--<a href="{{url('ez/travel/'.$row->id.'/form')}}">
                                                    <button type="button" class="btn btn-primary">Pilih</button>
                                                </a>--}}
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                    <tfoot>
                                    <tr class="bg-primary">
                                        <th>Operator</th>
                                        <th>Tipe</th>
                                        <th>Keberangkatan</th>
                                        <th>Kedatangan</th>
                                        <th>Harga</th>
                                        <th>Tautan</th>
                                    </tr>
                                    </tfoot>
                                </table>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-info">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="news-gr">
                        <div class="content-carousel" id="beranda">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <img src="/images/travel/bus/pahala_kencana1.JPG">
                                    </div>

                                    <div class="item">
                                        <img src="/images/travel/bus/pahala_kencana2.JPG">
                                    </div>

                                    <div class="item">
                                        <img src="/images/travel/bus/pahala_kencana3.JPG">
                                    </div>

                                    <div class="item">
                                        <img src="/images/travel/bus/pahala_kencana4.JPG">
                                    </div>
                                    <div class="carousel-caption">
                                        <h5 style="color: #e2e2e2"><em>Gambar tersebut hanya sebagai referensi.</em>
                                        </h5>
                                    </div>
                                </div>
                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
