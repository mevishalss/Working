<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dto.UserDetails"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String uname=(String)request.getAttribute("uid"); 
String pwd=(String)request.getAttribute("pwd");
//out.print("Welcome "+ uname);
session.setAttribute("sessname",uname);
response.sendRedirect("LoginPage.php");


%>
</body>
</html>