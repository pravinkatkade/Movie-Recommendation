<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movies by Genre</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>


	<!-- Navbar -->
		<nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-info fixed-top">
			<a class="navbar-brand" href="#">
				<h2>Movie Recommendation</h2>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<input type="text" id="movieSearch" class="form-control w-50 ml-5"
					placeholder="Enter movie name...">

				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="hii"
						id="genreDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"
						style="margin-right: 50px"> Actors </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="genreDropdown" style="width: 450px;">
							<div class="container-fluid">
								<div class="row">
									<c:forEach var="g" items="${aList}" varStatus="status">
										<div class="col-6 p-1">
											<a
												class="dropdown-item d-flex align-items-center font-weight-bold"
												href="#" style="white-space: nowrap;"> <span
												class="mr-2">${status.index + 1}.</span> <!-- Numbering actors -->
												<span>${g.getAname()}</span>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="#"
						id="genreDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"
						style="margin-right: 50px"> Genres </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="genreDropdown">
							<c:forEach var="g" items="${gList}">
								<a class="dropdown-item" href="moviesByGenre?genre=${g.gname}">
									${g.gname} </a>
							</c:forEach>
						</div>
					<li class="nav-item"><a class="btn btn-danger" href="logout"
						role="button" aria-haspopup="true" aria-expanded="false"> Log
							Out </a>
							<h5> ${uuname}</h5>
							</li>
				</ul>
			</div>
		</nav>
		
		

		<div id="movieResults" class="mt-4"></div>


	


	<div class="container height"
		style="background-color: #f0f0f0;margin-top: 100px;">
		<h1 class="text-center mb-4">${selectedGenre} Movies</h1>

		<div id="movieCarousel" class="carousel slide"
			data-bs-interval="false">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex flex-nowrap overflow-auto"
						style="overflow-y: hidden; -ms-overflow-style: none; scrollbar-width: none;">
						<c:forEach var="g" items="${moviesByGenre}" begin="0" end="78">
							<div class="col-6 col-md-3 mb-3 flex-shrink-0"
								style="border-radius: 20px;">
								<div class="card h-60"
									style="border-radius: 20px; width: 90%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
									<a href="clickMovie?id=${g.movie.getMovieid()}"> <img
										src="<c:url value='/resources/imgs/${g.movie.getMoviename().replaceAll(" ","").toLowerCase()}.jpg' />"
										class="card-img-top" alt="Movie Image"
										style="border-radius: 20px; height: 300px; object-fit: cover; padding: 10px;">
									</a>
									<div class="card-body text-center">
										<h5 class="card-title">${g.movie.getMoviename()}</h5>

										<a href="clickMovie?id=${g.movie.getMovieid()}"
											class="btn btn-danger mt-2" style="border-radius: 10px;">Watch
											Movie</a>


									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>

			<a class="carousel-control-prev" href="#movieCarousel" role="button"
				data-bs-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#movieCarousel" role="button"
				data-bs-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Next</span>
			</a>
		</div>
		
	</div>
			    <a href="backindex" class="btn btn-primary mt-4" style="margin-left: 700px;">Back to Movie List</a>
	
	<script>
		document
				.getElementById('movieSearch')
				.addEventListener(
						'input',
						function() {
							const searchTerm = this.value.trim();

							if (searchTerm.length > 0) {
								const xhr = new XMLHttpRequest();
								xhr
										.open(
												'GET',
												`${pageContext.request.contextPath}/clickMoviee?name=`
														+ encodeURIComponent(searchTerm),
												true);
								xhr.onreadystatechange = function() {
									if (xhr.readyState === 4
											&& xhr.status === 200) {
										document.getElementById('movieResults').innerHTML = xhr.responseText;
									}
								};
								xhr.send();
							} else {
								document.getElementById('movieResults').innerHTML = ''; // Clear results if search box is empty
							}
						});
	</script>
	 <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
</body>
</html>
