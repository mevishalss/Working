
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="scripts/jquery-3.3.1.min.js"></script>


<script>

$(document).ready(function () {


$("#submit").click(function(){
	$(".conpass").focus();
	 if ($('.pass').val() !== $('.conpass').val()){
		 $('#conpass').next('div.red').remove();
         $('#conpass').after('<div class="red">You password does not match</div>');
		 }
	 else{
     	$('#conpass').next('div.red').remove();
	 }
	 
	var zip = $('.pincode').val();
		if ((zip.length)>= 7 || (zip.length)<=5 ){	    	
	    	$('#spanpincode').next('div.red').remove();
            $('#spanpincode').after('<div class="red">Invalid Pin code</div>');
	    	if ( zip =( "^[0-9]+$" )){		    	
	    		$('#spanpincode').next('div.red').remove();
	            $('#spanpincode').after('<div class="red">Invalid Pin code</div>');
		    }
	    }
		else {
        	$('#spanpincode').next('div.red').remove();

		}
		
		var regex = /^[a-zA-Z ]*$/;
		var regex1 = /^[a-zA-Z.,]*$/;

		var numreg=/^(10|[1-6])$/;
		var regcollge=/^[0-9]/;
		var birthreg=/(?:0[1-9]|[12][0-9]|3[01])\/(?:0[1-9]|1[0-2])\/(?:19|20\d{2})/;
		var fname = $(".fname").val();
		var lname = $(".lname").val();
		var city = $(".city").val();
		var state = $(".state").val();
		var yearofcourse = $(".yearofcourse").val();
		var mobile = $(".mobile").val();
		var birthdate = $(".birthdate").val();
		var collegename=$(".cName").val();
		var collegecode=$(".cCode").val();

		
		
		

		if (!birthreg.test(birthdate)) {
        	$('#spanbirthdate').next('div.red').remove();
            $('#spanbirthdate').after('<div class="red">Invalid date(DD/MM/YYYY)</div>');
        } else {
        	$('#spanbirthdate').next('div.red').remove();
        }
		
		
		
		if (!regcollge.test(collegecode)) {
        	$('#spancCode').next('div.red').remove();
            $('#spancCode').after('<div class="red">Invalid College Code</div>');
        } else {
        	$('#spancCode').next('div.red').remove();
        }
		 
		
		if (!regex1.test(collegename)) {
        	$('#spancName').next('div.red').remove();
            $('#spancName').after('<div class="red">Invalid College Name</div>');
        } else {
        	$('#spancName').next('div.red').remove();
        }
		
		
		
		//var aa = regex.test(fname);
         if (!regex.test(fname)) {
        	$('#fnamemsg').next('div.red').remove();
            $('#fnamemsg').after('<div class="red">Please Enter Proper Name</div>');
        } else {
        	$('#fnamemsg').next('div.red').remove();
        }
         
        
         
         if (!regex.test(city)) {
         	$('#spancity').next('div.red').remove();
             $('#spancity').after('<div class="red">Invalid City</div>');
         } else {
         	$('#spancity').next('div.red').remove();
         }
                  
         if (!regex.test(state)) {
          	$('#spanstate').next('div.red').remove();
              $('#spanstate').after('<div class="red">Invalid State</div>');
          } else {
          	$('#spanstate').next('div.red').remove();
          }
         
        if (!regex.test(lname)) {
        	$('#lnamemsg').next('div.red').remove();
            $('#lnamemsg').after('<div class="red">Please Enter Proper Name</div>');
        } else {
        	$('#lnamemsg').next('div.red').remove();
        }
        
        if (!numreg.test(yearofcourse)) {
        	$('#spanyearofcourse').next('div.red').remove();
            $('#spanyearofcourse').after('<div class="red">Course Year is Not Valid</div>');
        } else {
        	$('#spanyearofcourse').next('div.red').remove();
        }
        
});

$(".uid").blur(function () {
	
	var uidreg=/^(?=.{6,})/;
    value =$(".uid").val();    
	if(value!=""){ 

    $.post("ValidateUserId.php",{"value":value}, function(data, status){
if(data=="true")
{	
	if (!uidreg.test(value)) {
		$('#imgsrc1').next('div.red').remove();
		$("#imgsrc1").attr("src","images/wrong.jpg");
    } else {
    	$("#imgsrc1").attr("src","images/correct.jpg");
    	$('#imgsrc1').next('div.red').remove();
    }	
}
else
{
	$('#imgsrc1').next('div.red').remove();
	$("#imgsrc1").attr("src","images/wrong.jpg");
}    
    });
	}else
	{
	$("#imgsrc1").attr("src","");
	}
});


$(".email").blur(function () {
	var emailreg=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	$('#imgsrc2').next('div.red').remove();

    value =$(".email").val();    
	if(value!=""){ 
    $.post("ValidateMailId.php",{"value":value}, function(data, status){
if(data=="true")
{	
	if (!emailreg.test(value)) {
		$('#imgsrc2').next('div.red').remove();
		$("#imgsrc2").attr("src","images/wrong.jpg");
    } else {
    	$("#imgsrc2").attr("src","images/correct.jpg");
    	$('#imgsrc2').next('div.red').remove();
    }	
}
else
{
	$('#imgsrc2').next('div.red').remove();
	$("#imgsrc2").attr("src","images/wrong.jpg");
}    
 });
	}else
	{
	$("#imgsrc2").attr("src","");
	}
 
});

$(".mobile").blur(function () {   
	var mobilereg=/^[7-9][0-9]{9}$/;
	$('#imgsrc3').next('div.red').remove();
	value =$(".mobile").val();  
	if(value!=""){ 
    $.post("ValidateMobile.php",{"value":value}, function(data, status){
if(data=="true")
{	    	

	if (!mobilereg.test(value)) {
    	$('#imgsrc3').next('div.red').remove();
    	$("#imgsrc3").attr("src","images/wrong.jpg");	
    } else {
    	$("#imgsrc3").attr("src","images/correct.jpg");
    	$('#imgsrc3').next('div.red').remove();
    }	
}
else
{
	$('#imgsrc3').next('div.red').remove();
	$("#imgsrc3").attr("src","images/wrong.jpg");	
}    
 });
	}else
		{
		$("#imgsrc3").attr("src","");
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
  padding: 11px 20px;
  font-size: 18px;
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
    background-image: url("images/background.jpg");
    
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
    }
    
    legend
    {
       color: #5f97ef;   
    }
 #h1 {
    color: #164084;
    font-family: verdana;
    font-size: 150%;
}
</style>
</head>




<body>


<jsp:include page="LoginHead.jsp"></jsp:include>
<spr:form action="registrationpage.php"  method="post" commandName="user">
<h1 align="center" id="h1">Registration Page</h1>
<div align="center" >
<fieldset>

<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Information&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>

<td>UserID: </td><td> <spr:input path = "userName" required="required" class="uid" id="text" Placeholder="User ID" /></td><td><span><img id="imgsrc1" src=""/></span></td>
</tr>
 <tr>

<td>FirstName : </td><td><spr:input path = "fName" id="text" class="fname" required="required"  placeholder="First Name"/></td><td><span class="fnameclass" id="fnamemsg"></span></td>
</tr>
<tr>
<td>LastName: </td><td> <spr:input path = "lName" id="text" class="lname" required="required" Placeholder="Last Name" /></td><td><span id="lnamemsg"></span></td>
</tr>
<tr>
 <td>Birth Date:</td><td><spr:input path = "bithDate" id="text" class="birthdate" required="required" Placeholder="(DD/MM/YYYY)" /></td><td><span id="spanbirthdate"></span></td>
</tr>

<tr>
<td>Password: </td><td> <spr:input type="password" path="userPass" class="pass" required="required" id="text" Placeholder="Password" /></td>
</tr>
<tr>
<td>Confirm Password: </td><td> <input type="password"  class="conpass" required="required" id="text" Placeholder="Confirm Password" /></td><td><span id="conpass"></span></td>
</tr>
<tr>

<td>EmailId: </td><td> <spr:input type ="email" path = "emailId" id="text" class="email" required="required" Placeholder="abc@gmail.com" /></td><td><span><img id="imgsrc2" src=""/></span></td>
</tr>
<tr>

<td>Mobile No: </td><td> <spr:input path = "phoneNo" id="text"  class="mobile" required="required" Placeholder="9123456789" /></td><td><span><img id="imgsrc3" src=""/></span></td>
</tr>
</table>
</fieldset>
</div>

<div align="center" >
<fieldset>
<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;College Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>
<td>College Code: </td><td> <spr:input type="text"  path = "CollegeCode" class="cCode"  required="required" id="text" Placeholder="College Code" /></td><td><span id="spancCode"></span></td>
</tr>
<tr>
<td>College Name: </td><td> <spr:input type="text"  path = "CollegeName" class="cName" required="required" id="text" Placeholder="College Name" /></td><td><span id="spancName"></span></td>
</tr>
<tr>
<td>College PNR: </td><td> <spr:input path = "prnNo" id="text"  required="required" Placeholder="P123456789" /></td>
</tr>
<tr>
<td>Course: </td><td> <spr:input path = "course" id="text" class="course" required="required" Placeholder="Course" /></td><td><span id="course"></span></td>
</tr>

<tr>

<td>Year of Course: </td><td> <spr:input path = "yearOfCourse" class="yearofcourse" required="required" id="text" Placeholder="Year of Course" /></td><td><span id="spanyearofcourse"></span></td>
</tr>
</table>
</fieldset>
</div>


<div align="center">
<fieldset >
<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>
<td>Address: </td><td> <spr:input path = "address"  id="text" required="required" Placeholder="Address" /></td>
</tr>
<tr>
<td>City: </td><td> <spr:input path = "city" id="text" class="city" required="required" Placeholder="City" /></td><td><span id="spancity"></span></td>
</tr>
<tr>
<td>State: </td><td> <spr:input path = "state" id="text" class="state" required="required" Placeholder="Maharashtra" /></td><td><span id="spanstate"></span></td>
</tr>
<tr>
<td>PinCode: </td><td> <spr:input path = "pinCode" id="text" class="pincode" required="required" Placeholder="PinCode" /></td><td><span id="spanpincode"></span></td>
</tr>
</table>
</fieldset>
</div>
<div align="center">
<table>
<tr>
<td></td><td><input type="submit" id="submit" value="Save" /></td>
</tr>	
</table>
</div>
	
	
	</spr:form>
	
</body>
</html>