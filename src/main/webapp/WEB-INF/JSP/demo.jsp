<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Movie</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>


    <!-- Table to display search results -->
    <div class="container mt-4">
        <c:if test="${not empty movieList}">
            <table class="table table-hover">
                <thead class="table-dark">
                    <tr>
<!--                         <th scope="col">Movie Id</th>
 -->                        <th scope="col">Movie Name(Update)</th>
                        <th scope="col">Movie Language</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Release Year</th>
                        <th scope="col">Actor</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="m" items="${movieList}">
                        <tr style="color:black">
<%--                             <td><a href="updateMoviePage?movieId=${m.movie.getMovieid()}">${m.movie.getMovieid()}</a></td>
 --%>                            <td><a href="updateMoviePage?movieId=${m.movie.getMovieid()}" style="text-decoration: none;color:black;">${m.movie.getMoviename()}</a></td>
                            <td>${m.movie.getMovielang()}</td>
                            <td>${m.genre.getGname()}</td>
                            <td>${m.movie.getMovieyear()}</td>
                            <td>${m.actor.getAname()}</td>
                            <td>
                                <form action="deleteMovie" method="post" style="display:inline;">
                                    <input type="hidden" name="moviename" value="${m.movie.getMoviename()}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
    </div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkv3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7HUbX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
