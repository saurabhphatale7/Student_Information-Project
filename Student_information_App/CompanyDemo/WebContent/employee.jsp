<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/styles.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
</head>
<body>
<form method="POST" action='EmployeeHandler' name="frmAddUser">
<input	type="hidden" name="action" value="insert" />
<%
 String errorMsg = (String)request.getParameter("errorMsg");
String okMsg = (String)request.getParameter("okMsg");
%>

<h1 class="header">Add New Record</h1>

<table>
<!-- 	<tr> -->
<!-- 		<td>Employee ID</td> -->
<!-- 		<td><input type="text" name="userid" /></td> -->
<!-- 	</tr> -->
<tr>
<%if(null!=errorMsg) {%>
<td class="error"><%=errorMsg %></td>
<%} %>
</tr>
<tr>
<%if(null!=okMsg) {%>
<td class="ok"><%=okMsg %></td>
<%} %>
</tr>

	<tr>
		<td class="tdiv">Employee Name</td>
		<td><input type="text" name="name" /></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Email</td>
		<td><input type="text" name="email" /></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Address</td>
		<td><input type="text" name="address" /></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Phone No</td>
		<td><input type="text" name="phone" maxlength="10"/></td>
	</tr><tr></tr><tr></tr>
	
	
	<tr><tr></tr><tr></tr><tr></tr>
		<td></td>
		<td><input type="submit" value="Submit" />
		<a class="getDetails"
			href="index.jsp" id="getnext" name="next">Back</a></td>
	</tr>
</table>
</form>

</body>
</html>