<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'SIPEMAKAMAN') — Sistem Informasi Pemakaman</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind via CDN: tidak perlu npm build, langsung jalan di XAMPP -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Instrument Sans', ui-sans-serif, system-ui, sans-serif; }

        /* ---- Ikon aplikasi (PNG di /img/icons) ---- */
        .ic {
            display: inline-block;
            width: 1.25rem;
            height: 1.25rem;
            object-fit: contain;
            flex-shrink: 0;
            vertical-align: -.2em;
        }
        .ic-sm { width: 1rem; height: 1rem; }
        .ic-lg { width: 1.5rem; height: 1.5rem; }
        .ic-xl { width: 2rem; height: 2rem; }
        .ic-3xl { width: 2.5rem; height: 2.5rem; }
        /* Ikon di area gelap -> diletakkan di ubin putih agar warnanya terlihat */
        .ic-nav {
            width: 1.75rem;
            height: 1.75rem;
            padding: .25rem;
            border-radius: .5rem;
            background: rgba(255, 255, 255, .92);
        }
        /* Ubin abolish untuk ikon kartu statistik */
        .ic-tile {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
            border-radius: .75rem;
            background: #f8fafc;
        }
        /* Elemen yang isinya teks + ikon */
        .ic-btn { display: inline-flex; align-items: center; gap: .375rem; }
    </style>
</head>
<body class="bg-gray-50 text-gray-900 antialiased">
    @yield('content')
</body>
</html>
