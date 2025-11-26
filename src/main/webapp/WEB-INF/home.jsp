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
                        'primary-purple': '#6366f1',
                        'primary-blue': '#3b82f6',
                        'light-bg': '#f9fafb',
                        'dark-text': '#1f2937',
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

<body class="bg-light-bg h-screen overflow-hidden flex flex-col">

<nav class="bg-white shadow-md w-full h-[80px] flex items-center px-4 flex-shrink-0 border-b-2">
    <div class="flex justify-between items-center w-full">

        <div class="flex items-center">
            <div class="bg-green-500 text-primary-green rounded-lg text-xl p-2">
                <i class="fas fa-leaf"></i>
            </div>
            <span class="ml-2 text-xl font-bold text-gray-800">Voluntree</span>
        </div>

        <div class="hidden sm:flex space-x-8">
            <a href="/home" class="border-b-2 border-primary-green text-gray-900 px-1 pt-1 text-sm font-medium text-xl">
                Home
            </a>
            <a href="/events" class="border-b-2 border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 px-1 pt-1 text-sm font-medium text-xl">
                Events
            </a>
            <a href="/home#" class="border-b-2 border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 px-1 pt-1 text-sm font-medium text-xl">
                My Profile
            </a>
        </div>

        <div class="flex">
            <p class="text-orange-300">
               Welcome, ${logged.firstname}
            </p>
            <form class="hidden sm:flex" action="/logout" method="post">
                <button type="submit">
                    <a  class="ml-4 px-3 py-2 text-sm font-medium text-gray-500 bg-gray-100 rounded-md hover:bg-red-500 hover:text-white duration-150">
                        <i class="fas fa-sign-out-alt mr-1"></i> Logout
                    </a>
                </button>
            </form>

        </div>
    </div>
</nav>

<div class="flex flex-1 h-[calc(100vh-80px)] w-full bg-white overflow-hidden">

    <div class="lg:w-1/2 p-10 flex flex-col justify-evenly space-y-6">

        <h1 class="text-4xl sm:text-5xl font-extrabold text-dark-text">Events</h1>

        <h1 class="text-4xl">Connect, Volunteer, and Grow Together</h1>

        <p class="text-lg text-gray-600 max-w-lg">
            Join our community of passionate volunteers. Find meaningful opportunities,
            develop new skills, and create lasting impact.
        </p>

        <a href="/events"
           class="flex items-center justify-center px-8 py-3 text-lg font-semibold text-white rounded-xl shadow-lg
           bg-gradient-to-r from-primary-blue to-primary-purple hover:from-primary-purple hover:to-primary-blue w-fit">
            Explore Events <i class="fas fa-arrow-right ml-2"></i>
        </a>

        <div class="flex justify-between pt-8 w-full max-w-lg">

            <div class="flex items-center bg-white shadow-xl rounded-xl p-4 w-[30%]">
                <div class="bg-green-100 text-green-600 p-2 rounded-full text-xl">
                    <i class="fas fa-users"></i>
                </div>
                <div class="ml-3">
                    <p class="text-xl font-bold text-dark-text">3+</p>
                    <p class="text-sm text-gray-500">Users</p>
                </div>
            </div>

            <div class="flex items-center bg-white shadow-xl rounded-xl p-4 w-[30%]">
                <div class="bg-blue-100 text-blue-600 p-2 rounded-full text-xl">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div class="ml-3">
                    <p class="text-xl font-bold text-dark-text">12</p>
                    <p class="text-sm text-gray-500">Events</p>
                </div>
            </div>

            <div class="flex items-center bg-white shadow-xl rounded-xl p-4 w-[30%]">
                <div class="bg-purple-100 text-purple-600 p-2 rounded-full text-xl">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <div class="ml-3">
                    <p class="text-xl font-bold text-dark-text">5</p>
                    <p class="text-sm text-gray-500">Volunteers</p>
                </div>
            </div>

        </div>
    </div>

    <div class="lg:w-1/2 relative bg-gray-100">
        <div class="absolute inset-0 bg-cover bg-center"
             style="background-image: url('https://www.hotboxevents.com/media/5510/volunteer-at-music-festivals_hotbox-events_arena-volunteers-walking-in-front-of-main-stage_2022-001_740x513px72dpi.jpg');">
        </div>

        <div class="absolute inset-0 bg-gradient-to-t from-black/10 to-transparent"></div>
    </div>

</div>

</body>
</html>
