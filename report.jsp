<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import="java.sql.Statement" %>

<%@ page import="java.sql.Connection" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<title>File A Report</title>
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

<div class="title">File A Report</div>
<%

Connection connect = null;

Statement s = null;





Class.forName("com.mysql.jdbc.Driver");

 

connect =  DriverManager.getConnection("jdbc:mysql://localhost/sip?user=root&password=kumarpillai" );

 

s = connect.createStatement();





ResultSet r = s.executeQuery("SELECT Max(reportid) AS maxid FROM report;");
r.next();
int reportid = r.getInt("maxid")+1;



String countx=Integer.toString(reportid);
r.close();

%>
<form name="frmUpdate" action="reportevi" method="post" enctype="multipart/form-data"> 



<table width="428" border="1">   

<tr>

<th width="181">

<div align="left"><a class="head1">Report ID </a></div></th>

<td width="231"><input type="text" name="reportid" value=<%=reportid%> readonly="readonly" /></td>

</tr>

<tr>

<th width="181">

<div align="left"><a class="head1">Your Name </a> </div></th>

<td><input type="text" name="vname" size="20" value=" "></td>

</tr>

<tr>

<th width="181">

<div align="left"><a class="head1">Your Contact Details </a> </div></th>

<td><input type="text" name="vphone" size="20" value=" "></td>

</tr>

<tr>

<th width="181">

<div align="left"><a class="head1">Name Of Perpetrator </a> </div></th>

<td><input type="text" name="pname" size="20" value=""></td>

</tr>

<tr>
<th width="181">

<div align="left"><a class="head1">Name of Preferred Liason (e.g; Parent, Teacher) </a> </div></th>

<td><input type="text" name="gname" size="20" value=""></td>

</tr>

<tr>

<th width="181">

<div align="left"><a class="head1">Liasion Contact Details </a> </div></th>

<td><input type="text" name="gphone" size="20" value=" "></td>

</tr>
<tr>

<th width="181">

<div align="left"><a class="head1">Description </a> </div></th>

<td><input type="text" name="desc" size="40" value=""></td>

</tr>


<tr>
<th width="181">

<div align="left"><a class="head1">Evidence </a></div></th>

<td><input type="file" name="photo" size="20"></td>

</tr>

</table>

<input type="submit" value="Save">

</form>

</body>
</html>