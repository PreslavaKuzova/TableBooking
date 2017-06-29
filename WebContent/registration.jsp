<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body
	background="http://molinarealcelebraciones.com/wp-content/uploads/2016/12/Molina-Real-tambi%C3%A9n-para-cenas-y-comidas-de-empresa-1920.jpg">
<head>
<link rel="stylesheet" type="text/css"
	href="CSS/registrationjsp-design.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

	<div class="buttons">
		<form action="index.html">
			<input class="button" type="submit" value="HOME" />
		</form>

		<form action="login.html">
			<input class="button" type="submit" value="BOOK A TABLE" />
		</form>

		<form action="registration.html">
			<input class="button" type="submit" value="SIGN UP" disabled />
		</form>
	</div>

	<div class="wrapper">
		<jsp:useBean id="database" class="com.database.UserDatabase" />

		<%
			String usernameAlreadyBeentaken = "Sorry, the username has already been taken!";
			String invalidPassword = "Sorry, the passwords you entered don't match!";
			String successfulRegistration = ", you registered successfully!";
		%>

		<%
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String passwordConf = request.getParameter("password-conf");
		%>

		<p class="feedback">
			<%
				if (password.equals(passwordConf)) {
					if (database.checkNames(username)) {
						out.print(usernameAlreadyBeentaken);
					} else {
						database.insertData(username, email, password);
						out.print(username + successfulRegistration);
					}
				} else {
					out.print(invalidPassword);
				}
			%>
		</p>
	</div>

</body>
</html>