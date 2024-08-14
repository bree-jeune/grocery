<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Product List</h1>
    <a href="${pageContext.request.contextPath}/product/create" class="btn btn-primary mb-3">Add New Product</a>
    <table class="table table-striped">
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
    <table class="table table-striped">
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
</body>
</html>
