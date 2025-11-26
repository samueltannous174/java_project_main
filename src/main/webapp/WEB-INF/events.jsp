<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
    </style>
</head>
<body class="bg-background-white min-h-screen text-primary-purple font-sans">

<!-- SAME NAV AS HERO PAGE -->
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

<div class="w-full px-4 sm:px-10 lg:px-20 xl:px-32 py-12">

    <!-- filters -->
    <div class="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
        <div class="w-full lg:w-1/2">
            <div class="relative">
                <input
                        type="text"
                        placeholder="Search events, organizers, or keywords..."
                        class="w-full rounded-full border border-primary-purple/20 bg-background-white py-3 pl-11 pr-5 text-lg shadow-sm
                               focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple"
                />
                <span class="absolute left-3.5 top-1/2 -translate-y-1/2 text-primary-purple/40 text-xl">🔍</span>
            </div>
        </div>

        <div class="flex w-full lg:w-1/2 gap-4">
            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option>All Categories</option>
                <option>Animal Welfare</option>
                <option>Food &amp; Nutrition</option>
                <option>Technology</option>
            </select>

            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option>All Skills</option>
            </select>

            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option>Date</option>
            </select>
        </div>
    </div>

    <div class="mt-8 flex items-center justify-between">
        <h2 class="text-3xl font-semibold">All Events</h2>
        <p class="text-base text-primary-purple/60">7 events found</p>
    </div>

    <div class="mt-8 grid gap-8 grid-cols-1 sm:grid-cols-2 lg:grid-cols-4">

<%--        <c:forEach var="" items="">--%>
<%--            <!-- Card 1 -->--%>
<%--            <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col">--%>
<%--                <div class="relative h-60">--%>
<%--                    <img src="https://images.pexels.com/photos/6646903/pexels-photo-6646903.jpeg?auto=compress&cs=tinysrgb&w=800"--%>
<%--                         alt="Animal welfare" class="w-full h-full object-cover">--%>
<%--                    <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>--%>

<%--                    <div class="absolute left-4 top-4 flex gap-2">--%>
<%--                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        🐾 Animal Welfare--%>
<%--                    </span>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="flex-1 px-6 py-5 text-base">--%>
<%--                    <h3 class="text-xl font-semibold text-primary-purple mb-1">hahahha</h3>--%>
<%--                    <p class="text-sm text-primary-purple/60 mb-3">by Alex Johnson</p>--%>

<%--                    <div class="space-y-1 text-base text-primary-purple/80">--%>
<%--                        <p>📅 Nov 12, 2025</p>--%>
<%--                        <p>📍 Ramallah</p>--%>
<%--                        <p>👥 1 volunteer joined</p>--%>
<%--                    </div>--%>

<%--                    <div class="mt-4 text-sm">--%>
<%--                        <p class="text-primary-purple/70 mb-1">Your matching skills:</p>--%>
<%--                        <div class="flex flex-wrap gap-1.5">--%>
<%--                        <span class="inline-flex items-center rounded-full bg-primary-purple/5 px-3 py-1 text-xs font-medium text-primary-purple border border-primary-purple/20">--%>
<%--                            💬 Communication--%>
<%--                        </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="px-6 pb-5">--%>
<%--                    <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">--%>
<%--                        View Details →--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>

    <div class="mt-8 flex flex-wrap gap-8">
        <c:forEach var="event" items="${events}">
            <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col flex-none">
                <div class="relative h-60">
                    <img src="${event}"
                         alt="Animal welfare" class="w-full h-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>

                    <div class="absolute left-4 top-4 flex gap-2">
                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">
                        ${event.category}
                    </span>
                    </div>
                </div>

                <div class="flex-1 px-6 py-5 text-base">
                    <h3 class="text-xl font-semibold text-primary-purple mb-1">hahahha</h3>
                    <p class="text-sm text-primary-purple/60 mb-3">by Alex Johnson</p>

                    <div class="space-y-1 text-base text-primary-purple/80">
                        <p>📅 Nov 12, 2025</p>
                        <p>📍 Ramallah</p>
                        <p>👥 1 volunteer joined</p>
                    </div>

                    <div class="mt-4 text-sm">
                        <p class="text-primary-purple/70 mb-1">Your matching skills:</p>
                        <div class="flex flex-wrap gap-1.5">
                        <span class="inline-flex items-center rounded-full bg-primary-purple/5 px-3 py-1 text-xs font-medium text-primary-purple border border-primary-purple/20">
                            💬 Communication
                        </span>
                        </div>
                    </div>
                </div>

                <div class="px-6 pb-5">
                    <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">
                        View Details →
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>



<%--        <!-- Card 2 -->--%>
<%--        <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col">--%>
<%--            <div class="relative h-60">--%>
<%--                <img src="https://images.pexels.com/photos/6646908/pexels-photo-6646908.jpeg?auto=compress&cs=tinysrgb&w=800"--%>
<%--                     alt="Food drive" class="w-full h-full object-cover">--%>
<%--                <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>--%>

<%--                <div class="absolute left-4 top-4 flex gap-2">--%>
<%--                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        🥕 Food &amp; Nutrition--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--                <div class="absolute right-4 top-4">--%>
<%--                    <span class="rounded-full bg-secondary-orange px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        83% Match--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="flex-1 px-6 py-5 text-base">--%>
<%--                <h3 class="text-xl font-semibold text-primary-purple mb-1">Community Food Drive</h3>--%>
<%--                <p class="text-sm text-primary-purple/60 mb-3">City Food Bank</p>--%>

<%--                <div class="space-y-1 text-base text-primary-purple/80">--%>
<%--                    <p>📅 Dec 5, 2025</p>--%>
<%--                    <p>📍 Downtown Community Center</p>--%>
<%--                    <p>👥 3 volunteers joined</p>--%>
<%--                </div>--%>

<%--                <div class="mt-4">--%>
<%--                    <div class="flex items-center justify-between text-xs text-primary-purple/60 mb-1">--%>
<%--                        <span>Your match</span>--%>
<%--                        <span>83%</span>--%>
<%--                    </div>--%>
<%--                    <div class="h-2 rounded-full bg-primary-purple/10 overflow-hidden">--%>
<%--                        <div class="h-full w-4/5 bg-primary-purple rounded-full"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="mt-4 text-sm">--%>
<%--                    <p class="text-primary-purple/70 mb-1">Your matching skills:</p>--%>
<%--                    <div class="flex flex-wrap gap-1.5">--%>
<%--                        <span class="inline-flex items-center rounded-full bg-primary-purple/5 px-3 py-1 text-xs font-medium text-primary-purple border border-primary-purple/20">--%>
<%--                            💬 Communication--%>
<%--                        </span>--%>
<%--                        <span class="inline-flex items-center rounded-full bg-secondary-orange/10 px-3 py-1 text-xs font-medium text-secondary-orange border border-secondary-orange/30">--%>
<%--                            🤝 Teamwork--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="px-6 pb-5">--%>
<%--                <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">--%>
<%--                    View Details →--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Card 3 -->--%>
<%--        <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col">--%>
<%--            <div class="relative h-60">--%>
<%--                <img src="https://images.pexels.com/photos/1181467/pexels-photo-1181467.jpeg?auto=compress&cs=tinysrgb&w=800"--%>
<%--                     alt="Tech workshop" class="w-full h-full object-cover">--%>
<%--                <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>--%>

<%--                <div class="absolute left-4 top-4 flex gap-2">--%>
<%--                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        💻 Technology--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--                <div class="absolute right-4 top-4">--%>
<%--                    <span class="rounded-full bg-secondary-orange px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        25% Match--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="flex-1 px-6 py-5 text-base">--%>
<%--                <h3 class="text-xl font-semibold text-primary-purple mb-1">Senior Tech Workshop</h3>--%>
<%--                <p class="text-sm text-primary-purple/60 mb-3">Elder Care Association</p>--%>

<%--                <div class="space-y-1 text-base text-primary-purple/80">--%>
<%--                    <p>📅 Dec 8, 2025</p>--%>
<%--                    <p>📍 Senior Community Center</p>--%>
<%--                    <p>👥 1 volunteer joined</p>--%>
<%--                </div>--%>

<%--                <div class="mt-4">--%>
<%--                    <div class="flex items-center justify-between text-xs text-primary-purple/60 mb-1">--%>
<%--                        <span>Your match</span>--%>
<%--                        <span>25%</span>--%>
<%--                    </div>--%>
<%--                    <div class="h-2 rounded-full bg-primary-purple/10 overflow-hidden">--%>
<%--                        <div class="h-full w-1/4 bg-primary-purple rounded-full"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="mt-4 text-sm">--%>
<%--                    <p class="text-primary-purple/70 mb-1">Your matching skills:</p>--%>
<%--                    <div class="flex flex-wrap gap-1.5">--%>
<%--                        <span class="inline-flex items-center rounded-full bg-primary-purple/5 px-3 py-1 text-xs font-medium text-primary-purple border border-primary-purple/20">--%>
<%--                            💬 Communication--%>
<%--                        </span>--%>
<%--                        <span class="inline-flex items-center rounded-full bg-secondary-orange/10 px-3 py-1 text-xs font-medium text-secondary-orange border border-secondary-orange/30">--%>
<%--                            🎓 Teaching--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="px-6 pb-5">--%>
<%--                <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">--%>
<%--                    View Details →--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Card 4 -->--%>
<%--        <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col">--%>
<%--            <div class="relative h-60">--%>
<%--                <img src="https://images.pexels.com/photos/1304472/pexels-photo-1304472.jpeg?auto=compress&cs=tinysrgb&w=800"--%>
<%--                     alt="Park cleanup" class="w-full h-full object-cover">--%>
<%--                <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>--%>

<%--                <div class="absolute left-4 top-4 flex gap-2">--%>
<%--                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        🌿 Environment--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--                <div class="absolute right-4 top-4">--%>
<%--                    <span class="rounded-full bg-secondary-orange px-4 py-1.5 text-sm font-semibold text-white shadow">--%>
<%--                        60% Match--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="flex-1 px-6 py-5 text-base">--%>
<%--                <h3 class="text-xl font-semibold text-primary-purple mb-1">City Park Clean-Up Day</h3>--%>
<%--                <p class="text-sm text-primary-purple/60 mb-3">Green City Initiative</p>--%>

<%--                <div class="space-y-1 text-base text-primary-purple/80">--%>
<%--                    <p>📅 Jan 15, 2026</p>--%>
<%--                    <p>📍 Central City Park</p>--%>
<%--                    <p>👥 8 volunteers joined</p>--%>
<%--                </div>--%>

<%--                <div class="mt-4">--%>
<%--                    <div class="flex items-center justify-between text-xs text-primary-purple/60 mb-1">--%>
<%--                        <span>Your match</span>--%>
<%--                        <span>60%</span>--%>
<%--                    </div>--%>
<%--                    <div class="h-2 rounded-full bg-primary-purple/10 overflow-hidden">--%>
<%--                        <div class="h-full w-3/5 bg-primary-purple rounded-full"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="mt-4 text-sm">--%>
<%--                    <p class="text-primary-purple/70 mb-1">Your matching skills:</p>--%>
<%--                    <div class="flex flex-wrap gap-1.5">--%>
<%--                        <span class="inline-flex items-center rounded-full bg-primary-purple/5 px-3 py-1 text-xs font-medium text-primary-purple border border-primary-purple/20">--%>
<%--                            💬 Communication--%>
<%--                        </span>--%>
<%--                        <span class="inline-flex items-center rounded-full bg-secondary-orange/10 px-3 py-1 text-xs font-medium text-secondary-orange border border-secondary-orange/30">--%>
<%--                            ⚙️ Organization--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="px-6 pb-5">--%>
<%--                <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">--%>
<%--                    View Details →--%>
<%--                </button>--%>
<%--            </div>--%>
        </div>

    </div>
</div>

</body>
</html>
