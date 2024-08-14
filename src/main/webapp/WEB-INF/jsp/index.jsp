<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageContent" value="content/home.jsp"/>
<c:set var="pageTitle" value="Home - The Neighborhood Nook"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<meta name="description" content="The Neighborhood Nook - Your go-to grocery store for fresh produce and quality goods.">
<meta name="keywords" content="grocery, fresh produce, quality goods, shopping"

<jsp:include page="include/header.jsp" />


<div class="hero_area">
    <h1>Welcome to The Neighborhood Nook</h1>
    <p>Your go-to grocery store for fresh produce and quality goods.</p>
    <a href="${pageContext.request.contextPath}/shop" class="btn">Shop Now</a>
</div>


<<div id="customCarousel1" class="carousel slide" data-ride="carousel">
<div class="carousel-inner">
    <div class="carousel-item active">
        <img src="${pageContext.request.contextPath}/resources/images/b1.jpg" class="d-block w-100" alt="Slide 1">
        <div class="carousel-caption d-none d-md-block">
            <h5>Fresh Produce Daily</h5>
            <p>Pick the freshest and finest products every day.</p>
        </div>
    </div>
    <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/b2.jpg" class="d-block w-100" alt="Slide 2">
        <div class="carousel-caption d-none d-md-block">
            <h5>100% Organic</h5>
            <p>We offer a wide range of organic fruits and vegetables.</p>
        </div>
    </div>
    <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/resources/images/b3.jpg" class="d-block w-100" alt="Slide 3">
        <div class="carousel-caption d-none d-md-block">
            <h5>Delicious Smoothies</h5>
            <p>Start your day with our refreshing smoothies made from fresh ingredients.</p>
        </div>
    </div>
</div>
<a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
</a>
</div>

<section class="featured_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>Featured Products</h2>
        </div>
        <div class="row">
            <c:forEach items="${featuredProducts}" var="product">
                <div class="col-md-4">
                    <div class="product-box">
                        <img src="${pageContext.request.contextPath}/resources/images/${product.image}" alt="${product.name}">
                        <h4>${product.name}</h4>
                        <p>${product.description}</p>
                        <p>$${product.price}</p>
                        <a href="${pageContext.request.contextPath}/product/details?id=${product.id}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="offers_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>Special Offers</h2>
        </div>
        <p>Check out our special offers for the week! Don't miss out on great deals.</p>
        <div class="btn-box">
            <a href="${pageContext.request.contextPath}/offers.jsp">View Offers</a>
        </div>
    </div>
</section>

<section class="testimonials_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>What Our Customers Say</h2>
        </div>
        <div class="owl-carousel owl-theme">
            <div class="item">
                <p>"The best grocery store in town!" - Sarah M.</p>
            </div>
            <div class="item">
                <p>"Always fresh and affordable." - John D.</p>
            </div>
            <div class="item">
                <p>"I love their organic selection." - Emily R.</p>
            </div>
        </div>
    </div>
</section>

<section class="cta_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h3>Join Our Newsletter</h3>
                <p>Stay updated with the latest news, offers, and promotions from The Neighborhood Nook.</p>
            </div>
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/subscribe" method="POST">
                    <input type="email" name="email" class="form-control" placeholder="Enter your email">
                    <button type="submit" class="btn btn-primary">Subscribe</button>
                </form>
            </div>
        </div>
    </div>
</section>

<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>
