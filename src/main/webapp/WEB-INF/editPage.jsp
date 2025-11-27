<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Edit Event — ${event.title}</title>
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

<header class="max-w-5xl mx-auto px-4 py-6">
    <h1 class="text-4xl font-extrabold text-primary-purple">Edit Event</h1>
</header>

<main class="max-w-5xl mx-auto px-4 pb-20 space-y-10">

    <!-- Each EDIT CARD -->
    <!-- REUSABLE COMPONENT -->
    <!-- Label, input, and accept/reject buttons -->

    <!-- Field: Title -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Title</label>
        <div class="mt-3 flex items-center gap-3">
            <input type="text"
                   value="${event.title}"
                   class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
            <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
        </div>
    </div>

    <!-- Field: Description -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Description</label>
        <div class="mt-3 flex items-start gap-3">
            <textarea class="w-full border rounded-lg px-4 py-2 h-32 focus:ring-primary-purple focus:border-primary-purple">${event.description}</textarea>
            <div class="flex flex-col gap-2">
                <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
                <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
            </div>
        </div>
    </div>

    <!-- Field: Date -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Event Date</label>
        <div class="mt-3 flex items-center gap-3">
            <input type="date"
                   value="${event.startDate}"
                   class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
            <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
        </div>
    </div>

    <!-- Field: Image URL -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Image URL</label>
        <div class="mt-3 flex items-center gap-3">
            <input type="text"
                   value="${event.image_url}"
                   class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
            <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
        </div>
    </div>

    <!-- Field: Expected Outcomes -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Expected Outcomes</label>

        <div class="space-y-4 mt-4">
            <c:forEach var="item" items="${event.expectedOutcomes}">
                <div class="flex items-center gap-3">
                    <input type="text"
                           value="${item}"
                           class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple" />

                    <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
                    <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Field: Tasks -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Tasks</label>

        <div class="space-y-4 mt-4">
            <c:forEach var="task" items="${event.tasks}">
                <div class="flex items-center gap-3">
                    <input type="text"
                           value="${task}"
                           class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple" />

                    <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
                    <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Field: Available Spots -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Available Spots</label>
        <div class="mt-3 flex items-center gap-3">
            <input type="number"
                   value="${event.availableSpots}"
                   class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
            <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
        </div>
    </div>

    <!-- Field: Required Skills -->
    <div class="bg-white p-6 rounded-xl shadow border">
        <label class="text-lg font-semibold text-primary-purple">Required Skills</label>

        <div class="space-y-4 mt-4">
            <c:forEach var="skill" items="${event.skills}">
                <div class="flex items-center gap-3">
                    <input type="text"
                           value="${skill}"
                           class="w-full border rounded-lg px-4 py-2 focus:ring-primary-purple focus:border-primary-purple"/>

                    <button class="px-3 py-2 bg-green-100 text-green-700 rounded-lg font-bold text-lg">✓</button>
                    <button class="px-3 py-2 bg-red-100 text-red-600 rounded-lg font-bold text-lg">✕</button>
                </div>
            </c:forEach>
        </div>
    </div>

</main>

</body>
</html>
