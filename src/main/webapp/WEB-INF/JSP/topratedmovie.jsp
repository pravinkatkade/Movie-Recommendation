<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Rated Movies</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h2>Top Rated Movies</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Movie Name</th>
                    <th>Year</th>
                    <th>Genre</th>
                    <th>Actor</th>
                    <th>Overall Rating</th>
                    <th>User Count</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate through the movie list and display movie details -->
                <c:forEach var="m" items="${movies}">
                    <tr>
                        <td>${m.movie.movieid}</td> <!-- Movie ID -->
                        <td>${m.movie.moviename}</td> <!-- Movie Name -->
                        <td>${m.movie.movieyear}</td> <!-- Year -->
                        <td>${m.genre.gname}</td> <!-- Genre -->
                        <td>${m.actor.aname}</td> <!-- Actor -->
                        <td>${m.overallRating}</td>
                        <td>${m.usercount}</td> <!-- Overall Rating -->
                         <!-- Overall Rating -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
