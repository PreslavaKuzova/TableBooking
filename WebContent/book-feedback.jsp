<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body
	background="http://molinarealcelebraciones.com/wp-content/uploads/2016/12/Molina-Real-tambi%C3%A9n-para-cenas-y-comidas-de-empresa-1920.jpg">
<head>
<link rel="stylesheet" type="text/css" href="CSS/book-feedback-design.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you!</title>
</head>
<body>
<body>

	<div class="buttons">
		<form action="index.html">
			<input class="button" type="submit" value="HOME" />
		</form>

		<form action="book.jsp">
			<input class="button" type="submit" value="BOOK A TABLE" disabled />
		</form>

		<form action="registration.jsp">
			<input class="button" type="submit" value="SIGN UP" />
		</form>
	</div>
	
	<div class="wrapper">
		<h1 class="thank-you">Thank you for your reservation!</h1>
	</div>
	
    <script>
        var timer = setTimeout(function() {
            window.location='index.html'
        }, 7000);
    </script>
	
	</body>
</body>
</html>