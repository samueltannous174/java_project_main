

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
</head>
<body class="bg-gray-50">

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
                    new Event
                </a>
            </c:if>
        </div>

        <form class="hidden sm:flex" action="/logout" method="post">
            <input type="submit" value="Logout"
                   class="ml-4 px-4 py-2 text-sm font-medium text-primary-purple/80 bg-background-white border border-primary-purple/20 rounded-md hover:bg-red-500 hover:text-white duration-150 flex items-center">
        </form>
    </div>
</nav>

<div class="max-w-5xl mx-auto px-4 py-8">
    <div class="bg-white rounded-2xl shadow-lg overflow-hidden  flex flex-col">
        <div class="border-b border-gray-200">
            <div class="flex">
                <button type="button"
                        onclick="switchTab('participant')"
                        id="participantTab"
                        class="flex-1 px-6 py-4 text-center font-medium text-gray-600 hover:text-gray-800 hover:bg-gray-50 transition-colors border-b-2 border-transparent">
                    <i class="fas fa-users mr-2"></i>
                    Participant Chat
                </button>

                <button type="button"
                        onclick="switchTab('ai')"
                        id="aiTab"
                        class="flex-1 px-6 py-4 text-center font-medium text-primary-purple bg-gray-50 transition-colors border-b-2 border-primary-purple">
                    <i class="fas fa-robot mr-2"></i>
                    AI Assistant
                </button>
            </div>
        </div>

        <div id="participantChat" class="flex-1 flex flex-col hidden">
            <div class="flex-1 overflow-y-auto p-6 space-y-4 scroll-smooth bg-gray-50">
                <c:forEach var="message" items="${event.messages}">
                    <c:choose>
                        <c:when test="${message.user.id != logged.id && message.type == 2}" >
                            <div class="chat-message flex items-start gap-3">
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gray-300 rounded-full overflow-hidden flex items-center justify-center">
                                        <img
                                                class="w-full h-full object-cover"
                                                src="${logged.image_url}"
                                                alt="profile"
                                        />
                                    </div>
                                </div>

                                <div class="flex-1">
                                    <div class="flex items-center gap-2 mb-1">
                                        <span class="font-semibold text-gray-800">${message.user.firstname}</span>
                                        <span class="text-xs text-gray-500">2:40 PM</span>
                                    </div>
                                    <div class="bg-white rounded-2xl rounded-tl-sm px-4 py-3 shadow-sm">
                                        <p class="text-gray-700">
                                            ${message.content}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${message.user.id == logged.id && message.type == 2}">
                            <div class="chat-message flex items-start gap-3 justify-end">
                                <div class="flex-1 flex flex-col items-end">
                                    <div class="flex items-center gap-2 mb-1">
                                        <span class="font-semibold text-gray-800">You</span>
                                    </div>
                                    <div class="bg-primary-purple text-white rounded-2xl rounded-tr-sm px-4 py-3 shadow-sm max-w-md">
                                        <p>${message.content}</p>
                                    </div>
                                </div>
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gray-300 rounded-full overflow-hidden flex items-center justify-center">
                                        <img
                                                class="w-full h-full object-cover"
                                                src="${logged.image_url}"
                                                alt="profile"
                                        />
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </div>

            <div class="border-t border-gray-200 bg-white p-4">
                <form id="participantChatForm" class="flex gap-3" method="post" action="/participant/message">
                    <input
                            name="content"
                            type="text"
                            id="participantMessageInput"
                            placeholder="Send a message to other participants..."
                            class="flex-1 px-4 py-3 bg-gray-100 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple transition-all"
                            autocomplete="off"
                            required
                    />
                    <input type="hidden" name="user_id" value="${logged.id}">
                    <input type="hidden" name="event_id" value="${event.id}">
                    <input type="hidden" name="type" value="2">
                    <input type="hidden" name="activeTab" value="participant">
                    <button
                            type="submit"
                            class="bg-primary-purple hover:bg-purple-900 text-white px-5 py-3 rounded-xl transition-all transform hover:scale-105 active:scale-95 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:ring-offset-2 shadow-lg">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </form>
            </div>
        </div>

        <div id="aiChat" class="flex-1 flex flex-col">
            <div id="aiMessagesContainer"
                 class="flex-1 scroll-smooth p-6 space-y-4 overflow-y-visible bg-gray-50">

                <div class="chat-message flex items-start gap-3">
                    <div class="flex-shrink-0">
                        <div class="w-10 h-10 bg-gradient-to-br from-primary-purple to-purple-900 rounded-full flex items-center justify-center shadow-lg">
                            <i class="fas fa-robot text-white"></i>
                        </div>
                    </div>

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




                        <c:forEach var="message" items="${event.messages}">
                            <c:choose>
                                <c:when test="${message.user.id == 9 && message.type == 1}">
                                    <div class="bg-white rounded-2xl rounded-tl-sm px-4 py-3 shadow-sm">
                                        <p class="text-gray-700">
                                                ${message.content}
                                        </p>
                                    </div>
                                </c:when>

                                <c:when test="${message.user.id == logged.id && message.type == 1}">
                                    <div class="flex-1 flex flex-col items-end">
                                        <div class="flex items-center gap-2 mb-1">
                                            <span class="text-xs text-gray-500">2:42 PM</span>
                                            <span class="font-semibold text-gray-800">You</span>
                                        </div>
                                        <div class="bg-primary-purple text-white rounded-2xl rounded-tr-sm px-4 py-3 shadow-sm max-w-md">
                                            <p>
                                                    ${message.content}
                                            </p>
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${message.user.id != 9 && message.user.id != logged.id && message.type == 1}">
                                    <div class="flex-1 flex flex-col items-end">
                                        <div class="flex items-center gap-2 mb-1">
                                            <span class="text-xs text-gray-500">2:42 PM</span>
                                            <span class="font-semibold text-gray-800">${message.user.firstname}</span>
                                        </div>
                                        <div class="bg-orange-200 text-white rounded-2xl rounded-tr-sm px-4 py-3 shadow-sm max-w-md">
                                            <p>
                                                    ${message.content}
                                            </p>
                                        </div>
                                    </div>

                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>

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

            <div class="border-t border-gray-200 bg-white p-4">
                <form id="aiChatForm" action="/ai/message" method="post" class="flex gap-3">
                    <input
                            type="text"
                            name="content"
                            id="aiMessageInput"
                            placeholder="Ask the AI assistant..."
                            class="flex-1 px-4 py-3 bg-gray-100 border-none rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-purple transition-all"
                            autocomplete="off"
                            required
                    />

                    <input type="hidden" name="user_id" value="${logged.id}">
                    <input type="hidden" name="event_id" value="${event.id}">
                    <input type="hidden" name="type" value="1">
                    <input type="hidden" name="activeTab" value="ai">
                    <button
                            type="submit"
                            class="bg-primary-purple hover:bg-purple-900 text-white px-5 py-3 rounded-xl transition-all transform hover:scale-105 active:scale-95 focus:outline-none focus:ring-2 focus:ring-primary-purple focus:ring-offset-2 shadow-lg">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    function switchTab(tab) {
        const participantTab = document.getElementById('participantTab');
        const aiTab = document.getElementById('aiTab');
        const participantChat = document.getElementById('participantChat');
        const aiChat = document.getElementById('aiChat');

        if (tab === 'participant') {
            participantTab.classList.add('text-primary-purple', 'bg-gray-50', 'border-primary-purple');
            participantTab.classList.remove('text-gray-600', 'border-transparent');

            aiTab.classList.add('text-gray-600', 'border-transparent');
            aiTab.classList.remove('text-primary-purple', 'bg-gray-50', 'border-primary-purple');

            participantChat.classList.remove('hidden');
            participantChat.classList.add('flex');
            aiChat.classList.add('hidden');
            aiChat.classList.remove('flex');
        } else {
            aiTab.classList.add('text-primary-purple', 'bg-gray-50', 'border-primary-purple');
            aiTab.classList.remove('text-gray-600', 'border-transparent');

            participantTab.classList.add('text-gray-600', 'border-transparent');
            participantTab.classList.remove('text-primary-purple', 'bg-gray-50', 'border-primary-purple');

            aiChat.classList.remove('hidden');
            aiChat.classList.add('flex');
            participantChat.classList.add('hidden');
            participantChat.classList.remove('flex');
        }
    }
    function sendMessage(e) {
        e.preventDefault();
    }

    window.addEventListener("DOMContentLoaded", () => {
        const params = new URLSearchParams(window.location.search);
        const activeTab = params.get("activeTab");

        if (activeTab === "participant") {
            switchTab("participant");
        } else if (activeTab === "ai") {
            switchTab("ai");
        }
    });
</script>

</body>
</html>
