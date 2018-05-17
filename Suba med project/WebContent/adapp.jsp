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
<th>NUMBER</th>
<th>DATE</th>
<th>TIME</th>
<th>Action</th>
</tr>
	<% ResultSet rs =st.executeQuery("select * from appoint_tab order by date ");
	while(rs.next())	
	{
		String s=rs.getString("status");
	%>
	<tr>
	<td><%=rs.getString("number") %>	</td>                         
	<td><%=rs.getString("date") %>	</td>
	<td><%=rs.getString("time") %>	</td>
		<%
		if(s.equals("1"))
		{
		%>
		<td>fixed</td>	
			
		<%
		}
		else
		{
		%>
			<td>
			<form action ="Msgser" method="get">
			<input type="hidden" value="<%=rs.getString("number")%>" name="num">
			<input type="submit" value="fix">
			</form>
			</td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>


</table>
<br>
<a href ="view.jsp"> BACK</a>

</body>
</html>
