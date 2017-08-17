<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<title>#Anti-Bully | Donations</title>
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


<center><div class="title">Help Us Help Others :)</div></center>

<center><form method="post" action="insertdon.jsp"><!--Parsing input into adminchecker-->
  <a class="subtitle">Full name:</a><br>
  <input class="head1" type="text" name="name" required><!--Parsing username into adminchecker-->
  <br>
  <a class="subtitle">Paypal Account ID:</a><br>
  <input class="head1" type="text" name="id" required><!--Parsing password into adminchecker-->
  <br><br>
  <a class="subtitle">Amount in SGD:</a><br>
  <input class="head1" type="text" name="money" required><!--Parsing password into adminchecker-->
  <br><br>
  <input type="submit" value="Submit">
</form></center> 	


</body>
</html>