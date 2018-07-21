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
	<spr:form action="MLogin.php" commandName="collegedto" method="post" >
	<fieldset>
	<legend>College Login</legend>
	<table>
	<tr>
	<tr>
	 	<td>User Name : </td><td><spr:input path="Userid"/></td>
	</tr>
	</tr>
	<tr>
	<tr>
	     <td>Password : </td><td><spr:password path="password"/></td>
	</tr>
	</tr>
	<tr>
	<tr>
	<tr>
		<td> <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label></td>
    </tr>
    </tr>
    </tr>
    
    <tr>
    <tr>
    <tr>
		<td colspan="2" align="center"><input type="submit" value="Login" /> <input type="submit" value="Reset" /></td>
	</tr>
	</tr>
	</tr>
	
	<tr>
	<tr>
		<td align="Left">
		</td> <td align="Right"><a href="url">Forgot Password</a></td>
	</tr>
	</tr>
	</table> 
		
		</div>
		
		</fieldset>
	</spr:form>
</body>
</html>