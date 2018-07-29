<%@page import="Dao.UserDao"%>
<%@page import="dto.UserDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="scripts/jquery-3.3.1.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<% List<UserDetails> list = (List) request.getAttribute("list");
	UserDao dao = (UserDao)request.getAttribute("user");
%>

<script>
$(document).ready(function () {   
   $('input.btn-outline-warning').click(function () {
	   				$('#option1').bootstrapToggle('on');
	   				$('#option2').bootstrapToggle('off');
	   				$('#option3').bootstrapToggle('off');
    	   	
       value =$('#option1').val();
       uid = $('#uid').html();
       $.post("ValidateUser.php",{"value":value,"uid":uid}, function(data, status){
    	   			alert(value);
    	   			
           });
 
   	   	 });		

$('input.btn-outline-success').click(function () {
		$('#option2').bootstrapToggle('on');
		$('#option1').bootstrapToggle('off');
		$('#option3').bootstrapToggle('off');
	
       value =$('#option2').val();
       uid = $('#uid').html();
       $.post("ValidateUser.php",{"value":value,"uid":uid}, function(data, status){
    	   			alert(value);
           });

   	   	 });	
$('input.btn-outline-danger').click(function () {


	$('#option3').bootstrapToggle('on');
	$('#option1').bootstrapToggle('off');
	$('#option2').bootstrapToggle('off');
    value =$('#option3').val();
    uid = $('#uid').html();
    $.post("ValidateUser.php",{"value":value,"uid":uid}, function(data, status){
 	   			alert(value);
        });

	   	 });
   
});

</script>

<script>


</script>


</head>

<body>


<jsp:include page="collegeMenu.jsp"></jsp:include>


<br><br><br>


<table align="center" border="1" >
		<thead>
		<tr>
		<th colspan="10" align="center">Payment History Page</th>
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
		<th >Status</th>	
		</tr>
		</thead>
		
		<tbody>
		<%
			for(UserDetails m : list){
		%>
		<tr>
			<td id="uid" align="center" ><%=m.getUserName()%></td>
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
			
	
			<td>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
  			<label class="btn btn-secondary active">
    			<input type="button" class="btn btn-outline-warning"  value="Not Verified" name="options" id="option1" autocomplete="off" checked="checked" data-onstyle="warning" data-offstyle="primary" data-on="Not Verified" data-off="Off"> 
  			</label>
 			 <label class="btn btn-secondary">
   				 <input type="button" class="btn btn-outline-success"  value="Verified" name="options" id="option2" autocomplete="off" checked="checked" data-onstyle="success" data-offstyle="primary" data-on="Verified" data-off="Off"> 
 			</label>
  			<label class="btn btn-secondary">
   				 <input type="button" class="btn btn-outline-danger"  value="Declined" name="options" id="option3" autocomplete="off" checked="checked" data-onstyle="danger" data-offstyle="primary" data-on="Declined" data-off="Off"> 
 			</label>
		</div>
			
			
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