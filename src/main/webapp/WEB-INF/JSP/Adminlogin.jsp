<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Open Sans", sans-serif;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      width: 100%;
      padding: 0 10px;
    }

    body::before {
      content: "";
      position: absolute;
      width: 100%;
      height: 100%;
      background: url("<c:url value='/resources/img/hero-bg.jpg'/>"), #000;
      background-position: center;
      background-size: cover;
    }

    .wrapper {
      width: 400px;
      border-radius: 8px;
      padding: 30px;
      text-align: center;
      border: 1px solid rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      position: relative;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    h2 {
      font-size: 2rem;
      margin-bottom: 20px;
      color: #fff;
    }

    .input-field {
      position: relative;
      border-bottom: 2px solid #ccc;
      margin: 15px 0;
    }

    .input-field label {
      position: absolute;
      top: 50%;
      left: 0;
      transform: translateY(-50%);
      color: #fff;
      font-size: 16px;
      pointer-events: none;
      transition: 0.15s ease;
    }

    .input-field input {
      width: 100%;
      height: 40px;
      background: transparent;
      border: none;
      outline: none;
      font-size: 16px;
      color: #fff;
    }

    .input-field input:focus~label,
    .input-field input:valid~label {
      font-size: 0.8rem;
      top: 10px;
      transform: translateY(-120%);
    }

    .forget {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin: 25px 0 35px 0;
      color: #fff;
    }

    #remember {
      accent-color: #fff;
    }

    .forget label {
      display: flex;
      align-items: center;
    }

    .forget label p {
      margin-left: 8px;
    }

    .wrapper a {
      color: #efefef;
      text-decoration: none;
    }

    .wrapper a:hover {
      text-decoration: underline;
    }

    button {
      background: #fff;
      color: #000;
      font-weight: 600;
      border: none;
      padding: 12px 20px;
      cursor: pointer;
      border-radius: 3px;
      font-size: 16px;
      border: 2px solid transparent;
      transition: 0.3s ease;
    }

    button:hover {
      color: #fff;
      border-color: #fff;
      background: rgba(255, 255, 255, 0.15);
    }

    .register {
      text-align: center;
      margin-top: 30px;
      color: #fff;
    }

    .password-container {
      position: relative;
    }

    .password-container input {
      padding-right: 40px; /* Space for the eye icon */
    }

    .password-container .eye-icon {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #fff;
      font-size: 18px;
    }

  </style>
</head>
<body>
  <div class="wrapper">
    <form name="frm" action="${pageContext.request.contextPath}/valid" method="POST">
      <h2>Admin Login</h2>
      <div class="input-field">
        <input type="text" name="username" required autocomplete="off">
        <label>Enter your username</label>
      </div>
      <div class="input-field password-container">
        <input type="password" name="password" id="password" required autocomplete="off">
        <label>Enter your password</label>
        <span class="eye-icon" onclick="togglePassword()">&#128065;</span> <!-- Eye icon (Unicode) -->
      </div>
      <div class="forget">
        <!-- <label for="remember">
          <input type="checkbox" id="remember">
          <p>Remember me</p>
        </label>
        <a href="#">Forgot password?</a> -->
      </div>
      <button type="submit">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="#">Register</a></p>
      </div>
    </form>
  </div>

  <script>
    function togglePassword() {
      const passwordInput = document.getElementById('password');
      const eyeIcon = document.querySelector('.eye-icon');
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.innerHTML = '&#128064;'; // Eye with a line through it (Unicode)
      } else {
        passwordInput.type = 'password';
        eyeIcon.innerHTML = '&#128065;'; // Eye icon (Unicode)
      }
    }
  </script>
</body>
</html>
