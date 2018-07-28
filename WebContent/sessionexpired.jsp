<%@page import="java.io.Console"%>
<% 
session.removeAttribute("sessname");
session.invalidate();
out.print("session expired");
response.sendRedirect("prepLog.php");

%>