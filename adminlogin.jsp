<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Login</title>
</head>
<body>

<div id="mainnav">
   <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="bullying.jsp">Bullying</a></li>
      <li><a href="event.jsp">Event</a></li>
      <li><a href="counsel.jsp">Counseling</a></li>
      <li><a href="report.jsp">File A Report</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>

      <li><a href="adminlogin.jsp">Admin Login</a></li>
      
   </ul>
</div>





<center><form method="post" action="adminchecker.jsp"><!--Parsing input into adminchecker-->
  <a class="subtitle">Username:</a><br>
  <input class="head1" type="text" name="Username" required><!--Parsing username into adminchecker-->
  <br>
  <a class="subtitle">Password:</a><br>
  <input class="head1" type="password" name="Password" required><!--Parsing password into adminchecker-->
  <br><br>
  <input type="submit" value="Submit">
</form></center> 	



	
</body>
</html>