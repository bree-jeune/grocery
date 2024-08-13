<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" type="image/x-icon">
    <title>Olests</title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- font awesome style -->
    <link href="<%= request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
<div class="hero_area">
    <!-- header section starts -->
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"> Olests </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/about.jsp"> About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/shop.jsp">Shop</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<%= request.getContextPath() %>/blog.jsp">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                            </a>
                        </li>
                        <form class="form-inline justify-content-center">
                            <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->
</div>

<!-- blog section -->

<section class="blog_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>
                Our Blog
            </h2>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="<%= request.getContextPath() %>/images/b1.jpg" alt="">
                        <h4 class="blog_date">
                <span>
                  11 Feb <br>
                  2021
                </span>
                        </h4>
                    </div>
                    <div class="detail-box">
                        <h5>
                            Nemo fugit corporis sitTenetur pariatur culpa harum
                        </h5>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="<%= request.getContextPath() %>/images/b2.jpg" alt="">
                        <h4 class="blog_date">
                <span>
                  11 Feb <br>
                  2021
                </span>
                        </h4>
                    </div>
                    <div class="detail-box">
                        <h5>
                            Ut facere necessitatibus modi eum architecto? Minima
                        </h5>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="<%= request.getContextPath() %>/images/b3.jpg" alt="">
                        <h4 class="blog_date">
                <span>
                  10 Feb <br>
                  2021
                </span>
                        </h4>
                    </div>
                    <div class="detail-box">
                        <h5>
                            Sapiente obcaecati cupiditate assumenda illum incidunt
                        </h5>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end blog section -->

<!-- info section -->
<section class="info_section ">
    <div class="info_container ">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <h6>
                        ABOUT US
                    </h6>
                    <p>
                        Nostrum praesentium, animi pariatur eaque harum amet necessitatibus unde aliquam molestias, sapiente cumque aspernatur officia molestiae possimus atque
                    </p>
                </div>
                <div class="col-md-6 col-lg-3">
                    <h6>
                        CONTACT US
                    </h6>
                    <div class="info_link-box">
                        <a href="">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span> Location </span>
                        </a>
                        <a href="">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <span>+01 12345678901</span>
                        </a>
                        <a href="">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <span> demo@gmail.com</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <h6>
                        Our Products
                    </h6>
                    <p>
                        Sapiente quidem fugit sed incidunt aut quia eos consectetur, iste eius nobis ullam voluptatem esse mollitia amet. Quibusdam eos inventore neque explicabo aliquid quos
                    </p>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="info_form ">
                        <h6>
                            Newsletter
                        </h6>
                        <form action="#">
                            <input type="email" placeholder="Enter your email">
                            <button>
                                Subscribe
                            </button>
                        </form>
                    </div>
                    <div class="social_container">
                        <div class="social_box">
                            <a href="">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-instagram" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-youtube" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end info section -->

<!-- footer section -->
<footer class=" footer_section">
    <div class="container">
        <p>
            &copy; <span id="displayYear"></span> All Rights Reserved By
        </p>
    </div>
</footer>
<!-- footer section -->

<!-- jQery -->
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<!-- bootstrap js -->
<script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
<!-- owl slider -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<!-- custom js -->
<script src="<%= request.getContextPath() %>/js/custom.js"></script>
</body>

</html>
