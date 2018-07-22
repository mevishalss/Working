<%@page import="dto.UserDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<% List<UserDetails> list = (List) request.getAttribute("list"); %>

<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="8" align="center">Payment History Page</th>
		</tr>
		
		<tr>
		
		<th >User Id</th>
		<th >First Name</th>
		<th >Last Name</th>
		<th >Course</th>
		<th>Year of Admission</th>
		<th >PRN Number</th>
		<th >Email</th>
		<th >Phone Number</th>
		
		</tr>
		</thead>
		
		<tbody>
		<%
			for(UserDetails m : list){
		%>
		<tr>
			<td align="center" >
				<%=m.getUserName()%>
			</td>
			<td align="center" >
				<%=m.getfName()%>
			</td>
			<td align="center" >
				<%=m.getlName()%>
			</td>
			<td align="center" >
				<%=m.getCourse()%>
			</td>
			<td align="center" >
				<%=m.getYearOfCourse()%>
			</td>
			<td align="center" >
				<%=m.getPrnNo()%>
			</td>
			<td align="center" >
				<%=m.getEmailId() %>
			</td>
			<td align="center" >
				<%=m.getPhoneNo()%>
			</td>
			
		</tr>
		<% } %>
		
		</tbody>
		</table>
		
		<br><br>
		<br>
	<jsp:include page="footer.jsp"></jsp:include>
	
	

</body>
</html>