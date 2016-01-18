<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PKASSO | Login</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="<c:url value="/resources/images/logo4.png"/>">
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="login"  method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="username" class="form-control" placeholder="Email address" name="username" required autofocus>
                <input type="password" id="password" class="form-control" placeholder="Password" name="password" required>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" name="submit">Sign in</button>
            </form>
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
<%@include file="footer.jsp" %>
</body>
</html>