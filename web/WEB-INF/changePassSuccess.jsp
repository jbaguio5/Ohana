<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<!-- title and shortcut icon -->
        <title>Ohana Family&trade; Arcades</title>
        <link rel="icon" type="image/x-icon" href="/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
        <META http-equiv="refresh" content="5;URL=/LoginMain">
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
<!-- flash message and page content -->        
        <h1 class="center" style="color: green">${flash}</h3></br>
        <p class="center">You will be re-directed to the login page in 5 seconds...</p>
<!-- footer content -->
        <div id="ft">
            <div>
                <div style="float: left">
                    <a href="/Terms">Terms</a>
                    <a href="/Policies">Policies</a>
                    <a href="/Warranty">Warranty</a>
                </div>
                <a style="color: white">Ohana Family&trade; Arcades - More Fun...Less Money!</a>
                <div style="float: right">
                    <a href="/Returns">Returns</a>
                    <a href="/Contact">Contact Us</a>
                    <a href="/Careers">Careers</a>
                </div>
            </div>
        </div>
</body>
</html>