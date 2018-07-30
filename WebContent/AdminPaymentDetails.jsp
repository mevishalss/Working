<%@page import="dto.User"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDetails"%>
<%@ page import="dto.Payment"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit page</title>
<script src="scripts/jquery-3.3.1.min.js"></script>
<script src="scripts/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="path/to/date-validator.js"></script>




<style type="text/css">
.red {
    color:red;
}
#submit {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
#submit:hover {background-color: #3c3c3c}
#submit:active {
  background-color: #b4b4b4;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
editDiv {
    border-radius: 5px;
    background-color: 696969;
    padding: 20px;
}
#text {
    width: 100%;
    padding: 10px 17px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
</style>
</head>




<body>

<% List<Payment> plist = (List) request.getAttribute("list"); %>
<jsp:include page="menu.jsp"></jsp:include>
<br><br>

<table align="center" border="2" >
		
		<tbody>
		<%
		if(plist.isEmpty())
		{
		%>
			<tr><td><%="Data Not Found" %></td></tr>
		<%}
			for(Payment m : plist){
		%>
		<th >User Id</th>
		<th >Order Id</th>
		<th >Transaction Id</th> 
		<th >Transaction Date</th>
		<th >Transaction Amount</th>
		<th >Transaction Status</th>
		<th >Transaction Mode</th>
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
</html>>