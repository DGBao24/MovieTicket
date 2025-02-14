<%@page import="java.util.List"%>
<%@page import="entity.Movie,entity.Account"%>
<%
   
    
    Object accObj = session.getAttribute("account");
    Account account = null;
    if (accObj instanceof Account) {
        account = (Account) accObj;
    }

    boolean isLoggedIn = (account != null);
    Integer customerID = (Integer) session.getAttribute("CustomerID");
    
    

%>

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
            }
            .now-showing {
                text-align: center;
            }
            .movies-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }
            .movie-card {
                background-color: white;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 200px;
            }
            .movie-card img {
                width: 100%;
                height: 150px;
                background-color: lightgray;
                border-radius: 8px;
            }
            .movie-card button {
                background-color: red;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                margin-top: 10px;
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
            .now-showing {
                text-align: center;
                max-width: 1200px;  
                margin: 0 auto; 
                overflow: hidden; 
            }

            .movies-container {
                display: flex;
                gap: 20px;
                overflow-x: auto; 
                white-space: nowrap; 
                padding-bottom: 10px;
                max-width: 100%; 
                margin: 0 auto;
            }

            .movies-container::-webkit-scrollbar {
                height: 8px; /* Thanh cu?n ngang */
            }

            .movies-container::-webkit-scrollbar-thumb {
                background-color: red; 
                border-radius: 10px;
            }

            .movies-container::-webkit-scrollbar-track {
                background-color: #f4f4dc; 
            }

            .movie-card {
                flex: 0 0 auto; 
                width: 200px;
            }

        </style>
    </head>
    <body>
        <header>
            <div class="logo">
                <a href="home">Home</a>
            </div>
            <nav>
                <ul>
                    <li><a href="MovieController">MOVIES</a></li>
                    <li><a href="CimemaController?action=list">CINEMAS</a></li>
                    <li><a href="#">MEMBERS</a></li>
                </ul>
            </nav>
            <% if (isLoggedIn) { %>
            <p><strong>Xin chào, <%= account.getName() %>!</strong></p>
            <li class="nav-item">
                <a class="nav-link" href="logout">Logout</a>
            </li>
            <% } else { %>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <% } %>
        </header>

        <main>
            <section class="now-showing">
                <h2>Now Showing</h2>
                <div class="movies-container">
                    <% 
         List<Movie> movie = (List<Movie>) request.getAttribute("MOVIE_LIST");  
         if (movie != null && !movie.isEmpty()) {  
                    %>
                    <div class="movies-container">
                        <% for (Movie mv : movie) { %>
                        <div class="movie-card">
                            <img src="<%= mv.getMoviePoster() %>" alt="Movie Poster">
                            <p><strong><%= mv.getMovieName() %></strong></p>
                            <button onclick="window.location.href = 'MovieController?action=detail&id=<%= mv.getMovieID() %>'">View Details</button>
                        </div>
                        <% } %>
                    </div>
                    <% } else { %>
                    <p>No movies available</p>
                    <% } %>

                </div>

            </section>
        </main>

        <footer>
            <div class="social-icons">
                <a href="#"><img src="facebook.png" alt="Facebook"></a>
                <a href="#"><img src="youtube.png" alt="YouTube"></a>
                <a href="#"><img src="tiktok.png" alt="TikTok"></a>
            </div>
        </footer>

        <script src="script.js"></script>
    </body>
</html>
