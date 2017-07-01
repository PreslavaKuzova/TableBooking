<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body
	background="http://molinarealcelebraciones.com/wp-content/uploads/2016/12/Molina-Real-tambi%C3%A9n-para-cenas-y-comidas-de-empresa-1920.jpg">
<head>
<link rel="stylesheet" type="text/css"
	href="CSS/registration-design.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

	<div class="buttons">
		<form action="index.html">
			<input class="button" type="submit" value="HOME" />
		</form>

		<form action="login.jsp">
			<input class="button" type="submit" value="BOOK A TABLE" />
		</form>

		<form action="registration.jsp">
			<input class="button" type="submit" value="SIGN UP" disabled />
		</form>
	</div>

	<div class="wrapper">
		<h1 class="registration-text">REGISTRATION</h1>
		<form action="registration.jsp">
			<div class="registration-info">
				<input class="field" type="text" name="username" id="username"
					placeholder="Enter a desired username" required /> <input
					class="field" type="text" name="email" id="email"
					placeholder="Enter your email" required /> <input class="field"
					type="password" name="password" id="password"
					placeholder="Enter password" required /> <input class="field"
					type="password" name="password-conf" id="password-conf"
					placeholder="Confirm password" required />
			</div>
			<input class="registration-button" type="submit" value="Register" />
		</form>

		<jsp:useBean id="database" class="com.database.UserDatabase" />

		<%
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String passwordConf = request.getParameter("password-conf");
		%>

		<h1 class="feedback">
			<%
				if (username != null) {
					if (password.equals(passwordConf)) {
						if (database.checkNames(username)) {
							out.print("<b>Sorry, the username has already been taken!</b>");
						} else {
							database.insertData(username, email, password);
							out.print("<b>" + username + ", you registered successfully!</b>");
						}
					} else {
						out.print("<b>Sorry, the passwords you entered don't match!</b>");
					}
				}
			%>
		</h1>
	</div>

</body>
</html>