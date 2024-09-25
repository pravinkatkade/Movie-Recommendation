
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Movie Recommendation</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<link href="<c:url value='/resources/CSS/stylee.css' />"
	rel="stylesheet">
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

<style>
/* General Styles */
body {
	background: #f0f2f5;
	font-family: 'Arial', sans-serif;
}

.container-fluid {
}

.main-content {
	padding: 20px;
}

.navbar {
	background-color: #007bff;
	height: 100%; /* Navbar background color */
}

.navbar-brand, .nav-link {
	color: black !important; /* Navbar text color */
}

.nav-pills {
	margin-bottom: 20px;
}

.nav-pills .nav-link {
	border-radius: 50px;
	color: #007bff;
	font-weight: bold;
}

.nav-pills .nav-link.active {
	background-color: #007bff;
	color: white;
}

.nav-item {
	padding:0.8rem;
}

/* Table Styles */
table {
	background-color: #ffffff;
	border-radius: 8px;
	overflow: hidden;
}

thead {
	background-color: #007bff;
	color: white;
}

tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

tbody tr:hover {
	background-color: #e9ecef;
}

h2 {
	color: white;
}

/* Media Queries */
@media ( max-width : 768px) {
	/* Adjust navbar and sidebar for tablets and small devices */
	.navbar-brand h2 {
		font-size: 1.5rem;
	}
	.navbar-toggler {
		border-color: #fff;
	}
	.nav-pills .nav-link {
		font-size: 0.9rem;
	}
	.main-content {
		padding: 10px;
	}
	.container-fluid {
		padding: 10px;
	}

	/* Adjust table styles for smaller screens */
	table {
		font-size: 0.9rem;
	}
}

@media ( max-width : 368px) {
	/* Adjust navbar and sidebar for very small devices */
	.navbar-brand h2 {
		font-size: 1.2rem;
	}
	.navbar-toggler {
		border-color: #fff;
	}
	.nav-pills .nav-link {
		font-size: 0.8rem;
	}
	.main-content {
		padding: 5px;
	}
	.container-fluid {
		padding: 5px;
	}

	/* Adjust form and button styles for very small screens */
	.form-control {
		font-size: 0.8rem;
		padding: 0.5rem;
	}
	.btn {
		font-size: 0.8rem;
		padding: 0.5rem;
	}

	/* Adjust table styles for very small screens */
	table {
		font-size: 0.8rem;
	}
	.col-md-3 {
		padding-left: 0;
		padding-right: 0;
	}
	.navbar{
		margin-top: 100px;
	
	}
}
</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark  bg-dark sticky-top">
		<a class="navbar-brand" href="#"><h2 style="color: white;">Movie
				Recommendation System</h2></a>

		<!-- Toggler for mobile view -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar content -->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a
					class="nav-link btn btn-danger text-white" href="logout">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid border
	
	" style="background: #FF7F50;">
		<div class="row">
			<!-- Sidebar Menu -->
			<div class="col-md-3 bg-light">
				<ul class="nav flex-column nav-pills " id="pills-tab" role="tablist" style="background: #9FE2BF;position:fixed;">
					<li class="nav-item "><a class="nav-link"
						id="pills-home-tab" data-toggle="pill" href="#pills-home"
						role="tab" aria-controls="pills-home" aria-selected="true">Search or Display All Movie</a>
					</li>
					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
						role="tab" aria-controls="pills-profile" aria-selected="false">Add
							Category</a></li>
					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-cat-tab" data-toggle="pill" href="#pills-cat" role="tab"
						aria-controls="pills-cat" aria-selected="false">Display All
							Category</a></li>

					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
						role="tab" aria-controls="pills-contact" aria-selected="false">Add
							Actor</a></li>
					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-act-tab" data-toggle="pill" href="#pills-act" role="tab"
						aria-controls="pills-act" aria-selected="false">Display All
							Actor</a></li>
					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-user-tab" data-toggle="pill" href="#pills-user"
						role="tab" aria-controls="pills-user" aria-selected="false">Display
							All Users</a></li>
					<li class="nav-item mt-3"><a class="nav-link"
						id="pills-rating-tab" data-toggle="pill" href="#pills-rating"
						role="tab" aria-controls="pills-rating" aria-selected="false">Display
							All Review And Rating</a></li>

				</ul>
			</div>

			<!-- Main Content -->
			<div class="col-md-9 main-content">
				<div class="tab-content" id="pills-tabContent">
					<!-- Movie Tab -->
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<div class="container-fluid">
							<h1 style="text-align: center;">Search Movie</h1>
							<div class="container">
								<form action="searchMovie" method="get">
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="inputId">ID</label> <input type="text"
												class="form-control" name="movieId" id="inputId"
												placeholder="id">
										</div>
										<div class="form-group col-md-4">
											<label for="inputName">Movie Name</label> <input type="text"
												class="form-control" name="moviename" id="inputName"
												placeholder="name..">
										</div>
										<div class="form-group col-md-4">
											<label for="inputLang">Movie Language</label> <input
												type="text" class="form-control" name="movielang"
												id="inputLang" placeholder="lang..">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="inputLang">Movie Category</label> <input
												type="text" class="form-control" name="moviecat"
												id="inputcat" placeholder="cat..">
										</div>
										<div class="form-group col-md-4">
											<label for="inputYearFrom">Year from</label> <input
												type="date" class="form-control" name="yearFrom"
												id="inputYearFrom">
										</div>
										<div class="form-group col-md-4">
											<label for="inputYearTo">Year to</label> <input type="date"
												class="form-control" name="yearTo" id="inputYearTo">
										</div>
									</div>
									<button type="submit" class="btn btn-danger"
										id="searchMovieBtn">Search Movie</button>
									<a href="addmovie" class="text-white"
										style="text-decoration: none;">
										<button type="button" class="btn btn-danger">Add New
											Movie</button>
									</a>
								</form>
							</div>
							<jsp:include page="demo.jsp"></jsp:include>
						</div>
					</div>

					<!-- Category Tab -->
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab"
						style="background-color: #f5f7fa; min-height: 100vh; padding-top: 50px;">
						<div class="container-fluid">
							<h1 style="text-align: center; color: #333;">Add Category</h1>
							<div class="container"
								style="background-color: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
								<form name="frm" action="genere" method="post"
									onsubmit="return validateForm('inputCategoryName', 'categoryErrorMsg')">
									<div class="form-row justify-content-center">
										<div class="form-group col-md-6">
											<label for="inputCategoryName">Category Name:</label> <input
												type="text" class="form-control" name="gname"
												id="inputCategoryName" placeholder="Category Name"
												oninput="validateInput('inputCategoryName', 'categoryErrorMsg')"
												autocomplete="off" required> <small id="categoryErrorMsg"
												style="color: red;"></small>
										</div>
									</div>
									<div class="form-row justify-content-center">
										<div class="form-group col-md-3 text-center">
											<button type="submit" class="btn btn-primary w-100">Add</button>
										</div>
									</div>
								</form>
								${msg }
							</div>
						</div>
					</div>


					<!-- Actor Tab -->
					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab"
						style="background-color: #f5f7fa; min-height: 100vh; padding-top: 50px;">
						<div class="container-fluid">
							<h1 style="text-align: center; color: #333;">Add Actor</h1>
							<div class="container"
								style="background-color: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
								<form name="frm" action="actor" method="post"
									onsubmit="return validateForm('inputActorName', 'actorErrorMsg')">
									<div class="form-row justify-content-center">
										<div class="form-group col-md-6">
											<label for="inputActorName">Actor Name:</label> <input
												type="text" class="form-control" name="aname"
												id="inputActorName" placeholder="Actor Name"
												oninput="validateInput('inputActorName', 'actorErrorMsg')"
												autocomplete="off" required> <small id="actorErrorMsg"
												style="color: red;"></small>
										</div>
									</div>
									<div class="form-row justify-content-center">
										<div class="form-group col-md-3 text-center">
											<button type="submit" class="btn btn-primary w-100">Add</button>
										</div>
									</div>
								</form>
									${msg }
								
							</div>
						</div>
					</div>


					<!-- Display All Users Tab -->
					<div class="tab-pane fade" id="pills-user" role="tabpanel"
						aria-labelledby="pills-user-tab">
						<div class="container-fluid">
							<h1 style="text-align: center;">Display All Users</h1>
							<jsp:include page="viewuser.jsp"></jsp:include>

						</div>
					</div>

					<div class="tab-pane fade" id="pills-rating" role="tabpanel"
						aria-labelledby="pills-rating-tab">
						<div class="container-fluid">
							<jsp:include page="topratedmovie.jsp"></jsp:include>

						</div>
					</div>
					<div class="tab-pane fade" id="pills-cat" role="tabpanel"
						aria-labelledby="pills-cat-tab">
						<div class="container-fluid">

							<jsp:include page="viewcat.jsp"></jsp:include>
						</div>
					</div>
					<div class="tab-pane fade" id="pills-act" role="tabpanel"
						aria-labelledby="pills-act-tab">
						<div class="container-fluid">

							<jsp:include page="viewact.jsp"></jsp:include>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<script>
		// Validate input in real-time
		function validateInput(inputId, errorMsgId) {
			const input = document.getElementById(inputId);
			const errorMsg = document.getElementById(errorMsgId);
			const value = input.value.trim();

			if (input.value.startsWith(' ') || input.value.endsWith(' ')) {
				errorMsg.textContent = "Input cannot start or end with a space.";
			} else {
				errorMsg.textContent = "";
			}
		}

		// Validate form on submit
		function validateForm(inputId, errorMsgId) {
			const input = document.getElementById(inputId);
			const value = input.value.trim();

			if (input.value.startsWith(' ') || input.value.endsWith(' ')) {
				document.getElementById(errorMsgId).textContent = "Input cannot start or end with a space.";
				return false;
			}
			return true;
		}
	</script>

</body>

</html>
