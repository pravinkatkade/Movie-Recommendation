<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.movie.recomendation.model.MovieDetail"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Recommendation</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
    padding-top: 70px; 
    background-color:#f0f0f0;
}

.card {
	transition: transform 0.3s ease;
}

.card-img:hover {
	transform: scale(1.05);
}

/* Ensure the image retains its rounded corners during the zoom */
.card-img-top {
	border-radius: 20px 20px 0 0;
	transition: transform 0.3s ease;
}

.card:hover .card-img-top {
	transform: scale(1.05);
}
</style>

</head>
<body>
	<div class="container-fluid">

		<!-- Navbar -->
		<nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="#">
				<h2>Movie Recommendation</h2>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<!--  	<form class="form-inline mx-auto">
					<input class="form-control" type="search"
						placeholder="Search for Movies, Events, Plays, Sports and Activities"
						aria-label="Search" style="width: 400px;">
				</form>-->
                <input type="text" id="movieSearch" class="form-control w-50 ml-5" placeholder="Enter movie name...">
				
				
				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="#"
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
								<a class="dropdown-item" href="#">${g.getGname()}</a>
							</c:forEach>

						</div></li>
						<%-- <div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="genreDropdown">
							<c:forEach var="g" items="${gList}">
								<a class="dropdown-item" href="moviesByGenre?genre=${g.gname}">${g.gname}</a>
							</c:forEach>
						</div> --%>
					<li class="nav-item dropdown"><a
						class="btn btn-danger dropdown-toggle" href="#"
						id="signinDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Sign in </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="signinDropdown">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/valid">Admin Login</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/uvalid">User Login</a>
						</div></li>
				</ul>
			</div>
		</nav>





 <div id="movieResults" class="mt-4"></div>








		<!-- Carousel  -->
		<div id="carouselExampleIndicators" class="carousel slide mt-4"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="<c:url value='/resources/img/poster111.jpg'/>"
						alt="First slide"
						style="width: 100%; height: 50vh; object-fit: cover;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<c:url value='/resources/img/poster2.webp'/>"
						alt="Second slide"
						style="width: 100%; height: 50vh; object-fit: cover;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<c:url value='/resources/img/poster3.webp'/>"
						alt="Third slide"
						style="width: 100%; height: 50vh; object-fit: cover;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>









		<div class="container-fluid mt-5 height"
			style="background-color: #f0f0f0;">
			<h1 class="text-center mb-4">Recommended Movies</h1>

			<div id="movieCarousel" class="carousel slide"
				data-bs-interval="false">
				
				
	
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="d-flex flex-nowrap overflow-auto"
							style="overflow-y: hidden; -ms-overflow-style: none; scrollbar-width: none;">
							<c:forEach var="g" items="${topmovies}" begin="0" end="78">
								<div class="col-6 col-md-3 mb-3 flex-shrink-0"
									style="border-radius: 20px;">
									<div class="card h-60"
										style="border-radius: 20px; width: 90%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
										<a href="uvalid"> <img
											src="<c:url value='/resources/imgs/${g.getMovie().getMoviename().replaceAll(" ","").toLowerCase()}.jpg' />"
											class="card-img-top" alt="Movie Image"
											style="border-radius: 20px; height: 400px; object-fit: cover; padding: 10px;">
										</a>
										<div class="card-body text-center">
											<h5 class="card-title">
												Rating:
												<!-- Filled Stars -->
												<c:forEach begin="1"
													end="${g.getOverallRating().intValue()}" var="star">
													<i class="fas fa-star" style="color: #FFD700;"></i>
													<!-- Yellow filled star -->
												</c:forEach>

												<!-- Half Star -->
												<c:if
													test="${g.getOverallRating() - g.getOverallRating().intValue() > 0}">
													<i class="fas fa-star-half-alt" style="color: #FFD700;"></i>
													<!-- Yellow half star -->
												</c:if>

												<!-- Empty Stars -->
												<c:forEach begin="${g.getOverallRating().intValue() + 1}"
													end="5" var="emptyStar">
													<i class="far fa-star" style="color: #FFD700;"></i>
													<!-- Yellow empty star -->
												</c:forEach>
											</h5>
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
				</a> <a class="carousel-control-next" href="#movieCarousel"
					role="button" data-bs-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
				</a>
			</div>
		</div>
























		<!-- Top 10 Recommended Movies Carousel================================ -->










		<div class="container-fluid mt-5 height"
			style="background-color: #f0f0f0;">
			<h1 class="text-center mb-4">All Movies</h1>

			<div id="movieCarousel" class="carousel slide"
				data-bs-interval="false">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div id="movieList" class="d-flex flex-nowrap overflow-auto"
							style="overflow-y: hidden; -ms-overflow-style: none; scrollbar-width: none;">
							<c:forEach var="g" items="${movies}" begin="0" end="78">
								<div class="col-6 col-md-3 mb-3 flex-shrink-0"
									style="border-radius: 20px;">
									<div class="card h-60"
										style="border-radius: 20px; width: 90%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
										<a href="uvalid"> <img
											src="<c:url value='/resources/imgs/${g.movie.getMoviename().replaceAll(" ","").toLowerCase()}.jpg' />"
											class="card-img-top" alt="Movie Image"
											style="border-radius: 20px; height: 400px; object-fit: cover; padding: 10px;">
										</a>
										<div class="card-body text-center">
											<h5 class="card-title">${g.movie.getMoviename()}</h5>
											
										<a href="uvalid" class="btn btn-danger mt-2" style="border-radius: 10px;">Watch Movie</a>
											
												
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
				</a> <a class="carousel-control-next" href="#movieCarousel"
					role="button" data-bs-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
				</a>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
























		<!-- Footer -->
		<footer class="bg-dark text-white mt-5">
			<div class="container py-4">
				<div class="row">
					<!-- About Section -->
					<div class="col-md-3">
						<img src="img/logo_text_white_small.png" class="img-fluid mb-3"
							alt="Logo" width="200px">
						<p>Discover the best movies, actors, and genres with our movie
							recommendation system. Stay updated with the latest blog posts,
							reviews, and more.</p>
					</div>

					<!-- Top Movies Section -->
					<div class="col-md-3">
						<h5>Top Movies</h5>
						<ul class="list-unstyled">
							<li><a href="#" class="text-white">Raja Babu</a></li>
							<li><a href="#" class="text-white">Singham</a></li>
							<li><a href="#" class="text-white">Pathan</a></li>
							<li><a href="#" class="text-white">Race</a></li>
						</ul>
					</div>

					<!-- Top Actors Section -->
					<div class="col-md-3">
						<h5>Top Actors</h5>
						<ul class="list-unstyled">
							<li><a href="#" class="text-white">Akshay Kumar</a></li>
							<li><a href="#" class="text-white">Salman Khan</a></li>
							<li><a href="#" class="text-white">Ajay Devgn</a></li>
							<li><a href="#" class="text-white">Shah Rukh Khan</a></li>
						</ul>
					</div>

					<!-- Genres Section -->
					<div class="col-md-3">
						<h5>Genres</h5>
						<ul class="list-unstyled">
							<li><a href="#" class="text-white">Action</a></li>
							<li><a href="#" class="text-white">Drama</a></li>
							<li><a href="#" class="text-white">Comedy</a></li>
							<li><a href="#" class="text-white">Horror</a></li>
						</ul>
					</div>
				</div>

				<!-- Footer Bottom -->
				<hr class="bg-light">
				<div class="text-center py-3">&copy; 2024 Movie
					Recommendation. All Rights Reserved.</div>
			</div>
		</footer>
	</div>
 	<script>
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



	<!-- Optional JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
