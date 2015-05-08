<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<!-- title and shortcut icon -->
        <title>Ohana Family&trade; Arcades</title>
        <link rel="shortcut icon" href="images/Ohana Family Arcades v1.0_00_trans.png"/>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
        <META http-equiv="refresh" content="5;URL=/Ohana/Account">
    </head>
    <body>
<!-- company logo and motto -->
        <img class="center" src="images/Ohana Family Arcades v1.0_00_trans.png" alt="" /></br>
        <p class="center">Quality Made to Order Arcades at
            a fraction of the cost!</p></br>
<!-- flash message -->        
        <h1 class="center" style="color: green">${flash}</h3></br>
        <p class="center">You will be re-directed to your Account page in 5 seconds...</p>
<!-- footer content -->
        <div id="ft">
            <div>
                <a href="/Ohana/Terms">Terms</a>
                <a href="/Ohana/Policies">Policies</a>
                <a href="/Ohana/Warranty">Warranty</a>
                Ohana Family&trade; Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!
                <a href="/Ohana/Returns">Returns</a>
                <a href="/Ohana/Contact">Contact Us</a>
                <a href="/Ohana/Careers">Careers</a>
            </div>
        </div>
</body>
</html>