<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="wrapper">
    <html>
        <head>
            <title>Ohana Family&reg; Arcades</title>
            <link rel="shortcut icon" href="images/Ohana Family Arcades v1.0_00_trans.png"/>


            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
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

        <link rel="stylesheet" type="text/css" href="styles/main.css">
        </head>
        <body>
            <img class="center" src="images/Ohana Family Arcades v1.0_00_trans.png" alt="" /></br>
            <p class="center">Quality Made to Order Arcades at a fraction of the 
                cost!</p></br>
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
                                    <li><a href="admin.jsp">Admin</a></li>
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
            <div class="boxdeco">
                <h1 class="center" style="color: darkorange">Policies</h1>
                
                <h3 class="center">Privacy Policy</h3>
                <p class="terms">Ohana Family Arcades has created this privacy statement in order 
                    to demonstrate our firm commitment to privacy. The following discloses our 
                    information gathering and dissemination practices for this website: ohanafamilyarcades.com. 
                    We use your IP address to help diagnose problems with our server to administer 
                    and track our Web site.</p>
                
                <p class="terms">This site may contain links to other sites. Ohana Family Arcades is not 
                    responsible for the privacy practices or the content of such Web sites. Our forums may 
                    collect and store names and email addresses in cookies on user's browsers. Other services 
                    may also collect email address information, but this is optional and not distributed.</p>

                <h3 class="center">Security</h3>
                <p class="terms">This site has security measures in place to protect the loss, misuse, and 
                    alteration of the information under our control. Order information such as name, address, 
                    and credit card numbers will only be shared with our partners as required to process your 
                    order. Contact the Web Site if you have any questions about this privacy statement or the 
                    practices of this site. You can email: webmaster@ohanafamilyarcades.com</p>
            </div>
            <div id="ft">
                <div>
                    <a href="/Ohana/Terms">Terms</a>
                    <a href="/Ohana/Policies">Policies</a>
                    <a href="/Ohana/Warranty">Warranty</a>
                    Ohana Family Arcades - Quality Made to Order Arcades at a 
                    fraction of the cost!
                    <a href="/Ohana/Returns">Returns</a>
                    <a href="/Ohana/Contact">Contact Us</a>
                    <a href="/Ohana/Careers">Careers</a>                    
                </div>
            </div>
        </body>
    </html>
</div>