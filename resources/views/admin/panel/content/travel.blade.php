@extends('admin.panel.layouts.mcontent')
@section('nav')
    <li class="treeview">
        <a href="#">
            <i class="fa fa-globe"></i> <span>Tours</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="{{url('admin/tourcontent#addtour')}}"><i class="fa fa-pencil-square-o text-aqua"></i> Add Tour</a>
            </li>
            <li><a href="{{url('admin/tourcontent#tour')}}"><i class="fa fa-table text-aqua"></i> View Tour</a></li>
        </ul>
    </li>
    <li class="active treeview menu-open">
        <a href="#">
            <i class="fa fa-bus"></i> <span>Travels</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="{{url('admin/travelcontent#addtravel')}}"><i class="fa fa-pencil-square-o text-teal"></i> Add
                    Travel</a></li>
            <li><a href="{{url('admin/travelcontent#travel')}}"><i class="fa fa-table text-teal"></i> View Travel</a>
            </li>
        </ul>
    </li>
@endsection
@section('content')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Data Tables
                <small>Travel Contents</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{route('admin.dashboard')}}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="{{url('admin/travelcontent')}}">Tables</a></li>
                <li class="active">Travel Tables</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-success" id="travel">
                        <div class="box-header">
                            <h3 class="box-title"><i class="fa fa-bus"></i> &nbsp;All Travel Contents</h3>
                            <div class="box-tools pull-right">
                                <a href="#addtravel">
                                    <button type="button" class="btn btn-box-tool">
                                        <strong><i class="fa fa-plus"></i> ADD TRAVEL</strong>
                                    </button>
                                </a>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                            class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                            class="fa fa-times"></i></button>
                            </div>
                        </div>
                        @if(session('status'))
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;
                                </button>
                                <h4><i class="icon fa fa-trash"></i> Alert!</h4>
                                {{session('status')}}
                            </div>
                        @elseif(session('add'))
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;
                                </button>
                                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                                {{session('add')}}
                            </div>
                    @endif
                    <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Operator</th>
                                    <th>Type</th>
                                    <th>Keberangkatan</th>
                                    <th>Kedatangan</th>
                                    <th>Harga</th>
                                    <th>Created_at</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($travelcontent as $row)
                                    <tr><?php $rupiah = number_format($row->harga, 2, ",", ".")?>
                                        <td>{{$row->id}}</td>
                                        <td>{{$row->nama}}</td>
                                        <td>{{$row->jenis_kendaraan.' ('.$row->no_pol.')'}}</td>
                                        <td>{{$row->asal.' ('.$row->tgl_berangkat.' &mdash; '.$row->jadwal_berangkat.')'}}</td>
                                        <td>{{$row->tujuan.' ('.$row->tgl_datang.' &mdash; '.$row->jadwal_datang.')'}}</td>
                                        <td>Rp{{$rupiah}}</td>
                                        <td>{{$row->created_at}}</td>
                                        <td>
                                            <a href="{{url('admin/travelcontent/'.$row->id.'/edit#travel')}}">
                                                <button class="btn btn-warning">
                                                    <i class="fa fa-edit" data-toggle="tooltip"
                                                       title="EDIT"></i>
                                                </button>
                                            </a>
                                            <a onclick="return confirm('Are you sure wanna delete {{$row->nama}} ?')"
                                               href="{{url('admin/travelcontent/'.$row->id.'/delete')}}">
                                                <button class="btn btn-danger">
                                                    <i class="fa fa-trash" data-toggle="tooltip"
                                                       title="DELETE"></i>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Operator</th>
                                    <th>Type</th>
                                    <th>Keberangkatan</th>
                                    <th>Kedatangan</th>
                                    <th>Harga</th>
                                    <th>Created_at</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <div class="box box-success" id="addtravel">
                        <div class="box-header">
                            <h3 class="box-title"><i class="fa fa-plus-square"></i> &nbsp;Add Travel Content</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                            class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                            class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form method="post" class="form-horizontal" action="{{url('admin/travelcontent/adds')}}">
                                {{ csrf_field() }}
                                <div class="form-group{{ $errors->has('operator_id') ? ' has-error' : '' }} has-feedback">
                                    <label for="inputName" class="col-sm-2 control-label">Operator</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="operator_id">
                                            <option disabled selected>-- Pilih Operator --</option>
                                            @foreach($operator as $row)
                                                <option value="{{$row->id}}">{{$row->nama}}</option>
                                            @endforeach
                                        </select>
                                        <span class="fa fa-bus form-control-feedback"></span>
                                        @if ($errors->has('operator_id'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('operator_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('asal') ? ' has-error' : '' }} has-feedback">
                                    <label for="inputName" class="col-sm-2 control-label">Destinasi</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="asal" id="sel1"
                                                onchange="giveSelection(this.value)" required>
                                            <option disabled>-- Pilih Kota --</option>
                                            <?php $asal = (isset($_GET['asal']) ? strtolower($_GET['asal']) : NULL); ?>
                                            <option value="blitar" selected>Blitar</option>
                                            <option value="kediri">Kediri</option>
                                            <option value="malang">Malang</option>
                                            <option value="sidoarjo">Sidoarjo</option>
                                            <option value="surabaya">Surabaya</option>
                                        </select>
                                        <span class="fa fa-building-o form-control-feedback"></span>
                                        @if ($errors->has('asal'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('asal') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="tujuan" id="sel2">
                                            <option data-option="blitar" value="Kediri">Kediri</option>
                                            <option data-option="blitar" value="Malang">Malang</option>
                                            <option data-option="blitar" value="Sidoarjo">Sidoarjo</option>
                                            <option data-option="blitar" value="Surabaya">Surabaya</option>

                                            <option data-option="kediri" value="Blitar">Blitar</option>
                                            <option data-option="kediri" value="Malang">Malang</option>
                                            <option data-option="kediri" value="Sidoarjo">Sidoarjo</option>
                                            <option data-option="kediri" value="Surabaya">Surabaya</option>

                                            <option data-option="malang" value="Blitar">Blitar</option>
                                            <option data-option="malang" value="Kediri">Kediri</option>
                                            <option data-option="malang" value="Sidoarjo">Sidoarjo</option>
                                            <option data-option="malang" value="Surabaya">Surabaya</option>

                                            <option data-option="sidoarjo" value="Blitar">Blitar</option>
                                            <option data-option="sidoarjo" value="Kediri">Kediri</option>
                                            <option data-option="sidoarjo" value="Malang">Malang</option>
                                            <option data-option="sidoarjo" value="Surabaya">Surabaya</option>

                                            <option data-option="surabaya" value="Blitar">Blitar</option>
                                            <option data-option="surabaya" value="Kediri">Kediri</option>
                                            <option data-option="surabaya" value="Malang">Malang</option>
                                            <option data-option="surabaya" value="Sidoarjo">Sidoarjo</option>
                                        </select>
                                        <span class="fa fa-building form-control-feedback"></span>
                                        @if ($errors->has('tujuan'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('tujuan') }}</strong>
                                            </span>
                                        @endif
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
                                </div>
                                <div class="form-group{{ $errors->has('tgl_berangkat') ? ' has-error' : '' }} has-feedback">
                                    <label for="inputName" class="col-sm-2 control-label">Keberangkatan</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="tgl_berangkat" type="date">
                                        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                                        @if ($errors->has('tgl_berangkat'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('tgl_berangkat') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="jadwal_berangkat" type="time">
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                        @if ($errors->has('jadwal_berangkat'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('jadwal_berangkat') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('tgl_datang') ? ' has-error' : '' }} has-feedback">
                                    <label for="inputName" class="col-sm-2 control-label">Kedatangan</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="tgl_datang" type="date">
                                        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                                        @if ($errors->has('tgl_datang'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('tgl_datang') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="jadwal_datang" type="time">
                                        <span class="glyphicon glyphicon-time form-control-feedback"></span>
                                        @if ($errors->has('jadwal_datang'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('jadwal_datang') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group{{ $errors->has('harga') ? ' has-error' : '' }} has-feedback">
                                    <label for="inputName" class="col-sm-2 control-label">Harga (Rp)</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type="number" min="50000" name="harga">
                                        <span class="glyphicon glyphicon-usd form-control-feedback"></span>
                                        @if ($errors->has('harga'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('harga') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-8">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
@endsection