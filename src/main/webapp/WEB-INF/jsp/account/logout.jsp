<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout - The Neighborhood Nook</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/logout.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <!-- Illustration -->
                <div class="card-header text-center">
                    <h3>Goodbye!</h3>
                </div>
                <div class="card-body text-center">
                    <p>You have successfully logged out.</p>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-primary mt-3">Login Again</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
