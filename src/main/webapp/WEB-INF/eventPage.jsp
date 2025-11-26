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

<header class="max-w-6xl mx-auto px-4 py-6">
    <h1 class="text-4xl font-extrabold text-primary-purple">${event.title}</h1>
</header>

<main class="max-w-6xl mx-auto px-4 pb-12">

    <!-- Hero section -->
    <section class="relative w-full sm:h-[400px] h-[300px] rounded-xl overflow-hidden bg-gray-200 shadow">
        <img
                src="${event.image_url}"
                alt="Event image"
                class="w-full h-full object-cover transition-transform duration-300 hover:scale-105"
                loading="lazy"
        />

        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/40 to-transparent"></div>

        <div class="absolute bottom-5 left-5 right-5 text-orange-200 space-y-3">
            <p class="text-sm sm:text-base max-w-xl">
                ${event.description}
            </p>

            <div class="flex items-center space-x-2 text-gray-200">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2v-5H3v5a2 2 0 002 2z"/>
                </svg>
                <span class="text-orange-200">${event.startDate}</span>
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
                        <span>Collect trash and debris</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">2</span>
                        <span>Sort recyclables</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">3</span>
                        <span>Document findings</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full font-semibold text-sm">4</span>
                        <span>Educate beachgoers</span>
                    </li>
                </ol>
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
                        class="w-full bg-primary-purple text-white py-2 rounded-lg mt-4 hover:bg-secondary-orange transition font-semibold">
                    Unregister
                </button>

                <p class="text-green-700 bg-green-100 mt-3 p-2 rounded-lg text-sm text-center">
                    ✓ You're registered for this event!
                </p>
            </div>

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h3 class="text-lg font-semibold mb-3 text-primary-purple">Required Skills</h3>

                <div class="flex flex-wrap gap-2">
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Physical fitness</span>
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Teamwork</span>
                    <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">Environmental awareness</span>
                </div>

                <p class="text-sm text-gray-600 mt-3">
                    Don’t have all the skills? No problem! Many can be learned during the event.
                </p>
            </div>

        </div>
    </div>

</main>

</body>
</html>
