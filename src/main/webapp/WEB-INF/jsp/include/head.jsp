<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Your grocery store for fresh produce and quality goods">
<meta name="keywords" content="grocery, fresh produce, quality goods, shopping">
<meta name="author" content="The Neighborhood Nook">

<!-- Title -->
<title>${pageTitle != null ? pageTitle : 'The Neighborhood Nook | Grocery Store'}</title>

<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">

<!-- CSS Links -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<!-- Optional JS  -->
<!-- <script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script> -->

<!-- Page-Specific Styles or Scripts (Placeholder) -->
<c:if test="${pageSpecificStyles != null}">
    <style>
        ${pageSpecificStyles}
    </style>
</c:if>

<c:if test="${pageSpecificScripts != null}">
    <script>
        ${pageSpecificScripts}
    </script>
</c:if>
