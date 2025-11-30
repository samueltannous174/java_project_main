<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voluntree - Events</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

        // Simple AJAX functionality
        function loadEvents(page = 0, search = '', category = '') {
            const params = new URLSearchParams();
            if (page) params.append('page', page);
            if (search) params.append('search', search);
            if (category) params.append('category', category);

            $('#loadingIndicator').show();
            $('#eventsContainer').hide();
            $('#paginationContainer').hide();

            $.ajax({
                url: '/events?' + params.toString(),
                type: 'GET',
                dataType: 'html',
                success: function(data) {
                    // Extract just the events grid and pagination from the response
                    const tempDoc = $('<div>').html(data);
                    const newEvents = tempDoc.find('#eventsContainer').html();
                    const newPagination = tempDoc.find('#paginationContainer').html();
                    const eventCount = tempDoc.find('#eventCount').text();

                    $('#eventsContainer').html(newEvents);
                    $('#paginationContainer').html(newPagination);
                    $('#eventCount').text(eventCount);

                    // Update URL without page reload
                    const newUrl = '/events' + (params.toString() ? '?' + params.toString() : '');
                    window.history.pushState({}, '', newUrl);
                },
                error: function() {
                    alert('Error loading events. Please try again.');
                },
                complete: function() {
                    $('#loadingIndicator').hide();
                    $('#eventsContainer').show();
                    $('#paginationContainer').show();
                }
            });
        }

        // Initialize AJAX handlers when document is ready
        $(document).ready(function() {
            // AJAX search form submission
            $('#searchForm').on('submit', function(e) {
                e.preventDefault();
                const searchTerm = $('#searchInput').val();
                loadEvents(0, searchTerm, getSelectedCategory());
            });

            // AJAX category filter
            $('#categoryFilter').on('change', function() {
                const category = $(this).val();
                if (category) {
                    loadEvents(0, $('#searchInput').val(), category);
                }
            });

            // AJAX pagination
            $(document).on('click', '.pagination-link', function(e) {
                e.preventDefault();
                const page = $(this).data('page');
                loadEvents(page, $('#searchInput').val(), getSelectedCategory());
            });

            // Handle browser back/forward buttons
            window.addEventListener('popstate', function() {
                window.location.reload();
            });
        });

        function getSelectedCategory() {
            return $('#categoryFilter').val() || '';
        }
    </script>

    <style>
        :root {
            --color-primary-green: #00b894;
        }

        .text-primary-green {
            color: var(--color-primary-green);
        }

        .border-primary-green {
            border-color: var(--color-primary-green);
        }

        .loading-spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #390070;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 2s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body class="bg-background-white min-h-screen text-primary-purple font-sans">

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

<div class="w-full px-4 sm:px-10 lg:px-20 xl:px-32 py-12">

    <div class="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
        <div class="w-full lg:w-1/2">
            <form id="searchForm" class="relative w-full">
                <button type="submit"
                        class="absolute left-3.5 top-1/2 -translate-y-1/2 text-primary-purple/40
                   hover:text-primary-purple transition text-xl">
                    🔍
                </button>

                <input
                        id="searchInput"
                        type="text"
                        name="search"
                        value="${param.search}"
                        placeholder="Search events, organizers, or keywords... (leave it empty to get all events)"
                        class="w-full rounded-full border border-primary-purple/20 bg-background-white
               py-3 pl-11 pr-5 text-lg shadow-sm
               focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple"
                />
            </form>
        </div>

        <div class="flex w-full lg:w-1/2 gap-4">
            <select id="categoryFilter" class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option value="" ${empty param.category ? 'selected' : ''}>All Categories</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category}" ${param.category == category ? 'selected' : ''}>${category}</option>
                </c:forEach>
            </select>

            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option>All Skills</option>
            </select>

            <select class="w-1/3 rounded-full border border-primary-purple/20 bg-background-white px-4 py-2.5 text-sm shadow-sm focus:border-primary-purple focus:outline-none focus:ring-1 focus:ring-primary-purple">
                <option>Date</option>
            </select>
        </div>
    </div>

    <div id="loadingIndicator" class="hidden">
        <div class="loading-spinner"></div>
        <p class="text-center text-primary-purple/60 mt-2">Loading events...</p>
    </div>

    <div id="eventsContainer" class="mt-8 grid gap-8 grid-cols-1 sm:grid-cols-2 lg:grid-cols-4">
        <c:if test="${fn:length(events) == 0}">
            <p class="mt-8 text-lg text-primary-purple/60 col-span-full text-center">
                No events found.
            </p>
        </c:if>
        <c:if test="${fn:length(events) != 0}">
            <c:forEach var="event" items="${events}">
                <div class="bg-background-white rounded-2xl shadow-lg border border-primary-purple/10 overflow-hidden flex flex-col h-full">
                    <div class="relative h-60">
                        <img src="${event.image_url}"
                             alt="${event.title}" class="w-full h-full object-cover">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/5 to-transparent"></div>

                        <div class="absolute left-4 top-4 flex gap-2">
                    <span class="rounded-full bg-primary-purple px-4 py-1.5 text-sm font-semibold text-white shadow">
                            ${event.category}
                    </span>
                        </div>
                    </div>

                    <div class="flex-1 px-6 py-5 text-base">
                        <h3 class="text-xl font-semibold text-primary-purple mb-1 min-h-[3rem] leading-snug break-words">
                                ${event.title}
                        </h3>

                        <p class="text-sm text-primary-purple/60 mb-3">${orgnizer.firstName } ${orgnizer.lastName }</p>

                        <div class="space-y-1 text-base text-primary-purple/80">
                            <p>
                                📅
                                <fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/>
                                -
                                <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/>
                            </p>
                            <p> ${event.city}</p>
                            <p>👥 ${fn:length(event.users)} volunteer/s joined</p>
                        </div>
                    </div>

                    <div class="px-6 pb-5 mt-auto">
                        <a href="/event/${event.id}"
                           class="w-full block text-center rounded-full bg-primary-purple py-3 text-base font-semibold text-white hover:bg-secondary-orange">
                            View Details
                        </a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>

    <!-- Pagination Container -->
    <div id="paginationContainer" class="flex justify-center mt-10 gap-3">
        <c:if test="${currentPage > 0}">
            <a href="javascript:void(0)" data-page="${currentPage - 1}"
               class="pagination-link px-4 py-2 bg-primary-purple text-white rounded-lg hover:bg-primary-purple/80">
                Previous
            </a>
        </c:if>

        <c:forEach begin="0" end="${totalPages - 1}" var="i">
            <a href="javascript:void(0)" data-page="${i}"
               class="pagination-link px-4 py-2 rounded-lg
           ${i == currentPage ? 'bg-primary-purple text-white' : 'bg-gray-200 text-primary-purple'}">
                    ${i + 1}
            </a>
        </c:forEach>

        <c:if test="${currentPage < totalPages - 1}">
            <a href="javascript:void(0)" data-page="${currentPage + 1}"
               class="pagination-link px-4 py-2 bg-primary-purple text-white rounded-lg hover:bg-primary-purple/80">
                Next
            </a>
        </c:if>
    </div>
</div>

</body>
</html>