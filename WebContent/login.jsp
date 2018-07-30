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


body {
  background-image: url("images/background.jpg");
   
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
    width: 700px;
    height: auto;   
}
    
legend
{
    color: #5f97ef;   
}

.myButton {
	-moz-box-shadow: 3px 4px 0px 0px #1564ad;
	-webkit-box-shadow: 3px 4px 0px 0px #1564ad;
	box-shadow: 3px 4px 0px 0px #1564ad;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	border:1px solid #337bc4;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:8px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
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
	//System.out.print(see);
	
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
	 	<td>User Name : </td><td><spr:input path="userName" class="uid" name="uid"/></td><td><span><img id="imgsrc1" src=""/></span></td><td><span id="spanuser"></span></td>
	</tr>
	
	<tr>
	     <td>Password : </td><td><spr:password path="userPass" id="pwd" name="pwd"/></td><td><span id="spanpass"></span></td>
	</tr>
	
	<tr><td> </td></tr> 
	<tr><td> </td></tr> 
	<tr><td> </td></tr> 
	<tr><td> </td></tr> 

    <tr>
    	<td colspan="2" align="center"><input type="submit" id="btnlogin" class="myButton" value="Login" /> <input type="reset" value="Reset" class="myButton"/></td>		
	</tr>	
		
	<p id="details"></p>
	
	<tr><td> </td></tr> 
	<tr><td> </td></tr> 
	<tr><td> </td></tr> 
	<tr>
		<td align="Left"><a href="registration.php">New Register</a></td> <td align="Right"><a href="forgotpass1.php">Forgot Password</a></td>	
	</tr>
</table>

	</fieldset>	
	</div>
	</spr:form>
</body>
</html>