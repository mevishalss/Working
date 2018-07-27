<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

#logoutLblPos{
   position:fixed;
   right:10px;
   top:5px;
   margin:50px;
}

#logoutLblPos{
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  color: #fff;
  background-color: #FF0000;
  border: none;
  border-radius: 15px;
}

* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
  
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  .header-right {
    float: none;
  }
}

h3 { color: #f2f2f2; background: #ff4a4a; font-size: 40px; line-height: 45px; font-weight: 500; margin: 0 5px 5px; float: left; padding: 10px; margin: 0 5px 5px; font-family: 'Libre Baskerville', serif;margin-left: 80px; }
</style>
</head>
<body>

<div class="header">
<h3><a href ="home.jsp">EMI POOL</a></h3>
  <div class="header-right">
    <a class="active" href="home.php">Home</a>
    <a href="#contact">My Profile</a>
    <a href="orderdetails.php">My Orders</a>
        <a href="paymentdetails.php">My Installment</a>
    <a href="edit.php">Edit Profile</a>
        <a href="sessionexpired.php">Logout</a>
    
  </div>
</div>


</body>
</html>