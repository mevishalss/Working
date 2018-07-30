<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
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
<style type="text/css">
input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    width: 50%;    
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('images/searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}
input[type=text]:focus {
    width: 80%;
}

#searchbox {
  display: inline-block;
  padding: 12px 20px;
  font-size: 17px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 11px;
  box-shadow: 0 9px #999;
}

#searchbox:hover {background-color: #3c3c3c}

#searchbox:active {
  background-color: #b4b4b4;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


</style>

</head>
<body>

<% String uid = (String) request.getAttribute("user"); 
 String see =(String) session.getAttribute("sessname");
//System.out.print(see);

if(see==null)
{
	//response.sendRedirect("prepLog.php");
	RequestDispatcher rd=request.getRequestDispatcher("prepLog.php"); 
	rd.forward(request, response);
}
%>







<jsp:include page="menu.jsp"></jsp:include>
<form action="searchProduct.php" method="post">
<div align="center" style="margin-top: 200px">
 <div align="center"><img src="images/final.png" ></div>
 <br><br>
<table>
<tr>
  <input type="text" name="search" placeholder="Paste Your URL & Search for the products......">
	
	<td>
	
		<input type="submit" id="searchbox" value="Search" name="searchbtn">
		
		<input type="hidden" id="uid" value="<%=uid%>" name="uid">		
	</td>
</tr>


</table>
</div>
<br><br>
<br>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</form>
</body>
</html>