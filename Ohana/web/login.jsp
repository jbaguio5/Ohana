<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
        <div class="login">
            <form action="index?action=login">
                <fieldset class="contact">
                    <legend>&#9733</legend>
                    <label for="username">Username:</label>
                    <input type="text" value="" placeholder=" username"required/></br>       
                    <label for="password">Password:</label>
                    <input type="password" value="" placeholder=" password"required/></br>
                    <div class="regforgot">
                        <input type="submit" value="Login" class="button">
                    </div>
                    <div class="regforgot">
                        <a href="join.jsp" style="float: left">Register</a>
                        <a href="forgot.jsp"style="float: right">I forgot my password!</a>
                    </div>
                </fieldset>
            </form>
        </div>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>
