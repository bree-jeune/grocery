<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
<h2>Search Results for "${query}"</h2>
<c:forEach var="product" items="${searchResults}">
    <div>
        <h3>${product.productTitle}</h3>
        <p>${product.productDescription}</p>
        <p>Price: $${product.productPricePerItem}</p>
    </div>
</c:forEach>
</body>
</html>
