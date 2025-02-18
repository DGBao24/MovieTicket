
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@page import="java.util.List"%>
<%@page import="entity.Cinema"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINEMATIC</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4dc;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #b22222;
            padding: 10px 20px;
            color: white;
        }
        .logo img {
            height: 50px;
        }
        nav ul {
            list-style: none;
            display: flex;
            gap: 15px;
        }
        nav ul li {
            display: inline;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        .auth a {
            color: white;
            text-decoration: none;
        }
        main {
            padding: 20px;
            text-align: center;
        }
        .cinema-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            justify-content: center;
            margin-top: 20px;
        }
        .cinema-card {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .cinema-card img {
            width: 80px;
            height: auto;
            border-radius: 8px;
            display: block;
            margin: 0 auto 10px;
        }
        .cinema-card p {
            font-size: 16px;
            font-weight: bold;
            margin: 0;
            color: #333;
        }
        footer {
            background-color: #333;
            text-align: center;
            padding: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        .social-icons img {
            width: 30px;
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <a href="home.jsp"<img src="logo.png" alt="CINEMATIC"> </a>
        </div>
        <nav>
            <ul>
                <li><a href="MovieController">MOVIES</a></li>
                <li><a href="CimemaController">CINEMAS</a></li>
                <li><a href="#">MEMBERS</a></li>
            </ul>
        </nav>
        <div class="auth">
            <a href="home">Home</a>
        </div>
    </header>
    
    <main>
        <h2>Cinemas</h2>
        <div class="cinema-container">
            <% 
                List<Cinema> cinemas = (List<Cinema>) request.getAttribute("CINEMA_LIST");  
                if (cinemas != null && !cinemas.isEmpty()) {  
                    for (Cinema cinema : cinemas) { 
            %>
                <div class="cinema-card" onclick="window.location.href='CinemaRoomController?action=byCinema&cinemaID=<%= cinema.getCinemaID() %>'" >
                    <img src="https://c8.alamy.com/comp/2KE1GD2/cinema-building-vector-illustration-isolated-on-white-background-movie-theater-and-houses-exterior-view-in-flat-style-2KE1GD2.jpg" alt="<%= cinema.getCinemaName() %> Cinema">
                    <p><%= cinema.getCinemaName() %></p>
                </div>
            <% } } else { %>
                <p>No cinemas available</p>
            <% } %>
        </div>
    </main>
    
    <footer>
        <div class="social-icons">
            <a href="#"><img src="facebook.png" alt="Facebook"></a>
            <a href="#"><img src="youtube.png" alt="YouTube"></a>
            <a href="#"><img src="tiktok.png" alt="TikTok"></a>
        </div>
    </footer>
</body>
</html>
