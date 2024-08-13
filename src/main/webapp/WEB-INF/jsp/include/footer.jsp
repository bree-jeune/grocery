<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<body>

<div class="footer" style="background-image: url('${pageContext.request.contextPath}/resources/images/footer-bg.jpg'); background-size: cover; color: white;">>
    <p>&copy; 2024 Grocery Store. All rights reserved.</p>

    <ul class="footer-nav">
        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
        <li><a href="${pageContext.request.contextPath}/privacy">Privacy Policy</a></li>
        <li><a href="${pageContext.request.contextPath}/terms">Terms of Service</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
    </ul>

    <div class="store-info">
        <p>123 Grocery Lane, Food City, FC 45678</p>
        <p>Phone: (123) 456-7890</p>
        <p>Email: info@grocerystore.com</p>
        <p>Hours: Mon-Sat 8:00 AM - 9:00 PM</p>
    </div>

    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=...your-store-location..." width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>

    <div class="social-icons">
        <a href="https://facebook.com/yourstore" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/facebook-icon.png" alt="Facebook"></a>
        <a href="https://twitter.com/yourstore" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/twitter-icon.png" alt="Twitter"></a>
        <a href="https://instagram.com/yourstore" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/instagram-icon.png" alt="Instagram"></a>
    </div>


    <div class="testimonials">
        <p>"Best grocery shopping experience ever!" - Jane D.</p>
        <p>"Always fresh and great service." - John S.</p>
        <p>"I love their organic selection!" - Emily R.</p>
    </div>




    <form action="${pageContext.request.contextPath}/subscribe" method="POST">
        <label for="email">Subscribe to our newsletter to stay updated about our savings:</label>
        <input type="email" name="email" id="email" placeholder="Enter your email">
        <button type="submit">Subscribe</button>
    </form>

    <button id="back-to-top" class="back-to-top">Back to Top</button>
</div>

<script>
    document.getElementById('back-to-top').addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>


</body>
</html>