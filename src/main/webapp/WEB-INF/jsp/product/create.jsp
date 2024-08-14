<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<jsp:include page="../include/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create or Edit Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}..resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}..resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Create or Edit Product</h1>
    <form:form modelAttribute="form" method="post" action="${pageContext.request.contextPath}/product/create">
        <div class="form-group">
            <form:label path="name">Product Name</form:label>
            <form:input path="name" class="form-control" />
            <form:errors path="name" class="text-danger" />
        </div>
        <div class="form-group">
            <form:label path="description">Description</form:label>
            <form:textarea path="description" class="form-control" />
            <form:errors path="description" class="text-danger" />
        </div>
        <div class="form-group">
            <form:label path="price">Price</form:label>
            <form:input path="price" class="form-control" />
            <form:errors path="price" class="text-danger" />
        </div>
        <div class="form-group">
            <form:label path="imageUrl">Image URL</form:label>
            <form:input path="imageUrl" class="form-control" />
            <form:errors path="imageUrl" class="text-danger" />
        </div>
        <div class="form-group">
            <form:label path="ripe">Is Ripe</form:label>
            <form:checkbox path="ripe" class="form-control" />
        </div>
        <div class="form-group">
            <form:label path="radio">Category</form:label>
            <form:radiobuttons path="radio" items="${categories}" class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>
