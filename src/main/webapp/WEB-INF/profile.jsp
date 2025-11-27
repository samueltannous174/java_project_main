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

<!-- NAVBAR -->
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
                <a href="/show_create"
                   class="border-b-2 border-transparent text-primary-purple hover:border-secondary-orange hover:text-primary-purple px-1 pt-1 text-2xl font-bold">
                    new Event
                </a>
            </c:if>
        </div>

        <form class="hidden sm:flex" action="/logout" method="post">
            <input type="submit" value="Logout"
                   class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
        </form>
    </div>
</nav>

<!-- MAIN WRAPPER (90vh height, 85% width) -->
<main class="flex-1 flex justify-center items-start py-6">

    <div class="w-[65%] mx-auto space-y-8 overflow-auto pb-10">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

            <!-- PROFILE -->
            <section class="lg:col-span-2 bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-7">
                <div class="flex flex-col md:flex-row md:items-center gap-6">
                    <div class="flex-shrink-0">
                        <div class="w-28 h-28 rounded-full bg-primary-purple flex items-center justify-center text-white text-4xl font-bold">
                            ${logged.firstname.charAt(0)}${logged.lastname.charAt(0)}
                        </div>
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

                            <button class="px-5 py-2.5 text-sm font-semibold rounded-full border border-primary-purple/20 text-primary-purple bg-white hover:bg-primary-purple hover:text-white transition">
                                Edit Profile
                            </button>
                        </div>

                        <div class="inline-flex items-center rounded-full bg-secondary-orange/10 border border-secondary-orange/40 px-3 py-1.5">
                            <span class="h-2 w-2 rounded-full bg-secondary-orange mr-2"></span>
                            <span class="text-xs font-semibold text-secondary-orange tracking-wide uppercase">
                                ${logged.role}
                            </span>
                        </div>
                    </div>
                </div>

                <!-- STATS -->
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 pt-5 border-t border-primary-purple/10">
                    <div class="rounded-xl border border-primary-purple/10 px-5 py-4">
                        <p class="text-sm text-primary-purple/60">Events Attended</p>
                        <p class="text-3xl font-bold text-primary-purple">12</p>
                    </div>
                    <div class="rounded-xl border border-primary-purple/10 px-5 py-4 flex items-center justify-center">
                        <p class="text-xl font-bold text-primary-purple">Joined at 📅
                                <fmt:formatDate value="${logged.createdAt}" pattern="yyyy-MM-dd"/></p>
                    </div>
                </div>
            </section>

            <!-- SKILLS -->
            <section class="bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-5 flex flex-col justify-around">
                <div class="flex items-center justify-between">
                    <h2 class="text-xl font-semibold text-primary-purple">My Skills</h2>
                </div>

                <div class="flex flex-wrap gap-2.5 h-4px overflow-y-auto">
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">Leadership</span>
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">Communication</span>
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">Teaching</span>
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">Event Planning</span>
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">First Aid</span>
                    <span class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-primary-purple/5 text-primary-purple border border-primary-purple/20">Environmental Science</span>
                </div>
<%--                <button class="w-full px-4 py-2.5 text-sm font-semibold rounded-xl bg-primary-purple text-white hover:bg-secondary-orange transition">--%>
<%--                    Add New Skill--%>
<%--                </button>--%>
            </section>
        </div>

        <!-- ACHIEVEMENTS -->
<%--        <section class="bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-5">--%>
<%--            <div class="flex items-center justify-between pb-3 border-b border-primary-purple/10">--%>
<%--                <div class="flex items-center gap-2">--%>
<%--                    <h2 class="text-xl font-semibold text-primary-purple">Achievements</h2>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">--%>
<%--                <div class="rounded-xl border border-secondary-orange/30 bg-secondary-orange/5 px-5 py-4">--%>
<%--                    <div class="flex justify-between">--%>
<%--                        <p class="font-semibold text-primary-purple">Community Leader</p>--%>
<%--                        <span class="text-xs text-primary-purple/60">Sept 2024</span>--%>
<%--                    </div>--%>
<%--                    <p class="text-sm text-primary-purple/80">Led a team of 20 volunteers in a beach cleanup initiative.</p>--%>
<%--                    <p class="text-xs text-primary-purple/50 mt-1">Beach Cleanup Initiative</p>--%>
<%--                </div>--%>

<%--                <div class="rounded-xl border border-secondary-orange/30 bg-secondary-orange/5 px-5 py-4">--%>
<%--                    <div class="flex justify-between">--%>
<%--                        <p class="font-semibold text-primary-purple">Education Champion</p>--%>
<%--                        <span class="text-xs text-primary-purple/60">June 2024</span>--%>
<%--                    </div>--%>
<%--                    <p class="text-sm text-primary-purple/80">Organized and taught weekly tutoring sessions.</p>--%>
<%--                    <p class="text-xs text-primary-purple/50 mt-1">Youth Education Program</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>


        <%-- EVENTS  لا تنسى تغير اليفينتس صديقي --%>
        <section class="bg-background-white border border-primary-purple/10 rounded-2xl shadow-sm p-8 space-y-5">
            <div class="flex items-center justify-between pb-3 border-b border-primary-purple/10">
                <div class="flex items-center gap-2">
                    <h2 class="text-xl font-semibold text-primary-purple">Events</h2>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                <%-- Events which the user volunteered in لا تنسى --%>
                <div class="rounded-xl border border-secondary-orange/30 bg-secondary-orange/5 px-5 py-4">
                    <div class="flex justify-between">
                        <p class="font-semibold text-primary-purple">Community Leader</p>
                        <span class="text-xs text-primary-purple/60">Sept 2024</span>
                    </div>
                    <p class="text-sm text-primary-purple/80">Led a team of 20 volunteers in a beach cleanup initiative.</p>
                    <p class="text-xs text-primary-purple/50 mt-1">Beach Cleanup Initiative</p>
                </div>

                <div class="rounded-xl border border-secondary-orange/30 bg-secondary-orange/5 px-5 py-4">
                    <div class="flex justify-between">

                        <p class="font-semibold text-primary-purple">Education Champion</p>
                        <span class="text-xs text-primary-purple/60">June 2024</span>
                    </div>
                    <p class="text-sm text-primary-purple/80">Organized and taught weekly tutoring sessions.</p>
                    <p class="text-xs text-primary-purple/50 mt-1">Youth Education Program</p>
                </div>
            </div>
        </section>

    </div>
</main>

</body>
</html>
