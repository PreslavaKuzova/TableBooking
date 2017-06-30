<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>
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
			<input class="button" type="submit" value="BOOK A TABLE" disabled />
		</form>

		<form action="registration.jsp">
			<input class="button" type="submit" value="SIGN UP" />
		</form>
	</div>

	<div class="wrapper">
		<h1 class="reservations">RESERVATIONS</h1>
		<form action="book.jsp">
			<div id="calendar"></div>

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
			<script src="js/jquery-ui-datepicker.min.js"></script>
			<script>
				$('#calendar').datepicker(
						{
							inline : true,
							firstDay : 1,
							showOtherMonths : true,
							dayNamesMin : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu',
									'Fri', 'Sat' ]
						});
			</script>

			<div class="date">
				<select class="left-selection" name="DOBDay">
					<option>Day</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select> <select class="right-selection" name="DOBMonth">
					<option>Month</option>
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</div>

			<select class="party-size-selection" name="DOBPartySize">
				<option>Party size</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
			</select>

			<div class="time">
				<select class="left-selection" name="DOBHour">
					<option>Hour</option>
					<option value="12">12AM</option>
					<option value="13">1PM</option>
					<option value="14">2PM</option>
					<option value="15">3PM</option>
					<option value="16">4PM</option>
					<option value="17">5PM</option>
					<option value="18">6PM</option>
					<option value="19">7PM</option>
					<option value="20">8PM</option>
					<option value="21">9PM</option>
					<option value="22">10PM</option>
					<option value="23">11PM</option>
					<option value="24">12PM</option>
				</select> <select class="right-selection" name="DOBMinutes">
					<option>Minutes</option>
					<option value="0">00</option>
					<option value="15">15</option>
					<option value="30">30</option>
					<option value="45">45</option>
				</select>
			</div>

			<input class="reservation-button" type="submit" value="BOOK" />
		</form>
	</div>
	
	<% String tableOwner = request.getParameter("usertname"); %>
		
	<jsp:useBean id="database" class="com.database.BookingDatabase"></jsp:useBean>
	<%!Calendar c = Calendar.getInstance();%>
	<%
		if (request.getParameter("DOBDay") != null && request.getParameter("DOBMonth") != null
				&& request.getParameter("DOBPartySize") != null && request.getParameter("DOBHour") != null
				&& request.getParameter("DOBMinutes") != null) {
			
			int day = c.get(Calendar.DAY_OF_MONTH);
			int month = c.get(Calendar.MONTH);
			out.print(day + " " + month);

			int lday = Integer.parseInt(request.getParameter("DOBDay"));
			int lmonth = Integer.parseInt(request.getParameter("DOBMonth"));
			String date = request.getParameter("DOBDay") + "." + request.getParameter("DOBMonth");

			String lpartySize = request.getParameter("DOBPartySize");

			String time = request.getParameter("DOBHour") + ":" + request.getParameter("DOBMinutes");
			 if (month == lmonth){
				 if (day <= lmonth) {
					 database.insertData(tableOwner, date, lpartySize, time);
					 response.sendRedirect("book-feedback.jsp");
				 }
			 } else if (month < lmonth) {
				 	database.insertData(tableOwner, date, lpartySize, time);
					response.sendRedirect("book-feedback.jsp");
			 }
		}
	%>

</body>
</html>