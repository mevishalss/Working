<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

$(document).ready(function () {


	$("#submit").click(function(){
		$(".conpass").focus();
		 if ($('.pass').val() !== $('.conpass').val()){
			 $('#conpass').next('div.red').remove();
	         $('#conpass').after('<div class="red">You password does not match the confirmed password</div>');
			 }
		 else{
	     	$('#conpass').next('div.red').remove();
		 }
	});
	
});

</script>

<style type="text/css">
.red {
    color:red;
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

div {
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
<body>
<jsp:include page="LoginHead.jsp"></jsp:include>

<div align="center" >
<form action="changePassword.php"  method="post" >
<fieldset>
<legend><b><u><font size="5">Change Password</font></u></b></legend>
<table>
<tr>
<td>Password: </td><td> <input type="password" path="userPass" class="pass" required id="text"  Placeholder="Password" ></td>
</tr>
<tr>
<td>Confirm Password: </td><td> <input type="password"  class="conpass" required id="text" Placeholder="Confirm Password" ></td><td><span id="conpass"></span></td>
</tr>
<tr>
<td></td><td><input type="submit" id="submit" value="Save" /></td>
</tr>	
</table>
</fieldset>
</form>
</body>
</html>