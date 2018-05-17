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
<% 
Connection con = null;
Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_data","postgres","admin");
Statement st = con.createStatement();
%>
<table>
<tr>
<td>NUMBER</td>
<td>MEDICINE</td>
<td>QUANTITY</td>

</tr>
<% ResultSet rs =st.executeQuery("select * from med_tab  ");
while(rs.next())	
{	
%>
<tr>
<td><%=rs.getString("number") %>	</td>                         
<td><%=rs.getString("medicine") %>	</td>
<td><%=rs.getString("quantity") %>	</td>
</tr>
<tr>
<td>
<td><%=rs.getString("med2") %>	</td>
<td><%=rs.getString("qu2") %>	</td>

</tr>

<%} %>

</table>
<form method="get" action="view.jsp">
<button type="submit"> BACK</button>
</form>




</body>
</html>