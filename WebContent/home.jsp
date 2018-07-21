<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #b4b4b4;
  border: none;
  border-radius: 15px;
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
<jsp:include page="menu.jsp"></jsp:include>
<form>
<div align="center" style="margin-top: 200px">

<table>
<tr>
  <input type="text" name="search" placeholder="Paste Your URL & Search for the products......">

	<td>
		<input type="button" id="searchbox" value="Search">	
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