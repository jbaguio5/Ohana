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
                    <!-- veiwcart button and logged in user display -->
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
        <script type="text/javascript">
            var gamesA = new Array(); // create new array to preload images
            gamesA[0] = new Image(); // create new instance of image object
            gamesA[0].src = "images/Gallery/mspacgalaga.png"; // set image src property to image path, preloading image in the process
            gamesA[1] = new Image();
            gamesA[1].src = "images/Gallery/pacburger.png";
            gamesA[2] = new Image();
            gamesA[2].src = "images/Gallery/galaxinvad.png";
            gamesA[3] = new Image();
            gamesA[3].src = "images/Gallery/centimilli.png";

            var mainPic = new Array();
            mainPic[0] = new Image();
            mainPic[0].src = "images/Gallery/ArcadeFront.png";
    
            var gamesB = new Array();
            gamesB[0] = new Image();
            gamesB[0].src = "images/Gallery/dkdkjr.png";
            gamesB[1] = new Image();
            gamesB[1].src = "images/Gallery/dk3dig.png";
            gamesB[2] = new Image();
            gamesB[2].src = "images/Gallery/1942gal3.png";
            gamesB[3] = new Image();
            gamesB[3].src = "images/Gallery/pinbreak.png";
        </script>
        </head>
        <body>
<!-- company logo and motto-->
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
            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <!-- user welcome -->
                    <h2 class="welcome">Welcome ${sessionScope.user.firstname}</h2>
                </c:when>
            </c:choose>
            <!-- flash message -->
            <h3>${flash}</h3>
<!-- page content -->
            <div class="boxdeco">
                <!-- website welcome info -->
                <div>
                    <p class="center">Welcome to Ohana Family&trade; Arcades</p>
                    <p class="center">We offer fully built arcades as well as parts needed 
                        for your own build!</p></br>
                </div>
     <!-- picture slideshow -->
                <div>
                    <img style="float: left" src="images/Gallery/mspacgalaga.png" id="a" width="193" height="500" />
                    <script type="text/javascript">
                        //variable that will increment through the images
                        var stepA = 0;
                        function slideitA() {
                            //if browser does not support the image object, exit.
                            if (!document.images)
                                return;
                            document.getElementById('a').src = gamesA[stepA].src;
                            if (stepA < 3)
                                stepA++;
                            else
                                stepA = 0;
                            //call function "slideit()" every 2.5 seconds
                            setTimeout("slideitA()", 2500);
                        }
                        slideitA();
                    </script>
                    <img style="margin-left: 1.5em" src="images/Gallery/ArcadeFront.png" width="500" height="500" />
                    <img style="float: right" src="images/Gallery/balltop---joystick.png" id="b" width="193" height="500" />
                    <script type="text/javascript">
                        //variable that will increment through the images
                        var stepB = 0;
                        function slideitB() {
                            //if browser does not support the image object, exit.
                            if (!document.images)
                                return;
                            document.getElementById('b').src = gamesB[stepB].src;
                            if (stepB < 3)
                                stepB++;
                            else
                                stepB = 0;
                            //call function "slideit()" every 2.5 seconds
                            setTimeout("slideitB()", 2500);
                        }
                        slideitB();
                    </script>
                </div>
                <!-- register link -->
                <div style="margin-top: 3em">
                    <a href="/Ohana/Join"><img class="center" src="images/other/Sign-Up-Today.png"/></a></br>
                </div>
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