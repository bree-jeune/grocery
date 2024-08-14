<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Special Offers - The Neighborhood Nook</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/offers.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
</head>
<body class="sub_page">

<%@ include file="include/header.jsp" %>

<div class="content">
    <!-- Offers Section -->
    <section class="offers_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Special Offers</h2>
                <p class="col-lg-9 mx-auto px-0">
                    Discover the best deals and special offers at The Neighborhood Nook. Save more on your favorite groceries with our amazing discounts and bundles.
                </p>
            </div>
            <div class="row">
                <!-- Offer 1 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="offer_box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/placeholder.png" alt="Buy One Get One Free">
                        </div>
                        <div class="detail-box">
                            <h4>Buy One Get One Free</h4>
                            <p>Buy one, get one free on selected items! Don't miss out on this fantastic deal.</p>
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
                <!-- Offer 2 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="offer_box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/placeholder.png" alt="20% Off on Fresh Produce">
                        </div>
                        <div class="detail-box">
                            <h4>20% Off on Fresh Produce</h4>
                            <p>Enjoy 20% off on all fresh fruits and vegetables. Freshness guaranteed!</p>
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
                <!-- Offer 3 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="offer_box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/placeholder.png" alt="Bundle Deals">
                        </div>
                        <div class="detail-box">
                            <h4>Bundle Deals</h4>
                            <p>Save more with our exclusive bundle deals on a variety of products.</p>
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-box">
                <a href="${pageContext.request.contextPath}/shop" class="btn btn-outline-success">Explore More Offers</a>
            </div>
        </div>
    </section>
</div>

<%@ include file="include/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>
