<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- page wrapper -->
<div id="wrapper">
    <html>
        <head>
<!-- title and shortcut icon -->            
            <title>Ohana Family&trade; Arcades</title>
            <link rel="icon" type="image/x-icon" href="/Ohana/favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="styles/main.css">
            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <!-- viewcart and logged in user display -->                    
                <p class="userbycart" style="color: green"> ${sessionScope.user.username}</p>
                <p class="userbycart">Logged In:</p>
                <form class="cart" target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post" >
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
                           ">
                    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_viewcart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form>
            </c:when>
        </c:choose>
        </head>
        <body>
<!-- company logo and motto -->            
            <img class="logo" src="images/other/OFA-logo.png" alt="" />
            <!-- site navigation bar -->            
            <nav>
                <ul>
                    <li><a href="/Ohana/Home">Home</a></li>
                    <li><a href="/Ohana/About">About</a></li>
                    <li><a href="/Ohana/Products">Products</a></li>
                    <li><a href="/Ohana/Contact">Contact</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.user.username != null}">
                                <c:choose>
                                    <c:when test="${sessionScope.user.username == 'admin'}">
                                    <li><a href="/Ohana/Admin">Admin</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="/Ohana/Account">Account</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li><a href="/Ohana/Logout">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="/Ohana/LoginMain">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </nav>
<!-- page content -->
            <div class="boxdeco">
                <h1 class="center" style="color: darkorange">About Us</h1>
                <h3 class="center">History</h3>
                <p class="about">In 2014, <span class="ohananame">Ohana Family&trade; Arcades</span>
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
                <p class="about"><span class="ohananame">Ohana Family&trade; Arcades</span> offers dozens of 
                    different color options, wood choices, configurations or full customization 
                    services.</p>

                <p class="about">Our video arcades meet high quality standards and each unit
                    goes through a rigorous series of tests that take several days to complete.</p>
            </div>
</div>
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