<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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


<div  align="center" style="margin-top: 100px">
	
	<fieldset>
	<legend>EMI Details</legend>
	<table>
	<tr>
	<tr>
	 	<td>Product Price: </td><td><input type="number" id="price" name="EPrice"/></td>
	</tr>
	</tr>
	<tr>
	 	<td>Down Payment: </td><td><input type="number" id="Dpay" name="Dpayment"/></td>
	</tr>
	
	<tr><td>Month :</td><td><select id="month">
  <option value="3">3</option>
  <option value="6">6</option>
   <option value="9">9</option>
  <option value="12">12</option>
</select></td><td></td>

	</tr>
	<tr>
	 	<td colspan="2" align="center"><button id="calculate"  onclick="calculate()">calculate</button></td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	
	</table>
	<table border="1" >
	<tr><td style="padding:2px">monthly EMI</td><td><span id="result"></span></td></tr>
	<tr><td style="padding:2px">Total EMI</td><td><span id="T_EMI"></span></td></tr>
</table>
</fieldset>

</div>





</body>
</html>