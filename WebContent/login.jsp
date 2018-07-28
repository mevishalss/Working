<%@page import="java.io.Console"%>

<%@page import="java.nio.channels.SeekableByteChannel"%>
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
 
<script src="scripts/jquery-3.3.1.min.js"></script>

<script>

$(document).ready(function () {
	
    $(".uid").blur(function(){
        var name = $('.uid').val();
        if (name.length == 0) {
            $('#spanuser').next('div.red').remove();
            $('#spanuser').after('<div class="red">User Name is Required</div>');
        } else {
        	$('#spanuser').next('div.red').remove();
            return true;
        }
    });

    $("#pwd").blur(function(){
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
    
    $(".uid").blur(function () {    	
        value =$(".uid").val();    
    	if(value!=""){ 
        $.post("ValidateUserId.php",{"value":value}, function(data, status){
    if(data=="true")
    {	    	
    	$("#imgsrc1").attr("src","images/wrong.jpg");
        	$('#imgsrc1').next('div.red').remove();        
    }
    else
    {
    	$('#imgsrc1').next('div.red').remove();
    	$("#imgsrc1").attr("src","images/correct.jpg");
    }    
        });
    	}else
    	{
    	$("#imgsrc1").attr("src","");
    	}
    });

      
});

<% String see =(String) session.getAttribute("sessname");
%>
			
</script>  
</head>
<body>

<jsp:include page="LoginHead.jsp"></jsp:include>

	<div  align="center" style="margin-top: 100px">
	<spr:form action="login.php" commandName="user" method="post" id="myform">
	<fieldset>
	<legend align="center">&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;</legend>
	<table>
	
	<tr>
	 	<td>User Name : </td><td><spr:input path="userName" class="uid" name="uid" value="<%= see%>"/></td><td><span><img id="imgsrc1" src=""/></span></td><td><span id="spanuser"></span></td>
	</tr>
	
	<tr>
	     <td>Password : </td><td><spr:password path="userPass" id="pwd" name="pwd"/></td><td><span id="spanpass"></span></td>
	</tr>
	
	<tr><td> 
        <input type="checkbox" name="remember" id="remember"> Remember me
     </td></tr> 

    <tr>
    	<td colspan="2" align="center"><input type="submit" id="btnlogin" value="Login" /> <input type="reset" value="Reset" /></td>		
	</tr>	
		
	<p id="details"></p>
	
	
	<tr>
		<td align="Left"><a href="registration.php">New Register</a></td> <td align="Right"><a href="forgotpass.php">Forgot Password</a></td>	
	</tr>
</table>
	</fieldset>	
	</div>
	</spr:form>
	
</body>
</html>