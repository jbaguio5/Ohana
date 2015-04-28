<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="shortcut icon" href="images/Ohana Family Arcades v1.0_00_trans.png"/>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <img class="center" src="images/Ohana Family Arcades v1.0_00_trans.png" alt="" /></br>
        <p class="center">Quality Made to Order Arcades at a fraction of the 
            cost!</p></br>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="/Ohana/product">Products</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <c:choose>
                        <c:when test="username != null">
                        <li><a href="logout.jsp">Logout</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href="login.jsp">Login</a></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
        </nav>
        <p>${flash}</p>
        <h1 class="center">Contact Us</h1>
        <p class="center">We will try our best to respond to your question within 24-48 hours</p>
        <div class="legend">
            <form action="thankyousub.html">
                <fieldset class="contact">
                    <legend>Please enter your information and/or question(s)</legend>
                    <label for="name">Name:</label>
                    <input type="text" value="" placeholder="enter your name"required/></br>       
                    <label for="email">Email:</label>
                    <input type="email" value="" placeholder="name@domain.com"required/></br>
                    <label class="comment" for="comment">Comment:</label>         
                    <input type="text" value="" placeholder="enter your comment"required></br></br>
                    <input type="submit" value="Submit">
                </fieldset>
            </form>
        </div>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>
