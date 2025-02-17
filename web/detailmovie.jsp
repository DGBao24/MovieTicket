<%@page import="entity.Movie"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
        }
        .movie-detail {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }
        .movie-info {
            display: flex;
            gap: 20px;
        }
        .movie-info img {
            width: 200px;
            border-radius: 8px;
        }
        .details h3 {
            margin-top: 0;
        }
        .trailer, .buy-ticket {
            background-color: red;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin-right: 10px;
        }
        .description {
            margin-top: 20px;
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
            <img src="logo.png" alt="CINEMATIC">
            <li><a href="home">Home</a></li>
        </div>
        <nav>
            <ul>
                <li><a href="MovieController?action=list">MOVIES</a></li>
                <li><a href="CimemaController">CINEMAS</a></li>
                <li><a href="#">MEMBERS</a></li>
            </ul>
        </nav>
        <div class="auth">
            <a href="#">Login/Register</a>
        </div>
    </header>
    
    <main>
        <%
            Movie movie = (Movie) request.getAttribute("MOVIE_DETAIL");
            if (movie != null) {
        %>
        <section class="movie-detail">
            <h2><%= movie.getMovieName() %> - Details</h2>
            <div class="movie-info">
                <img src="<%= movie.getMoviePoster() %>" alt="Movie Poster">
                <div class="details">
                    <h3><%= movie.getMovieName() %></h3>
                    <p><strong>Director:</strong> <%= movie.getDirector() %></p>
                    <p><strong>Genre:</strong> <%= movie.getGenre() %></p>
                    <p><strong>Duration:</strong> <%= movie.getDuration() %> minutes</p>
                    <p><strong>Release Year:</strong> <%= movie.getReleaseDate() %></p>
                    <p><strong>Rating:</strong> <%= movie.getAgeRate() %></p>
                    <a href="<%= movie.getTrailerURL() %>" target="_blank">
                        <button class="trailer">Watch Trailer</button>
                    </a>
                    <button class="buy-ticket">BUY TICKET</button>
                </div>
            </div>
        </section>
        
        <section class="description">
            <h3>Description</h3>
            <p><%= movie.getDescription() %></p>
        </section>
        <% } else { %>
            <p>Movie details not available.</p>
        <% } %>
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
