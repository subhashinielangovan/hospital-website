<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="View_ser" method="post">
<div>
SEARCH<input type="text" name="pname" >
<input type="submit" value="view"><br>

<% 
Connection con = null;
Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
Statement st = con.createStatement();
%>
<table>
<tr>
<td>NAME</td>
<td>PHONENUMBER</td>
<td>ADDRESS</td>
<td>PROBLEM</td>
<td>DOCTOR</td>
<td>DATE</td>
</tr>
<% ResultSet rs =st.executeQuery("select * from patient  ");
while(rs.next())	
{	
%>
<tr>
<td><%=rs.getString("pname") %>	</td>
<td><%=rs.getString("paddress") %>	</td>
<td><%=rs.getString("pphonenumber") %>	</td>
<td><%=rs.getString("pproblem") %>	</td>
<td><%=rs.getString("pdoctor") %>	</td>
<td><%=rs.getString("pdate") %>	</td>
</tr>

<%} %>

</table>


</div>
</form>
<a href ="adapp.jsp"> APPOINTMENTS </a>
<br>
<br>
<a href ="admed.jsp"> ORDERS </a>
<br>
<a href ="register.jsp"> REGISTER </a>
<br>
<a href ="admin_add.jsp"> ADD PATIENT DETAILS </a>
<br>
<form method="get" action="index.jsp">
<button type="submit"> LOGOUT </button>
</form>



</body>
</html>