
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin-bottom: 30px;
            color: #343a40;
        }
        .form-group label {
            font-weight: bold;
            color: #495057;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .alert {
            margin-bottom: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Update Movie</h1>

    <!-- Display success or error messages -->
    <c:if test="${not empty success}">
        <div class="alert alert-success">
            <c:out value="${success}"/>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">
            <c:out value="${error}"/>
        </div>
    </c:if>

    <form name='frm' action="updateMovie" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="movieId" value="${movieDetail.movie.getMovieid()}">
        
        <div class="form-group">
            <label for="moviename">Movie Name:</label>
            <input type="text" class="form-control" id="moviename" name="moviename" value="${movieDetail.movie.getMoviename()}">
             <span id="movienameError" style="color: red;"></span> <!-- Error message for movie name -->
        
        </div>

        <div class="form-group">
            <label for="movielang">Movie Language:</label>
            <select class="form-control" id="movielang" name="movielang">
                <option value="Hindi" ${movieDetail.movie.movielang == 'Hindi' ? 'selected' : ''}>Hindi</option>
                <option value="English" ${movieDetail.movie.movielang == 'English' ? 'selected' : ''}>English</option>
                <option value="Marathi" ${movieDetail.movie.movielang == 'Marathi' ? 'selected' : ''}>Marathi</option>
            </select>
        </div>

         <div class="form-group">
            <label for="movielink">Movie Link:</label>
            <input type="text" class="form-control" id="movielink" name="movielink" value="${movieDetail.movie.getMovielink()}">
            <span id="movielinkError" style="color: red;"></span> <!-- Error message for movie link -->
               
        </div> 
                
<%-- 
	        <div class="form-group">
    <label for="fixedGname">Genre:</label>
    <!-- Input box to display the genre (initially the fixed genre) -->
    <input type="text" class="form-control" id="fixedGname" name="fixedGname" value="${movieDetail.genre.getGname()}" readonly>
</div> --%>

<div class="form-group">
    <label for="gname">Select New Genre:</label>
    <!-- Dropdown to select a new genre -->
    <select class="form-control" id="gname" name="gname" onchange="updateGenre()">
        <option value="">-- Select New Genre --</option>
        <option value="Comedy" ${movieDetail.genre.getGname() == 'Comedy' ? 'selected' : ''}>Comedy</option>
        <option value="Action" ${movieDetail.genre.getGname() == 'Action' ? 'selected' : ''}>Action</option>
        <option value="Adventure" ${movieDetail.genre.getGname() == 'Adventure' ? 'selected' : ''}>Adventure</option>
        <option value="Drama" ${movieDetail.genre.getGname() == 'Drama' ? 'selected' : ''}>Drama</option>
        <option value="Thriller" ${movieDetail.genre.getGname() == 'Thriller' ? 'selected' : ''}>Thriller</option>
        <option value="Romantic" ${movieDetail.genre.getGname() == 'Romantic' ? 'selected' : ''}>Romantic</option>
    </select>
</div>

      
			
       <%--  <div class="form-group">
    <label for="fixedAname">Actor:</label>
    <!-- Input box to display the actor (initially the fixed actor) -->
    <input type="text" class="form-control" id="fixedAname" name="fixedAname" value="${movieDetail.actor.getAname()}" readonly>
</div> --%>

<div class="form-group">
    <label for="aname">Update New Actor:</label>
    <!-- Dropdown to select a new actor -->
    <select class="form-control" id="aname" name="aname" onchange="updateActor()">
        <option value="">-- Select New Actor --</option>
        <option value="Ajay Devgan" ${movieDetail.actor.getAname() == 'Ajay Devgan' ? 'selected' : ''}>Ajay Devgan</option>
        <option value="Shah Rukh Khan" ${movieDetail.actor.getAname() == 'Shah Rukh Khan' ? 'selected' : ''}>Shah Rukh Khan</option>
        <option value="Ritik Roshan" ${movieDetail.actor.getAname() == 'Ritik Roshan' ? 'selected' : ''}>Ritik Roshan</option>
        <option value="Amitabh Bachchan" ${movieDetail.actor.getAname() == 'Amitabh Bachchan' ? 'selected' : ''}>Amitabh Bachchan</option>
        <option value="Salman Khan" ${movieDetail.actor.getAname() == 'Salman Khan' ? 'selected' : ''}>Salman Khan</option>
        <option value="Ranbir Kapoor" ${movieDetail.actor.getAname() == 'Ranbir Kapoor' ? 'selected' : ''}>Ranbir Kapoor</option>
        <option value="Hrithik Roshan" ${movieDetail.actor.getAname() == 'Hrithik Roshan' ? 'selected' : ''}>Hrithik Roshan</option>
        <option value="Chris Hemsworth" ${movieDetail.actor.getAname() == 'Chris Hemsworth' ? 'selected' : ''}>Chris Hemsworth</option>
        <option value="Chris" ${movieDetail.actor.getAname() == 'Chris' ? 'selected' : ''}>Chris</option>
        <option value="Keanu Reeves" ${movieDetail.actor.getAname() == 'Keanu Reeves' ? 'selected' : ''}>Keanu Reeves</option>
        <option value="Ranveer Singh" ${movieDetail.actor.getAname() == 'Ranveer Singh' ? 'selected' : ''}>Ranveer Singh</option>
        <option value="Aishwarya Rai Bachchan" ${movieDetail.actor.getAname() == 'Aishwarya Rai Bachchan' ? 'selected' : ''}>Aishwarya Rai Bachchan</option>
        <option value="Kareena Kapoor" ${movieDetail.actor.getAname() == 'Kareena Kapoor' ? 'selected' : ''}>Kareena Kapoor</option>
        <option value="Priyanka Chopra" ${movieDetail.actor.getAname() == 'Priyanka Chopra' ? 'selected' : ''}>Priyanka Chopra</option>
        <option value="Deepika Padukone" ${movieDetail.actor.getAname() == 'Deepika Padukone' ? 'selected' : ''}>Deepika Padukone</option>
        <option value="Katrina Kaif" ${movieDetail.actor.getAname() == 'Katrina Kaif' ? 'selected' : ''}>Katrina Kaif</option>
        <option value="Alia Bhatt" ${movieDetail.actor.getAname() == 'Alia Bhatt' ? 'selected' : ''}>Alia Bhatt</option>
        <option value="Kalki Koechlin" ${movieDetail.actor.getAname() == 'Kalki Koechlin' ? 'selected' : ''}>Kalki Koechlin</option>
        <option value="Sonam Kapoor" ${movieDetail.actor.getAname() == 'Sonam Kapoor' ? 'selected' : ''}>Sonam Kapoor</option>
        <option value="Jacqueline Fernandez" ${movieDetail.actor.getAname() == 'Jacqueline Fernandez' ? 'selected' : ''}>Jacqueline Fernandez</option>
        <option value="Taapsee Pannu" ${movieDetail.actor.getAname() == 'Taapsee Pannu' ? 'selected' : ''}>Taapsee Pannu</option>
        <option value="Nargis Fakhri" ${movieDetail.actor.getAname() == 'Nargis Fakhri' ? 'selected' : ''}>Nargis Fakhri</option>
        <option value="Diana Penty" ${movieDetail.actor.getAname() == 'Diana Penty' ? 'selected' : ''}>Diana Penty</option>
        <option value="Sushmita Sen" ${movieDetail.actor.getAname() == 'Sushmita Sen' ? 'selected' : ''}>Sushmita Sen</option>
        <option value="Huma Qureshi" ${movieDetail.actor.getAname() == 'Huma Qureshi' ? 'selected' : ''}>Huma Qureshi</option>
        <option value="Leonardo DiCaprio" ${movieDetail.actor.getAname() == 'Leonardo DiCaprio' ? 'selected' : ''}>Leonardo DiCaprio</option>
    </select>
</div>

  
        
        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<!-- JavaScript validation function -->
<script>
    
    
    function updateGenre() {
        var selectedGenre = document.getElementById("gname").value; // Get the selected value
        var genreInput = document.getElementById("fixedGname");      // Input field to update

        if (selectedGenre) {
            genreInput.value = selectedGenre; // Update input field with selected genre
        } else {
            genreInput.value = ""; // Clear the input field if no genre is selected
        }
    }
    
    function updateActor() {
        var selectedActor = document.getElementById("aname").value; // Get the selected value
        var actorInput = document.getElementById("fixedAname");      // Input field to update

        if (selectedActor) {
            actorInput.value = selectedActor; // Update input field with selected actor
        } else {
            actorInput.value = ""; // Clear the input field if no actor is selected
        }
    }
    
    function validateForm() {
        // Get input fields
        var movieName = document.getElementById("moviename").value.trim();
        var movieLink = document.getElementById("movielink").value.trim();

        // Clear previous error messages
        clearErrorMessage("movienameError");
        clearErrorMessage("movielinkError");

        var isValid = true;

        // Validate Movie Name
        if (movieName === "") {
            setErrorMessage("movienameError", "Movie name cannot start or end with spaces.");
            isValid = false;
        }

        // Validate Movie Link
        if (movieLink === "") {
            setErrorMessage("movielinkError", "Movie link cannot start or end with spaces.");
            isValid = false;
        }

        return isValid; // Prevent form submission if validation fails
    }

    // Function to handle blur event validation
    function validateField(fieldId, errorFieldId, message) {
        var field = document.getElementById(fieldId);
        var value = field.value;

        clearErrorMessage(errorFieldId);

        if (value.trim() !== value) {
            setErrorMessage(errorFieldId, message);
        }
    }

    // Function to set error message
    function setErrorMessage(fieldId, message) {
        document.getElementById(fieldId).innerText = message;
    }

    // Function to clear error message
    function clearErrorMessage(fieldId) {
        document.getElementById(fieldId).innerText = "";
    }

    // Attach blur events to the fields
    window.onload = function() {
        document.getElementById("moviename").addEventListener("blur", function() {
            validateField("moviename", "movienameError", "Movie name should not start or end with spaces.");
        });

        document.getElementById("movielink").addEventListener("blur", function() {
            validateField("movielink", "movielinkError", "Movie link should not start or end with spaces.");
        });
    };
    
    
</script>

</body>
</html>
