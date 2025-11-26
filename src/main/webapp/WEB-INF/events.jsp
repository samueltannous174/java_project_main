<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

        .text-primary-green {
            color: var(--color-primary-green);
        }

        .border-primary-green {
            border-color: var(--color-primary-green);
        }
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
            <form action="/events" method="get" class="relative">
                <span class="absolute left-3.5 top-1/2 -translate-y-1/2 text-primary-purple/40 text-xl">🔍</span>

                <input
                        type="text"
                        name="search"
                        placeholder="Search events, organizers, or keywords..."
                        class="w-full rounded-full border border-primary-purple/20 bg-background-white py-3 pl-11 pr-5 text-lg shadow-sm
                       focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple"
                />
            </form>
        </div>

        <div class="flex w-full lg:w-1/2 gap-4">
            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <c:forEach var="event" items="${events}">
                    <option>${event.category}</option>
                </c:forEach>
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

        <c:if test="${fn:length(events) == 0}">
            <p class="mt-8 text-lg text-primary-purple/60">
                No events yet.
            </p>
        </c:if>
        <c:if test="${fn:length(events) != 0}">
            <c:forEach var="event" items="${events}">
                <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col h-full">
                    <div class="relative h-60">
                        <img src="${event.image_url}"
                             alt="${event.title}" class="w-full h-full object-cover">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>

                        <div class="absolute left-4 top-4 flex gap-2">
                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">
                            ${event.category}
                    </span>
                        </div>
                    </div>

                    <div class="flex-1 px-6 py-5 text-base">
                        <!-- same height for all titles, full card width -->
                        <h3 class="text-xl font-semibold text-primary-purple mb-1 min-h-[3rem] leading-snug break-words">
                                ${event.title}
                        </h3>

                        <p class="text-sm text-primary-purple/60 mb-3">by Alex Johnson</p>

                        <div class="space-y-1 text-base text-primary-purple/80">
                            <p>
                                📅
                                <fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/>
                                -
                                <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/>
                            </p>
                            <p> ${event.city}</p>
                            <p>👥 ${fn:length(event.users)} volunteer/s joined</p>
                        </div>
                    </div>

                    <div class="px-6 pb-5 mt-auto">
                        <button class="w-full rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">
                            View Details →
                        </button>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>

</div>
</div>

</body>
</html>
