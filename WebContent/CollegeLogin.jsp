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
//new College Login


//new College Login
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
fieldset { 
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
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
			$(document).ready(function () {
    $("#cuid").focus();
    $("#cuid").blur(function () {
        var name = $('#cuid').val();
        if (name.length == 0) {
            $('#cuid').next('div.red').remove();
            $('#cuid').after('<div class="red">User Name is Required</div>');
        } else {
            $(this).next('div.red').remove();
            return true;
        }
    });
    $("#cpwd").blur(function () {
        var password = $('#cpwd').val();
        if (password.length == 0) {
            $('#cpwd').next('div.red').remove();
            $('#cpwd').after('<div class="red">Password is Required</div>');
            return false;
        } else {
            $('#cpwd').next('div.red').remove();
            return true;
        }
    });
});
</script> 


</head>
<body>


<jsp:include page="collegeMenu.jsp"></jsp:include>
	<div  align="center" style="margin-top: 100px">
	<spr:form action="MLogin.php" commandName="collegedto" method="post" >
	<fieldset>
	<legend align="center">&nbsp;&nbsp;&nbsp;COLLEGE LOGIN&nbsp;&nbsp;&nbsp;</legend>
	<table>
	
	
	<tr>
	 	<td>User Name : </td><td><spr:input path="userid" id="cuid" name="cuid"/></td>
	</tr>
	
	
	<tr>
	     <td>Password : </td><td><spr:password path="password" id="cpwd" name="cpwd"/></td>
	</tr>
	

    <tr>
		<td colspan="2" align="center"><input type="submit" value="Login" class="myButton" /> <input type="reset" value="Reset" class="myButton" /></td>
	</tr>
	
<tr>
		<td align="Left">
		</td> <td align="Right"><a href="url">Forgot Password</a></td>
	</tr>

	</table> 
		
		
		
		</fieldset>
	</spr:form>
	</div>
</body>
</html>