<%@page import="java.util.List"%>
<%@page import="entity.CinemaRoom"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Seating</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4dc;
            text-align: center;
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
        .theater-name {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .divider {
            width: 50%;
            margin: 0 auto;
            height: 3px;
            background-color: black;
            margin-bottom: 20px;
        }
        .seat-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            background-color: #d3d3d3;
            padding: 20px;
            border-radius: 8px;
            width: fit-content;
            margin: 0 auto;
        }
        .seat {
            background-color: white;
            padding: 15px;
            border-radius: 4px;
            font-weight: bold;
        }
        .address {
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="logo.png" alt="CINEMATIC">
        </div>
        <nav>
            <ul>
                <li><a href="MovieController">MOVIES</a></li>
                <li><a href="CimemaController">CINEMAS</a></li>
                <li><a href="#">MEMBERS</a></li>
            </ul>
        </nav>
        <div class="auth">
            <a href="#">Login/Register</a>
        </div>
    </header>
    
    <main>
        <div class="theater-name">Cinema Rooms</div>
        <div class="divider"></div>
        <h3>Room List</h3>
        <div class="seat-container">
            <% 
                List<CinemaRoom> rooms = (List<CinemaRoom>) session.getAttribute("CINEMA_ROOM_LIST");  
                if (rooms != null && !rooms.isEmpty()) {  
                    for (CinemaRoom room : rooms) { 
            %>
                <div class="seat">
                    <%= room.getRoomName() %>
                </div>
            <% } } else { %>
                <p>No rooms available</p>
            <% } %>
        </div>
        <div class="divider"></div>
    </main>
</body>
</html>
