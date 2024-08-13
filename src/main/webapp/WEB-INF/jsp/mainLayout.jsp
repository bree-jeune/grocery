<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${pageTitle != null ? pageTitle : 'The Neighborhood Nook | Grocery Store'}</title>

    <!-- CSS Links -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <!-- Additional Head Content -->
    <jsp:include page="${pageContext.request.contextPath}/include/head.jsp"/>
</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="content">
    <jsp:include page="${pageContent}"/>
</div>

<%@ include file="include/footer.jsp" %>

<!-- JavaScript Links -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<!-- Additional Scripts -->
<jsp:include page="${pageContext.request.contextPath}/include/scripts.jsp"/>
</body>
</html>




<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<jsp:include page="include/header.jsp" />--%>
<%--<jsp:include page="include/footer.jsp" />--%>

