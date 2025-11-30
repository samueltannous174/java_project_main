<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Page Not Found</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
<body class="min-h-screen bg-blue-50 flex items-center justify-center">

<div class="bg-white shadow-lg rounded-2xl px-10 py-12 max-w-md w-full text-center">

    <h1 class="text-6xl font-bold text-gray-800 mb-2">404</h1>
    <h2 class="text-2xl font-semibold text-gray-700 mb-4">Page Not Found</h2>
    <p class="text-gray-500 mb-8">
        Sorry, the page you are looking for doesn't exist or has been moved.
    </p>

    <a href="/"
       class="inline-block px-6 py-3 rounded-full bg-blue-600 text-white font-semibold text-lg hover:bg-blue-700 transition">
        Back to Home
    </a>

</div>

</body>
</html>
