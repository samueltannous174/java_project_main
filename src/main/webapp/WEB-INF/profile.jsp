<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${logged.firstname} Profile</title>

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

<body class="bg-background-white flex flex-col font-sans min-h-screen">

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

            <c:if test="${logged.role == 'ORGANIZER'}">
                <a href="/create"
                   class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-2xl font-bold">
                    New Event
                </a>
            </c:if>
        </div>

        <form class="hidden sm:flex" action="/logout" method="post">
            <input type="submit" value="Logout"
                   class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
        </form>
    </div>
</nav>

<main class="flex-1 flex justify-center items-start py-6">

    <div class="w-[65%] mx-auto space-y-8 overflow-auto pb-10">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

            <section class="lg:col-span-2 bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-7">
                <div class="flex flex-col md:flex-row md:items-center gap-6">
                    <div class="flex-shrink-0">
<%--                        <div class="w-28 h-28 rounded-full bg-primary-purple flex items-center justify-center text-white text-4xl font-bold">--%>
<%--                            ${logged.firstname.charAt(0)}${logged.lastname.charAt(0)}--%>
<%--                        </div>--%>

                        <img class="w-28 h-28 rounded-full bg-primary-purple flex items-center justify-center text-white text-4xl font-bold" src="${logged.image_url}"/>
                    </div>

                    <div class="flex-1 space-y-3">
                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                            <div>
                                <h1 class="text-4xl font-bold text-primary-purple">
                                    ${logged.firstname} ${logged.lastname}
                                </h1>
                                <p class="text-base text-primary-purple/70 mt-1">
                                    ${logged.email}
                                </p>
                            </div>
                            <div class="flex flex-col  gap-5">
                                <a href="/edit/${logged.id}" class="px-5 py-2.5 text-sm font-semibold rounded-full border border-primary-purple/20 text-primary-purple bg-white hover:bg-primary-purple hover:text-white transition">
                                    Edit Profile
                                </a>
                                <form action="/ai/pdf" method="post">
                                    <input type="hidden" name="volunteerName" value="${logged.firstname} ${logged.lastname}">
                                    <input type="hidden" name="volunteerEmail" value="${logged.email}">
                                    <input type="hidden" name="eventsNumber" value="${logged.events.size()}">
                                    <button class="px-5 py-2.5 text-sm font-semibold rounded-full border border-primary-purple/20 text-primary-purple bg-white hover:bg-primary-purple hover:text-white transition">
                                        Get Certification
                                    </button>
                                </form>



                            </div>

                        </div>

                        <div class="inline-flex items-center rounded-full bg-secondary-orange/10 border border-secondary-orange/40 px-3 py-1.5">
                            <span class="h-2 w-2 rounded-full bg-secondary-orange mr-2"></span>
                            <span class="text-xs font-semibold text-secondary-orange tracking-wide uppercase">
                                ${logged.role}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 pt-5 border-t border-primary-purple/10">
                    <div class="rounded-xl border border-primary-purple/10 px-5 py-4">
                        <p class="text-sm text-primary-purple/60">Events Attended</p>

                        <c:set var="count" value="${fn:length(logged.events)}"/>
                        <p class="text-3xl font-bold text-primary-purple">${count}</p>
                    </div>

                    <div class="rounded-xl border border-primary-purple/10 px-5 py-4 flex items-center justify-center">
                        <p class="text-xl font-bold text-primary-purple">
                            Joined at 📅 <fmt:formatDate value="${logged.createdAt}" pattern="yyyy-MM-dd"/>
                        </p>
                    </div>
                </div>
            </section>

            <section class="bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-5 flex flex-col justify-around">
                <div class="flex items-center justify-between">
                    <h2 class="text-xl font-semibold text-primary-purple">My Skills</h2>
                </div>

                <div class="flex flex-wrap gap-2.5">
                    <c:forEach var="skill" items="${logged.skills}">
                        <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">
                                ${skill.name}
                        </span>
                    </c:forEach>
                </div>
            </section>

        </div>


        <section class="bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-5">

            <h2 class="text-xl font-semibold text-primary-purple mb-4">My Medals</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                <c:forEach var="event" items="${logged.events}">
                    <div class="rounded-xl border border-yellow-400/40 bg-yellow-100/30 px-5 py-4">
                        <div class="flex justify-between items-start">
                            <div class="flex items-center gap-2">
                                <svg class="w-5 h-5 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M10 2a1 1 0 01.894.553l1.447 2.894 3.197.465a1 1 0 01.554 1.706l-2.313 2.255.546 3.183a1 1 0 01-1.452 1.054L10 12.347l-2.873 1.513a1 1 0 01-1.452-1.054l.546-3.183-2.313-2.255a1 1 0 01.554-1.706l3.197-.465L9.106 2.553A1 1 0 0110 2z"/>
                                </svg>
                                <p class="font-semibold text-primary-purple">${event.title}</p>
                            </div>

                            <span class="text-xs text-primary-purple/60">
                                <fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/>
                            </span>
                        </div>

                        <p class="text-sm text-primary-purple/80 mt-2">
                            Awarded for completing ${event.title}.
                        </p>
                    </div>
                </c:forEach>

            </div>
        </section>

    </div>
</main>

</body>
</html>
