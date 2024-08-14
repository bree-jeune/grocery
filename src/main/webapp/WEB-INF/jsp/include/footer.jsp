<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<body>

<div class="footer" style="background-image: url('${pageContext.request.contextPath}/resources/images/footer-bg.jpg'); background-size: cover; color: white; padding: 20px; text-align: center;">
    <p style="font-size: 1.25rem; margin-bottom: 20px;">&copy; 2024 Grocery Store. All rights reserved.</p>

    <ul class="footer-nav" style="list-style: none; padding: 0; margin-bottom: 20px;">
        <li style="display: inline; margin-right: 15px;"><a href="${pageContext.request.contextPath}/about" style="color: white; text-decoration: none;">About Us</a></li>
        <li style="display: inline; margin-right: 15px;"><a href="${pageContext.request.contextPath}/privacy" style="color: white; text-decoration: none;">Privacy Policy</a></li>
        <li style="display: inline; margin-right: 15px;"><a href="${pageContext.request.contextPath}/terms" style="color: white; text-decoration: none;">Terms of Service</a></li>
        <li style="display: inline; margin-right: 15px;"><a href="${pageContext.request.contextPath}/contact" style="color: white; text-decoration: none;">Contact Us</a></li>
    </ul>

    <div class="store-info" style="margin-bottom: 20px;">
        <p style="margin: 5px 0;">123 Grocery Lane, Las Vegas, NV 89109</p>
        <p style="margin: 5px 0;">Phone: (702) 123-4567</p>
        <p style="margin: 5px 0;">Email: info@grocerystore.com</p>
        <p style="margin: 5px 0;">Hours: Mon-Sat 8:00 AM - 9:00 PM</p>
    </div>

    <div class="map" style="margin-bottom: 20px;">
        <iframe src="https://www.google.com/maps/embed?pb=...your-store-location..." width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>

    <div class="social-icons" style="margin-bottom: 20px;">
        <a href="https://facebook.com/yourstore" target="_blank" style="margin-right: 10px;"><img src="${pageContext.request.contextPath}/resources/images/facebook-icon.png" alt="Facebook" style="width: 30px;"></a>
        <a href="https://twitter.com/yourstore" target="_blank" style="margin-right: 10px;"><img src="${pageContext.request.contextPath}/resources/images/twitter-icon.png" alt="Twitter" style="width: 30px;"></a>
        <a href="https://instagram.com/yourstore" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/instagram-icon.png" alt="Instagram" style="width: 30px;"></a>
    </div>

    <div class="testimonials" style="margin-bottom: 20px; font-style: italic;">
        <p style="margin: 5px 0;">"Best grocery shopping experience ever!" - Jane D.</p>
        <p style="margin: 5px 0;">"Always fresh and great service." - John S.</p>
        <p style="margin: 5px 0;">"I love their organic selection!" - Emily R.</p>
    </div>

    <form action="${pageContext.request.contextPath}/subscribe" method="POST" style="margin-bottom: 20px;">
        <label for="email" style="display: block; margin-bottom: 10px;">Subscribe to our newsletter to stay updated about our savings:</label>
        <input type="email" name="email" id="email" placeholder="Enter your email" style="padding: 10px; width: 250px; border-radius: 5px; border: none; margin-bottom: 10px;">
        <button type="submit" style="padding: 10px 20px; background-color: #ffc107; border: none; border-radius: 5px; color: #000;">Subscribe</button>
    </form>

    <button id="back-to-top" class="back-to-top" style="padding: 10px 20px; background-color: #ffc107; border: none; border-radius: 5px; color: #000;">Back to Top</button>
</div>

<script>
    document.getElementById('back-to-top').addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>

</body>
</html>
