	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Genres Table</title>
	<style>
	table {
		width: 100%;
		border-collapse: collapse;
		margin: 20px 0;
		font-size: 18px;
		text-align: left;
	}
	
	table, th, td {
		border: 1px solid black;
	}
	
	th, td {
		padding: 12px;
	}
	
	th {
		background-color: #007bff;
		color: white;
	}
	
	tr:nth-child(even) {
		background-color: #f2f2f2;
	}
	
	tr:hover {
		background-color: #ddd;
	}
	</style>
	</head>
	<body>
	
		<h2>List of Genres</h2>
	
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Genre Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="genre" items="${genres}">
					<tr>
						<td>${genre.gid}</td>
						<td>${genre.gname}</td>
						<td><a href="deletecat?cid=${genre.gid}"
							class="btn btn-danger btn-sm" onclick="return confirmDelete()">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<script>
	    function confirmDelete() {
	        return confirm('Are you sure you want to delete this genre? This action cannot be undone.');
	    }
	</script>
	</body>
	</html>
