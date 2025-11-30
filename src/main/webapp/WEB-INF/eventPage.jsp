<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-2xl font-bold">
                Home
            </a>
            <a href="/events"
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-2xl font-bold">
                Events
            </a>
            <a href="/profile/${id}"
               class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-2xl font-bold">
                My Profile
            </a>
        </div>

        <form class="hidden sm:flex" action="/logout" method="post">
            <input type="submit" value="Logout"
                   class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
        </form>
    </div>
</nav>


<header class="max-w-6xl mx-auto px-4 py-6">
    <h1 class="text-4xl font-extrabold text-primary-purple">${event.title}</h1>
</header>

<main class="max-w-6xl mx-auto px-4 pb-12">

    <section class="relative w-full sm:h-[400px] h-[300px] rounded-xl overflow-hidden bg-gray-200 shadow">

        <img
                src="${event.image_url}"
                alt="Event image"
                class="w-full h-full object-cover transition-transform duration-300 hover:scale-105"
        />

        <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/40 to-transparent"></div>

        <div class="absolute bottom-5 left-5 right-5 text-white space-y-3">
            <p class="text-sm text-orange-200 sm:text-base max-w-xl">
                ${event.description}
            </p>

            <div class="flex items-center space-x-2 text-orange-200 ">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2v-5H3v5a2 2 0 002 2z"/>
                </svg>
                <p class="">
                    <fmt:formatDate  value="${event.startDate}" pattern="yyyy-MM-dd" />
                </p>
            </div>
        </div>


    </section>



    <div class="mt-4 p-4 bg-white w-1/4 shadow-md rounded-lg flex items-center gap-3">

        <img src="${organizer.image_url}" class="w-12 h-12 rounded-full bg-primary-purple text-white flex items-center justify-center text-lg font-semibold"/>

        <div>
            <p class="text-sm text-gray-500">Organizer</p>
            <p class="text-lg font-semibold text-gray-800">
                ${organizer.firstname} ${organizer.lastname}
            </p>
        </div>


    </div>



    <a
            href="/chat/${event.id}"
            class="w-1/4 bg-primary-purple text-white py-3 rounded-lg mt-2
           flex items-center justify-center font-semibold
           hover:bg-secondary-orange transition duration-200"
    >
        Chats
    </a>
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
                    <c:forEach var="outcome" items="${outcomes}">
                        <li class="flex items-center space-x-2">
                            <span class="text-green-600">✔</span>
                            <span> ${outcome.description}</span>
                        </li>
                    </c:forEach>
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
                        <c:forEach var="task" items="${tasks}">
                            <li class="flex items-center space-x-2">
                                <span class="text-green-600">✔</span>
                                <span> ${task.name}</span>
                            </li>
                        </c:forEach>
                </ol>
            </div>

        </div>

        <div class="space-y-6">

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h3 class="text-lg font-semibold text-primary-purple">Available Spots</h3>
                <p class="text-2xl font-bold mt-1 text-primary-purple">
                    ${fn:length(event.users)}/ 50
                </p>
                <div class="w-full bg-gray-200 h-2 rounded-full mt-2">
                    <div class="h-2 bg-primary-purple rounded-full" style="width: 32%;"></div>
                </div>

                <c:set var="isJoined" value="false" />
                <c:forEach var="u" items="${event.users}">
                    <c:if test="${u.id == logged.id}">
                        <c:set var="isJoined" value="true" />
                    </c:if>
                </c:forEach>

                <c:if test="${isJoined}">
                    <form action="/remove_user_to_event" method="post">
                        <input name="event_id" type="hidden" value="${event.id}">
                        <button class="w-full bg-primary-purple text-white py-2 rounded-lg mt-4 hover:bg-secondary-orange transition font-semibold">
                            unRegister
                        </button>
                        <p class="text-green-700 bg-green-100 mt-3 p-2 rounded-lg text-sm text-center">
                            ✓ You're registered for this event!
                        </p>
                    </form>
                </c:if>

                <c:if test="${not isJoined}">
                    <form action="/add_user_to_event" method="post">
                        <input name="event_id" type="hidden" value="${event.id}">
                        <button class="w-full bg-primary-purple text-white py-2 rounded-lg mt-4 hover:bg-secondary-orange transition font-semibold">
                            Register
                        </button>

                    </form>
                </c:if>
            </div>

            <div class="bg-background-white p-6 rounded-xl shadow border">
                <h3 class="text-lg font-semibold mb-3 text-primary-purple">Required Skills</h3>

                <div class="flex flex-wrap gap-2">
                    <c:forEach var="skill" items="${skills}">
                        <span class="bg-gray-100 text-primary-purple px-3 py-1 rounded-full text-sm">${skill.name}</span>
                    </c:forEach>

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
