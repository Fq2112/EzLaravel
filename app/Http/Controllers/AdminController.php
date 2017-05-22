<?php

namespace App\Http\Controllers;

use App\contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        $contact = DB::table('contacts')->orderby('created_at','desc')->get();
        $sql = DB::table('contacts')->count();
        return view('admin.panel.dashboard.dashboardv1', compact('contact', 'sql'));
    }

    public function index2()
    {
        $contact = DB::table('contacts')->orderby('created_at', 'desc')->get();
        $sql = DB::table('contacts')->count();
        return view('admin.panel.dashboard.dashboardv2', compact('contact', 'sql'));
    }

}
