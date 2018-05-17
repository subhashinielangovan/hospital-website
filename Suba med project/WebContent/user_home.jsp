<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<table style="color:black">

<%
HttpSession ses=request.getSession();

String recmsg = ses.getAttribute("msg")!=null?(String)ses.getAttribute("msg"):" ";

%>

<% 
Connection con = null;
Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
Statement st = con.createStatement();

ResultSet rs =st.executeQuery("select * from patient where pphonenumber='"+recmsg+"' ");
if(rs.next())	
{
%>
<tr>
<td>NAME</td><td><%=rs.getString("pname") %>	</td>
</tr>
hello &nbsp;<%=rs.getString("pname") %>
<tr>
<td>ADDRESS</td><td><%=rs.getString("paddress") %>	</td>
</tr>
<tr>
<td>PHONENUMBER</td><td><%=rs.getString("pphonenumber") %>	</td>
</tr>
<tr>
<td>PROBLEM</td><td><%=rs.getString("pproblem") %>	</td>
</tr>
<tr>
<td>DOCTOR</td><td><%=rs.getString("pdoctor") %>	</td>
</tr>
<tr>
<td>DATE</td><td><%=rs.getString("pdate") %>	</td>
</tr>


<%} %>


</table>
<a href ="med_book.jsp">MED ORDERS </a>
<br>
<br>
<a href ="app.jsp"> APPOINTMENT </a>
<br>
<br>
<a href ="index.jsp"> LOGOUT </a>

</body>
</html>