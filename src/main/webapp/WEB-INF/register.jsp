<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages"/>
<fmt:setLocale value="${pageContext.request.locale}" />
<c:set var="currentLang" value="${pageContext.request.locale.language}" />

<!DOCTYPE html>
<html lang="${currentLang}" dir="${currentLang == 'ar' ? 'rtl' : 'ltr'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-widt    h, initial-scale=1.0">
    <title><fmt:message key="app.title.register"/></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        function togglePassword(id, iconId) {
            const input = document.getElementById(id);
            const icon = document.getElementById(iconId);
            if (input.type === "password") {
                input.type = "text";
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                input.type = "password";
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br w-full from-primary-purple/10 to-secondary-orange/10 min-h-screen flex items-center justify-center p-6">

<div class="absolute top-4 right-4 flex items-center gap-2 text-sm">
    <a href="?lang=en"
       class="px-2 py-1 rounded-full border border-primary-purple/30 text-primary-purple/80 hover:bg-primary-purple hover:text-white transition">
        EN
    </a>
    <a href="?lang=ar"
       class="px-2 py-1 rounded-full border border-primary-purple/30 text-primary-purple/80 hover:bg-primary-purple hover:text-white transition">
        AR
    </a>
</div>

<div class="bg-white rounded-3xl shadow-2xl p-8 lg:p-12 w-full lg:w-1/2">
    <div class="mb-8 text-center">
        <h2 class="text-3xl font-bold text-gray-800 mb-2">
            <fmt:message key="register.main.title"/>
        </h2>
        <p class="text-gray-500">
            <fmt:message key="register.main.subtitle"/>
        </p>
    </div>

    <form:form method="POST" action="/register" modelAttribute="newUser">
        <div class="mb-4 flex gap-4">
            <div class="w-1/2">
                <label class="block text-gray-700 font-medium mb-2" for="firstname">
                    <fmt:message key="register.form.firstname.label"/>
                </label>
                <form:input path="firstname" id="firstName" type="text"
                            class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
                <form:errors path="firstname" cssClass="text-red-500 text-sm mt-1"/>
            </div>
            <div class="w-1/2">
                <label class="block text-gray-700 font-medium mb-2" for="lastname">
                    <fmt:message key="register.form.lastname.label"/>
                </label>
                <form:input path="lastname" id="lastName" type="text"
                            class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
                <form:errors path="lastname" cssClass="text-red-500 text-sm mt-1"/>
            </div>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-medium mb-2" for="email">
                <fmt:message key="register.form.email.label"/>
            </label>
            <form:input path="email" id="email" type="email"
                        class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
            <form:errors path="email" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-medium mb-2" for="image_url">
                <fmt:message key="register.form.imageUrl.label"/>
            </label>
            <form:input path="image_url" id="image_url" type="text"
                        class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
            <form:errors path="image_url" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="mb-4 relative">
            <label class="block text-gray-700 font-medium mb-2" for="password">
                <fmt:message key="register.form.password.label"/>
            </label>
            <form:password path="password" id="password"
                           class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
            <button type="button" onclick="togglePassword('password','togglePasswordIcon1')"
                    class="absolute right-4 top-10 text-gray-400 hover:text-gray-600">
                <i class="fas fa-eye" id="togglePasswordIcon1"></i>
            </button>
            <form:errors path="password" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="mb-4 relative">
            <label class="block text-gray-700 font-medium mb-2" for="confirm">
                <fmt:message key="register.form.confirmPassword.label"/>
            </label>
            <form:password path="confirm" id="confirm"
                           class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple"/>
            <button type="button" onclick="togglePassword('confirm','togglePasswordIcon2')"
                    class="absolute right-4 top-10 text-gray-400 hover:text-gray-600">
                <i class="fas fa-eye" id="togglePasswordIcon2"></i>
            </button>
            <form:errors path="confirm" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="mb-6">
            <label class="block text-gray-700 font-medium mb-2" for="role">
                <fmt:message key="register.form.role.label"/>
            </label>
            <form:select path="role" id="role"
                         class="w-full px-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple">
                <form:option value="" selected="true" disabled="true"><fmt:message key='register.form.role.placeholder'/></form:option>
                <form:option value="VOLUNTEER" ><fmt:message key='register.form.role.volunteer'/></form:option>
                <form:option value="ORGANIZER" label="" ><fmt:message key='register.form.role.organizer'/></form:option>
            </form:select>
            <form:errors path="role" cssClass="text-red-500 text-sm mt-1"/>
        </div>

        <div class="mb-6">
            <label class="block text-gray-700 font-medium mb-2">
                <fmt:message key="register.form.skills.label"/>
            </label>
            <c:forEach items="${allSkills}" var="skill">
                <div class="flex items-center mb-2">
                    <form:checkbox path="skills" value="${skill.id}" id="skill_${skill.id}" />
                    <label for="skill_${skill.id}" class="ml-2 text-gray-700">${skill.name}</label>
                </div>
            </c:forEach>
        </div>

        <button type="submit"
                class="w-full bg-primary-purple hover:bg-secondary-orange text-white font-semibold py-3 rounded-xl transition-all transform hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-primary-purple focus:ring-offset-2">
            <fmt:message key="register.form.submit"/>
        </button>

        <c:if test="${not empty error}">
            <div class="mt-4 p-3 bg-red-50 border border-red-200 text-red-600 rounded-lg text-sm">
                    ${error}
            </div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="mt-4 p-3 bg-green-50 border border-green-200 text-green-600 rounded-lg text-sm">
                    ${message}
            </div>
        </c:if>
    </form:form>

    <div class="mb-6 mt-4">
        <label class="block text-gray-700 font-medium mb-2">
            <fmt:message key="register.section.skillsNeeded.label"/>
        </label>
        <%-- you can later show recommended skills text here if you want --%>
    </div>

    <p class="text-center text-gray-600 mt-6">
        <fmt:message key="register.form.alreadyHaveAccount"/>
        <a href="/login" class="text-primary-purple hover:text-secondary-orange font-semibold">
            <fmt:message key="register.form.signInLink"/>
        </a>
    </p>
</div>
</body>
</html>