<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<jsp:include page="LoginHead.jsp"></jsp:include>

<div  align="center" style="margin-top: 100px">
	<spr:form action="edit.php" commandName="edituser" method="post" >
	<fieldset>
	<legend>Edit Profile</legend>
	<table>
	<tr>
	<tr>
	 	<td>User Name : </td><td><spr:input path="userName" readonly="readonly"/></td>
	</tr>
	</tr>
	<tr>
	<tr>
	     <td>Password : </td><td><spr:input path="userPass"/></td>
	</tr>
	</tr>
	<tr>
	
	
	
	<tr>
	<tr>
	     <td>First Name </td><td><spr:input path="fName"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Last Name: </td><td><spr:input path="lName"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Mobile Number: </td><td><spr:input path="phoneNo"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Date Of Birth : </td><td><spr:input path="birthDate"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Email Id: </td><td><spr:input path="emailId"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>University PRN Number: </td><td><spr:input path="prnNo" readonly="readonly"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Course Name: </td><td><spr:input path="course" readonly="readonly"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Year Of Course </td><td><spr:input path="yearOfCourse" readonly="readonly"/></td>
	</tr>
	</tr>
	
	
	<tr>
	<tr>
	 	<td>Address: </td><td><spr:input path="address"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>City : </td><td><spr:input path="city"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>State : </td><td><spr:input path="state"/></td>
	</tr>
	</tr>
	
	<tr>
	<tr>
	 	<td>Pin Code : </td><td><spr:input path="pinCode"/></td>
	</tr>
	</tr>
	
	
    <tr>
    <tr>
    <tr>
		<td colspan="2" align="center"><input type="reset" value="Cancel" /> </td>
	</tr>
	</tr>
	</tr>
    
    <tr>
    <tr>
    <tr>
		<td colspan="2" align="center"><input type="submit" value="Update" /> </td>
	</tr>
	</tr>
	</tr>
	
	</table> 
		
		</div>
		
		</fieldset>
	</spr:form>
</body>
</html>