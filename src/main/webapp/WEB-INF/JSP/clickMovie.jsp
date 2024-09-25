<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        body {
            background-color: #f8f9fa; /* Light grey background */
        }
        .movie-details-container {
            background-color: #ffffff; /* White background */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
        }
        .movie-details-container h1 {
            color: #343a40; /* Dark grey color */
            font-weight: bold;
        }
        .movie-details-container p {
            font-size: 1.1rem;
            color: #6c757d; /* Medium grey color */
        }
        .movie-details-container strong {
            color: #495057; /* Darker grey for strong elements */
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
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
		
		

		<div id="movieResults" class="mt-5"></div>

    
    <div class="container mt-5 pt-5">
        <div class="row justify-content-center">
            <div class="col-md-10 movie-details-container">
                <div class="row">
                    <!-- Image Section -->
                    <div class="col-md-4 text-center">
                        <img src="${pageContext.request.contextPath}/resources/imgs/${movieDetail.movie.getMoviename().replaceAll(' ', '').toLowerCase()}.jpg" 
                             alt="Movie Image" class="img-fluid img-thumbnail">
                    </div>
                    
                    <!-- Movie Details Section -->
                    <div class="col-md-8">
                        <h1 class="mb-4">Movie Details</h1>
                        <p><strong>Movie ID:</strong> ${movieDetail.movie.getMovieid()}</p>
                        <p><strong>Movie Name:</strong> ${movieDetail.movie.getMoviename()}</p>
                        <p><strong>Language:</strong> ${movieDetail.movie.getMovielang()}</p>
                        <p><strong>Movie Actor:</strong> ${movieDetail.actor.getAname()}</p>
                        <p><strong>Genre:</strong> ${movieDetail.genre.getGname()}</p>
                        <p><strong>Year:</strong> ${movieDetail.movie.getMovieyear()}</p>
                       
                        <form action="${pageContext.request.contextPath}/saveMovieUser" method="post">
                            <!-- Assuming userId is stored in sessionScope -->
                            <input type="hidden" name="userId" value="${sessionScope.userId}" />
                            <input type="hidden" name="movieId" value="${movieDetail.movie.getMovieid()}" />     
                           <button type="submit" class="btn btn-primary mt-3">Watch Movie</button> 
                        </form>

                        <a href="backindex" class="btn btn-primary mt-3">Back to Movie List</a>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
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
