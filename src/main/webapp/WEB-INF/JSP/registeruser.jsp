<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

<!-- Link to custom CSS -->
<link href="<c:url value='/resources/CSS/stylee.css' />" rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<!-- FontAwesome for icons -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Custom JS -->
<script type="text/javascript" src="<c:url value='/resources/JS/validate.js'/>"></script>
<script> src="<c:url value='/resources/JS/validate.js'/>"></script>

<!-- Inline Custom CSS for Page -->
<style>
body {
    /* Add background image */
    background-image: url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
    background-color: #007bff;
    color: white;
    border-bottom: none;
}

.card-body {
    padding: 2rem;
}

.form-group label {
    font-weight: bold;
}

.input-icon-container {
    position: relative;
}

.input-icon-container input {
    padding-left: 40px;
}

.input-icon-container .fa {
    position: absolute;
    left: 10px;
    top: 78%;
    transform: translateY(-50%);
    color: #888;
}

.password-container {
    position: relative;
}

.password-container .form-control {
    padding-right: 50px; /* Adjust based on the size of the toggle button */
    padding-left: 40px;  /* Ensure there is space for the lock icon */
}

.password-container .fa {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #888;
}

.password-container .toggle-password {
    position: absolute;
    top: 50%;
    right: 15px;
    transform: translateY(-50%);
    cursor: pointer;
}

.error-message {
    color: red;
    font-size: 0.875em;
    display: block;
}

.invalid {
    border-color: red;
}

</style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>User Registration</h3>
                    </div>
                    <div class="card-body">
                        <form name="frm" action="ureg" method="post" onsubmit="return validateForm()">
                            <div class="form-group input-icon-container">
                                <label for="username">Username</label>
                                                                <small id="usernameError" class="form-text error-message"></small>
                                
                                <i class="fa fa-user"></i>
                                <input type="text" name="username" id="username" class="form-control" placeholder="Enter your name" autocomplete="off" required>
                            </div>

                            <div class="form-group password-container">
                                <label for="password">Password</label>
                                <div class="position-relative">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" autocomplete="off" required>
                                    <span id="togglePassword" class="toggle-password"><i class="fa fa-eye"></i></span>
                                </div>
                                <small id="passwordError" class="form-text error-message"></small>
                            </div>

                            <div class="form-group input-icon-container">
                                <label for="mail">Email</label>
                                                                <small id="emailError" class="form-text error-message"></small>
                                
                                <i class="fa fa-envelope"></i>
                                <input type="email" name="mail" id="mail" class="form-control" placeholder="Enter your email" autocomplete="off" required>
                            </div>

                            <div class="form-group input-icon-container">
                                <label for="contact">Contact Number</label>
                          <small id="contactError" class="form-text error-message"></small>
                                <i class="fa fa-phone"></i>
                                <input type="text" name="contact" id="contact" class="form-control" placeholder="Enter your contact" autocomplete="off" required>

                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block">Submit Information</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
    // Function to validate if a field starts or ends with spaces
    function validateField(fieldId, errorId, errorMsgStart, errorMsgEnd) {
        var field = document.getElementById(fieldId);
        var errorElement = document.getElementById(errorId);

        // Reset error states
        field.classList.remove('invalid');
        errorElement.textContent = "";

        // Check for leading or trailing spaces
        if (field.value.startsWith(" ")) {
            errorElement.textContent = errorMsgStart;
            field.classList.add('invalid');
        } else if (field.value.endsWith(" ")) {
            errorElement.textContent = errorMsgEnd;
            field.classList.add('invalid');
        }
    }

    // Individual field validation functions
    function validateUsername() {
        validateField('username', 'usernameError', 'Username cannot start with a space.', 'Username cannot end with a space.');
    }

    function validatePassword() {
        var password = document.getElementById('password').value;
        var errorElement = document.getElementById('passwordError');

        // Reset error states
        document.getElementById('password').classList.remove('invalid');
        errorElement.textContent = "";

        // Strong password validation
        var strongPasswordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (!strongPasswordPattern.test(password)) {
            errorElement.textContent = "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.";
            document.getElementById('password').classList.add('invalid');
        }
    }

    function validateEmail() {
        var email = document.getElementById('mail').value;
        var errorElement = document.getElementById('emailError');

        // Reset error states
        document.getElementById('mail').classList.remove('invalid');
        errorElement.textContent = "";

        // Check for leading or trailing spaces
        if (email.startsWith(" ")) {
            errorElement.textContent = "Email cannot start with a space.";
            document.getElementById('mail').classList.add('invalid');
        } else if (email.endsWith(" ")) {
            errorElement.textContent = "Email cannot end with a space.";
            document.getElementById('mail').classList.add('invalid');
        } else {
            // Email format validation
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                errorElement.textContent = "Invalid email format.";
                document.getElementById('mail').classList.add('invalid');
            }
        }
    }

    function validateContact() {
        var contact = document.getElementById('contact').value;
        var errorElement = document.getElementById('contactError');

        // Reset error states
        document.getElementById('contact').classList.remove('invalid');
        errorElement.textContent = "";

        // Contact number validation (e.g., 10 digits)
        var contactPattern = /^\d{10}$/;
        if (!contactPattern.test(contact)) {
            errorElement.textContent = "Contact number must be 10 digits long.";
            document.getElementById('contact').classList.add('invalid');
        }
    }

    // Attach blur event listeners to fields
    document.getElementById("username").addEventListener("blur", validateUsername);
    document.getElementById("password").addEventListener("blur", validatePassword);
    document.getElementById("mail").addEventListener("blur", validateEmail);
    document.getElementById("contact").addEventListener("blur", validateContact);

    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function () {
        var passwordField = document.getElementById('password');
        var toggleIcon = document.getElementById('togglePassword').querySelector('i');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    });

    // Main form validation
    function validateForm() {
        validateUsername();
        validatePassword();
        validateEmail();
        validateContact();

        // Check if any fields are invalid
        var invalidFields = document.querySelectorAll('.invalid');
        return invalidFields.length === 0;
    }
    
    
   
    $(document).ready(function() {
        <c:if test="${not empty m}">
            alert('${m}');
        </c:if>
    });

    </script>
</body>
</html>
