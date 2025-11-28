<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-br from-purple-100 to-orange-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white shadow-2xl rounded-3xl p-10 w-1/2">

    <h2 class="text-3xl font-bold text-center mb-8">Edit Profile</h2>

    <form action="/edit" method="POST">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="${user.id}" />

        <!-- FIRST NAME -->
        <label class="block mb-2 font-semibold">First Name</label>
        <input type="text"
               name="firstname"
               value="${user.firstname}"
               class="w-full px-4 py-3 bg-gray-100 rounded-xl mb-4" />

        <!-- LAST NAME -->
        <label class="block mb-2 font-semibold">Last Name</label>
        <input type="text"
               name="lastname"
               value="${user.lastname}"
               class="w-full px-4 py-3 bg-gray-100 rounded-xl mb-4" />

        <!-- IMAGE URL -->
        <label class="block mb-2 font-semibold">Image URL</label>
        <input type="text"
               name="image_url"
               value="${user.image_url}"
               class="w-full px-4 py-3 bg-gray-100 rounded-xl mb-4" />

        <!-- ROLE -->
        <label class="block mb-2 font-semibold">Role</label>
        <select name="role"
                class="w-full px-4 py-3 bg-gray-100 rounded-xl mb-4">
            <option value="VOLUNTEER"
            ${user.role == 'VOLUNTEER' ? 'selected' : ''}>Volunteer</option>
            <option value="ORGANIZER"
            ${user.role == 'ORGANIZER' ? 'selected' : ''}>Organizer</option>
        </select>

        <label class="block mb-2 font-semibold">Skills</label>

        <div class="max-h-60 overflow-y-auto border rounded-lg p-3">
            <c:forEach items="${allSkills}" var="skill">
                <div class="flex items-center mb-2 p-2 hover:bg-gray-50 rounded">
                    <input type="checkbox"
                           id="skill_${skill.id}"
                           name="skills"
                           value="${skill.id}"
                           class="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300 rounded"
                           <c:if test="${fn:contains(userSkillIds, skill.id)}">checked</c:if>
                    />
                    <label for="skill_${skill.id}" class="ml-2 text-sm font-medium text-gray-700 cursor-pointer">
                            ${skill.name}
                    </label>
                </div>
            </c:forEach>
        </div>


        <button type="submit"
                class="w-full bg-purple-800 text-white py-3 rounded-xl hover:bg-orange-500 mt-6">
            Update Profile
        </button>

    </form>

</div>
</body>
</html>
