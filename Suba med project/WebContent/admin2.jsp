<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String recmsg = request.getAttribute("msg")!=null?(String)request.getAttribute("msg"):" ";

%>

<form action="Admin_ser" method='post'>
NAME:<input type="text" name="aname"><br>
ADMIN CODE:<input type="text" name="apass"><br>
<input type="submit" value="login"><br>
</form>
<br>
<a href="index.jsp" >BACK</a>


<%=recmsg %>


</body>
</html>