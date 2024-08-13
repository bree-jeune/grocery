<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> c

<jsp:include page="../include/header.jsp"/>

<section style="background-color:gray">
    <div class="container">
        <div class="row pt-5 pb-5">
            <h1 class="text-center">Enter Credentials</h1>
        </div>
    </div>
</section>

<section>
    <sec:authentication property="principal.username"/>
    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
        <p>Admin Panel</p>
    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <p>Welcome, <sec:authentication property="principal.username"/></p>
    </sec:authorize>
</section>


<section>
    <div class="container">
        <c:if test="${param['error'] eq ''}">
            <div class="row pt-5 justify-content-center">
                <div class="col-6">
                    <div class="alert alert-danger" role="alert">Invalid Username or Password</div>
                </div>
            </div>
        </c:if>


        <div class="row pt-5 ">
            <div class="col-12">
                <form action="/account/loginProcessingURL" method="post">

                    <div class="row align-items-center justify-content-center">
                        <div class="col-2">
                            <label for="usernameId" class="col-form-label">Email</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="usernameId" name="username" class="form-control <c:if test="${bindingResult.hasFieldErrors('email')}">is-invalid</c:if>"
                                   value="${form.email}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('email')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>


                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="passwordId" class="col-form-label">Password</label>
                        </div>
                        <div class="col-4">
                            <input type="text"
                                   id="passwordId"
                                   name="password"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                                   value="${form.password}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('password')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div style="color:red">
                                    <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="row justify-content-center pt-3 ">
                        <div class="col-auto text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>