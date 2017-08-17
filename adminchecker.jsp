<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    try{
        String username = request.getParameter("Username");   //Username verification in reference to Admin Credentials Table
        String password = request.getParameter("Password");//Password verification in reference to Admin Credentials Table
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sip?user=root&password=kumarpillai");    
        PreparedStatement pst = conn.prepareStatement("Select Username,Password from admintb where username=? and password=?");
        pst.setString(1, username);//Retrieving data from Admin Credentials Table and matching/verifying user input
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {          
        	response.sendRedirect("reportlist.jsp");//login conditions for successful login 
        
        }
        else{
        	 response.sendRedirect("index.jsp?login=fail");//login conditions for unsuccessful login 
 	    
        }
   }
   catch(Exception e){       
	   response.sendRedirect("index.jsp?login=null");//login conditions for null
	         
   }      
%>



</body>
</html>