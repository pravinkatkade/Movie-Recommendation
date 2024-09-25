<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Watch Movie</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .rating-form {
            display: none; /* Hidden by default */
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-2">



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



    <!-- Movie details and links -->
    <c:forEach var="movieDetail" items="${movies}">
        <div class="movie-item mb-4"  style="margin-top: 100px;">
            <h3><strong>Movie Name:</strong> ${movieDetail.movie.moviename}</h3>
            
            <!-- Display iframe for trailer if link is available -->
            <c:choose>
                <c:when test="${not empty movieDetail.movie.movielink}">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="${movieDetail.movie.movielink}"
                                allowfullscreen></iframe>
                    </div>
                   <%--  <p><strong>Language:</strong> ${movieDetail.movie.movielang}</p>
            <p><strong>Year:</strong> ${movieDetail.movie.movieyear}</p>
            <p><strong>Genre:</strong> ${movieDetail.genre.gname}</p>
            <p><strong>Actor:</strong> ${movieDetail.actor.aname}</p>
                     --%>
                </c:when>
                <c:otherwise>
                    <p>No Trailer Available</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>

    
    <!-- Ratings and Reviews Button -->
    <a href="javascript:void(0);" class="btn btn-primary mt-3" onclick="toggleRatingForm()">Ratings and Reviews</a>
    <a href="backindex" class="btn btn-primary mt-3">Back to Movie List</a>

    <!-- Rating and Review Form -->
    <!-- Rating and Review Form -->
<!-- Rating and Review Form -->
<div class="rating-form">
    <form id="reviewForm" action="${pageContext.request.contextPath}/submitReview" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="userId" value="${param.userId}">
        <input type="hidden" name="movieId" value="${param.movieId}">
        
        <div class="form-group">
            <label for="rating">Rating (1-5):</label>
            <input type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
        </div>
        
        <div class="form-group">
            <label for="review">Review:</label>
            <textarea class="form-control" id="review" name="review" rows="4" required></textarea>
        </div>
        
        <button type="submit" class="btn btn-success">Submit Review</button>
    </form>
</div>
</div>



<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JavaScript to toggle rating form visibility -->
<script>
    function toggleRatingForm() {
        var form = document.querySelector('.rating-form');
        form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
    }
    

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

   

	function toggleRatingForm() {
        var form = document.querySelector('.rating-form');
        form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
    }

    function validateForm() {
        var rating = document.getElementById('rating').value;
        var review = document.getElementById('review').value;

        if (rating.trim() === '' || review.trim() === '') {
            alert('Please fill out all fields.');
            return false; // Prevent form submission
        }

        // Show confirmation message on successful submission
        alert('Thank you for your review!');
        return true; // Allow form submission
    }

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

    

</body>
</html>
