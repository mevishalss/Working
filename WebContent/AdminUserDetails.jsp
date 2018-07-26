<%@page import="dto.User"%>
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

editDiv {
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
<% List <UserDetails> list = (List) request.getAttribute("list"); %>
<jsp:include page="menu.jsp"></jsp:include>


<div align="center" id="paymentDiv" >
<spr:form action="paymentDetails.php" commandName="user"  method="post" >
<fieldset>
<legend><b><u><font size="5"> Payment Details</font></u></b></legend>
<div align="right" id="userdetail" >
<tr>

</tr>
</div>
<%for(UserDetails m : list){ %>
<table>
 <tr>
<td>Name : </td><td><%=m.getfName() %>  <%=  m.getlName() %></td>
</tr>
 

<tr>
 <td>Birth Date:</td><td><%=m.getBithDate() %></td>
</tr>

<tr>
<td>UserID: </td><td ><spr:hidden path="userName" value="<%=m.getUserName()%>"></spr:hidden><%=m.getUserName()%></td>
</tr>

<tr>
<td>College Code: </td><td><%=m.getCollegeCode()%></td>
</tr>

<tr>
<td>College Name: </td><td> <%=m.getCollegeName()%></td>
</tr>

<tr>
<td>College PNR: </td><td> <%=m.getPrnNo()%></td>
</tr>

<tr>
<td>Course: </td><td> <%=m.getCourse() %></td>
</tr>

<tr>
<td>EmailId: </td><td><%=m.getEmailId() %> </td>
</tr>
<tr>
<td>Mobile No: </td><td> <%=m.getPhoneNo() %></td>
</tr>
<tr>
<td>Year of Course: </td><td> <%=m.getYearOfCourse() %></td>
</tr>
<tr>
<td>Address: </td><td> <%=m.getAddress() %> <%=  m.getCity() %> <%= m.getState() %> <%= m.getPinCode() %></td>
</tr>
<tr>
<td></td><td><input type="submit" id="submit" onclick="paymentDetails(<%= m.getUserName() %>)" value="Show Payment Details" /></td>
</tr>

</table>
<%} %>
</fieldset>

</spr:form>
</div>


	
</body>
</html>>