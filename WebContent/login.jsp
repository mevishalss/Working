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

	$(document).ready(function () {

    $("#uid").focus();

    $("#btnlogin").click(function(){


    $("#uid").blur(function () {

        var name = $('#uid').val();
        if (name.length == 0) {
            $('#uid').next('div.red').remove();




            $('#uid').after('<div class="red">User Name is Required</div>');
        } else {
            $(this).next('div.red').remove();
            return true;
        }
    });

    $("#btnlogin").click(function(){
        var password = $('#pwd').val();
        if (password.length == 0) {
            $('#pwd').next('div.red').remove();



            $('#pwd').after('<div class="red">Password is Required</div>');
            return false;
        } else {
            $('#pwd').next('div.red').remove();
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
	 	<td>User Name : </td><td><spr:input path="userName" id="uid" name="uid"/></td>
	</tr>
	</tr>
	<tr>
	<tr>
	     <td>Password : </td><td><spr:password path="userPass" id="pwd" name="pwd"/></td>
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

		<td colspan="2" align="center"><input type="submit" value="Login" onclick="validate()"/> <input type="submit" value="Reset" /></td>

	</tr>
	</tr>
	</tr>
	
	<tr>
	<tr>
		<td align="Left"><a href="registrationpage.jsp">New Register</a></td> <td align="Right"><a href="url">Forgot Password</a></td>
	</tr>
	</tr>
	</table> 
		
		</div>
		
		</fieldset>
		
		
		
		
		<p id="details"></p>
	</spr:form>
</body>
</html>