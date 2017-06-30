<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body
	background="http://molinarealcelebraciones.com/wp-content/uploads/2016/12/Molina-Real-tambi%C3%A9n-para-cenas-y-comidas-de-empresa-1920.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/login-design.css">
<title>Login</title>
</head>
<body>
	<div class="buttons">
		<form action="index.html">
			<input class="button" type="submit" value="HOME" />
		</form>

		<form action="login.jsp">
			<input class="button" type="submit" value="BOOK A TABLE" disabled />
		</form>

		<form action="registration.jsp">
			<input class="button" type="submit" value="SIGN UP" />
		</form>
	</div>

	<div class="wrapper">
		<h1 class="login-text">LOGIN</h1>
		<form action="login.jsp" method="post">
			<div class="user-info">
				<p class="login-info">In order to make a reservation, you have
					to sign in your account.</p>
				<input class="field" type="text" name="username" id="username"
					placeholder="Enter your username" required /> <input class="field"
					type="password" name="password" id="password"
					placeholder="Enter your password" required />
			</div>
			<input class="login-button" type="submit" value="LOGIN" /> 
						</form>
						
		<img class="divider" src="Graphics/gray-divider.png" />

		<jsp:useBean id="database" class="com.database.UserDatabase" />

		<p class="message">
			<%
				if (request.getParameter("username")!= null) {
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					if (database.checkNames(username)) {
						if (database.checkPassword(username, password)) {
							response.sendRedirect("book.jsp?username=" + request.getParameter("username")); //transfer to book.jsp page
						} else {
							out.print("<b>Invalid password. Try again!</b></p>");
						}
					} else {
						out.print("<b>Invalid username. Try again!</b></p>");

					}
				}
			%>
		</p>

		<p class="registration-information">
			If you don't have an account, you can sign up from <a
				href="registration.jsp"> HERE</a>.
		</p>
	</div>

</body>
</html>