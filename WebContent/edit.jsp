<%@page import="java.util.List"%>
<%@page import="dto.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit page</title>
<script src="scripts/jquery-3.3.1.min.js"></script>
<script src="scripts/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="path/to/date-validator.js"></script>

<script>

$(document).ready(function () {



	 
	var zip = $('.pincode').val();
		if ((zip.length)>= 7 || (zip.length)<=5 ){	    	
	    	$('#spanpincode').next('div.red').remove();
            $('#spanpincode').after('<div class="red">Invalid Pin code(Should have 6 digit)</div>');
	    	if ( zip =( "^[0-9]+$" )){		    	
	    		$('#spanpincode').next('div.red').remove();
	            $('#spanpincode').after('<div class="red">Invalid Pin code(Should have 6 digit)</div>');
		    }
	    }
		else {
        	$('#spanpincode').next('div.red').remove();

		}
		
		var regex = /^[a-zA-Z ]*$/;
		var numreg=/^(10|[1-6])$/;
		var birthreg=/^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$/;
		var mobilereg=/^[7-9][0-9]{9}$/;
		var fname = $(".fname").val();
		var lname = $(".lname").val();
		var city = $(".city").val();
		var state = $(".state").val();
		var yearofcourse = $(".yearofcourse").val();
		var mobile = $(".mobile").val();
		var birthdate = $(".birthdate").val();
		

		if (!birthreg.test(birthdate)) {
        	$('#spanbirthdate').next('div.red').remove();
            $('#spanbirthdate').after('<div class="red">Invalid date(should follow pattern MM/DD/YYYY)</div>');
        } else {
        	$('#spanbirthdate').next('div.red').remove();
        }
		
		if (!mobilereg.test(mobile)) {
        	$('#spanmobile').next('div.red').remove();
            $('#spanmobile').after('<div class="red">Invalid mobile</div>');
        } else {
        	$('#spanmobile').next('div.red').remove();
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
    background-image: url("images/background.jpg");
    e
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
<% List <UserDetails> list = (List) request.getAttribute("list"); 


%>
<jsp:include page="menu.jsp"></jsp:include>

<h1 align="center" id="h1">Edit Profile</h1>

<div align="center" id="editDiv" >
<spr:form action="edited.php" commandName="user"  method="post" >
<%for(UserDetails m : list){ %>
<div align="center">
<fieldset>

<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Personal Information</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>
<td>UserID: </td><td> <spr:input path = "userName"  required="required" disabled="true" id="text" readonly="readonly" value="<%=m.getUserName()%>" Placeholder="User ID" /></td>
</tr>
 <tr>
<td>FirstName : </td><td><spr:input path = "fName" id="text" class="fname"  disabled="true"  placeholder="First Name" value="<%=m.getfName() %>" /></td><td><span  id="fnamemsg"></span></td>
</tr> 
<tr>
<td>LastName: </td><td> <spr:input path = "lName" id="text" class="lname"  disabled="true"  required="required" Placeholder="Last Name" value="<%=m.getlName() %>"/></td><td><span id="lnamemsg"  ></span></td>
</tr>
<tr>
 <td>Birth Date:</td><td><spr:input path = "bithDate" disabled="true" class="birthdate" id="text"  value="<%=m.getBithDate() %>" required="required" /></td><td><span id="spanbirthdate"></span></td>
</tr>
<tr>
<td>Password: </td><td> <spr:input type="password" path="userPass" class="pass" required="required" id="text" Placeholder="Password" /></td>
</tr>
<tr>
<td>Confirm Password: </td><td> <input type="password"  class="conpass" required id="text" required="required" Placeholder="Confirm Password" ></td><td><span id="conpass"></span></td>
</tr>
<tr>
<td>Email-Id: </td><td> <spr:input type ="email" path = "emailId" id="text" disabled="true" required="required" Placeholder="abc@gmail.com"  value="<%=m.getEmailId() %>" /> </td>
</tr>
<tr>
<td>Mobile No: </td><td> <spr:input path = "phoneNo" id="text" class="mobile" required="required" Placeholder="eg:9123456789" value="<%=m.getPhoneNo() %>"/></td><td><span id="spanmobile"></span></td>
</tr>
</table>
</fieldset>
</div>

<div align="center" >
<fieldset>
<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>College Details</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>
<td>College Code: </td><td> <spr:input   path = "CollegeCode" class="cCode"  readonly="readonly" value="<%=m.getCollegeCode()%>" required="required" id="text" Placeholder="College Code" /></td><td><span id="cCode"></span></td>
</tr>

<tr>
<td>College Name: </td><td> <spr:input   path = "CollegeName" class="cName" required="required" id="text"  readonly="readonly" value="<%=m.getCollegeName()%>" Placeholder="College Name" /></td><td><span id="cName"></span></td>
</tr>

<tr>
<td>College PNR: </td><td> <spr:input path = "prnNo" id="text" readonly="readonly" value="<%=m.getPrnNo()%>"  required="required" Placeholder="P123456789" /></td>
</tr>

<tr>
<td>Course: </td><td> <spr:input path = "course" id="text" class="course" readonly="readonly" value="<%=m.getCourse() %>" required="required" Placeholder="Course" /></td><td><span id="course"></span></td>
</tr>


<tr>
<td>Duration of Course: </td><td> <spr:input path = "yearOfCourse" class="yearofcourse"  readonly="readonly" value="<%=m.getYearOfCourse() %>" required="required" id="text" Placeholder="Year of Course" /></td><td><span id="spanyearofcourse"></span></td>
</tr>

</table>
</fieldset>
</div>


<div align="center">
<fieldset  >
<legend align="center"><b><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Address Details</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></legend>
<table>
<tr>
<td>Address: </td><td> <spr:input path = "address"  id="text" required="required" Placeholder="Address" value="<%=m.getAddress() %>" /></td>
</tr>
<tr>
<td>City: </td><td> <spr:input path = "city" id="text" class="city" required="required" Placeholder="City" value="<%=m.getCity() %>" /></td><td><span id="spancity"></span></td>
</tr>
<tr>
<td>State: </td><td> <spr:input path = "state" id="text" class="state" value="<%=m.getState() %>" required="required" Placeholder="Maharashtra" /></td><td><span id="spanstate"></span></td>
</tr>
<tr>
<td>PinCode: </td><td> <spr:input path = "pinCode" id="text" class="pincode"  value="<%=m.getPinCode() %>" required="required" Placeholder="PinCode" /></td><td><span id="spanpincode"></span></td>
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

<%} %>


</spr:form>



	
</body>
</html>