<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${pageTitle != null ? pageTitle : 'The Neighborhood Nook | Grocery Store'}</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: #009900;
        }
        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #fff;
        }
        .navbar-brand:hover {
            color: #fff;
        }
        .navbar-nav .nav-link {
            color: #fff;
            margin-right: 15px;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107; /* Yellow color on hover */
        }
        .form-control {
            border-radius: 0.25rem;
            border: none;
            box-shadow: none;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(255, 193, 7, 0.8);
            border-color: #ffc107;
        }
        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: #fff;
            border-radius: 0.25rem;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            color: #fff;
        }
        .navbar-text {
            color: #fff;
        }
    </style>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Grocery Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product/list">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/order">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/cart">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/checkout">Checkout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/order/history">Order History</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a>
                </li>
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Admin Dashboard</a>
                    </li>
                </sec:authorize>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/product/search" method="GET">
                <input class="form-control mr-sm-2" type="search" placeholder="Search products" aria-label="Search" name="query">
                <button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
            </form>

            <ul class="navbar-nav">
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                    <li class="nav-item">
                        <span class="navbar-text">
                            Welcome, <sec:authentication property="principal.username"/>!
                        </span>
                    </li>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </nav>
</header>
