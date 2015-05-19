<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
<!-- title and shortcut icon -->        
        <title>Ohana Family&trade; Arcades</title>
        <link rel="icon" type="image/x-icon" href="/Ohana/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
    </head>
    <body>
<!-- company logo and motto -->        
        <img class="logo" src="images/other/OFA-logo.png" alt="" />
<!-- page content -->        
        <div class="login">
            <form action="/Ohana/AddProduct" enctype="multipart/form-data" method="post">
                <fieldset>
                    <legend>Add Product</legend>
                    <!-- flash message -->                    
                    <h3>${flash}</h3>
                    <label for="description"><font color="red">*</font> Description:</label>
                    <input type="text" name="description" value="" placeholder=" description"required/></br>  

                    <label for="content"><font color="red">*</font> Content:</label>
                    <input type="text" name="content" value="" placeholder=" content"required/></br>

                    <label for="PaypalVale"><font color="red">*</font> PayPal Value:</label>
                    <input type="text" name="paypalValue" value="" placeholder=" paypal value"required/></br>

                    <label for="feature1"><font color="red">*</font> Feature 1:</label>
                    <input type="text" name="feature1" value="" placeholder=" feature 1"required/></br>

                    <label for="feature2"> Feature 2:</label>
                    <input type="text" name="feature2" value="" placeholder=" feature 2"/></br>

                    <label for="feature3"> Feature 3:</label>
                    <input type="text" name="feature3" value="" placeholder=" feature 3"/></br>

                    <label for="dimensions"><font color="red">*</font> Dimensions:</label>
                    <input type="text" name="dimensions" value="" placeholder=" dimensions"required/></br>

                    <label for="price"><font color="red">*</font> Price:</label>
                    <input type="text" name="price" value="" placeholder=" price"/></br>

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

                    <input type="submit" value="Add Product" class="button"></br>

                    <p style="color: red" align="left">* Required</p>
                </fieldset>
            </form>
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