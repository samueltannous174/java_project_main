<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
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
    <form action="saveEvent" method="post" class="bg-white p-6 rounded-xl shadow space-y-6" >

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="name">Event Name *</label>
            <input type="text" name="name" id="name"
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1" for="location">Location *</label>
                <input type="text" name="location" id="location"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1" for="date">Event Date *</label>
                <input type="date" name="date" id="date"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="category">Category *</label>
            <select name="category" id="category"
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple">
                <option value="" disabled selected>Select a category</option>
                <option value="environment">Environment</option>
                <option value="community">Community</option>
                <option value="education">Education</option>
                <option value="health">Health</option>
            </select>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="imageUrl">Event Image URL (Optional)</label>
            <input type="url" name="imageUrl" id="imageUrl" placeholder="https://example.com/image.jpg"
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            <p class="text-xs text-gray-500 mt-1">Leave blank to use a default image</p>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="description">Event Description *</label>
            <textarea name="description" id="description" rows="4"

                      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"></textarea>
        </div>

        <hr class="border-gray-700 my-4"/>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Tasks (3)</label>
            <div class="space-y-2">
                <input type="text" name="task1" placeholder="Task 1"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <input type="text" name="task2" placeholder="Task 2"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <input type="text" name="task3" placeholder="Task 3"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            </div>
        </div>

        <hr class="border-gray-700 my-4"/>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Skills Needed (3)</label>
            <div class="space-y-2">
                <input type="text" name="skill1" placeholder="Skill 1"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <input type="text" name="skill2" placeholder="Skill 2"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
                <input type="text" name="skill3" placeholder="Skill 3"
                       class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:border-primary-purple"/>
            </div>
        </div>

        <div class="text-right">
            <button type="submit"
                    class="bg-primary-purple text-white font-semibold px-6 py-2 rounded-lg hover:bg-secondary-orange transition">
                Create Event
            </button>
        </div>

    </form>
</main>
</body>
</html>
