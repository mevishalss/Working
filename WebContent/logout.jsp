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
Cookie[] cookies = request.getCookies();

        for(int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("UserName")) {
             cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
}
}
}

<%
session.invalidate();
response.sendRedirect("login.jsp");
%>
    
</body>
</html>