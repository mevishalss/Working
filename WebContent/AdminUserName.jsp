<%@page import="java.util.List"%>
<%@page import="dto.Payment"%>
<%@page import="dto.UserDetails" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

body {
  background-image: url("images/background.jpg");
   
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

</head>
<body>

		
		
		<div align="right" id="userDetails" >
<jsp:include page="menu.jsp"></jsp:include>
<br><br>
<% List <UserDetails> list1 = (List) request.getAttribute("list"); %>
<table border="1" align="center">
		<thead>
		
		<tr>
		<th >User Id</th>
	
		<th >Name</th>
		
		
		</tr>
		</thead>
		<tbody>
		<%
			for(UserDetails m : list1){
		%>
		<tr>
		
		<td align="center" >
		<a href="admnUserDetails.php?uid=<%=m.getUserName()%>"><%=m.getUserName()%></a></td>
		<td align="center" >
			<a href="admnUserDetails.php?uid=<%=m.getUserName()%>"><%=m.getfName()%> <%=m.getlName()%></a>
		</td>
		
		
			
		</tr>
		<% } %>
		
		</tbody>
		</table>
		</div><br>
		<br>
		<br>
		
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>