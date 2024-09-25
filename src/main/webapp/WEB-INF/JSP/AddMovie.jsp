<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Movie Management</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7HUbX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style>
body {
	background: url("<c:url value='/resources/img/backgroundmovie.webp'/>"),
		#000;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	font-family: 'Arial', sans-serif;
	height: 100vh;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background-color: rgba(255, 255, 255, 0.8);
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
	width: 100%;
	max-width: 600px;
	color: #000;
}

h1 {
	margin-bottom: 20px;
	text-align: center;
}

label {
	font-weight: bold;
}

.form-control {
	border-radius: 8px;
	border: 1px solid #ced4da;
}

.btn {
	border-radius: 50px;
	padding: 10px 20px;
}

.btn-danger {
	background-color: #dc3545;
	border-color: #dc3545;
}

.btn-danger:hover {
	background-color: #c82333;
	border-color: #bd2130;
}

h2 {
	text-align: center;
	color: black;
	margin-top: 20px;
}

.error-message {
	color: red;
	font-size: 0.875em;
	display: block;
	margin-top: 0.25em;
}
</style>

<script>
	// Function to show error on field blur
	function validateField(fieldId, errorId, validateFunction) {
		const fieldValue = document.getElementById(fieldId).value;
		const errorMessage = validateFunction(fieldValue);
		document.getElementById(errorId).textContent = errorMessage || '';
	}

	// Validation functions for each field
	function validateMovieName(value) {
		if (value.startsWith(" ")) {
			return "Movie name should not start with a space.";
		} else if (value.endsWith(" ")) {
			return "Movie name should not end with a space.";
		} else if (value.includes("  ")) {
			return "Movie name should not contain double spaces.";
		} else if (!value.trim()) {
			return "Movie name is required.";
		}
		return '';
	}

	function validateMovieLang(value) {
		return !value.trim() ? "Movie language is required." : '';
	}

	function validateMovieYear(value) {
		return !value ? "Movie year is required." : '';
	}

	function validateMovieLink(value) {
		return !value.trim() ? "Movie link is required." : '';
	}

	window.onload = function() {
		// Add blur event listeners to all form fields
		document.getElementById("inputName").addEventListener('blur',
				function() {
					validateField("inputName", "errorName", validateMovieName);
				});
		document.getElementById("inputLang").addEventListener('blur',
				function() {
					validateField("inputLang", "errorLang", validateMovieLang);
				});
		document.getElementById("inputYear").addEventListener('blur',
				function() {
					validateField("inputYear", "errorYear", validateMovieYear);
				});
		document.getElementById("inputLink").addEventListener('blur',
				function() {
					validateField("inputLink", "errorLink", validateMovieLink);
				});
	}

	// Validate form on submit
	function validateForm() {
		let isValid = true;

		// Validate all fields
		isValid &= !validateField("inputName", "errorName", validateMovieName);
		isValid &= !validateField("inputLang", "errorLang", validateMovieLang);
		isValid &= !validateField("inputYear", "errorYear", validateMovieYear);
		isValid &= !validateField("inputLink", "errorLink", validateMovieLink);

		return !!isValid; // Return true if all validations pass, false otherwise
	}
</script>
</head>

<body>

	<div class="container">
		<h1 class="text-center">Add Movie</h1>
		<form name="frm" action="submitMovie" method="post"
			onsubmit="return validateForm()">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputName">Movie Name:</label> <input type="text"
						class="form-control" id="inputName" name="moviename"
						placeholder="Enter movie name.." required> <span
						id="errorName" class="error-message"></span>
				</div>
			</div>

			<!-- Movie Language Dropdowns -->
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputLang">Movie Language:</label> <select
						class="form-control" id="inputLang" name="movielang" required>
						<option value="">Select language...</option>
						<option value="Marathi">Marathi</option>
						<option value="English">English</option>
						<option value="Hindi">Hindi</option>
					</select> <span id="errorLang" class="error-message"></span>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputYear">Movie Year:</label> <input type="date"
						class="form-control" id="inputYear" name="movieyear" required>
					<span id="errorYear" class="error-message"></span>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputLink">Movie Link:</label> <input type="url"
						class="form-control" id="inputLink" name="movielink"
						placeholder="Enter movie URL" required> <span
						id="errorLink" class="error-message"></span>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputCategory">Category Name:</label> <select
						class="form-control" id="inputCategory" name="gname" required>
						<option value="">Select a category...</option>
						<c:forEach var="g" items="${gList}">
							<option value="${g.gid}">${g.gname}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			

              
     

              


			  <div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputActor">Actor Name:</label> <select
						class="form-control" id="inputActor" name="aname" required>
						<option value="">Select an actor...</option>
						<c:forEach var="a" items="${aList}">
							<option value="${a.aid}">${a.aname}</option>
						</c:forEach>
					</select>
				</div>
			</div> 
			
			
			
			
			<!-- <div class="form-row">
				<div class="form-group col-md-12">
					<label for="inputphoto">Movie Poster:</label> <input type="file"
						class="form-control" id="inputphoto" name="moviephoto" required>
				</div>
			</div>
 -->

			<div class="form-row d-flex justify-content-center">
				<button type="submit" class="btn btn-danger">Add New Movie</button>
				<a href="admindash" class="btn btn-primary mt-3">Back to
					Dashboard</a>

			</div>
		</form>
		<h2>${message}</h2>
	</div>

</body>

</html>