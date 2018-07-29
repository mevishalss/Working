
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product_Details </title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
</head>
<style type="text/css">
.btn {
    background-color: #e59b12; /* Green */
    border: none;
    color: white;
    padding: 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 3px 2px;
    cursor: pointer;
   
}

 #imgdiv {
    width: 800px;
    height:450px;
    color: navy;
    background-color: #d4d8db;
    border-style: inset;
    padding: 5px;
 }

.btn {border-radius: 4px;}

.img:hover {
    transform: scale(1.3);

</style>
<script type="text/javascript">  

     function calculate()
     { 
  		var Dpay=document.getElementById("Dpay").value;
 		var price=document.getElementById("sellingPrice").value;
 		var minamt=3*(price/10);	
		if(Dpay<=price){
  			if(Dpay>=minamt)
  	  		{
  	  			var EMIPrice =price-Dpay;         	
     			var mm=document.getElementById("month").value;     	    		
     			var result1=EMIPrice/mm;     
     			var T_EMI=mm*result1;     	
     			var interest = result1+(result1/10) ;     		
     			document.getElementById("result").innerHTML=Math.ceil(interest);
      			if(Dpay>=minamt)         		
     			document.getElementById("T_EMI").innerHTML=Math.ceil(interest*mm);
      			else
          		{
      				var v="Minimum 30% Downpayment Required";
      				document.getElementById("T_EMI").innerHTML=v;	
      			}
  		}
  		else{
  	  		var v="Minimum 30% Downpayment Required";
     		document.getElementById("result").innerHTML=v;
      		document.getElementById("T_EMI").innerHTML="";	
     		
  		}
}
else
	{
	alert("Invalid Downpayment Amount");
	}
  	  		
     }
</script>

<body>
<jsp:include page="menu.jsp" ></jsp:include>


<%

 String see =(String) session.getAttribute("sessname");
if(see==null)
{
	//response.sendRedirect("prepLog.php");
	RequestDispatcher rd=request.getRequestDispatcher("prepLog.php"); 
	rd.forward(request, response);
}
%>

<% 
String productid=(String)request.getAttribute("productid");
float sellprice=(float)request.getAttribute("sellprice");
String title=(String)request.getAttribute("title");
float maxprice=(float)request.getAttribute("maxprice");
String currency=(String)request.getAttribute("currenncy");
float FlipkartSellingPrice=(float)request.getAttribute("sellprice");
float specialprice=(float)request.getAttribute("specialprice");
String producturl=(String)request.getAttribute("producturl");
String brand=(String)request.getAttribute("brand");
boolean instock=(boolean)request.getAttribute("instock");
boolean codavailable=(boolean)request.getAttribute("codavailable");
float discountpercent=(float)request.getAttribute("discountpercent");
String size=(String)request.getAttribute("size");
String color=(String)request.getAttribute("color");
String Storage=(String)request.getAttribute("Storage");
String displaysize=(String)request.getAttribute("displaysize");
float shippingcharges=(float)request.getAttribute("shippingcharges");
String estimateddeliverytime=(String)request.getAttribute("estimateddeliverytime");
String sellername=(String)request.getAttribute("sellername");
float selleravgrating=(float)request.getAttribute("selleravgrating");
String booklanguage=(String)request.getAttribute("language");
String bookbinding=(String)request.getAttribute("binding");
String bookpages=(String)request.getAttribute("pages");
String image=(String)request.getAttribute("image");
String bookpublisher=(String)request.getAttribute("publisher");
float bookyear=(float)request.getAttribute("year");
List<Object> arr = (List) request.getAttribute("categoryspeci");
List<Object> off=(List) request.getAttribute("offers");
%>
<form action="paymentpage.jsp" method="post">
<div class="container">
  <h1 align="center"><i><u><font size="5" color="BlueViolet">Product Details</font></u></i></h1><br><br>
  <div class="row">
    <div class="col-sm-5" id="imgdiv" align="center" >
      <img src="<%=image %>" class="img">

    </div>
    <div class="col-sm-7" ">
      <div  align="center" style="margin-top: 50px">
	


	<table>
<tr>
	 	<td><b>Title</b> </td><td> : <%=title %></td>
	</tr>
	<tr>
	 	<td><b>brand </b></td><td>: <%=brand %> </td>
	</tr>
	<tr>
	 	<td><b>Selling Price</b></td><td>: <b>&#x20B9;&nbsp;<%=sellprice %></b></td><input type="hidden" id="sellingPrice" value="<%=sellprice %>">
	</tr>		
	<tr>
	 	<td><b>color</b> </td><td>: <%=color %></td>
	</tr>
	<tr><td><b>Detailed Specification  </b></td></tr>
	<%for(Object o :arr){
		String abc = o.toString();
	%>
	<tr><td></td><td><li> <%=abc %></li> </td></tr>
	<% }%>

	
	<tr></tr>
	<tr></tr>
	<tr><td><b>DownPayment Amount &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>(Min 30%):</b></td><td><input type="text" id="Dpay"></td></tr>
		<tr><td><b>Month :</b></td><td><select id="month">
  <option value="3">3</option>
  <option value="6">6</option>
   <option value="9">9</option>
  <option value="12">12</option>
</select></td><td></td>

	</tr>
	
</table>
	
</table>
<table><tr>
	 	<td colspan="2" align="center"><button id="calculate"  class="btn" onclick="calculate()">Calculate</button></td>
	</tr>
	<tr></tr>
	<tr></tr>	
	</table>
	<table border="1" >
	<tr><td style="padding:4px">Monthly EMI</td><td colspan="2"><span id="result"></span></td></tr>
	<tr><td style="padding:4px">Total EMI</td><td colspan="2"><span id="T_EMI"></span></td></tr></table>
<div padding-top: 25px; align="center"><input type="submit" class="btn" value="Apply For Loan"/></button></div>

</div>
    </div>
  </div>
</div>


</form>








</body>
</html>