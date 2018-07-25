<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.red {
    color:red;
}
</style>
 
<script src="scripts/jquery-3.3.1.min.js"></script>
<script src="scripts/jquery-3.3.1.slim.min.js"></script>
<script>

$(document).ready(function () {
    $("#uid").focus();
    $("#btnlogin").click(function(){
        var name = $('#uid').val();
        if (name.length == 0) {
            $('#spanuser').next('div.red').remove();
            $('#spanuser').after('<div class="red">User Name is Required</div>');
        } else {
        	$('#spanuser').next('div.red').remove();
            return true;
        }
    });

    $("#btnlogin").click(function(){
        var password = $('#pwd').val();
        if (password.length == 0) {
            $('#spanpass').next('div.red').remove();
            $('#spanpass').after('<div class="red">Password is Required</div>');
            return false;
        } else {
            $('#spanpass').next('div.red').remove();
            return true;
        }
    });     
      
});
			
</script>  
</head>
<body>

<jsp:include page="LoginHead.jsp"></jsp:include>

	<div  align="center" style="margin-top: 100px">
	<spr:form action="login.php" commandName="user" method="post" id="myform">
	<fieldset>
	<legend>LOGIN</legend>
	<table>
	<tr>
	<tr>
	 	<td>User Name : </td><td><spr:input path="userName" id="uid" name="uid"/></td><td><span id="spanuser"></span></td>
	</tr>
	</tr>
	<tr>
	<tr>
	     <td>Password : </td><td><spr:password path="userPass" id="pwd" name="pwd"/></td><td><span id="spanpass"></span></td>
	</tr>
	</tr>
	<tr>
	<tr>
	<tr>
		<td> <label>
        <input type="checkbox" name="remember" id="remember"> Remember me
      </label></td>
    </tr>
    </tr>
    </tr>
    
    <tr>
    <tr>
    <tr>

		<td colspan="2" align="center"><input type="submit" id="btnlogin" value="Login" /> <input type="reset" value="Reset" /></td>

	</tr>
	</tr>
	</tr>
	
	</table> 
		
		</div>
		
		</fieldset>
		
		
		
		
		<p id="details"></p>
	</spr:form>
<table align="center">
	<tr>
	<tr>

		<td align="Left"><a href="registration.php">New Register</a></td> <td align="Right"><a href="forgotpass.php">Forgot Password</a></td>
		
	</tr>
	</tr>
</table>
		
</body>
</html>