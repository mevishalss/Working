
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.red {
    color:red;
}

body {
  background-image: url("images/background.jpg");
   
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
    $("#contact").focus();
    $("#contact").blur(function () {
        var contact = $('#contact').val();
        if (contact.length == 0) {
            $('#contact').next('div.red').remove();
            $('#contact').after('<div class="red">E-Mail Address is Required</div>');
        } else {
            $(this).next('div.red').remove();
            return true;
        }
    });
    
    
    $("#contact").blur(function () {
    	var emailreg=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
        var contact = $('#contact').val();

	if (!emailreg.test(contact)) {
    	$('#contact').next('div.red').remove();
        $('#contact').after('<div class="red">Enter Proper Email Address</div>');
    } else {
    	$('#contact').next('div.red').remove();
    }
    });
    
    
    
    $(".email").blur(function () {    	
        value =$(".email").val();    
    	if(value!=""){ 
        $.post("ValidateMailId.php",{"value":value}, function(data, status){
    if(data=="true")
    {	    	
    	alert("true");
    
    	//$("#imgsrc1").attr("src","images/wrong.jpg");
        // $('#imgsrc1').next('div.red').remove(); 
    }
    else
    {
    	alert("click submit button to send passsword your email id");
    
    	//$('#imgsrc1').next('div.red').remove();
    	//$("#imgsrc1").attr("src","images/correct.jpg");
    }    
        });
    	}else
    	{
    		alert("Enter your mail id");
    	
    	//$("#imgsrc1").attr("src","");
    	}
    });

});
			
			
			
			
			
			
</script> 


</head>
<body>
<% 
 String see =(String) session.getAttribute("sessname");
if(see==null)
{
	//response.sendRedirect("prepLog.php");
	RequestDispatcher rd=request.getRequestDispatcher("prepLog.php"); 
	rd.forward(request, response);
}
%>
	<jsp:include page="AdminMenu.jsp"></jsp:include>
	
	<div  align="center" style="margin-top: 100px">
	<form action="forgotpass.php" method="post" >
	<fieldset>
	<legend align="center">&nbsp;&nbsp;&nbsp;FORGOT PASSWORD&nbsp;&nbsp;&nbsp;</legend>
	<table>
	<tr>
	<tr>
	 	<td>Enter Your E-Mail Address: </td><td><input type="text" path="email" class="email" id="contact" name="email"/><td><span><img id="imgsrc1" src=""/></span></td>
	</tr>
	</tr>
	
	 <tr>
    <tr>
    <tr>
		<td colspan="2" align="center"><input type="submit" value="Submit"/></td>
	</tr>
	</tr>
	</tr>
	
	</table>
	</fieldset>
	</form>
	
	
	
	

</body>
</html>