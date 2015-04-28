<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ohana Family&reg; Arcades</title>
        <link rel="shortcut icon" href="images/Ohana Family Arcades v1.0_00_trans.png"/>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <img class="center" src="images/Ohana Family Arcades v1.0_00_trans.png" alt="" /></br>
        <p class="center">Quality Made to Order Arcades at
            a fraction of the cost!</p></br>
        <h3>${flash}</h3>
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
    </nav>
    <div id="ft">
        <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
            fraction of the cost!</div>
    </div>
</body>
</html>