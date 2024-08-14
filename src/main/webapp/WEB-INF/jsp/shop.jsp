<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Shop - The Neighborhood Nook</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
</head>
<body class="sub_page">

<%@ include file="include/header.jsp" %>

<div class="content">
    <!-- Fruits Section -->
    <section class="fruits_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Our Fruits</h2>
                <p class="col-lg-9 mx-auto px-0">
                    If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything.
                </p>
            </div>
            <div class="fruits_owl-carousel owl-carousel owl-theme">
                <!-- Item 1 -->
                <div class="item">
                    <div class="box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/f1.png" alt="Apple">
                        </div>
                        <div class="detail-box">
                            <h4>Apple</h4>
                            <h6 class="price">
                                <span class="new_price">$4.25</span>
                            </h6>
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Item 2 -->
                <div class="item">
                    <div class="box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/f2.png" alt="Banana">
                        </div>
                        <div class="detail-box">
                            <h4>Banana</h4>
                            <h6 class="price">
                                <span class="new_price">$3.50</span>
                            </h6>
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Item 3 -->
                <div class="item">
                    <div class="box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/f3.png" alt="Orange">
                        </div>
                        <div class="detail-box">
                            <h4>Orange</h4>
                            <h6 class="price">
                                <span class="new_price">$4.00</span>
                            </h6>
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Item 4 -->
                <div class="item">
                    <div class="box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/f4.png" alt="Grapes">
                        </div>
                        <div class="detail-box">
                            <h4>Grapes</h4>
                            <h6 class="price">
                                <span class="new_price">$5.00</span>
                            </h6>
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Item 5 -->
                <div class="item">
                    <div class="box">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/f5.png" alt="Pineapple">
                        </div>
                        <div class="detail-box">
                            <h4>Pineapple</h4>
                            <h6 class="price">
                                <span class="new_price">$6.50</span>
                            </h6>
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-basket" aria-hidden="true"></i> Add To Cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-box">
                <a href="#">View More Fruits</a>
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
