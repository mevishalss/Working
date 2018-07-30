<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
</head>
<body>
<jsp:include page="menu.jsp" ></jsp:include>

<h1 align="center">Work in Progress.....</h1>
</body>
</html>