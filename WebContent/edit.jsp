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
<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="14" >Order History Page</th>
		</tr>
		<tr>
		
		<th >First Name</th>
		<th >Last Name</th>
		<th >Password</th>
		<th >College Code</th>
		<th >Mobile Number</th>
		<th >Birth Date</th>
		<th >Email Id</th>
		<th > PRN Number</th>
		<th >Course</th>
		<th >Year of Course</th>
		<th >Address</th>
		<th > City</th>
		<th >State</th>
		<th >City Pin code</th>
</tr>
		</thead>
		<tbody>
		<%
			for(UserDetails m : list){
		%>
		<tr>
			
			<td align="center" >
				<input type="text" <%=m. getfName() %> >
			</td>
			<td align="center" >
			<input type="text" <%=m.getlName() %>>
			</td>
			<td align="center" >
				<input type="text" <%=m.getUserPass() %>>
			</td>
			
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getCollegeCode()%>>
			</td>
			
			
			<td align="center" >
				<input type="text" <%=m.getPhoneNo() %>>
			</td>
			<td align="center" >
				<input type="text" <%=m.getBithDate() %>>
			</td>
			<td align="center" >
				<input type="text" <%=m.getEmailId() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getPrnNo() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getCourse() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getYearOfCourse() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getAddress() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getCity() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getState() %>>
			</td>
			<td align="center" >
				<input type="text" readonly="readonly"<%=m.getPinCode() %>>
			</td>
			
			
			
		</tr>
		<% } %>
		
		</tbody>
		</table>
		
</body>
</html>