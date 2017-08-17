<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.sql.SQLException" %>

<%@ page import="java.sql.Statement" %>

<%@ page import="java.sql.Connection" %>

<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Insert Aircraft Records</title>
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
<%  

Connection connect = null;

Statement s = null;

 

try {

Class.forName("com.mysql.jdbc.Driver");

 

connect =  DriverManager.getConnection("jdbc:mysql://localhost/sip?user=root&password=kumarpillai");

 

s = connect.createStatement();

 

String name = request.getParameter("name");
String id = request.getParameter("id");
String money = request.getParameter("money");




String sql2="insert into donor(name,payid,amount)"
+"values('"+name+"','"+id+"','"+money+"')";
s.execute(sql2);

 

out.println("Record Inserted Successfully");
response.sendRedirect("thanks.jsp");
 

} catch (Exception e) {

// TODO Auto-generated catch block

out.println(e.getMessage());

e.printStackTrace();

}

 

try {

if(s!=null){

s.close();

connect.close();

}

} catch (SQLException e) {

// TODO Auto-generated catch block

out.println(e.getMessage());

e.printStackTrace();

}

%>

</body>
</html>