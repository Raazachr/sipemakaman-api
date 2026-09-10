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
    </style>
</head>
<body class="bg-gray-50 text-gray-900 antialiased">
    @yield('content')
</body>
</html>
