<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .error-container {
            text-align: center;
            max-width: 600px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .error-container h1 {
            font-size: 72px;
            margin-bottom: 10px;
            color: #ff6b6b;
        }

        .error-container h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #ffa502;
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
    <h1>404</h1>
    <h2>Oops! We can't find that page.</h2>
    <img src="${pageContext.request.contextPath}resources/images/empty-cart.png" alt="Empty Cart">
    <p>It looks like the page you were looking for is out of stock, just like that item in your cart last week!</p>
    <a href="${pageContext.request.contextPath}/">Back to Home</a>
</div>
</body>

</html>
