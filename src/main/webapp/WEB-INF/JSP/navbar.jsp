<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Recommendation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Custom Styles */
        body { background-color: #f8f9fa; }
        .navbar-brand h2 { margin: 0; }
        .navbar-nav .nav-link { color: #ffffff !important; }
        .navbar-nav .nav-link:hover { color: #e9ecef !important; }
    </style>
</head>
<body>
  
    <!-- Navbar -->
    <nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-info fixed-top">
        <a class="navbar-brand" href="#">
            <h2>Movie Recommendation</h2>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <input type="text" id="movieSearch" class="form-control w-50 ml-5" placeholder="Enter movie name...">

            <ul class="navbar-nav ml-auto">

                <!-- Actors Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="actorDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-right: 50px">Actors</a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="actorDropdown" style="width: 450px;">
                        <div class="container-fluid">
                            <div class="row">
                                <c:forEach var="actor" items="${aList}" varStatus="status">
                                    <div class="col-6 p-1">
                                        <a class="dropdown-item d-flex align-items-center font-weight-bold" href="#" style="white-space: nowrap;">
                                            <span class="mr-2">${status.index + 1}.</span> <!-- Numbering actors -->
                                            <span>${actor.aname}</span>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Genres Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="genreDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-right: 50px">Genres</a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="genreDropdown">
                        <c:forEach var="genre" items="${gList}">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/moviesByGenre?genre=${fn:escapeXml(genre.gname)}">${genre.gname}</a>
                        </c:forEach>
                    </div>
                </li>

                <!-- Logout Button -->
                <li class="nav-item">
                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout" role="button" aria-haspopup="true" aria-expanded="false">Log Out</a>
                    <h5>${uuname}</h5>
                </li>
            </ul>
        </div>
    </nav>
  
    <!-- Movie Search Results -->
    <div id="movieResults" class="mt-4"></div>

    <script>
        // Movie search functionality
        document.getElementById('movieSearch').addEventListener('input', function() {
            const searchTerm = this.value.trim();
            
            if (searchTerm.length > 0) {
                const xhr = new XMLHttpRequest();
                xhr.open('GET', `${pageContext.request.contextPath}/clickMoviee?name=` + encodeURIComponent(searchTerm), true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById('movieResults').innerHTML = xhr.responseText;
                    }
                };
                xhr.send();
            } else {
                document.getElementById('movieResults').innerHTML = ''; // Clear results if search box is empty
            }
        });
    </script>

    <!-- jQuery Full Version -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- Correct Bootstrap Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
