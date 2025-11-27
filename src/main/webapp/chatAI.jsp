<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Communications - Voluntree</title>
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
    </script>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        
        .chat-message {
            animation: fadeInUp 0.3s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .typing-indicator {
            display: inline-flex;
            gap: 4px;
            padding: 8px 12px;
        }
        
        .typing-indicator span {
            width: 8px;
            height: 8px;
            background-color: #9CA3AF;
            border-radius: 50%;
            animation: typing 1.4s infinite;
        }
        
        .typing-indicator span:nth-child(2) {
            animation-delay: 0.2s;
        }
        
        .typing-indicator span:nth-child(3) {
            animation-delay: 0.4s;
        }
        
        @keyframes typing {
            0%, 60%, 100% {
                transform: translateY(0);
            }
            30% {
                transform: translateY(-10px);
            }
        }
        
        .chat-container {
            height: calc(100vh - 200px);
            min-height: 400px;
        }
        
        .scroll-smooth {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body class="bg-gray-50">
    <!-- Navigation Bar  -->
    <nav class="bg-white shadow-sm border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16 items-center">
                <!-- Logo -->
                <div class="flex items-center gap-3">
                    <div class="bg-primary-purple p-2 rounded-lg">
                        <i class="fas fa-users text-white text-xl"></i>
                    </div>
                    <div>
                        <h1 class="text-xl font-bold text-gray-800">Voluntree</h1>
                    </div>
                </div>
                
                <!-- User Menu -->
                <div class="flex items-center gap-4">
                    <span class="text-gray-600">Welcome, <strong>${user.fullName}</strong></span>
                    <a href="${pageContext.request.contextPath}/auth/logout" 
                        class="text-gray-600 hover:text-gray-800">
                        <i class="fas fa-sign-out-alt"></i>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="max-w-5xl mx-auto px-4 py-8">
        <!-- Page Header -->
        <div class="bg-white rounded-2xl shadow-sm p-6 mb-6">
            <div class="flex items-center gap-3">
                <div class="bg-purple-50 p-3 rounded-xl">
                    <i class="fas fa-comments text-primary-purple text-2xl"></i>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Event Communications</h2>
                    <p class="text-gray-600">Chat with participants or get help from AI Assistant</p>
                </div>
            </div>
        </div>

        <!-- Chat Container -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
            <!-- Tabs -->
            <div class="border-b border-gray-200">
                <div class="flex">
                    <!-- Participant Chat Tab -->
                    <button onclick="switchTab('participant')" 
                            id="participantTab"
                            class="flex-1 px-6 py-4 text-center font-medium text-gray-600 hover:text-gray-800 hover:bg-gray-50 transition-colors border-b-2 border-transparent">
                        <i class="fas fa-users mr-2"></i>
                        Participant Chat
                    </button>
                    
                    <!-- AI Assistant Tab -->
                    <button onclick="switchTab('ai')" 
                            id="aiTab"
                            class="flex-1 px-6 py-4 text-center font-medium text-primary-purple bg-gray-50 transition-colors border-b-2 border-primary-purple">
                        <i class="fas fa-robot mr-2"></i>
                        AI Assistant
                    </button>
                </div>
            </div>

            <!-- Chat Content Area -->
            <div class="chat-container flex flex-col">
                <!-- Messages Area -->
                <div id="messagesContainer" 
                    class="flex-1 overflow-y-auto p-6 space-y-4 scroll-smooth bg-gray-50">
                    
                    <!-- Welcome Message -->
                    <div class="chat-message flex items-start gap-3">
                        <!-- AI Avatar -->
                        <div class="flex-shrink-0">
                            <div class="w-10 h-10 bg-gradient-to-br from-primary-purple to-purple-900 rounded-full flex items-center justify-center shadow-lg">
                                <i class="fas fa-robot text-white"></i>
                            </div>
                        </div>
                        
                        <!-- Message Content -->
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="font-semibold text-gray-800">AI Assistant</span>
                                <span class="text-xs text-gray-500">2:51 PM</span>
                            </div>
                            <div class="bg-white rounded-2xl rounded-tl-sm px-4 py-3 shadow-sm">
                                <p class="text-gray-700">
                                    Hello! I'm here to help answer any questions about this event. 
                                    Feel free to ask me about tasks, required materials, or anything else!
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Additional example messages (can be removed) -->
                    <!-- User Message Example -->
                    <!--
                    <div class="chat-message flex items-start gap-3 justify-end">
                        <div class="flex-1 flex flex-col items-end">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="text-xs text-gray-500">2:52 PM</span>
                                <span class="font-semibold text-gray-800">You</span>
                            </div>
                            <div class="bg-teal-500 text-white rounded-2xl rounded-tr-sm px-4 py-3 shadow-sm max-w-md">
                                <p>What materials do I need to bring?</p>
                            </div>
                        </div>
                        <div class="flex-shrink-0">
                            <div class="w-10 h-10 bg-gray-300 rounded-full flex items-center justify-center">
                                <i class="fas fa-user text-gray-600"></i>
                            </div>
                        </div>
                    </div>
                    -->

                </div>

                <!-- Typing Indicator (hidden by default) -->
                <div id="typingIndicator" class="px-6 py-2 hidden">
                    <div class="flex items-start gap-3">
                        <div class="flex-shrink-0">
                            <div class="w-10 h-10 bg-gradient-to-br from-primary-purple to-purple-900 rounded-full flex items-center justify-center shadow-lg">
                                <i class="fas fa-robot text-white"></i>
                            </div>
                        </div>
                        <div class="bg-white rounded-2xl px-4 py-2 shadow-sm">
                            <div class="typing-indicator">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Input Area -->
                <div class="border-t border-gray-200 bg-white p-4">
                    <form id="chatForm" onsubmit="sendMessage(event)" class="flex gap-3">
                        <input 
                            type="text" 
                            id="messageInput"
                            placeholder="Ask the AI assistant..." 
                            class="flex-1 px-4 py-3 bg-gray-100 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple transition-all"
                            autocomplete="off"
                            required
                        />
                        <button 
                            type="submit"
                            class="bg-primary-purple hover:bg-purple-900 text-white px-5 py-3 rounded-xl transition-all transform hover:scale-105 active:scale-95 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:ring-offset-2 shadow-lg">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </form>
                    
                    <!-- Quick Actions  -->
                    <div class="mt-3 flex flex-wrap gap-2">
                        <button onclick="quickQuestion('What time does the event start?')" 
                                class="text-xs px-3 py-1.5 bg-purple-50 hover:bg-purple-100 text-primary-purple rounded-full transition-colors border border-purple-200">
                            <i class="far fa-clock mr-1"></i> Event Time
                        </button>
                        <button onclick="quickQuestion('Where is the event located?')" 
                                class="text-xs px-3 py-1.5 bg-purple-50 hover:bg-purple-100 text-primary-purple rounded-full transition-colors border border-purple-200">
                            <i class="fas fa-map-marker-alt mr-1"></i> Location
                        </button>
                        <button onclick="quickQuestion('What should I bring?')" 
                                class="text-xs px-3 py-1.5 bg-purple-50 hover:bg-purple-100 text-primary-purple rounded-full transition-colors border border-purple-200">
                            <i class="fas fa-box mr-1"></i> Materials
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Event Info Card -->
        <div class="mt-6 bg-white rounded-2xl shadow-sm p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4">Event Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="flex items-center gap-3">
                    <div class="bg-purple-50 p-2 rounded-lg">
                        <i class="fas fa-calendar text-primary-purple"></i>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Date</p>
                        <p class="font-medium text-gray-800">${event.date}</p>
                    </div>
                </div>
                <div class="flex items-center gap-3">
                    <div class="bg-orange-50 p-2 rounded-lg">
                        <i class="fas fa-clock text-secondary-orange"></i>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Time</p>
                        <p class="font-medium text-gray-800">${event.time}</p>
                    </div>
                </div>
                <div class="flex items-center gap-3">
                    <div class="bg-purple-50 p-2 rounded-lg">
                        <i class="fas fa-map-marker-alt text-primary-purple"></i>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Location</p>
                        <p class="font-medium text-gray-800">${event.location}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

