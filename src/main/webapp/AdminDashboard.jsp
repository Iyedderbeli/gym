<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="gym.Client" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client List</title>
    <!-- Add Bootswatch Lux theme -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="greeting.jsp">Gym Management</a>
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
    <h1>Client List</h1>
    <!-- Your client list table content goes here -->
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Membership Type</th>
                <th>Date</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients", "root", "");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM clients";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
            %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("membership_type") %></td>
                        <td><%= rs.getDate("registrationdate") %></td>
                    </tr>
            <% 
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</div>

<b style="color:green;">
    <% String message = (String) (request.getAttribute("message"));
    if (message != null) {
        out.print(message);
    }
    %>
</b>

<!-- Add Bootstrap JS and Popper.js CDN links -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
