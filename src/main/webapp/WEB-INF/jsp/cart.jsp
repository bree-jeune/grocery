<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

<sec:authorize access="isAuthenticated()">
    <div class="container cart-container">
        <div class="cart-header">Your Shopping Cart</div>
        <c:if test="${not empty cartItems}">
            <div class="row">
                <div class="col-12">
                    <c:forEach var="item" items="${cartItems}">
                        <div class="row cart-item">
                            <div class="col-md-2">
                                <img src="${item.product.imageUrl}" alt="${item.product.name}">
                            </div>
                            <div class="col-md-4 item-details">
                                <h5>${item.product.name}</h5>
                                <p>${item.product.description}</p>
                            </div>
                            <div class="col-md-2">
                                <form action="${pageContext.request.contextPath}/cart/update" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <input type="number" name="quantity" value="${item.quantity}" class="form-control item-quantity" min="1">
                                    <button type="submit" class="btn btn-primary mt-2">Update</button>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <p class="item-price">$${item.product.price}</p>
                            </div>
                            <div class="col-md-2">
                                <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <button type="submit" class="btn btn-link btn-remove">Remove</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="cart-summary">
                Total: $${cartTotal}
            </div>
            <div class="text-right mt-4">
                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success">Proceed to Checkout</a>
            </div>
        </c:if>
        <c:if test="${empty cartItems}">
            <p>Your cart is empty.</p>
            <a href="${pageContext.request.contextPath}/product/list" class="btn btn-primary">Continue Shopping</a>
        </c:if>
    </div>
</sec:authorize>

<sec:authorize access="!isAuthenticated()">
    <div class="container cart-container">
        <p>You need to <a href="${pageContext.request.contextPath}/login">login</a> to view your cart.</p>
    </div>
</sec:authorize>

</body>
</html>
