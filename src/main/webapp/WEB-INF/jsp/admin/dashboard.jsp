<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - The Neighborhood Nook</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/dashboard.css" rel="stylesheet">
</head>
<body>
<div class="admin-dashboard">
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Admin Dashboard</h3>
        </div>
        <ul class="list-unstyled components">
            <li class="active">
                <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/users">Users</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/products">Products</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/orders">Orders</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/inventory">Inventory</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/reports">Reports</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/settings">Settings</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </li>
        </ul>
    </nav>

    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
        </nav>

        <div class="content-area">
            <h2>Dashboard Overview</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Users</h5>
                            <p class="card-text">${totalUsers != null ? totalUsers : 0}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Products</h5>
                            <p class="card-text">${totalProducts != null ? totalProducts : 0}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Orders</h5>
                            <p class="card-text">${totalOrders != null ? totalOrders : 0}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>
