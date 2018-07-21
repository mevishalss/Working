<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="LoginHead.jsp"></jsp:include>

	<div  align="center" style="margin-top: 100px">
	<spr:form action="login.php" commandName="user" method="post" >
	<table>
	<tr>
	 	<td>User Name : </td><td><spr:input path="userName"/></td>
	</tr>
	<tr>
	     <td>Password : </td><td><spr:password path="userPass"/></td>
	</tr>
	<tr>
		<td> <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label></td>
    </tr>
    <tr>
		<td colspan="2" align="center"><input type="submit" value="login" /> <input type="submit" value="login" /></td>
	</tr>
	
	<tr>
		<td colspan="2" align="Left"><a  href="url">New Register</a></td> <td colspan="2" align="Right><a href="url">Forgot Password</a></td>
	</tr>
	</table> 
		
		</div>
		
		
	</spr:form>
</body>
</html>