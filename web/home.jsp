
<%@ page import="entity.Account,entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Lodge</title>

        <!-- slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Poppins:400,600,700&display=swap" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
    </head>

    <body>
        <%List<Movie> list = (List<Movie>) request.getAttribute("listM");%>
        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="home.jsp">
                            <img src="images/logo1.png" alt="">
                            <span>
                                Lodge
                            </span>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                                <ul class="navbar-nav  ">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="MovieController?action=list">Movie </a>
                                    </li>
                                    <% if (isLoggedIn) { %>
                                    <p><strong>Xin chào, <%= account.getName() %>!</strong></p>
                                    <li class="nav-item">
                                        <a class="nav-link" href="logout">Logout</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" onclick="showProfile(event)">Your Profile</a>

                                        <!-- Div chứa thông tin -->
                                        <div id="profileContainer" style="display: none; position: absolute; background: white; padding: 15px; border-radius: 8px;
                                             box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); width: 250px;">
                                            <h3>Thông tin tài khoản</h3>
                                            <p><strong>Tên:</strong> <%= account.getName() %></p>
                                            <p><strong>Mã khách hàng:</strong> <%= customerID %></p>
                                            <p><a href="account?service=changeCustomerProfile&cid=<%= customerID %>" class="btn btn-primary">Cập nhật hồ sơ</a></p>
                                            <p><a href="account?service=changePassword" class="btn btn-secondary">Đổi mật khẩu</a></p>
                                            <button onclick="closeProfile()">Đóng</button>
                                        </div>
                                    </li>
                                    <% } else { %>
                                    <li class="nav-item">
                                        <a class="nav-link" href="login.jsp">Login</a>
                                    </li>
                                    <% } %>


                                </ul>

                            </div>
                            <div class="quote_btn-container ">
                                <a href="">
                                    <img src="images /cart.png" alt="">
                                    <div class="cart_number">
                                        0
                                    </div>
                                </a>
                                <form class="form-inline">
                                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                                </form>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class=" slider_section position-relative">
                <div class="design-box">
                    <img src="images/design-1.png" alt="">
                </div>
                <div class="slider_number-container d-none d-md-block">
                    <div class="number-box">
                        <span>
                            01
                        </span>
                        <hr>
                        <span class="jwel">
                            M <br>
                            O <br>
                            V <br>
                            I <br>
                            E <br>
                            l <br>
                            e <br>
                            r <br>
                            y
                        </span>
                        <hr>
                        <span>
                            02
                        </span>
                    </div>
                </div>
                <div class="container">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">01</li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1">02</li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2">03</li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail_box">
                                            <h2>
                                                <span>New Movies</span>
                                                <hr>
                                            </h2>
                                            <h1>
                                                #
                                            </h1>
                                            <p>
                                                Lorem ipsum dolor sit amet consec tetur adipiscing elit elit at felislacinia
                                                aptent taciti sociosqu ad litora torquent per conubia nostra
                                            </p>
                                            <div>
                                                <a href="">Order Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="img-box">
                                            <img src="images/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail_box">
                                            <h2>
                                                <span> New Movie</span>
                                                <hr>
                                            </h2>
                                            <h1>
                                                #
                                            </h1>
                                            <p>
                                                Lorem ipsum dolor sit amet consec tetur adipiscing elit elit at felislacinia
                                                aptent taciti sociosqu ad litora torquent per conubia nostra
                                            </p>
                                            <div>
                                                <a href="">Order Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="img-box">
                                            <img src="images/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail_box">
                                            <h2>
                                                <span> New Movie</span>
                                                <hr>
                                            </h2>
                                            <h1>
                                                #
                                            </h1>
                                            <p>
                                                Lorem ipsum dolor sit amet consec tetur adipiscing elit elit at felislacinia
                                                aptent taciti sociosqu ad litora torquent per conubia nostra
                                            </p>
                                            <div>
                                                <a href="">Order Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="img-box">
                                            <img src="images/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!-- end slider section -->
        </div>

        <!-- item section -->

        <section class="price_section layout_padding">
            <div class="container">
                <div class="heading_container">
                    <h2>Comming Soon</h2>
                </div>
                <div class="price_container">
                    <% if (list != null && list.size() >= 3) { 
                       for (int i = list.size() - 3; i < list.size(); i++) { 
                                Movie movie = list.get(i);

                    %>
                    <div class="box">
                        <div class="img-box">
                            <img src="<%= request.getContextPath() + "/" + movie.getMoviePoster() %>" alt="Movie Poster">
                        </div>
                        <div class="name">
                            <p><%= movie.getMovieName() %></p>
                        </div>
                        <div class="dur">
                            <p><%= movie.getDuration() %></p>
                        </div>
                        <div class="genr">
                            <p><%= movie.getGenre() %></p>
                        </div>
                        <div class="dir">
                            <p><%= movie.getDirector() %></p>
                        </div>
                        <div class="rel">
                            <p><%= movie.getReleaseDate() %></p>
                        </div>
                        <div class="">
                            <p><span><%= movie.getCountry() %></span></p>
                            <a href="MovieController?action=detail&id=<%= movie.getMovieID()%>">Detail</a>
                        </div>
                    </div>
                    <% } 
            } else { %>
                    <p>There are currently not enough movies to display.</p>
                    <% } %>
                </div>
            </div>
        </section>


        <!-- end item section -->

        <!-- about section -->



        <!-- end about section -->

        <!-- price section -->

        <section class="price_section layout_padding">
            <div class="container">
                <div class="heading_container">
                    <h2>Now Showing</h2>
                </div>
                <div class="price_container">
                    <% if (list != null && list.size() >= 3) { 
                        for (int i = 0; i < 3; i++) { 
                            Movie movie = list.get(i);
                    %>
                    <div class="box">
                        <div class="img-box">
                            <img src="<%= request.getContextPath() + "/" + movie.getMoviePoster() %>" alt="Movie Poster">
                        </div>
                        <div class="name">
                            <p><%= movie.getMovieName() %></p>
                        </div>
                        <div class="dur">
                            <p><%= movie.getDuration() %></p>
                        </div>
                        <div class="genr">
                            <p><%= movie.getGenre() %></p>
                        </div>
                        <div class="dir">
                            <p><%= movie.getDirector() %></p>
                        </div>
                        <div class="rel">
                            <p><%= movie.getReleaseDate() %></p>
                        </div>
                        <div class="">
                            <p><span><%= movie.getCountry() %></span></p>
                            <a href="MovieController?action=detail&id=<%= movie.getMovieID()%>">Detail</a>
                        </div>
                    </div>
                    <% } 
            } else { %>
                    <p>There are currently not enough movies to display.</p>
                    <% } %>
                </div>
            </div>
        </section>

        <!-- end price section -->

        <!-- ring section -->

        <!--        <section class="ring_section layout_padding">
                    <div class="design-box">
                        <img src="images/design-1.png" alt="">
                    </div>
                    <div class="container">
                        <div class="ring_container layout_padding2">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="detail-box">
                                        <h4>
                                            special
                                        </h4>
                                        <h2>
                                            Wedding Ring
                                        </h2>
                                        <a href="buy.jsp">
                                            Buy Now
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="img-box">
                                        <img src="images/ring-img.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>-->



        <!-- info section -->
        <section class="info_section ">
            <div class="container">
                <div class="info_container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="info_logo">
                                <a href="">
                                    <img src="images/logo.png" alt="">
                                    <span>
                                        Lodge
                                    </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="info_contact">
                                <a href="">
                                    <img src="images/location.png" alt="">
                                    <span>
                                        Address
                                    </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="info_contact">
                                <a href="">
                                    <img src="images/phone.png" alt="">
                                    <span>
                                        +01 1234567890
                                    </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="info_contact">
                                <a href="">
                                    <img src="images/mail.png" alt="">
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="info_form">
                        <div class="d-flex justify-content-center">
                            <h5 class="info_heading">
                                Newsletter
                            </h5>
                        </div>
                        <form action="">
                            <div class="email_box">
                                <label for="email2">Enter Your Email</label>
                                <input type="text" id="email2">
                            </div>
                            <div>
                                <button>
                                    subscribe
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="info_social">
                        <div class="d-flex justify-content-center">
                            <h5 class="info_heading">
                                Follow Us
                            </h5>
                        </div>
                        <div class="social_box">
                            <a href="">
                                <img src="images/fb.png" alt="">
                            </a>
                            <a href="">
                                <img src="images/twitter.png" alt="">
                            </a>
                            <a href="">
                                <img src="images/linkedin.png" alt="">
                            </a>
                            <a href="">
                                <img src="images/insta.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end info_section -->

        <!-- footer section -->
        <section class="container-fluid footer_section">
            <p>
                &copy; <span id="displayYear"></span> All Rights Reserved By
                <a href="https://html.design/">Free Html Templates</a>
            </p>
        </section>
        <!-- footer section -->

        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>

        <script>
    function showProfile(event) {
        event.preventDefault();
        var profile = document.getElementById('profileContainer');
        var link = event.target; // Lấy thẻ <a> được click

        // Định vị vị trí của profile ngay dưới "Your Profile"
        profile.style.display = 'block';
        profile.style.position = 'absolute';
        profile.style.top = (link.offsetTop + link.offsetHeight) + 'px';
        profile.style.left = link.offsetLeft + 'px';
    }

    function closeProfile() {
        document.getElementById('profileContainer').style.display = 'none';
    }
</script>

    </body>

</html>