<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile Update</title>
  <!-- Add Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
    }

    .container {
      margin-top: 50px;
    }

    .message {
      color: green;
      font-weight: bold;
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h2 class="text-center mb-4">Update Your Profile</h2>

        <!-- Success message -->
        <c:if test="${not empty m}">
          <div class="alert alert-success">${m}</div>
        </c:if>

        <!-- Update form -->
        <form action="updateUser" method="POST">
          <div class="form-group">
            <label for="uid"></label>
            <c:forEach var="u" items="${user}">
              <input type="hidden" class="form-control" id="uid" name="uid" value="${u.uid}" readonly>
          </div>

          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" value="${u.username}" required>
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="mail" value="${u.mail}" required>
          </div>

          <div class="form-group">
            <label for="contact">Contact</label>
            <input type="tel" class="form-control" id="contact" name="contact" value="${u.contact}" required>
          </div>
          </c:forEach>

          <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
        </form>

        <a href="backindex" class="btn btn-secondary btn-block mt-3">Back to Movie List</a>
      </div>
    </div>
  </div>

  <!-- Add Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
