<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Product List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <style>
        /* Custom inline styles */
        h1 {
            color: #4CAF50; /* Green color to match your site theme */
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .table thead th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }

        .btn-primary:hover {
            background-color: #45a049;
            border-color: #45a049;
        }

        .btn-secondary {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #e0a800;
            border-color: #e0a800;
        }

        .container {
            margin-top: 30px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        /* Add some padding to the cells */
        td, th {
            padding: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Product List</h1>
    <div class="text-right mb-3">
        <a href="${pageContext.request.contextPath}/product/create" class="btn btn-primary">Add New Product</a>
    </div>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.productTitle}</td>
                <td>${product.productDescription}</td>
                <td>${product.productPricePerItem}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/product/edit?id=${product.id}" class="btn btn-secondary">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="container">
    <h1>Products in Category</h1>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.productTitle}</td>
                <td>${product.productDescription}</td>
                <td>${product.productPricePerItem}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
