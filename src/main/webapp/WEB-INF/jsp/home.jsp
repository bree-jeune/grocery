<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Hero Area with Carousel -->
<div class="hero_area">
    <section class="slider_section">
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}..resources/images/slide1.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}..resources/images/slide2.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
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
    </section>
</div>

<!-- About Section -->
<section class="about_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>About Us</h2>
        </div>
        <p>Welcome to The Neighborhood Nook, your go-to grocery store for fresh produce and quality goods.</p>
        <div class="img-box">
            <img src="${pageContext.request.contextPath}..resources/images/about.jpg" alt="About Us">
        </div>
        <div class="btn-box">
            <a href="${pageContext.request.contextPath}/about.jsp">Read More</a>
        </div>
    </div>
</section>

<!-- Featured Products Section -->
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

<!-- Special Offers Section -->
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

<!-- Testimonials Section -->
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

<!-- Call to Action (CTA) Section -->
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
