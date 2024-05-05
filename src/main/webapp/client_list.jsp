<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client List</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" rel="stylesheet">
    <style>
*{
color: white;
}
h1{color: white;}
img{height:60px;
	width:60px;
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
            <li class="nav-item active">
                <a class="nav-link" href="client_list.jsp">Client List</a>
            </li>
            <li class="nav-item ">
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
    <h1 >Client List</h1>
    <table class="table mt-3">
        <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Membership Type</th>
                <th>Registration Date</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over each client and display their information -->
            <%@ page import="java.util.List" %>
            <%@ page import="dao.ClientDAO" %>
            <%@ page import="gym.Client" %>
            <% 
                // Retrieve all clients from the database
                List<Client> clients = ClientDAO.getAllClients();

                // Iterate over the list of clients
                for (Client client : clients) {
            %>
            <tr>
                <td><%= client.getName() %></td>
                <td><%= client.getAddress() %></td>
                <td><%= client.getPhone() %></td>
                <td><%= client.getEmail() %></td>
                <td><%= client.getMembership_type() %></td>
                <td><%= client.getRegistrationdate() %></td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>

<!-- Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
