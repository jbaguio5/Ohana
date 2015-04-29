<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
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
        <c:forEach var="products" items="${AllProducts}">    
            <div class="proddisp">
                <img class="imgdisp" src="/Ohana/ImageServlet?id=${products.id}">
                <div class="larger">
                    <a href="ProductDisplay.jsp?${products.description}">
                    ${products.description}</a>
                </div>
                <div class="prodcontent">
                        ${products.content}
                    </div>
                <ul class="prodfeatures">
                        <c:choose>
                            <c:when test="${products.feature1 != null}">
                                <li>${products.feature1}</li>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${products.feature2 != null}">
                                <li>${products.feature2}</li>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${products.feature1 != null}">
                                <li>${products.feature3}</li>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${products.dimensions != null}">
                                <li>Dimensions - ${products.dimensions}</li>
                                </c:when>
                            </c:choose>
                    </ul>

                <form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="hosted_button_id" value="${products.paypalvalue}">
                    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <a style="float: right">Price: $${products.price}</a>
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form>
            </div>
        </c:forEach>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>
