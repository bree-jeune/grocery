<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="news, article, updates" />
    <meta name="description" content="Latest news and updates from The Neighborhood Nook." />

    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resource/images/favicon.png" type="image/x-icon">
    <title>News Article | The Neighborhood Nook</title>

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />
    <link href="<%= request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">

<%@ include file="include/header.jsp" %>

<section class="news_article_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>Latest Updates</h2>
        </div>
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="article_box">
                    <div class="article_header">
                        <h3>Article Title Goes Here</h3>
                        <p><strong>By Author Name</strong> | <em>Published on 11 Feb 2021</em></p>
                    </div>
                    <div class="article_image">
                        <img src="<%= request.getContextPath() %>/resource/images/placeholder.png" alt="Article Image">
                    </div>
                    <div class="article_content">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                        </p>
                        <p>
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                        <p>
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Nulla quis lorem ut libero malesuada feugiat.
                        </p>
                        <p>
                            Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                        </p>
                    </div>
                    <div class="article_footer">
                        <a href="<%= request.getContextPath() %>/blog.jsp" class="btn btn-secondary">Back to Blog</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="include/footer.jsp" %>

<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/js/custom.js"></script>
</body>

</html>
