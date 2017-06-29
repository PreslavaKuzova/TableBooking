<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body
	background="http://molinarealcelebraciones.com/wp-content/uploads/2016/12/Molina-Real-tambi%C3%A9n-para-cenas-y-comidas-de-empresa-1920.jpg">
<head>
<link rel="stylesheet" type="text/css" href="CSS/book-design.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book a table</title>
</head>
<body>
<div class="buttons">
		<form action="index.html">
			<input class="button" type="submit" value="HOME" />
		</form>
		
		<form action="book.html">
			<input class="button" type="submit" value="BOOK A TABLE" disabled/>
		</form>
		
		<form action="registration.html">
			<input class="button" type="submit" value="SIGN UP" />
		</form>
	</div>
	
	<div class="wrapper">
	
		<jsp:useBean id="database" class="com.database.BookingDatabase"></jsp:useBean>
		<%! Calendar c = Calendar.getInstance(); %>
		<%
			int day = c.get(Calendar.DAY_OF_MONTH);
			int month = c.get(Calendar.MONTH);	
			
			int lday = Integer.parseInt(request.getParameter("DOBDay"));
			int lmonth = Integer.parseInt(request.getParameter("DOBMonth"));
			
			String date = request.getParameter("DOBDay") + "." + request.getParameter("DOBMonth");
			
			String lpartySize = request.getParameter("DOBPartySize");
			
			String time = request.getParameter("DOBHour") + ":" + request.getParameter("DOBMinutes");
			
			if (month <= lmonth) {
				if (day <= lday) {
					response.sendRedirect("book-feedback.jsp");
				} else {
				}
			}
			
		%>
	</div>

</body>
</html>