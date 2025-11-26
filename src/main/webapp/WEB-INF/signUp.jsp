<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Your Account - Voluntree</title>
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
        <div class="hidden lg:flex lg:w-1/2 p-12 flex-col justify-between">
            <div>
                <div class="flex items-center gap-4 mb-12">
                    <div class="bg-teal-500 p-4 rounded-2xl">
                        <i class="fas fa-users text-white text-3xl"></i>
                    </div>
                    <div>
                        <h1 class="text-3xl font-bold text-gray-800">Voluntree</h1>
                        <p class="text-gray-600">Connecting Communities</p>
                    </div>
                </div>

                <div class="space-y-8">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-6">Join thousands of volunteers</h2>
                    
                    <div class="flex items-center gap-4">
                        <div class="bg-teal-100 rounded-full p-2 w-10 h-10 flex items-center justify-center flex-shrink-0">
                            <i class="fas fa-check text-teal-600"></i>
                        </div>
                        <p class="text-gray-600">Discover meaningful opportunities</p>
                    </div>

                    <div class="flex items-center gap-4">
                        <div class="bg-teal-100 rounded-full p-2 w-10 h-10 flex items-center justify-center flex-shrink-0">
                            <i class="fas fa-check text-teal-600"></i>
                        </div>
                        <p class="text-gray-600">Track your volunteering hours</p>
                    </div>

                    <div class="flex items-center gap-4">
                        <div class="bg-teal-100 rounded-full p-2 w-10 h-10 flex items-center justify-center flex-shrink-0">
                            <i class="fas fa-check text-teal-600"></i>
                        </div>
                        <p class="text-gray-600">Earn badges and achievements</p>
                    </div>

                    <div class="flex items-center gap-4">
                        <div class="bg-teal-100 rounded-full p-2 w-10 h-10 flex items-center justify-center flex-shrink-0">
                            <i class="fas fa-check text-teal-600"></i>
                        </div>
                        <p class="text-gray-600">Connect with like-minded volunteers</p>
                    </div>

                    <div class="flex items-center gap-4">
                        <div class="bg-teal-100 rounded-full p-2 w-10 h-10 flex items-center justify-center flex-shrink-0">
                            <i class="fas fa-check text-teal-600"></i>
                        </div>
                        <p class="text-gray-600">Make a real difference</p>
                    </div>
                </div>
            </div>

            <div class="bg-teal-500 rounded-3xl p-8 text-white mt-12">
                <h3 class="text-xl font-bold mb-3">For Organizations</h3>
                <p class="text-teal-50">Are you an authorized organization? Register as an organizer to create and manage volunteering events for your community.</p>
            </div>
        </div>

        <div class="w-full lg:w-1/2 flex items-center justify-center p-6 lg:p-12">
            <div class="bg-white rounded-3xl shadow-2xl p-8 lg:p-12 w-full max-w-md">
                <div class="mb-8">
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">Create Your Account</h2>
                    <p class="text-gray-500">Join our community of changemakers</p>
                </div>

                <div class="mb-8">
                    <div class="h-1 bg-gray-200 rounded-full">
                        <div class="h-1 bg-teal-500 rounded-full" style="width: 50%"></div>
                    </div>
                </div>

                <form:form method="POST" action="${pageContext.request.contextPath}/register" modelAttribute="user">
                    <!-- Full Name -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2" for="fullName">Full Name</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-user"></i>
                            </span>
                            <form:input path="fullName" id="fullName" 
                                class="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all" 
                                placeholder="John Doe" required="required"/>
                        </div>
                        <form:errors path="fullName" cssClass="text-red-500 text-sm mt-1" />
                    </div>

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
                                placeholder="At least 6 characters" required="required"/>
                            <button type="button" onclick="togglePassword('password')" 
                                class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <i class="fas fa-eye" id="togglePasswordIcon"></i>
                            </button>
                        </div>
                        <form:errors path="password" cssClass="text-red-500 text-sm mt-1" />
                    </div>

                    <!-- Confirm Password -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-medium mb-2" for="confirmPassword">Confirm Password</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" name="confirmPassword" id="confirmPassword" 
                                class="w-full pl-12 pr-12 py-3 bg-gray-50 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 transition-all" 
                                placeholder="Re-enter your password" required/>
                            <button type="button" onclick="togglePassword('confirmPassword')" 
                                class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Terms and Conditions -->
                    <div class="mb-6">
                        <label class="flex items-start gap-3 cursor-pointer">
                            <input type="checkbox" name="acceptTerms" required 
                                class="mt-1 w-5 h-5 text-teal-500 bg-gray-100 border-gray-300 rounded focus:ring-teal-500">
                            <span class="text-sm text-gray-600">
                                I agree to the 
                                <a href="${pageContext.request.contextPath}/terms" class="text-teal-500 hover:text-teal-600 font-medium">Terms of Service</a> 
                                and 
                                <a href="${pageContext.request.contextPath}/privacy" class="text-teal-500 hover:text-teal-600 font-medium">Privacy Policy</a>
                            </span>
                        </label>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" 
                        class="w-full bg-teal-500 hover:bg-teal-600 text-white font-semibold py-3 rounded-xl transition-all transform hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
                        Continue
                    </button>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="mt-4 p-3 bg-red-50 border border-red-200 text-red-600 rounded-lg text-sm">
                            ${error}
                        </div>
                    </c:if>
                </form:form>

                <!-- Sign In Link -->
                <p class="text-center text-gray-600 mt-8">
                    Already have an account? 
                    <a href="${pageContext.request.contextPath}/signin" class="text-teal-500 hover:text-teal-600 font-semibold">Sign in</a>
                </p>
            </div>
        </div>
    </div>

    <script>
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const icon = document.getElementById('toggle' + fieldId.charAt(0).toUpperCase() + fieldId.slice(1) + 'Icon');
            
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

