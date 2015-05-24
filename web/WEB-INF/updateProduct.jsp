<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- page wrapper -->
<div id="wrapper">
    <html>
        <head>
            <!-- title and shortcut icon -->
            <title>Ohana Family&trade; Arcades</title>
            <link rel="icon" type="image/x-icon" href="/favicon.ico"/>
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
            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <a href="/Home"><img class="loggedInLogo" src="images/other/OFA-logo.png"/></a>
                    </c:when>
                    <c:otherwise>
                    <a href="/Home"><img class="logo" src="images/other/OFA-logo.png"/></a>
                    </c:otherwise>
                </c:choose>
            <!-- site navigation bar -->
            <nav>
                <ul>
                    <li><a href="/Home">Home</a></li>
                    <li><a href="/About">About</a></li>
                    <li><a href="/Products">Products</a></li>
                    <li><a href="/Contact">Contact</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.user.username != null}">
                                <c:choose>
                                    <c:when test="${sessionScope.user.username == 'admin'}">
                                    <li><a href="/Admin">Admin</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="/Account">Account</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li><a href="/Logout">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="/LoginMain">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </nav>
            <!-- page content -->
            <div class="boxdeco">
                <h1 class="center" style="color: darkorange">Update Product</h1>
                <div class="contact">
                    <form action="/UpdateProduct" enctype="multipart/form-data" method="post">
                        <fieldset>
                            <h3>${flash}</h3>
                            <label for="id"><font color="red">*</font> Product Id:</label>
                            <input type=text" name="id" value="${requestScope.prod.id}" placeholder="" readonly/></br>          

                            <label for="description"><font color="red">*</font> Description:</label>
                            <input type="text" name="description" value="${requestScope.prod.description}" placeholder=" description"required/></br>  

                            <label for="content"><font color="red">*</font> Content:</label>
                            <input type="text" name="content" value="${requestScope.prod.content}" placeholder=" content"required/></br>

                            <label for="PaypalValue"><font color="red">*</font> PayPal Value:</label>
                            <input type="text" name="paypalValue" value="${requestScope.prod.paypalvalue}" placeholder=" paypal value"required/></br>

                            <label for="feature1"><font color="red">*</font> Feature 1:</label>
                            <input type="text" name="feature1" value="${requestScope.prod.feature1}" placeholder=" feature 1"required/></br>

                            <label for="feature2"> Feature 2:</label>
                            <input type="text" name="feature2" value="${requestScope.prod.feature2}" placeholder=" feature 2"/></br>

                            <label for="feature3"> Feature 3:</label>
                            <input type="text" name="feature3" value="${requestScope.prod.feature3}" placeholder=" feature 3"/></br>

                            <label for="dimensions"><font color="red">*</font> Dimensions:</label>
                            <input type="text" name="dimensions" value="${requestScope.prod.dimensions}" placeholder=" dimensions"required/></br>

                            <label for="price"><font color="red">*</font> Price:</label>
                            <input type="text" name="price" value="${requestScope.prod.price}" placeholder=" price"/></br>

                            <label for="prodType"><font color="red">*</font> Product Type:</label>
                            <!-- product type down down menu -->                    
                            <select name="prodType">
                                <option>button</option>
                                <option>joystick</option>
                                <option>gameBoards</option>
                                <option>cabinetParts</option>
                                <option>arcades</option>
                            </select></br>
                            <!-- picture file select -->
                            <label for="picture"><font color="red">*</font> Picture:</label>
                            <input type="file" name="picture" value="" /></br></br></br>

                            <input type="submit" value="Update Product" class="button"></br>

                            <p style="color: red" align="left">* Required</p>
                        </fieldset>
                    </form>
                </div>
            </div>
</div>
<!-- footer content -->
<div id="ft">
    <div>
        <div style="float: left">
            <a href="/Terms">Terms</a>
            <a href="/Policies">Policies</a>
            <a href="/Warranty">Warranty</a>
        </div>
        <a style="color: white">Ohana Family&trade; Arcades - More Fun...Less Money!</a>
        <div style="float: right">
            <a href="/Returns">Returns</a>
            <a href="/Contact">Contact Us</a>
            <a href="/Careers">Careers</a>
        </div>
    </div>
</div>
</body>
</html>
