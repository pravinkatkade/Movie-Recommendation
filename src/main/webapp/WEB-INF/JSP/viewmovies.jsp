<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script src="<c:url value='/resources/JS/validate.js' />"></script>



</head>
<body>

	<div class="form-group">
		<input type="text" name="name" id="txtVend" value=''
			class="form-control" placeholder="Search data using movie name"
			onkeyup="searchUsingAjax(this.value)" autocomplete="off"/> 	

		<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th scope="col">Movie Id</th>
        
            <th scope="col">Movie Name</th>
            <th scope="col">Language</th>
            <th scope="col">Category</th>
            <th scope="col">Actor</th>
            <th scope="col">Year</th>
            
        </tr>
    </thead>
    <tbody>
        <c:forEach var="m" items="${movies}">
            <tr>
                <td>${m.movie.getMovieid()}</td>
                <td>${m.movie.getMoviename()}</td>
                <td>${m.movie.getMovielang()}</td>
                <td>${m.genre.getGname()}</td>
                <td>${m.actor.getAname()}</td>
                <td>${m.movie.getMovieyear()}</td>
                
            </tr>
        </c:forEach>
    </tbody>
</table>
		
</body>
</html>



