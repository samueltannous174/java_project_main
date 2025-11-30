<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Volunteers</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-6">

<div class="max-w-3xl mx-auto">
    <h2 class="text-2xl font-bold mb-6 text-gray-800">All Volunteers</h2>

    <c:forEach var="v" items="${volunteers}">
        <div class="p-4 bg-white border rounded-lg mb-3 flex justify-between items-center shadow-sm hover:shadow-md transition">
            <div>
                <div class="text-gray-800 font-medium">${v.firstname} ${v.lastname}</div>
                <div class="text-sm text-gray-500">Role: ${v.role}</div>
            </div>

            <form action="/admin/make-organizer" method="post"
                  onsubmit="return confirm('Are you sure you want to make ${v.firstname} an organizer?');">
                <input type="hidden" name="userId" value="${v.id}">
                <button
                        class="bg-green-600 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded-lg transition"
                >
                    Make Organizer
                </button>
            </form>
        </div>
    </c:forEach>

    <c:if test="${empty volunteers}">
        <p class="text-gray-500 text-center mt-6">No volunteers found.</p>
    </c:if>
</div>

</body>
</html>
