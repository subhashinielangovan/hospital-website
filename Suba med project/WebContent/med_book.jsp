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
HttpSession ses=request.getSession();

String recmsg = ses.getAttribute("msg")!=null?(String)ses.getAttribute("msg"):" ";

%>
<% 
String recmsg2 = request.getAttribute("msg2")!=null?(String)request.getAttribute("msg2"):" ";
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
<form action="Bookser" method='post'>
<table>
<tr>
<td>name</td>
<td>quantity</td>
<td>ORDERS</td>
</tr>
<tr>
<td><%=rs.getString("med1") %>	</td>

<td><input type="text" name="q1" >	</td>
<td><input type="hidden" value=<%=rs.getString("med1") %> name="m1"></td>


</tr>
<tr>
<td><%=rs.getString("med2") %>	</td>

<td><input type="text" name="q2" >	</td>
<td><input type="hidden" value=<%=rs.getString("med2") %> name="m2"></td>

<td> <input type="submit" value="book"></td>
</tr>
<%} %>
</form>
<%=recmsg2 %>
</table>
<form method="get" action="index.jsp">
<button type="submit"> LOGOUT</button>
</form>
<form method="get" action="user_home.jsp">
<button type="submit"> BACK</button>
</form>
</body>
</html>