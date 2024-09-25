<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Actors Table</title>
    <!-- Include jQuery and DataTables CSS/JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 12px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
        }
    </style>
    
    <!-- Initialize DataTable -->
    <script>
        $(document).ready(function() {
            $('#actorsTable').DataTable();
        });
    </script>
</head>
<body>

<h2>List of Actors</h2>

<!-- Table for actors -->
<table id="actorsTable" class="display">
    <thead>
        <tr>
            <th>ID</th>
            <th>Actor Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="a" items="${aList}">
            <tr>
                <td>${a.aid}</td>
                <td>${a.aname}</td>
                <td><a href="deleteactor?aid=${a.aid}" class="btn btn-danger btn-sm">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
