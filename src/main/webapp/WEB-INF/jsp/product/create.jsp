<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../include/header.jsp"/>

<h1 class="page-title">This is a create product page</h1>

<div class="container">
    <form:form method="post" action="/product/createSubmit" modelAttribute="form">
        <form:hidden path="id"/>
    </form:form>


    <div class="row pt-5">
            <div class="col-6">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <form:input path="name" class="form-control" id="name"/>
                    <form:errors path="name" cssClass="text-danger"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <form:textarea path="description" class="form-control" id="description"/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <form:input path="price" class="form-control" id="price" type="number" step="0.01"/>
                    <form:errors path="price" cssClass="text-danger"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="imageUrl" class="form-label">Image URL</label>
                    <form:input path="imageUrl" class="form-control" id="imageUrl"/>
                    <form:errors path="imageUrl" cssClass="text-danger"/>
                </div>
            </div>
        </div>

        <div class="form-check">
            <form:checkbox path="ripe" class="form-check-input" id="ripe"/>
            <label class="form-check-label" for="ripe">Is the product ripe?</label>
        </div>

        <div class="form-check">
            <form:radiobutton path="radio" value="option1" class="form-check-input" id="radioOption1"/>
            <label class="form-check-label" for="radioOption1">Option 1</label>
        </div>
        <div class="form-check">
            <form:radiobutton path="radio" value="option2" class="form-check-input" id="radioOption2"/>
            <label class="form-check-label" for="radioOption2">Option 2</label>
        </div>

        <div class="row pt-3">
            <div class="col-6">
                <button type="submit" class="btn btn-primary">Save Product</button>
                <a class="btn btn-secondary ms-3" href="/" role="button">Cancel</a>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="../include/footer.jsp"/>
