<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<!-- title and shortcut icon -->
        <title>Ohana Family&trade; Arcades</title>
        <link rel="icon" type="image/x-icon" href="/Ohana/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
        <META http-equiv="refresh" content="5;URL=/Ohana/Account">
    </head>
    <body>
<!-- company logo and motto -->
        <img class="logo" src="images/other/OFA-logo.png" alt="" />
<!-- flash message -->        
        <h1 class="center" style="color: green">${flash}</h3></br>
        <p class="center">You will be re-directed to your Account page in 5 seconds...</p>
<!-- footer content -->
        <div id="ft">
            <div>
        <div style="float: left">
            <a href="/Ohana/Terms">Terms</a>
            <a href="/Ohana/Policies">Policies</a>
            <a href="/Ohana/Warranty">Warranty</a>
        </div>
        <a style="color: white">Ohana Family&trade; Arcades - More Fun...Less Money!</a>
        <div style="float: right">
            <a href="/Ohana/Returns">Returns</a>
            <a href="/Ohana/Contact">Contact Us</a>
            <a href="/Ohana/Careers">Careers</a>
        </div>
    </div>
        </div>
</body>
</html>