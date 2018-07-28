<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
</head>
<style type="text/css">
#btn {
    background-color: #e59b12; /* Green */
    border: none;
    color: white;
    padding: 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
   
}
#btn {border-radius: 4px;}

.img:hover {
    transform: scale(1.5);

</style>
<script type="text/javascript">  

     function calculate()
     { 
     		var price=document.getElementById("price").value;
     		var Dpay=document.getElementById("Dpay").value;     		
     		var EMIPrice =price-Dpay;    	
     		var mm=document.getElementById("month").value;     		
     		var result1=EMIPrice/mm;
     		var T_EMI=mm*result1;
     		var intrest = result1+(result1/10) ;
     		document.getElementById("result").innerHTML=intrest;
     		document.getElementById("T_EMI").innerHTML=intrest*mm;
     }
</script>

<body>

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

<div class="container">
  <h1 align="center">Product Details</h1><br><br>
  <div class="row">
    <div class="col-sm-5" align="center" >
      <img src="<%=image %>" class="img">
      <div align="bottom"><table><tr>Offers
      
      
      
      
      
      </tr></table></div>
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
	 	<td><b>Selling Price </b></td><td>: <%=sellprice %></td>
	</tr>		
	<tr>
	 	<td><b>color</b> </td><td>: <%=color %></td>
	</tr>
	<tr><td><b>Detailed Specification  :</b></td></tr>
	<%for(Object o :arr){
		String abc = o.toString();
	%>
	<tr><td></td><td><li> <%=abc %></li> </td></tr>
	<% }%>

	
	<tr><td></td></tr>
	<tr><td></td></tr>
	
	
</table>
<div padding-top: 25px; align="center"><input type="submit" id="btn" value="Apply For Loan"/></button></div>

</div>
    </div>
  </div>
</div>











</body>
</html>