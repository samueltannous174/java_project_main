<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Event — Beach Cleanup Initiative</title>
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
</head>
<body class="bg-slate-50 text-slate-900 antialiased font-sans">

<nav class="bg-background-white shadow-md w-full h-[80px] flex items-center px-4 sm:px-8 flex-shrink-0 border-b border-primary-purple/10 sticky top-0 z-50">
    <div class="flex justify-between items-center w-full">
        <div class="flex items-center">
            <span class="ml-3 text-2xl font-extrabold text-primary-purple tracking-tight">
                Voluntree
            </span>
        </div>

        <div class="hidden sm:flex space-x-8">
            <a href="/"
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

        <div class="hidden sm:flex">
            <a href="/logout"
               class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
                Logout
            </a>
        </div>
    </div>
</nav>


<header class="max-w-6xl mx-auto px-4 py-6">
    <h1 class="text-3xl font-extrabold text-primary-purple">Event Page</h1>
</header>

<main class="max-w-6xl mx-auto px-4 pb-12">
    <section class="relative w-full sm:h-[450px] h-[300px] rounded-xl overflow-hidden bg-gray-200">
        <img
                src="${event.image_url}"
                alt="Volunteers collecting trash on a sandy beach during cleanup"
                class="w-full h-full object-fit"
                loading="lazy"
        />

        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/40 to-transparent"></div>

        <div class="absolute bottom-5 left-5 right-5 sm:right-auto text-white space-y-3">
            <h2 class="text-2xl sm:text-3xl font-bold leading-tight text-secondary-orange">${event.title}</h2>

            <p class="text-sm sm:text-base w-3/4">
                Join us for a comprehensive beach cleanup to protect marine life and keep our beaches beautiful. We will
                clean a 2km stretch of coastline, focusing on plastic waste and other harmful debris.
            </p>

            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2v-5H3v5a2 2 0 002 2z"/>
                    </svg>
                    <span>Sunday, December 15, 2024</span>
                </div>

                <a href="#"
                   class="bg-primary-purple text-background-white px-4 py-2 rounded-lg text-sm font-medium shadow-sm text-center hover:bg-secondary-orange transition"
                   role="button">
                    Sign up to volunteer
                </a>
            </div>
        </div>
    </section>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-10">

        <div class="lg:col-span-2 space-y-6">
            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h2 class="text-lg font-semibold flex items-center space-x-2 mb-4 text-primary-purple">
                    <svg class="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <span>Expected Outcomes</span>
                </h2>

                <ul class="space-y-2">
                    <li class="flex items-center space-x-2">
                        <span class="text-green-600">✔</span>
                        <span>Remove 500kg of trash</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-green-600">✔</span>
                        <span>Protect marine ecosystems</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-green-600">✔</span>
                        <span>Raise environmental awareness</span>
                    </li>
                </ul>
            </div>

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h2 class="text-lg font-semibold flex items-center space-x-2 mb-4 text-primary-purple">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12h6m-6 4h6m5-8H4m16 0H4"/>
                    </svg>
                    <span>Tasks & Responsibilities</span>
                </h2>

                <ol class="space-y-3">
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">1</span>
                        <span>Collect trash and debris from beach</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">2</span>
                        <span>Sort recyclables from general waste</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">3</span>
                        <span>Document findings for environmental report</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">4</span>
                        <span>Educate beachgoers about marine conservation</span>
                    </li>
                </ol>
            </div>

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h2 class="text-lg font-semibold flex items-center space-x-2 mb-4 text-secondary-orange">
                    <svg class="w-5 h-5 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M10.29 3.86L1.82 18a1 1 0 00.86 1.5h18.64a1 1 0 00.86-1.5L13.71 3.86a1 1 0 00-1.72 0z"/>
                    </svg>
                    <span>Possible Risks</span>
                </h2>
                <ul class="space-y-3">
                    <li class="flex items-center space-x-2">
                        <span class="text-secondary-orange">⚠️</span>
                        <span>Sun exposure – please wear sunscreen and hat</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-secondary-orange">⚠️</span>
                        <span>Sharp objects in sand – gloves will be provided</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-secondary-orange">⚠️</span>
                        <span>Heavy lifting – proper technique training provided</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="space-y-6">
            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h3 class="text-lg font-semibold text-primary-purple">Available Spots</h3>
                <p class="text-2xl font-bold mt-1 text-primary-purple">16 / 50</p>

                <div class="w-full bg-gray-200 h-2 rounded-full mt-2">
                    <div class="h-2 bg-primary-purple rounded-full" style="width: 32%;"></div>
                </div>

                <button
                        class="w-full bg-primary-purple text-background-white py-2 rounded-lg mt-4 border hover:bg-secondary-orange transition">
                    Unregister
                </button>

                <p class="text-green-700 bg-green-100 mt-3 p-2 rounded-lg text-sm text-center">
                    ✓ You're registered for this event!
                </p>
            </div>

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h3 class="text-lg font-semibold flex items-center space-x-2 mb-3 text-primary-purple">

                    <span>Required Skills</span>
                </h3>

                <div class="flex flex-wrap gap-2">
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Physical fitness</span>
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Teamwork</span>
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Environmental awareness</span>
                </div>

                <p class="text-sm text-gray-600 mt-3">
                    Don't have all the skills? No problem! Many of these can be learned on the job.
                </p>
            </div>
        </div>
    </div>
</main>
</body>
</html>
