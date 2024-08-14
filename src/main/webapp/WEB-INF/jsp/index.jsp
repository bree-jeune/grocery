<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageContent" value="content/home.jsp"/>
<c:set var="pageTitle" value="Home - The Neighborhood Nook"/>

<meta name="description" content="The Neighborhood Nook - Your go-to grocery store for fresh produce and quality goods.">
<meta name="keywords" content="grocery, fresh produce, quality goods, shopping">

<style>
    /* Reset and Box-Sizing */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Body Styling */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #333;
    }

    /* Container */
    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    /* Header Styling */
    header {
        background-color: #006600;
        padding: 20px;
        text-align: center;
        color: white;
    }

    /* Navigation Bar */
    nav {
        margin: 20px 0;
    }

    nav ul {
        list-style: none;
        display: flex;
        justify-content: center;
    }

    nav ul li {
        margin: 0 15px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-weight: bold;
    }

    nav ul li a:hover {
        color: #ff9900;
    }

    /* Hero Area */
    .hero_area {
        background-color: #009900;
        color: white;
        text-align: center;
        padding: 50px 0;
        background-image: url('../images/hero-bg.jpg'); /* Replace with your image path */
        background-size: cover;
        background-position: center;
    }

    .hero_area h1 {
        font-size: 48px;
        margin-bottom: 10px;
    }

    .hero_area p {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .hero_area .btn {
        padding: 10px 20px;
        background-color: #ff9900;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .hero_area .btn:hover {
        background-color: #cc7a00;
    }

    /* About Section */
    .about_section {
        background-color: white;
        padding: 50px 20px;
        text-align: center;
    }

    .about_section h2 {
        font-size: 36px;
        color: #009900;
        margin-bottom: 20px;
    }

    .about_section p {
        font-size: 18px;
        color: #666;
        line-height: 1.6;
        margin-bottom: 30px;
    }

    .about_section .img-box img {
        width: 100%;
        height: auto;
        max-width: 600px;
        border-radius: 10px;
        margin: 0 auto;
    }

    .about_section .btn-box a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #009900;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-size: 18px;
    }

    .about_section .btn-box a:hover {
        background-color: #007a00;
    }

    /* Featured Products Section */
    .featured_section {
        background-color: #f3f3f3;
        padding: 50px 20px;
    }

    .featured_section .heading_container {
        margin-bottom: 40px;
    }

    .featured_section h2 {
        font-size: 36px;
        color: #006600;
        text-align: center;
        margin-bottom: 20px;
    }

    .product-box {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .product-box img {
        width: 100%;
        height: auto;
        max-width: 250px;
        margin-bottom: 15px;
    }

    .product-box h4 {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }

    .product-box p {
        font-size: 18px;
        color: #666;
        margin-bottom: 15px;
    }

    .product-box .btn-primary {
        background-color: #ff9900;
        border-color: #ff9900;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
    }

    .product-box .btn-primary:hover {
        background-color: #cc7a00;
        border-color: #cc7a00;
    }

    /* Special Offers Section */
    .offers_section {
        background-color: white;
        padding: 50px 20px;
    }

    .offers_section h2 {
        font-size: 36px;
        color: #006600;
        text-align: center;
        margin-bottom: 20px;
    }

    .offers_section p {
        font-size: 18px;
        color: #666;
        text-align: center;
        margin-bottom: 30px;
    }

    .offers_section .btn-box a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #ff9900;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-size: 18px;
    }

    .offers_section .btn-box a:hover {
        background-color: #cc7a00;
    }

    /* Testimonials Section */
    .testimonials_section {
        background-color: #f3f3f3;
        padding: 50px 20px;
        text-align: center;
    }

    .testimonials_section h2 {
        font-size: 36px;
        color: #006600;
        margin-bottom: 20px;
    }

    .testimonials_section .item p {
        font-size: 18px;
        color: #666;
        margin-bottom: 20px;
    }

    /* CTA Section */
    .cta_section {
        background-color: #009900;
        color: white;
        padding: 50px 20px;
        text-align: center;
    }

    .cta_section h3 {
        font-size: 32px;
        margin-bottom: 20px;
    }

    .cta_section p {
        font-size: 18px;
        margin-bottom: 30px;
    }

    .cta_section form input[type="email"] {
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-right: 10px;
    }

    .cta_section form button {
        padding: 10px 20px;
        background-color: #ff9900;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .cta_section form button:hover {
        background-color: #cc7a00;
    }

    /* Footer Section */
    footer {
        background-color: #006600;
        color: white;
        padding: 20px 0;
        text-align: center;
        margin-top: 40px;
    }

    footer p {
        font-size: 14px;
    }

    footer a {
        color: #ff9900;
        text-decoration: none;
    }

    footer a:hover {
        color: #cc7a00;
    }

    /* Media Queries for Responsive Design */
    @media (max-width: 768px) {
        .hero_area {
            padding: 30px 0;
        }

        .about_section, .featured_section, .offers_section, .testimonials_section, .cta_section {
            padding: 30px 20px;
        }

        .cta_section form input[type="email"], .cta_section form button {
            width: 100%;
            margin-bottom: 10px;
        }

        /* Grid Layout for Sections */
        .content {
            display: grid;
            grid-template-columns: 1fr;
            grid-gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* For larger screens, stack the sections vertically */
        @media (min-width: 768px) {
            .content {
                grid-template-columns: 1fr 1fr;
            }
        }

        /* For extra large screens, use a three-column layout */
        @media (min-width: 1024px) {
            .content {
                grid-template-columns: 1fr 1fr 1fr;
            }
        }

        /* Individual Section Styling */
        .hero_area {
            grid-column: 1 / -1; /* Span full width on all screen sizes */
        }

        .about_section, .featured_section, .offers_section, .testimonials_section, .cta_section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /* Adjusting Buttons for Sections */
        .btn-box {
            text-align: center;
            margin-top: 20px;
        }

        .btn-box a {
            background-color: #ff9900;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-box a:hover {
            background-color: #cc7a00;
        }
    }

</style>

<div class="hero_area">
    <section class="slider_section">
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}..resources/images/slide1.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First Slide Title</h5>
                        <p>First Slide Description.</p>
                    </div>
                </div>
                <!-- Additional slides here -->
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
    </section>
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


