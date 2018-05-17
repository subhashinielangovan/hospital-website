
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
<%
HttpSession ses=request.getSession();

String recmsg = ses.getAttribute("msg")!=null?(String)ses.getAttribute("msg"):" ";

%>
<%
HttpSession ses1=request.getSession();

String recmsg2= request.getAttribute("msg3")!=null?(String)request.getAttribute("msg3"):" ";

%>
<%
HttpSession ses2=request.getSession();

String recmsg4 = ses.getAttribute("me2")!=null?(String)ses.getAttribute("me2"):" ";

%>

GET YOUR APPOINTMENT<br>
<form action="Appser" method='post'>

<table>
<tr>
<td>DATE:</td>
<td><input type="date" name="pdate" required></td>
</tr>
<tr>
<td>TIME:</td>
<td><select type="text" name="ptime" required>
<option>10:30AM</option>
<option>1:30PM</option>
<option>4:30PM</option>
<option>6:00PM</option>
</select>
 </td>
 </tr>
 <tr>
 <td></td>
  <td></td>
  <td>
 
<input type="submit" value="BOOK APPOINTMENT"> 
</td>
 </tr>

</table>

</form>
<%=recmsg2 %>
<%=recmsg4%>

<form method="get" action="index.jsp">
<button type="submit"> LOGOUT</button>
</form>
<form method="get" action="user_home.jsp">
<button type="submit"> BACK</button>
</form>
</body>
</html>