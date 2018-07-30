<%@page import="java.util.List"%>
<%@page import="dto.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.red {
    color:red;
}
fieldset 
{ 
    display: block;
    margin-left: 350px;
    margin-right: 350px;
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 2px groove (internal value);
    background: #F8F8F8;
    border-color: #5f97ef;    
}
    
legend
{
    color: #5f97ef;   
}
</style>
</head>
<style type="text/css">
body {
  background-image: url("images/background.jpg");
   
}
</style>
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
		<%if(list.isEmpty())
		{
		%>
			<tr><td><%="Data Not Found" %></td></tr>
		<%}%>
		
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