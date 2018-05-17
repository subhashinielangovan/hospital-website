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

<h2>Add Patient Here</h2>

<form action="Add_New_Patient" method="post">
<table>
<tr>
GENERAL DETAILS
</tr>
<tr>
<th></th>
<th></th>
</tr>

<tr>
<td> NAME </td>
<td><input type="text" name="pname"></td>
</tr>
<tr>
<td> ADDRESS </td>
<td><input type="text" name="paddress"></td>
</tr>
<tr>
<td> PHONE NUMBER </td>
<td><input type="text" name="pnumber"></td>
</tr>
</table>

<br>

<table>
CHECK UP DETAILS
<tr>
<td> PROBLEM </td>
<td><input type="text" name="pprob"></td>
</tr>
<tr>
<td> DOCTOR </td>
<td><input type="text" name="pdoct" ></td>
</tr>
<tr>
<td> DATE </td>
<td><input type="date" name="pdate"></td>
</tr>
</table>

<br>
MEDICINE DETAILS
<table style="color:black">

<tr>
<th>S.NO </th>
<th>MEDICINE NAME </th>
<th>QUANTITY</th>
</tr>

<tr>
<td>1</td>
<td><input type="text" name="med1"></td>
<td><input type="text" name="qu1"></td>
</tr>

<tr>
<td>2</td>
<td><input type="text" name="med2"></td>
<td><input type="text" name="qu2"></td>
</tr>
</table>
<input type="submit" value="add">

</form>
<a href ="view.jsp"> BACK</a>

<%= recmsg %>
</body>
</html>