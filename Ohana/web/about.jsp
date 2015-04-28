<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
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
        <h1 class="center">About Us</h1>
        <div>
            <h3 class="center">History</h3>
            <p class="about">In 2014, <span class="ohananame">Ohana Family Arcades</span>
                setup shop in the garage of our founder's home. Since that time we have 
                focused on development of low cost, high quality video arcades for home 
                or office use.</p>
            
            <h3 class="center">The Difference</h3>
            <p class="about">Unlike other arcade builders we do not build our tables
                on an assembly line.  We build our arcades one at a time in a shop. 
                Unlike our competitors we do not use PC's to run our software.  We only
                use hi-quality PCB Board loaded games.</p>
            
            <p class="about">Our arcades are 100% pre-built, all you have to do is slide 
                them into place, plug them in & start playing.</p>
            
            <h3 class="center">Customize</h3>
            <p class="about"><span class="ohananame">Ohana Family Arcades</span> offers dozens of 
                different color options, wood choices, configurations or full customization 
                services.</p>
            
            <p class="about">Our video arcades meet high quality standards and each unit
                goes through a rigorous series of tests that take several days to complete.</p>
            
            </div>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>