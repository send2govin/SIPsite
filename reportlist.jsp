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
<title>BLM - Reports</title>
</head>
<body>


<div id="adminnav">
   <ul>
      <li><a href="index.jsp">Log-out</a></li>
     <li><a href="donorlist.jsp">List Of Donors</a></li>
     <li><a href="reportlist.jsp">List Of Reports</a></li>
     
   </ul>
</div>

<div class="title">Report Database</div>
<%

Connection connect = null;

Statement s = null;



try {

Class.forName("com.mysql.jdbc.Driver");

 

connect =  DriverManager.getConnection("jdbc:mysql://localhost/sip?user=root&password=kumarpillai" );

 

s = connect.createStatement();



String sql = "select x.reportid, x.vname, x.vphone, x.pname, x.gname, x.gphone, x.synopsis, x.photo from report x";

 

ResultSet rec = s.executeQuery(sql);

%>

<table width="600" border="1" class="maintext">

<tr>

<th width="91"> <div align="center">Report ID </div></th>
<th width="91"> <div align="center">Victim Name</div></th>
<th width="98"> <div align="center">Victim Contact </div></th>
<th width="98"> <div align="center">Bully Name </div></th>
<th width="98"> <div align="center">Liaison Name</div></th>
<th width="198"> <div align="center">Liaison Contact </div></th>
<th width="98"> <div align="center">Description</div></th>
<th width="198"> <div align="center">Evidence</div></th>


</tr>  

<%while((rec!=null) && (rec.next())) {
	byte[]imgdata=rec.getBytes("x.photo");
String encode = Base64.getEncoder().encodeToString(imgdata);
request.setAttribute("imgbase", encode); %>

<tr>
<td  class="maintext"><div align="center"><%=rec.getString("x.reportid")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.vname")%></div></td>
<td class="maintext" ><div align="center"><%=rec.getString("x.vphone")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.pname")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.gname")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.gphone")%></div></td>
<td class="maintext"><div align="center"><%=rec.getString("x.synopsis")%></div></td>
<td class="maintext"><div align="center"><img height="200" width="400"src="data:image/jpeg;base64,${imgbase}"/></div></td>



</tr>

<%}%>

</table>     

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