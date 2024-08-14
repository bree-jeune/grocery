<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Basic Meta Tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="grocery, about us, neighborhood store" />
    <meta name="description" content="Learn more about The Neighborhood Nook, your go-to grocery store for fresh produce and quality goods." />
    <meta name="author" content="The Neighborhood Nook" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" type="image/x-icon">
    <title>The Neighborhood Nook | About Us</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

    <!-- Owl Carousel -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

    <!-- Font Awesome Icons -->
    <link href="<%= request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom Styles for this Template -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />

    <!-- Responsive Styles -->
    <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">

<jsp:include page="include/header.jsp" />


<section class="about_section layout_padding">
    <div class="container">
        <div class="detail-box">
            <div class="heading_container heading_center">
                <h2>About Us</h2>
            </div>
            <p>
                Welcome to The Neighborhood Nook, your trusted grocery store for fresh produce and quality goods. We pride ourselves on offering a wide variety of products to meet your daily needs. Our store has a long-standing tradition of providing excellent customer service and a community-focused shopping experience.
            </p>
        </div>
        <div class="col-md-9 mx-auto px-0">
            <div class="img-box">
                <img src="<%= request.getContextPath() %>/images/about-img.jpg" alt="About The Neighborhood Nook">
            </div>
            <div class="btn-box">
                <a href="<%= request.getContextPath() %>/contact.jsp">Contact Us</a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/js/custom.js"></script>
</body>
</html>
