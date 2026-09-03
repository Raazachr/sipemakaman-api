<?php

namespace Database\Seeders;

use App\Models\SuperAdmin;
use Illuminate\Database\Seeder;

class SuperAdminSeeder extends Seeder
{
    public function run(): void
    {
        SuperAdmin::updateOrCreate(
            ['username' => 'superadmin'],
            [
                'nip' => '0000000000',
                'nama_lengkap' => 'Super Administrator',
                'email' => 'superadmin@sipemakaman.test',
                'password' => 'super1234', // ganti setelah login pertama kali!
            ]
        );
    }
}
