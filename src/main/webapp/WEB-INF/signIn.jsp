<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Voluntree</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-green-50 to-teal-50 min-h-screen">
    <div class="flex min-h-screen">
        <div class="hidden lg:flex lg:w-1/2 p-12 flex-col justify-center">
            <div class="mb-12">
                <div class="flex items-center gap-4 mb-16">
                    <div class="bg-teal-500 p-4 rounded-2xl">
                        <i class="fas fa-users text-white text-3xl"></i>
                    </div>
                    <div>
                        <h1 class="text-3xl font-bold text-gray-800">Voluntree</h1>
                        <p class="text-gray-600">Connecting Communities</p>
                    </div>
                </div>

                <div class="space-y-8">
                    <div class="flex items-start gap-5 bg-white rounded-2xl p-6 shadow-sm hover:shadow-md transition-all">
                        <div class="bg-teal-100 rounded-xl p-3 flex-shrink-0">
                            <i class="fas fa-heart text-teal-600 text-2xl"></i>
                        </div>
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Find Your Passion</h3>
                            <p class="text-gray-600">Discover meaningful volunteering opportunities that match your skills and interests.</p>
                        </div>
                    </div>

                    <div class="flex items-start gap-5 bg-white rounded-2xl p-6 shadow-sm hover:shadow-md transition-all">
                        <div class="bg-teal-100 rounded-xl p-3 flex-shrink-0">
                            <i class="fas fa-hands-helping text-teal-600 text-2xl"></i>
                        </div>
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Make an Impact</h3>
                            <p class="text-gray-600">Join a community of dedicated volunteers creating positive change in our world.</p>
                        </div>
                    </div>

                    <div class="flex items-start gap-5 bg-white rounded-2xl p-6 shadow-sm hover:shadow-md transition-all">
                        <div class="bg-teal-100 rounded-xl p-3 flex-shrink-0">
                            <i class="fas fa-chart-line text-teal-600 text-2xl"></i>
                        </div>
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Track Your Journey</h3>
                            <p class="text-gray-600">Earn badges, track hours, and celebrate your volunteering achievements.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-full lg:w-1/2 flex items-center justify-center p-6 lg:p-12">
            <div class="bg-white rounded-3xl shadow-2xl p-8 lg:p-12 w-full max-w-md">
                <div class="mb-8">
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">Welcome Back</h2>
                    <p class="text-gray-500">Sign in to continue your volunteering journey</p>
                </div>

                <!-- Sign In Form -->
                <form:form method="POST" action="${pageContext.request.contextPath}/login" modelAttribute="loginForm">
                    <!-- Email Address -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2" for="email">Email Address</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-envelope"></i>
                            </span>
                            <form:input path="email" type="email" id="email" 
                                class="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all" 
                                placeholder="your.email@example.com" required="required"/>
                        </div>
                        <form:errors path="email" cssClass="text-red-500 text-sm mt-1" />
                    </div>

                    <!-- Password -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2" for="password">Password</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-lock"></i>
                            </span>
                            <form:password path="password" id="password" 
                                class="w-full pl-12 pr-12 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all" 
                                placeholder="Enter your password" required="required"/>
                            <button type="button" onclick="togglePassword()" 
                                class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <i class="fas fa-eye" id="togglePasswordIcon"></i>
                            </button>
                        </div>
                        <form:errors path="password" cssClass="text-red-500 text-sm mt-1" />
                    </div>

                    <!-- Remember Me & Forgot Password -->
                    <div class="flex items-center justify-between mb-6">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="rememberMe" 
                                class="w-4 h-4 text-teal-500 bg-gray-100 border-gray-300 rounded focus:ring-teal-500">
                            <span class="text-sm text-gray-700">Remember me</span>
                        </label>
                        <a href="${pageContext.request.contextPath}/forgot-password" 
                            class="text-sm text-teal-500 hover:text-teal-600 font-medium">
                            Forgot password?
                        </a>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" 
                        class="w-full bg-teal-500 hover:bg-teal-600 text-white font-semibold py-3 rounded-xl transition-all transform hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
                        Sign In
                    </button>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="mt-4 p-3 bg-red-50 border border-red-200 text-red-600 rounded-lg text-sm">
                            ${error}
                        </div>
                    </c:if>

                    <!-- Success Message -->
                    <c:if test="${not empty message}">
                        <div class="mt-4 p-3 bg-green-50 border border-green-200 text-green-600 rounded-lg text-sm">
                            ${message}
                        </div>
                    </c:if>
                </form:form>

                <!-- Divider -->
                <div class="relative my-8">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-200"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-4 bg-white text-gray-500">Or try demo accounts</span>
                    </div>
                </div>

                <!-- Demo Accounts -->
                <div class="grid grid-cols-2 gap-4 mb-8">
                    <form method="POST" action="${pageContext.request.contextPath}/demo-login">
                        <input type="hidden" name="role" value="volunteer"/>
                        <button type="submit" 
                            class="w-full py-3 px-4 border-2 border-gray-200 text-gray-700 font-medium rounded-xl hover:border-teal-500 hover:text-teal-500 transition-all focus:outline-none focus:ring-2 focus:ring-teal-500">
                            Demo Volunteer
                        </button>
                    </form>
                    
                    <form method="POST" action="${pageContext.request.contextPath}/demo-login">
                        <input type="hidden" name="role" value="organizer"/>
                        <button type="submit" 
                            class="w-full py-3 px-4 border-2 border-gray-200 text-gray-700 font-medium rounded-xl hover:border-teal-500 hover:text-teal-500 transition-all focus:outline-none focus:ring-2 focus:ring-teal-500">
                            Demo Organizer
                        </button>
                    </form>
                </div>

                <!-- Sign Up Link -->
                <p class="text-center text-gray-600">
                    Don't have an account? 
                    <a href="${pageContext.request.contextPath}/signup" class="text-teal-500 hover:text-teal-600 font-semibold">Sign up</a>
                </p>
            </div>
        </div>
    </div>

    <!-- Help Button -->
    <button class="fixed bottom-8 right-8 bg-gray-800 hover:bg-gray-900 text-white w-12 h-12 rounded-full shadow-lg flex items-center justify-center transition-all transform hover:scale-110 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:ring-offset-2">
        <i class="fas fa-question"></i>
    </button>

    <script>
        function togglePassword() {
            const field = document.getElementById('password');
            const icon = document.getElementById('togglePasswordIcon');
            
            if (field.type === 'password') {
                field.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                field.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>