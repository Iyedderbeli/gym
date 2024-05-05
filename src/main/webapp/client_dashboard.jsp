<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/lux/bootstrap.min.css" rel="stylesheet">
 <style>
*{
color: white;
}
h1,h2{color: white;}
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
 
</nav>
    <div class="container mt-5">
        <h1 class="mb-4">Welcome to Your Dashboard</h1>
        <div>
            <div class="card-body">
                <h2 >Your Informations:</h2>
                <p class="card-text"><strong>Name:</strong> <%= ((gym.Client)session.getAttribute("client")).getName() %></p>
                <p class="card-text"><strong>Email:</strong> <%= ((gym.Client)session.getAttribute("client")).getEmail() %></p>
                <p class="card-text"><strong>Address:</strong> <%= ((gym.Client)session.getAttribute("client")).getAddress() %></p>
                <p class="card-text"><strong>Phone Number:</strong> <%= ((gym.Client)session.getAttribute("client")).getPhone() %></p>
                <p class="card-text"><strong>Membership Type:</strong> <%= ((gym.Client)session.getAttribute("client")).getMembership_type() %></p>
                <!-- Add more client details as needed -->
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
