<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<!-- title and shortcut icon -->
        <title>Ohana Family&trade; Arcades</title>
        <link rel="icon" type="image/x-icon" href="/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
        <meta name="viewport" content="width=1250px, initial-scale=0.50" />
    </head>
    <body>
<!-- company logo and motto -->
        <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <a href="/Home"><img class="loggedInLogo" src="images/other/OFA-logo.png"/></a>
                    </c:when>
                    <c:otherwise>
                    <a href="/Home"><img class="logo" src="images/other/OFA-logo.png"/></a>
                    </c:otherwise>
                </c:choose>
<!-- flash message --></br>
        <h1 style="text-align: center; color: green; font-size: 70px; line-height: 10px;">Thank You!</h3></br>
        <h1  style="text-align: center; color: green; font-size: 70px; line-height: 10px;">Sean Gilkey and Norman Richards</h1></br></br></br></br>
        <h1 style="text-align: center">Any Questions?</h1>
</body>
</html>