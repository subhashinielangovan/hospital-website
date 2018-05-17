<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#m
{
font-size:100px;
position:absolute;
left:250px;
top:100px;
font-weight:bold;
color:green;
background-color:lightgreen;
}
#u
{
position:absoulute;
left:300px;
top:350px;
}
</style>
</head>
<body>
<%
String recmsg = request.getAttribute("msg")!=null?(String)request.getAttribute("msg"):" ";

%>

<form action="Indser" method='post'>
<div id="m">SUBAM HOSPITAL</div>

USERNAME <input type="text" name="lname" required><br>
PHONENUMBER <input type="text" name="lnum" required><br>

<input type="submit" value="login"><br>
</form>
<a href ="admin2.jsp"> ADMIN </a>

<%=recmsg %>

</body>
</html>