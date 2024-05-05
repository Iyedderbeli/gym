<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Client</title>
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" rel="stylesheet">
<style>
*{
color: white;
}
h1{color: white;}
img{height:60px;
	width:60px;
}
option{
color:black;
}
</style>
</head>
<body style="background-image: url(https://static.vecteezy.com/system/resources/previews/037/228/850/non_2x/ai-generated-exercise-machines-in-a-gym-free-photo.jpg);">>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
     <a class="navbar-brand" href="greeting.jsp"><img id="image-1" alt="logo" src="https://www.pngkit.com/png/full/239-2392915_logo-gym-logo-png-white.png"/>GYM MANAGEMENT</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item ">
                <a class="nav-link" href="client_list.jsp">Client List</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="add_client.jsp">Add Client</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="remove_client.jsp">Remove Client</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search_client.jsp">Search Client</a>
            </li>
              <li class="nav-item">
                <a class="nav-link" href="add_admin.jsp">Add Admin</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h1>Add Client</h1>
    <form action="add_client" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
         <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="membership_type">Membership Type:</label>
            <select id="membership_type" name="membership_type" class="form-control"  required>
                <option value="NULL" selected disabled hidden>NULL</option>
                <option value="WeightLifting" >WeightLifting</option>
                <option value="Cardio">Cardio</option>
                <option value="Both">Both</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add Client</button>
    </form>
</div>

<b style="color:red;">
    <%
        String message = (String) (request.getAttribute("message"));
        if (message != null) {
            out.print(message);
        }
    %>
</b>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
