<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
        <div class="login"join>
            <form method="post" action="/Ohana/Register">
                <fieldset>
                    <legend>Register</legend>
                    <h3>${flash}</h3>
                    <label for="username"><font color="red">*</font> Username:</label>
                    <input type="text" value="" placeholder=" username"required/></br>  
                    Username must be between 4-8 characters</br>
                    <label for="password"><font color="red">*</font> Password:</label>
                    <input type="password" value="" placeholder=" password"required/></br>
                    Password must be between 4-8 characters</br>
                    <label for="password2"><font color="red">*</font> Confirm Password:</label>
                    <input type="password" value="" placeholder=" confirm password"required/></br>
                    <label for="email"><font color="red">*</font> Email:</label>
                    <input type="email" value="" placeholder=" example@mail.com"required/></br>
                    <label for="firstname"><font color="red">*</font> First Name:</label>
                    <input type="text" value="" placeholder=" John"required/></br>
                    <label for="lastname"><font color="red">*</font> Last Name:</label>
                    <input type="text" value="" placeholder=" Doe"required/></br>
                    <label for="address"><font color="red">*</font> Address:</label>
                    <input type="text" value="" placeholder=" 12345 General Drive"required/></br>
                    <label for="address2">Address 2:</label>
                    <input type="text" value="" placeholder=" Apt. 1234"/></br>
                    <label for="city"><font color="red">*</font> City:</label>
                    <input type="text" value="" placeholder=" Dallas"required/></br>
                    <label for="state1"><font color="red">*</font> State:</label>
                    <input type="text" value="" placeholder=" TX"required/></br>
                    <label for="zipcode"><font color="red">*</font> Zip Code:</label>
                    <input type="text" value="" placeholder=" 75205"required/></br>
                    <label for="phone">Phone #:</label>
                    <input type="text" value="" placeholder=" 512-123-4567"required/></br>
                    <label for="secquestion"><font color="red">*</font> Security Question:</label>
                    <input type="text" value="" placeholder=" What is you mother's maiden name?"required/></br>
                    <label for="secanswer"><font color="red">*</font> Security Answer:</label>
                    <input type="password" value="" placeholder=" Security Answer"required/></br>
                    <input type="submit" value="Register" class="button"></br>
                    <p style="color: red" align="left">* Required</p>
                </fieldset>
            </form>
        </div>
        <div id="ft">
            <div>Ohana Family Arcades - Quality Made to Order Arcades at a 
                fraction of the cost!</div>
        </div>
    </body>
</html>
