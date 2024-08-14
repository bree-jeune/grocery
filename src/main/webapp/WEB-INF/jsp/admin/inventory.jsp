<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Management - The Neighborhood Nook</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/dashboard.css" rel="stylesheet">
    <style>
        .inventory-table {
            margin-top: 20px;
        }
        .inventory-table th, .inventory-table td {
            text-align: center;
        }
        .alert-low-stock {
            background-color: #ffcccc;
        }
        .alert-expiration {
            background-color: #ffe6cc;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4">Inventory Management</h2>

    <!-- Search and Filter -->
    <div class="row mb-3">
        <div class="col-md-4">
            <input type="text" class="form-control" placeholder="Search by product name or category...">
        </div>
        <div class="col-md-4">
            <select class="form-control">
                <option value="">Filter by Category</option>
                <option value="Dairy">Dairy</option>
                <option value="Bakery">Bakery</option>
                <option value="Produce">Produce</option>
                <!-- Add more categories as needed -->
            </select>
        </div>
        <div class="col-md-4 text-right">
            <button class="btn btn-primary">Add New Product</button>
        </div>
    </div>

    <!-- Inventory Table -->
    <table class="table table-striped table-bordered inventory-table">
        <thead>
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Stock</th>
            <th>Reorder Level</th>
            <th>Expiration Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr class="<c:if test='${product.stock le product.reorderLevel}'>alert-low-stock</c:if>
          <c:if test='${product.expirationDate le currentDate}'>alert-expiration</c:if>">
                <td>${product.productCode}</td>
                <td>${product.productName}</td>
                <td>${product.category}</td>
                <td>${product.stock}</td>
                <td>${product.reorderLevel}</td>
                <td>${product.expirationDate}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/inventory/edit?productCode=${product.productCode}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="${pageContext.request.contextPath}/admin/inventory/delete?productCode=${product.productCode}" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination (Optional) -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>

</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
