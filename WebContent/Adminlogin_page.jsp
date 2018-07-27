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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
			$(document).ready(function () {
    $("#auid").focus();
    $("#auid").blur(function () {
        var name = $('#auid').val();
        if (name.length == 0) {
            $('#auid').next('div.red').remove();
            $('#auid').after('<div class="red">User Name is Required</div>');
        } else {
            $(this).next('div.red').remove();
            return true;
        }
    });

    $("#apwd").blur(function () {
        var password = $('#apwd').val();
        if (password.length == 0) {
            $('#apwd').next('div.red').remove();
            $('#apwd').after('<div class="red">Password is Requqired</div>');
            return false;
        } else {
            $('#apwd').next('div.red').remove();
            return true;
        }
    });

});
</script>  


</head>
<body>


<jsp:include page="LoginHead.jsp"></jsp:include>
	<div  align="center" style="margin-top: 100px">
	<spr:form action="AdminData.php" commandName="Admindto" method="post" >
	<fieldset>
	<legend>Admin  Login</legend>
	<table>
	<tr>
	<tr>
	 	<td>User Name : </td><td><spr:input path="userid" id="auid" name="auid"/></td>
	</tr>
	</tr>
	<tr>
	<tr>
	     <td>Password : </td><td><spr:password path="password" id="apwd" value="apwd"/></td>
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
		<td colspan="2" align="center"><input type="submit" value="Login" /> <input type="reset" value="Reset" /></td>
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