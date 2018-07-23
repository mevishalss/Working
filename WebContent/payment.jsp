<%@page import="java.util.List"%>
<%@page import="dto.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<br><br>
<% List<Payment> list = (List) request.getAttribute("list"); %>
<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="8" >Payment History Page</th>
		</tr>
		<tr>
		<th >User Id</th>
		<th >Order Id</th>
		<th >Transaction Id</th>
		<th >Transaction Date</th>
		<th >Transacation Amount</th>
		<th >Transacation Status</th>
		<th >Payment Mode</th>
		
		</tr>
		</thead>
		<tbody>
		<%
			for(Payment m : list){
		%>
		<tr>
			<td align="center" >
				<%=m.getUserId() %>
			</td>
			<td align="center" >
				<%=m.getOrderId()%>
			</td>
			<td align="center" >
				<%=m.getTransId() %>
			</td>
			<td align="center" >
				<%=m.getTransDate() %>
			</td>
			<td align="center" >
				<%=m.getTransAmount() %>
			</td>
			<td align="center" >
				<%=m.getTransStatus()%>
			</td>
			<td align="center" >
				<%=m.getModeOfTrans() %>
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