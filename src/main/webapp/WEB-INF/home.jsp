<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voluntree - Events</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'background-white': '#ffffff',
                        'primary-purple': '#390070',
                        'secondary-orange': '#ff8c42',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>

    <style>
        :root {
            --color-primary-green: #00b894;
        }
        .text-primary-green { color: var(--color-primary-green); }
        .border-primary-green { border-color: var(--color-primary-green); }
        .focus\:ring-primary-green:focus { --tw-ring-color: var(--color-primary-green); }
    </style>
</head>

<body class="bg-background-white min-h-screen flex flex-col font-sans">

<!-- NAVBAR -->
<nav class="bg-background-white shadow-md w-full h-[80px] flex items-center px-4 sm:px-8 flex-shrink-0 border-b border-primary-purple/10">
    <div class="flex justify-between items-center w-full">

        <!-- Logo -->
        <div class="flex items-center">
            <div class="bg-background-white border border-primary-green text-primary-green rounded-xl text-2xl p-2 flex items-center justify-center">
                <i class="fas fa-leaf"></i>
            </div>
            <span class="ml-3 text-2xl font-extrabold text-primary-purple tracking-tight">
                Voluntree
            </span>
        </div>

        <!-- Nav links -->
        <div class="hidden sm:flex space-x-8">
            <a href="/home"
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-base font-medium">
                Home
            </a>
            <a href="/events"
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-base font-medium">
                Events
            </a>
            <a href="/home#"
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-base font-medium">
                My Profile
            </a>
        </div>

        <!-- Logout -->
        <div class="hidden sm:flex">
            <a href="/logout"
               class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
                Logout
            </a>
        </div>
    </div>
</nav>

<!-- MAIN SECTION -->
<div class="flex-1 w-full bg-background-white flex flex-col lg:flex-row overflow-hidden">

    <!-- LEFT SIDE: TEXT -->
    <div class="w-full lg:w-1/2 p-8 sm:p-10 lg:p-14 flex flex-col justify-center space-y-8">

        <!-- Small badge -->
        <div class="inline-flex items-center rounded-full bg-secondary-orange/10 border border-secondary-orange/40 px-3 py-1 w-fit">
            <span class="text-xs font-semibold text-secondary-orange tracking-wide">
                Welcome to Voluntree
            </span>
        </div>

        <div class="space-y-3">
            <h1 class="text-4xl sm:text-5xl font-extrabold text-primary-purple leading-tight">
                Events
            </h1>
            <h2 class="text-2xl sm:text-3xl font-semibold text-primary-purple/80">
                Connect, Volunteer, and Grow Together
            </h2>
        </div>

        <p class="text-lg text-primary-purple/70 max-w-xl leading-relaxed">
            Join our community of passionate volunteers. Discover meaningful opportunities,
            develop new skills, and make a lasting impact in your community.
        </p>

        <!-- CTA button -->
        <a href="/events"
           class="flex items-center justify-center px-8 py-3 text-lg font-semibold text-background-white rounded-xl shadow-lg
                  bg-gradient-to-r from-primary-purple to-secondary-orange hover:from-secondary-orange hover:to-primary-purple w-fit">
            Explore Events
            <i class="fas fa-arrow-right ml-2"></i>
        </a>

        <!-- Stats cards -->
        <div class="flex flex-col sm:flex-row justify-between gap-4 pt-6 w-full max-w-xl">

            <div class="flex items-center bg-background-white shadow-lg rounded-xl p-4 flex-1 border border-primary-purple/10">
                <div class="bg-secondary-orange/10 text-secondary-orange p-2 rounded-full text-xl flex items-center justify-center">
                    <i class="fas fa-users"></i>
                </div>
                <div class="ml-3">
                    <p class="text-2xl font-bold text-primary-purple">3+</p>
                    <p class="text-sm text-primary-purple/60">Users</p>
                </div>
            </div>

            <div class="flex items-center bg-background-white shadow-lg rounded-xl p-4 flex-1 border border-primary-purple/10">
                <div class="bg-secondary-orange/10 text-secondary-orange p-2 rounded-full text-xl flex items-center justify-center">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div class="ml-3">
                    <p class="text-2xl font-bold text-primary-purple">12</p>
                    <p class="text-sm text-primary-purple/60">Events</p>
                </div>
            </div>

            <div class="flex items-center bg-background-white shadow-lg rounded-xl p-4 flex-1 border border-primary-purple/10">
                <div class="bg-secondary-orange/10 text-secondary-orange p-2 rounded-full text-xl flex items-center justify-center">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <div class="ml-3">
                    <p class="text-2xl font-bold text-primary-purple">5</p>
                    <p class="text-sm text-primary-purple/60">Volunteers</p>
                </div>
            </div>

        </div>
    </div>

    <!-- RIGHT SIDE: IMAGE -->
    <div class="w-full lg:w-1/2 relative bg-background-white min-h-[260px] lg:min-h-0">
        <div class="absolute inset-0 bg-cover bg-center"
             style="background-image: url('https://www.hotboxevents.com/media/5510/volunteer-at-music-festivals_hotbox-events_arena-volunteers-walking-in-front-of-main-stage_2022-001_740x513px72dpi.jpg');">
        </div>

        <!-- gradient overlay -->
        <div class="absolute inset-0 bg-gradient-to-t from-black/35 via-black/10 to-transparent"></div>

        <!-- Optional text overlay bottom-left -->
        <div class="absolute bottom-4 left-4 bg-black/40 text-background-white px-4 py-2 rounded-lg text-sm max-w-[80%] hidden sm:block">
            Join live events, meet new people, and contribute to causes you care about.
        </div>
    </div>

</div>

</body>
</html>
