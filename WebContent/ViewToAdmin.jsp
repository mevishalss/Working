<%@page import="java.util.List"%>
<%@page import="dto.OrderDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="scripts/jquery-3.3.1.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title><style type="text/css">
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

<style type="text/css">
body {
  background-image: url("images/background.jpg");
   
}
</style>

</head>



<body>

<jsp:include page="Viewadminmenu.jsp"></jsp:include>
<br><br><br>

<% List <OrderDetails> list = (List) request.getAttribute("list"); %>



<script>
$(document).ready(function () {  
    $('input.btn-outline-danger').click(function () {

 	   
        value =$('#option3').val();
        uid = $('#uid').html();
        $.post("orderUpdatePage.php",{"value":value,"uid":uid}, function(data, status){
     	   			alert("Success");
            });

    	   	 });		

 $('input.btn-outline-success').click(function () {

 	   
        value =$('#option2').val();
        uid = $('#uid').html();
        $.post("orderUpdatePage.php",{"value":value,"uid":uid}, function(data, status){
     	   			alert("Success");
            });

    	   	 });	

});



</script>

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
		<th >confirm Oreder </th>
	
		</tr>
		</thead>	
		<tbody>
		<%
			for(OrderDetails m : list){
		%>
		<tr>
			
			<td align="center" id="uid"><%=m.getOrderId()%></td>
			<td align="center"  >
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
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
 			 <label class="btn btn-secondary">
   				 <input type="button" class="btn btn-outline-success"  value="confirm" name="options" id="option2" autocomplete="off"> 
 			</label>
 			
 			
  			<label class="btn btn-secondary">
   				 <input type="button" class="btn btn-outline-danger"  value="pending" name="options" id="option3" autocomplete="off"> 
 			
 			</label>
		</div>	
			</td>
			</td>
            </tr>
		<% } %>
		
		</tbody>
		</table>
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>