<%@page import="java.util.List"%>
<%@page import="dto.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<% List <UserDetails> list = (List) request.getAttribute("list"); %>
	<h3>Order History Page</h3>
		<table>
		<%for(UserDetails m : list){ %>
		
		<tr><td >First Name</td><td><input type="text" value="<%=m. getfName() %>" ></td></tr>
		<tr><td >Last Name</td><td><input type="text" value="<%=m.getlName() %>"></td></tr>
		<tr><td >Password</td><td><input type="text" value="<%=m.getUserPass() %>"></td></tr>
		<tr><td >College Code</td><td><input type="text" readonly="readonly" value="<%=m.getCollegeCode()%>"></td></tr>
		<tr><td >Mobile Number</td><td><input type="text" value="<%=m.getPhoneNo() %>"></td></tr>
		<tr><td >Birth Date</td><td><input type="text" value="<%=m.getBithDate() %>"></td></tr>
		<tr><td >Email Id</td><td><input type="text" value="<%=m.getEmailId() %>"></td></tr>
		<tr><td > PRN Number</td><td><input type="text" readonly="readonly" value="<%=m.getPrnNo()%>"></td></tr>
		<tr><td >Course</td><td><input type="text" readonly="readonly" value="<%=m.getCourse() %>"></td></tr>
		<tr><td >Year of Course</td><td><input type="text" readonly="readonly" value="<%=m.getYearOfCourse() %>"></td></tr>
		<tr><td >Address</td><td><input type="text" readonly="readonly" value="<%=m.getAddress() %>"></td></tr>
		<tr><td > City</td><td><input type="text" readonly="readonly" value="<%=m.getCity() %>"></td></tr>
		<tr><td >State</td><td><input type="text" readonly="readonly" value="<%=m.getState() %>"></td></tr>
		<tr><td >City Pin code</td><td><input type="text" readonly="readonly" value="<%=m.getPinCode() %>"></td></tr>

		<% } %>
		
	
		</table>
		
</body>
</html>