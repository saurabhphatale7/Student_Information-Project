<%@page import="com.mysql.jdbc.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.demo.bean.EmployeeBean"%>
<%@ page import="com.demo.dao.EmployeeDao"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="css/styles.css"/>
<script type="text/javascript">function changeIndex(value)
{
	     //alert(value);
	    document.getElementById("index").value=value;
	  //  alert(document.getElementById("index").value);
	    document.getElementById("getDetailsLink").href = "EmployeeHandler?action=getDetail&userId="+value;
	   // alert(document.getElementById("getDetailsLink").href);
	    
	}
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All User</title>
</head>
<%
	
	 String displayMode =request.getParameter("displaybyId");
	 
	EmployeeDao dao = new EmployeeDao();
	List<EmployeeBean> userList = (List<EmployeeBean>)dao.getAllEmployees();
	List<Integer> idSet= new ArrayList<Integer>();
	for(EmployeeBean e:userList){
		idSet.add(e.getEmployeeId());
		
	}
	Collections.sort(userList);
	Collections.sort(idSet);
	//Iterator<UserBean> itr = userList.iterator();
	String str =request.getParameter("index");
	int ind=0;
	if(!StringUtils.isNullOrEmpty(str)){
		ind=Integer.parseInt(str);
	}
	EmployeeBean empl = userList.get(ind);
	if(null!=displayMode && displayMode.equals("true")){
		String empIdR =request.getParameter("userId");
		int intid=Integer.parseInt(empIdR);
		empl =dao.getEmployeeById(intid);
		
	 }
	int currentIndex=empl.getEmployeeId();
	
	int nextId=0;
	int prevId=0;
	 int temp1,temp2=0;
	for(Integer index:idSet){
	 
		  //Find Larger
		  if(index>currentIndex){
			  temp2=index;
			  break;
		  }else{
			  temp1=index;
		  }
		}
	nextId=temp2;
	String nextUrl="EmployeeHandler?action=getDetail&userId="+nextId;
	System.out.println("NEXT OF "+currentIndex+" is "+nextId);
	temp1 =0;
	temp2=0;
	for(Integer index:idSet){
		
		if(index<currentIndex && index>temp1){
			temp1=index;
		}
	}
	prevId=temp1;
	if(prevId==0){
		prevId=currentIndex;
   if(nextId==0){
	   nextId=currentIndex;
   }
	}
	String prevUrl="EmployeeHandler?action=getDetail&userId="+prevId;
	
%>
<body>
<form name="formSelect" id="formSelect" method="post">
<div>
<input type="text" hidden="true" name="index" value="0" id="index"/>
<p class="link">Select Name:
<select name="ename" onchange="changeIndex(this.value)" >
<%for(EmployeeBean emp:userList){
	if(emp.getEmployeeId()==empl.getEmployeeId()){%>
		<option selected value = "<%=emp.getEmployeeId() %>"><%=emp.getName() %></option>
	<%}else{	%>



<option value = "<%=emp.getEmployeeId() %>"><%=emp.getName() %></option>
<%}} %>
</select>
<a class="getDetails"
			href="EmployeeHandler?action=getDetail&userId=0" id="getDetailsLink" name="getDetailsLink">Get Details</a>
<a class="getDetails"
			href="index.jsp">Back</a>
</div>

<table border="1">
	<tr>
		<th class="header">Id</th>
		<th class="header">Employee Name</th>
		<th class="header">Email</th>
		<th class="header">Address</th>
		<th class="header">Phone No</th>
		
	</tr>
	<tr>
		<%
		  String mode= request.getParameter("mode");
		if(null!=mode && !mode.equals("initial")){
		/*while(itr.hasNext())
			 {
			 System.out.println(user.getId());*/
			 
			
		%>
		<td class="tdiv"><%=empl.getEmployeeId()%></td>
		<td class="tdiv"><%=empl.getName()%></td>
		<td class="tdiv"><%=empl.getEmail()%></td>
		<td class="tdiv"><%=empl.getAddress()%></td>
		<td class="tdiv"><%=empl.getPhoneNo()%></td>
		
		<td ><a class="link"
			href="EmployeeHandler?action=editform&userId=<%=empl.getEmployeeId()%>">Update</a></td>
		<td><a class="link"
			href="EmployeeHandler?action=delete&userId=<%=empl.getEmployeeId()%>">Delete</a></td>

	</tr>
	<%} %>
<input type="hidden" name="detailId" value="" id="detailId">
</table><br>

<a class="getDetails"
			href="<%=prevUrl %>" id="getprev" name="prev">PREV Record</a>
			<a class="getDetails"
			href="<%=nextUrl %>" id="getnext" name="next">NEXT Record</a>
			

</form>
</body>
</html>