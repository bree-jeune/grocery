<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Server Error</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff3cd;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #856404;
        }

        .error-container {
            text-align: center;
            max-width: 600px;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ffeeba;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .error-container h1 {
            font-size: 72px;
            margin-bottom: 10px;
            color: #dc3545;
        }

        .error-container h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #fd7e14;
        }

        .error-container p {
            font-size: 18px;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .error-container img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .error-container a {
            text-decoration: none;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .error-container a:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>
<div class="error-container">
    <h1>500</h1>
    <h2>Uh-oh! Something went wrong in our stockroom.</h2>
    <img src="${pageContext.request.contextPath}resources/images/wet-floor.png" alt="Wet Floor Sign">
    <p>It looks like something broke in our system, just like that bag of groceries that spilled on the floor!</p>
    <a href="${pageContext.request.contextPath}/">Back to Home</a>
</div>
</body>

</html>


<sec:authorize access="hasAnyAuthority('ADMIN')">
    <div style="margin-left:30px;" class="pb-5">
        <br><br>
        <c:if test="${not empty requestUrl}">
            <p>${requestUrl}</p>
        </c:if>
        <h3>Stack Trace</h3>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
        <c:if test="${not empty stackTrace}">
            <p>${stackTrace}</p>
        </c:if>
        <c:if test="${not empty rootCause}">
            <h3>Root Cause</h3>
            <p>${rootCause}</p>
        </c:if>
        <c:if test="${not empty rootTrace}">
            <p>${rootTrace}</p>
        </c:if>
    </div>
</sec:authorize>