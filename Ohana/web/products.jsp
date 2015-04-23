<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <li><a href="/Arcades/product">Products</a></li>
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
        <c:forEach var="products" items="${AllProducts}">
            <div class="proddisp">
                <img class="imgdisp" src="images/lpb-purple.jpg"alt=""/></br>
                <a href="product?action=product=${products.description}">
                    ${products.description}</a>
            </div>
        </c:forEach>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>
