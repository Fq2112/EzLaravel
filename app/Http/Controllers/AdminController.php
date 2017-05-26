<?php

namespace App\Http\Controllers;

use App\Admin;
use App\contact;
use App\tour;
use App\tourform;
use App\travel;
use App\travelform;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        $sql = DB::table('contacts')->whereraw('created_at = curdate()')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();

        $tour = DB::table('tourforms')->orderby('id', 'desc')->limit(4)->get();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();

        $travel = DB::table('travelforms')->orderby('id', 'desc')->limit(4)->get();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();

        $tourcontent = DB::table('tours')->select('cities.name', 'tours.id', 'tours.paket', 'tours.durasi', 'tours.harga', 'tours.keterangan', 'tours.url')->leftjoin('cities', 'tours.city_id', '=', 'cities.id')->orderby('id', 'desc')->limit(4)->get();
        $travelcontent = DB::table('travels')->select('travels.id', 'travels.asal', 'travels.tujuan', 'travels.tgl_berangkat', 'travels.jadwal_berangkat', 'travels.tgl_datang', 'travels.jadwal_datang', 'travels.harga', 'operators.nama', 'operators.no_pol', 'operators.jenis_kendaraan', 'operators.kapasitas')->leftjoin('operators', 'travels.operator_id', '=', 'operators.id')->orderby('id', 'desc')->limit(4)->get();

        $member = DB::table('users')->whereraw('created_at = curdate()')->count();

        $notif = $contact + $ordertour + $ordertravel + $member;

        return view('admin.panel.dashboard', compact('contact', 'sql', 'tour', 'ordertour', 'travel', 'ordertravel', 'member', 'notif', 'tourcontent', 'travelcontent'));
    }

    public function showEditProfileForm(Admin $admin)
    {
        $sql = DB::table('contacts')->whereraw('created_at = curdate()')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;
        $me = DB::table('admins')->get();
        return view('admin.panel.profile', compact('admin', 'sql', 'contact', 'ordertravel', 'ordertour', 'member', 'notif', 'me'));
    }

    public function updateProfile(Request $request)
    {
        $this->validate($request, [
            'url' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'education' => 'required|string|max:255',
            'skills' => 'required|string|max:255',
            'biography' => 'required|string|max:255',
            'password' => 'required|string|min:6',
            'new_password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:new_password',
        ]);
        $data = $request->all();

        $user = Admin::find(auth()->user()->id);
        if (!Hash::check($data['password'], $user->password)) {
            Session::flash('status', 'Password lama anda salah!');
            return back();
        } else {
//            $request->url->storePubliclyAs('public',$request->url->getClientOriginalName());
            $update = $user->forceFill([
                'url' => $request->url,
                'name' => $request->name,
                'lastname' => $request->lastname,
                'address' => $request->address,
                'education' => $request->education,
                'skills' => $request->skills,
                'biography' => $request->biography,
                'email' => $request->email,
                'password' => bcrypt($request->new_password)
            ])->save();
            if ($update) {
                Session::flash('sukses', 'Successfully, updated!');
                return back();
            } else {
                Session::flash('gagal', 'Failed to update!');
                return back();
            }
        }
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    public function add(Request $request)
    {
        Admin::create([
            'name' => $request->name,
            'lastname' => $request->lastname,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);
        Session::flash('berhasil', 'Successfully, add an Admin');
        return back();
    }

    public function TableAdminDelete(Admin $admin)
    {
        $admin->delete();
        Session::flash('ban', 'Successfully, banned!');
        return back();
    }

    public function TableAdminRestore($admin)
    {
        Admin::withTrashed()->find($admin)->restore();
        Session::flash('restore', 'Successfully, restored!');
        return back();
    }


    public function tables()
    {
        $sql = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;

        $tour = DB::table('tourforms')->get();
        $travel = DB::table('travelforms')->get();
        $users = User::withTrashed()->get();
        $feedback = DB::table('contacts')->get();

        return view('admin.panel.tables', compact('sql', 'contact', 'ordertour', 'ordertravel', 'member', 'notif', 'tour', 'travel', 'users', 'feedback'));
    }

    public function TableTourPrint()
    {
        $tourform = DB::table('tourforms')->orderby('id', 'desc')->get();
        return view('admin.panel.tablesprint.tour', compact('tourform'));
    }

    public function TableTravelPrint()
    {
        $travelform = DB::table('travelforms')->orderby('id', 'desc')->get();
        return view('admin.panel.tablesprint.travel', compact('travelform'));
    }

    public function TableMemberPrint()
    {
        $user = DB::table('users')->orderby('id', 'desc')->get();
        return view('admin.panel.tablesprint.member', compact('user'));
    }

    public function TableMemberDelete(User $user)
    {
        $user->delete();
        Session::flash('status', 'Successfully, banned!');
        return redirect('admin/tables#member');
    }

    public function TableMemberRestore($user)
    {
        User::withTrashed()->find($user)->restore();
        Session::flash('status', 'Successfully, restored!');
        return redirect('admin/tables#member');
    }

    public function TableFeedbackPrint()
    {
        $contact = DB::table('contacts')->orderby('id', 'desc')->get();
        return view('admin.panel.tablesprint.feedback', compact('contact'));
    }

    //tour
    public function showTourContent()
    {
        $sql = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;
        $city = DB::table('cities')->get();

        $tourcontent = DB::table('tours')->select('cities.name', 'tours.id', 'tours.paket', 'tours.durasi', 'tours.harga', 'tours.keterangan', 'tours.url', 'tours.fasilitas', 'tours.transportasi', 'tours.created_at')->leftjoin('cities', 'tours.city_id', '=', 'cities.id')->get();
        return view('admin.panel.content.tour', compact('sql', 'contact', 'ordertour', 'ordertravel', 'member', 'notif', 'tourcontent', 'city'));
    }

    public function deleteTourContent(tour $tour)
    {
        $tour->delete();
        Session::flash('status', 'Successfully, deleted!');
        return back();
    }

    public function storeTourContent(Request $request)
    {
        tour::create($request->all());
        Session::flash('add', 'Successfully, added!');
        return redirect('admin/tourcontent#tour');
    }

    public function showEditTourForm(tour $tour)
    {
        $sql = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;
        $city = DB::table('cities')->get();
        $tourcontent = DB::table('tours')->select('cities.name', 'tours.id', 'tours.paket', 'tours.durasi', 'tours.harga', 'tours.keterangan', 'tours.url', 'tours.fasilitas', 'tours.transportasi', 'tours.created_at')->leftjoin('cities', 'tours.city_id', '=', 'cities.id')->get();
        return view('admin.panel.content.edittour', compact('sql', 'contact', 'ordertour', 'ordertravel', 'member', 'notif', 'tour', 'city', 'tourcontent'));
    }

    public function UpdateTourContent(Request $request, tour $tour)
    {
//        $update = $tour->update($request->all());
        $input = $request->all();
        if ($request->hasFile('url')) {
            $exist = Storage::disk('url')->exists($tour->url);
            if (isset($tour->url) && $exist) {
                $delete = Storage::disk('url')->delete($tour->url);
            }

            $url = $request->file('url');
            $ext = $url->getClientOriginalExtension();
            if ($request->file('url')->isValid()) {
                $foto_name = date('YmdHis') . ".$ext";
                $upload_path = 'fotoupload';
                $request->file('url')->move($upload_path, $foto_name);
                $input['url'] = $foto_name;
            }
        }
        $update = $tour->update($input);

//        $request->url->storePubliclyAs('public',$request->url->getClientOriginalName());
        if ($update) {
            Session::flash('sukses', 'Successfully, updated!');
            return back();
        } else {
            Session::flash('gagal', 'Failed to update!');
            return back();
        }
    }

    //travel
    public function showTravelContent()
    {
        $sql = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;
        $operator = DB::table('operators')->get();

        $travelcontent = DB::table('travels')->select('travels.id', 'travels.asal', 'travels.tujuan', 'travels.tgl_berangkat', 'travels.jadwal_berangkat', 'travels.tgl_datang', 'travels.jadwal_datang', 'travels.harga', 'operators.nama', 'operators.no_pol', 'operators.jenis_kendaraan', 'operators.kapasitas', 'travels.created_at')->leftjoin('operators', 'travels.operator_id', '=', 'operators.id')->get();
        return view('admin.panel.content.travel', compact('sql', 'contact', 'ordertour', 'ordertravel', 'member', 'notif', 'travelcontent', 'operator'));
    }

    public function deleteTravelContent(travel $travel)
    {
        $travel->delete();
        Session::flash('status', 'Successfully, deleted!');
        return back();
    }

    public function storeTravelContent(Request $request)
    {
        travel::create($request->all());
        Session::flash('add', 'Successfully, added!');
        return redirect('admin/travelcontent#travel');
    }

    public function showEditTravelForm(travel $travel)
    {
        $sql = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $contact = DB::table('contacts')->whereraw('created_at = curdate()')->count();
        $ordertour = DB::table('tourforms')->whereraw('created_at = curdate()')->count();
        $ordertravel = DB::table('travelforms')->whereraw('created_at = curdate()')->count();
        $member = DB::table('users')->whereraw('created_at = curdate()')->count();
        $notif = $contact + $ordertour + $ordertravel + $member;
        $operator = DB::table('operators')->get();
        $travelcontent = DB::table('travels')->select('travels.id', 'travels.asal', 'travels.tujuan', 'travels.tgl_berangkat', 'travels.jadwal_berangkat', 'travels.tgl_datang', 'travels.jadwal_datang', 'travels.harga', 'operators.nama', 'operators.no_pol', 'operators.jenis_kendaraan', 'operators.kapasitas', 'travels.created_at')->leftjoin('operators', 'travels.operator_id', '=', 'operators.id')->get();

        return view('admin.panel.content.edittravel', compact('sql', 'contact', 'ordertour', 'ordertravel', 'member', 'notif', 'travel', 'operator', 'travelcontent'));
    }

    public function UpdateTravelContent(Request $request, travel $travel)
    {
        $update = $travel->update($request->all());
        if ($update) {
            Session::flash('sukses', 'Successfully, updated!');
            return back();
        } else {
            Session::flash('gagal', 'Failed to update!');
            return back();
        }
    }
}
