<%@page import="java.util.List"%>
<%@page import="dto.OrderDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
body {
  background-image: url("images/background.jpg");
   
}
</style>
</head>

<body>

<jsp:include page="menu.jsp"></jsp:include>
<br><br><br>

<% List <OrderDetails> list = (List) request.getAttribute("list"); %>
<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="9" >Order History Page</th>
		</tr>
		<tr>
		<th >Order Id</th>
		<th >User Id</th>
		<th >Order Date</th>
		<th >Number of Installments</th>
		<th >Remaining Installments</th>
		<th >EMI Amount</th>
		<th >Price of Item</th>
		<th >Order Status</th>
		<th >Pay</th>
		
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
			<td ><%= m.getRemainingInst() %></td>
			
			
			
			<td align="center" >
				<%= m.getEMIAmount()  %>
			</td>
			
			<td align="center" >
				<%=m.getOrderPrice() %>
			</td>
			
			<td align="center" >
				<%= m.getOrderStatus() %>
				
			</td>
			<td>
			<%
			if( m.getRemainingInst() > 0 && m.getOrderStatus().equals("confirm") )
			{ 
				int text = m.getOrderId();
			%>
			<form method="post" action="PayInstallment.php">
				<input type="hidden" name="orderId" value="<%=text%>">
				<input type="submit" value="Pay Installment" ></a>
			</form>
				
			<% }%>
			
			</td> 
		</tr>
		<% } %>
		
		</tbody>
		</table>
		<br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>