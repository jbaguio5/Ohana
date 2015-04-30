<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ohana Family&reg; Arcades</title>
        <link rel="shortcut icon" href="images/Ohana Family Arcades v1.0_00_trans.png"/>
    <p class="userbycart">${sessionScope.user.username}</p>
    <form class="cart" target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post" >
        <input type="hidden" name="cmd" value="_s-xclick">
        <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIG1QYJKoZIhvcNAQcEoIIGxjCCBsICAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYB9qRkqz8eNfZqAaXAlAHlCOWFaxjoWIS/fORYIgl4a7NimJDXKP7Xe0OBhMlRpJ+TMBG8FbGZKKVux2T7w9lBlxJaXVEr04ydA4ynlgrLhYhne74Ugnr6KSG1lRUjtMkQcGxe8sJHNSDbXH03l2O114rf5g02VkrLqOGDyhOBrUjELMAkGBSsOAwIaBQAwUwYJKoZIhvcNAQcBMBQGCCqGSIb3DQMHBAga3FpPidxjRoAwGxjj/Iikl8IKE6egElG3AKetYpXACYt5Pzn/iyvW1UdB0LyS3yOItDscIdFVK/HGoIIDhzCCA4MwggLsoAMCAQICAQAwDQYJKoZIhvcNAQEFBQAwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMB4XDTA0MDIxMzEwMTMxNVoXDTM1MDIxMzEwMTMxNVowgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBR07d/ETMS1ycjtkpkvjXZe9k+6CieLuLsPumsJ7QC1odNz3sJiCbs2wC0nLE0uLGaEtXynIgRqIddYCHx88pb5HTXv4SZeuv0Rqq4+axW9PLAAATU8w04qqjaSXgbGLP3NmohqM6bV9kZZwZLR/klDaQGo1u9uDb9lr4Yn+rBQIDAQABo4HuMIHrMB0GA1UdDgQWBBSWn3y7xm8XvVk/UtcKG+wQ1mSUazCBuwYDVR0jBIGzMIGwgBSWn3y7xm8XvVk/UtcKG+wQ1mSUa6GBlKSBkTCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb22CAQAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBXzpWmoBa5e9fo6ujionW1hUhPkOBakTr3YCDjbYfvJEiv/2P+IobhOGJr85+XHhN0v4gUkEDI8r2/rNk1m0GA8HKddvTjyGw/XqXa+LSTlDYkqI8OwR8GEYj4efEtcRpRYBxV8KxAW93YDWzFGvruKnnLbDAF6VR5w/cCMn5hzGCAZowggGWAgEBMIGUMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbQIBADAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTUwNDI5MjI1OTUwWjAjBgkqhkiG9w0BCQQxFgQULxLq0V86YH9J+iIQg4JB/gjdlvQwDQYJKoZIhvcNAQEBBQAEgYC7PKTVFDND2u0y5iGR1VM7A9WgXZwaLtncc3Sj6MsmBQ2Y6KhDclXKo4oUNM1+XVXzRaE1AxPWFi1CMuHTrhCAQTTTuDfPTPUknaZWF3/OBdUoVSuDUfjdZwvL+V4qY7XTQYq/hrhgDxUs6On28HM/lx+1gppuG2Qimz4Os3mCcA==-----END PKCS7-----
               ">
        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_viewcart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
    </form>

    <link rel="stylesheet" type="text/css" href="styles/main.css">
</head>
<body>
    <img class="center" src="images/Ohana Family Arcades v1.0_00_trans.png" alt="" /></br>
    <p class="center">Quality Made to Order Arcades at a fraction of the 
        cost!</p></br>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="/Ohana/Products">Products</a></li>
            <li><a href="contact.jsp">Contact</a></li>
                <c:choose>
                    <c:when test="${sessionScope.user.username != null}">
                    <li><a href="userAccount.jsp">Account</a></li>
                    <li><a href="/Ohana/Logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="login.jsp">Login</a></li>
                    </c:otherwise>
                </c:choose>
        </ul>
    </nav>
    <div class="login">
        <form action="/Ohana/Register" method="post">
            <fieldset>
                <legend>Register</legend>
                <h3>${flash}</h3>
                <label for="username"><font color="red">*</font> Username:</label>
                <input type="text" name="username" value="" placeholder=" username"required/></br>  
                Username must be between 4-10 characters</br>
                <label for="password"><font color="red">*</font> Password:</label>
                <input type="password" name="password" value="" placeholder=" password"required/></br>
                Password must be between 4-10 characters</br>
                <label for="password2"><font color="red">*</font> Confirm Password:</label>
                <input type="password" name="password2" value="" placeholder=" confirm password"required/></br>
                <label for="email"><font color="red">*</font> Email:</label>
                <input type="email" name="email" value="" placeholder=" example@mail.com"required/></br>
                <label for="firstname"><font color="red">*</font> First Name:</label>
                <input type="text" name="firstname" value="" placeholder=" John"required/></br>
                <label for="lastname"><font color="red">*</font> Last Name:</label>
                <input type="text" name="lastname" value="" placeholder=" Doe"required/></br>
                <label for="address"><font color="red">*</font> Address:</label>
                <input type="text" name="address" value="" placeholder=" 12345 General Drive"required/></br>
                <label for="address2">Address 2:</label>
                <input type="text" name="address2" value="" placeholder=" Apt. 1234"/></br>
                <label for="city"><font color="red">*</font> City:</label>
                <input type="text" name="city" value="" placeholder=" Dallas"required/></br>
                <label for="state1"><font color="red">*</font> State:</label>
                <input type="text" name="state1" value="" placeholder=" TX"required/></br>
                <label for="zipcode"><font color="red">*</font> Zip Code:</label>
                <input type="text" name="zipcode" value="" placeholder=" 75205"required/></br>
                <label for="phone">Phone #:</label>
                <input type="text" name="phone" value="" placeholder=" 512-123-4567"/></br>
                <label for="secquestion"><font color="red">*</font> Security Question:</label>
                <input type="text" name="secquestion" value="" placeholder=" What is you mother's maiden name?"required/></br>
                <label for="secanswer"><font color="red">*</font> Security Answer:</label>
                <input type="password" name="secanswer" value="" placeholder=" Security Answer"required/></br>
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
