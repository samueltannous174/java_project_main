<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Create Event</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
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

<body class="bg-slate-50 text-slate-900 font-sans antialiased">
<header class="max-w-4xl mx-auto px-4 py-6">
    <h1 class="text-3xl font-bold text-primary-purple">Create New Event</h1>
</header>

<main class="max-w-4xl mx-auto px-4 pb-12">
    <form:form action="/ai/create2" method="post" modelAttribute="event" class="bg-white p-6 rounded-xl shadow space-y-6">

        <div>
            <form:label path="title" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Name *</form:label>
            <form:input path="title"
                        cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="title" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <form:label path="startDate" cssClass="block text-sm font-medium text-gray-700 mb-1">Start Date *</form:label>
                <form:input path="startDate" type="date"
                            cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <form:errors path="startDate" cssClass="text-red-500 text-sm mt-1"/>
            </div>
            <div>
                <form:label path="endDate" cssClass="block text-sm font-medium text-gray-700 mb-1">End Date *</form:label>
                <form:input path="endDate" type="date"
                            cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <form:errors path="endDate" cssClass="text-red-500 text-sm mt-1"/>
            </div>
        </div>

        <div>
            <form:label path="category" cssClass="block text-sm font-medium text-gray-700 mb-1">Category *</form:label>
            <form:select path="category"
                         cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple">
                <c:forEach var="category" items="${categories}">
                    <option >${category}</option>
                </c:forEach>
            </form:select>
            <form:errors path="category" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div>
            <form:label path="image_url" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Image URL (Optional)</form:label>
            <form:input path="image_url" type="url"
                        cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="image_url" cssClass="text-red-500 text-sm mt-1"/>
            <p class="text-xs text-gray-500 mt-1">Leave blank to use a default image</p>
        </div>

        <div>
            <form:label path="city" cssClass="block text-sm font-medium text-gray-700 mb-1">City: </form:label>
            <form:input path="city"
                        cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="city" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div>
            <form:label path="description" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Description *</form:label>
            <form:textarea path="description" rows="4"
                           cssClass="w-full border border-orange-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="description" cssClass="text-red-500 text-sm mt-1"/>
        </div>



        <div class="text-right">
            <button type="submit"
                    class="bg-primary-purple text-white font-semibold px-6 py-2 rounded-lg hover:bg-secondary-orange transition">
                Create Event
            </button>
        </div>

    </form:form>
</main>
</body>
</html>
