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

<body class="bg-slate-50 text-slate-900 font-sans antialiased">
<header class="max-w-4xl mx-auto px-4 py-6">
    <h1 class="text-3xl font-bold text-primary-purple">Create New Event</h1>
</header>

<main class="max-w-4xl mx-auto px-4 pb-12">
    <form:form action="/create" method="post" modelAttribute="event" class="bg-white p-6 rounded-xl shadow space-y-6">

        <div>
            <form:label path="title" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Name *</form:label>
            <form:input path="title"
                        cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="title" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <form:label path="startDate" cssClass="block text-sm font-medium text-gray-700 mb-1">Start Date *</form:label>
                <form:input path="startDate" type="date"
                            cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <form:errors path="startDate" cssClass="text-red-500 text-sm mt-1"/>
            </div>
            <div>
                <form:label path="endDate" cssClass="block text-sm font-medium text-gray-700 mb-1">End Date *</form:label>
                <form:input path="endDate" type="date"
                            cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <form:errors path="endDate" cssClass="text-red-500 text-sm mt-1"/>
            </div>
        </div>

        <div>
            <form:label path="category" cssClass="block text-sm font-medium text-gray-700 mb-1">Category *</form:label>
            <form:select path="category"
                         cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple">
                <form:option value="" label="Select a category"/>
                <form:option value="environment" label="Environment"/>
                <form:option value="community" label="Community"/>
                <form:option value="education" label="Education"/>
                <form:option value="health" label="Health"/>
            </form:select>
            <form:errors path="category" cssClass="text-red-500 text-sm mt-1"/>
        </div>
        <div class="mb-6">
            <label class="block text-gray-700 font-medium mb-2">Your Skills</label>
            <div class="grid grid-cols-2 md:grid-cols-3 gap-2">
                <c:forEach var="skill" items="${allSkills}">
                    <label class="flex items-center space-x-2 p-2 hover:bg-gray-50 rounded">
                        <input type="checkbox" name="skillIds" value="${skill.id}"
                               class="rounded border-gray-300 text-primary-purple focus:ring-primary-purple">
                        <span class="text-sm text-gray-700">${skill.name}</span>
                    </label>
                </c:forEach>
            </div>
        </div>
        <div>
            <form:label path="image_url" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Image URL (Optional)</form:label>
            <form:input path="image_url" type="url"
                        cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="image_url" cssClass="text-red-500 text-sm mt-1"/>
            <p class="text-xs text-gray-500 mt-1">Leave blank to use a default image</p>
        </div>

        <div>
            <form:label path="description" cssClass="block text-sm font-medium text-gray-700 mb-1">Event Description *</form:label>
            <form:textarea path="description" rows="4"
                           cssClass="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <form:errors path="description" cssClass="text-red-500 text-sm mt-1"/>
        </div>


        <hr class="border-gray-700 my-4"/>
        <div class="mt-9">
            <label class="block text-sm font-medium text-gray-700 mb-2">Tasks</label>
            <input type="text" name="taskDescriptions" placeholder="Task 1"
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <input type="text" name="taskDescriptions" placeholder="Task 2"
                   class="w-full mt-5 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <input type="text" name="taskDescriptions" placeholder="Task 3"
                   class="w-full mt-5 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
        </div>
        <hr class="border-gray-700 my-4"/>

        <div class="mt-9">
            <label class="block text-sm font-medium text-gray-700 mb-2">Expected Outcomes</label>
            <input type="text"  name="outcomesNames" placeholder="outcome-1"
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <input type="text" name="outcomesNames" placeholder="outcome-2"
                   class="w-full  mt-5 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <input type="text" name="outcomesNames" placeholder="outcome-3"
                   class="w-full border mt-5  border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
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
