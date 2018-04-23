<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.demo.bean.EmployeeBean"%>
<%@ page import="com.demo.dao.EmployeeDao"%>
<html>
<head>
<link rel="stylesheet" href="css/styles.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Employee</title>
</head>
<body>
<%
	EmployeeBean employee = new EmployeeBean();
%>
<%
	EmployeeDao dao = new EmployeeDao();
%>
<form method="POST" action='EmployeeHandler' name="frmEditUser"><input
	type="hidden" name="action" value="edit" /> <%
 	String uid = request.getParameter("userId");
 	if (!((uid) == null)) {
 		int id = Integer.parseInt(uid);
 		employee = dao.getEmployeeById(id);
 %>
<table>
	<tr>
		<td class="tdiv">Employee Id</td>
		<td><input type="text" name="userid" readonly="readonly"
			value="<%=employee.getEmployeeId()%>"></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Employee Name</td>
		<td><input type="text" name="name" value="<%=employee.getName()%>"/></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Email</td>
		<td><input type="text" name="email" value="<%=employee.getEmail()%>"/></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Address</td>
		<td><input type="text" name="address" value="<%=employee.getAddress()%>"/></td>
	</tr><tr></tr><tr></tr>
	<tr>
		<td class="tdiv">Phone No</td>
		<td><input type="text" name="phone" value="<%=employee.getPhoneNo()%>"/></td>
	</tr><tr></tr><tr></tr>
	
	<tr><tr></tr><tr></tr>
		<td></td>
		<td><input type="submit" value="Update" /></td>
	</tr>
</table>
<%
	} else
		out.println("ID Not Found");
%>
</form>
</body>
</html>