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
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
			$(document).ready(function () {
    $("#contact").focus();
    $("#contact").blur(function () {
        var contact = $('#contact').val();
        if (contact.length == 0) {
            $('#contact').next('div.red').remove();
            $('#contact').after('<div class="red">Contact Number is Required</div>');
        } else {
            $(this).next('div.red').remove();
            return true;
        }
    });

});
			
			
			$(document).ready(function () {
				  //called when key is pressed in textbox
				  $("#contact").keypress(function (e) {
				     //if the letter is not digit then display error and don't type anything
				     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
				        //display error message
				        $("#errmsg").html("Digits Only").show().fadeOut("slow");
				               return false;
				    }
				   });
				});
			
			
			
</script> 


</head>
<body>
	
	<jsp:include page="AdminMenu.jsp"></jsp:include>
	
	<div  align="center" style="margin-top: 100px">
	<form action="forgotpass.php" method="post" >
	<fieldset>
	<legend>FORGOT PASSWORD</legend>
	<table>
	<tr>
	<tr>
	 	<td>Contact Number : </td><td><input type="text" path="contactNo" id="contact" name="contact"/><span id="errmsg"> </span></td>
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