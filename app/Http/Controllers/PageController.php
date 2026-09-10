<?php

namespace App\Http\Controllers;

use App\Models\Tpu;

class PageController extends Controller
{
    // Beranda publik untuk Pemohon / masyarakat (tanpa login)
    public function home()
    {
        $tpus = Tpu::where('status', 'aktif')->get(['id', 'nama_tpu', 'alamat', 'kota']);

        return view('home', ['tpus' => $tpus]);
    }

    // Halaman login
    public function login()
    {
        return view('login');
    }

    // Aplikasi admin (SPA-lite, dirender JavaScript)
    public function app()
    {
        return view('app');
    }

    // Tampilan peta stand-alone
    public function peta()
    {
        return view('peta');
    }
}
