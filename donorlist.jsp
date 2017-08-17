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
<title>List Of Donors</title>
</head>
<body>


<div id="adminnav">
   <ul>
      <li><a href="index.jsp">Log-out</a></li>
     <li><a href="donorlist.jsp">List Of Donors</a></li>
     <li><a href="reportlist.jsp">List Of Reports</a></li>
   </ul>
</div>

<div class="title">List Of Donors</div>
<%

Connection connect = null;

Statement s = null;



try {

Class.forName("com.mysql.jdbc.Driver");

 

connect =  DriverManager.getConnection("jdbc:mysql://localhost/sip?user=root&password=kumarpillai" );

 

s = connect.createStatement();



String sql = "select x.id, x.name, x.payid,x.amount from donor x";

 

ResultSet rec = s.executeQuery(sql);

%>
<%while((rec!=null) && (rec.next())) { %>
<table width="600" border="1" class="maintext">

<tr>

<th width="91"> <div align="center">Donation ID </div></th>
<th width="91"> <div align="center">Full Name</div></th>
<th width="98"> <div align="center">Paypal ID </div></th>
<th width="98"> <div align="center">Amount Donated (SGD) </div></th>



</tr>  



<tr>
<td  class="maintext"><div align="center"><%=rec.getString("x.id")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.name")%></div></td>
<td class="maintext" ><div align="center"><%=rec.getString("x.payid")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.amount")%></div></td>




</tr>



</table>     
<%}%>

<%  

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