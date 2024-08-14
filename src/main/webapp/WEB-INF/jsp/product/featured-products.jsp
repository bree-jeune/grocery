<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<section class="featured_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>Featured Products</h2>
        </div>
        <div class="row">
            <c:forEach items="${featuredProducts}" var="product">
                <div class="col-md-4">
                    <div class="product-box">
                        <img src="${pageContext.request.contextPath}/images/${product.image}" alt="${product.name}">
                        <h4>${product.name}</h4>
                        <p>${product.description}</p>
                        <p>$${product.price}</p>
                        <a href="${pageContext.request.contextPath}/product/details?id=${product.id}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
