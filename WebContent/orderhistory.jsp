<%@page import="java.util.List"%>
<%@page import="dto.OrderDetails"%>
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
<br><br><br>

<% List <OrderDetails> list = (List) request.getAttribute("list"); %>
<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="8" >Order History Page</th>
		</tr>
		<tr>
		<th >Order Id</th>
		<th >User Id</th>
		<th >Order Date</th>
		<th >Number of Installments</th>
		<th >Price of Item</th>
		
		
		</tr>
		</thead>
		<tbody>
		<%
			for(OrderDetails m : list){
		%>
		<tr>
			
			<td align="center" >
				<%=m.getOrderId()%>
			</td>
			<td align="center" >
				<%=m.getUserId() %>
			</td>
			<td align="center" >
				<%=m.getOrderDate() %>
			</td>
			<td align="center" >
			<%=m.getNoOfInstalments() %>
				
			</td>
			<td align="center" >
				<%=m.getOrderPrice() %>
			</td>
			
			
		</tr>
		<% } %>
		
		</tbody>
		</table>
		<br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>