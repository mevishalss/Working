<%@page import="org.springframework.messaging.simp.user.UserSessionRegistry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
 Cookie UserName=new Cookie("name","");  
        UserName.setMaxAge(0);  
        response.addCookie(UserName);  
        
        
        Cookie UserPass=new Cookie("UserPass","");  
        UserPass.setMaxAge(0);  
        response.addCookie(UserPass);  
         out.print("you are successfully logged out!");  
         %>
    <p>Welcome <%= UserName.toString() %></p>  
    <p>Welcome <%= UserName.toString() %></p>  
</body>
</html>