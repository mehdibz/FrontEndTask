<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.*"
	import="javax.sql.*" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSource" driver="org.gjt.mm.mysql.Driver"

url="jdbc:mysql://localhost:3306/classicmodels" user="root" password="admin" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
public String filter(String x) {
	String query;

	if (x != ""){
		query = " WHERE customerName LIKE '%" + x + "%' ";	
	}
	else{
		query = "";
	}
	return query;
}
%>

<sql:query var = "users" dataSource="${dataSource}">
	SELECT * FROM Customers
      
</sql:query>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/style.css">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    	<script type="text/javascript">
		 function ChangeColor(tableRow, highLight)
		  {
		    if (highLight)
		    {
		      tableRow.style.backgroundColor = '#dcfac9';
		    }
		    else
		    {
		      tableRow.style.backgroundColor = 'white';
		    }
		  }
		  function ChooseRecord(e)
		  {
	    	   var bid = e.id; // button ID 
   		        $.ajax({
   		            type: "post",
   		            url: "DataDiscoveryServlet", 
   		            data: {
   	   		                rowid: bid
   		            	  },
   		            success: function(msg){      
   		                    //if(msg == "success")
   		                    //alert(msg);
   		                    $("#resDiv").text(msg);
   		                   // window.location.reload();
   		            }
   		        });	
		  }
	  	</script>
	</head>
<body onload="filter()">
	<div class="filter">
		<label>Filter by Company name: <input type="text" id="ft" onchange=filter(this) ></label>		
	</div>
	<div id="resDiv"></div>

	<div class="table-wrapper1" id="srcTable">
         <table cellpadding="2" cellspacing="0" class="tbl_reg">
	        <tr>
	        	<th width="41" align="center">Customer #</th>	
	         	<th width="41" align="center">Name</th>
	         	<th width="25" align="center">Last Name</th>
	         	<th width="25" align="center">First Name</th>
	         	<th width="12" align="center">Phone</th>
	         	<th width="31" align="center">Address Line1</th>
	         	<th width="43" align="center">Address Line2</th>
	         	<th width="20" align="center">City</th>
	         	<th width="15" align="center">State</th>
	         	<th width="32" align="center">Postal Code</th>
	         	<th width="20" align="center">Country</th>
	         	<th width="20" align="center">SalesRepEmpNum</th>
	         	<th width="32" align="center">Credit Limit</th>
	        </tr>
	     <tbody>   
         <c:forEach var="row" items="${users.rows}">
  		 	<tr id="${row.customerNumber}" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);" onclick=ChooseRecord(this) >
               <td width="10"><c:out value="${row.customerNumber}"/></td>
               <td width="150"><c:out value="${row.customerName}"/></td>
               <td width="100"><c:out value="${row.contactLastName}"/></td>
               <td width="100"><c:out value="${row.contactFirstName}"/></td>
               <td width="12"><c:out value="${row.phone}"/></td>
               <td width="150"><c:out value="${row.addressLine1}"/></td>
               <td width="150"><c:out value="${row.addressLine2}"/></td>
               <td width="20"><c:out value="${row.city}"/></td>
               <td width="12"><c:out value="${row.state}"/></td>
               <td width="8"><c:out value="${row.postalCode}"/></td>
               <td width="30"><c:out value="${row.country}"/></td>
               <td width="10"><c:out value="${row.salesRepEmployeeNumber}"/></td>
               <td width="28"><c:out value="${row.creditLimit}"/></td>
           	</tr>
         </c:forEach >
         </tbody>
		</table>
	</div>

	<div class="btn_space">
	</div>

	<div class="table-wrapper2">
         <table cellpadding="2" cellspacing="0" class="tbl_reg">
	        <tr>
	        	<th width="41" align="center">Customer #</th>	
	         	<th width="41" align="center">Name</th>
	         	<th width="25" align="center">Last Name</th>
	         	<th width="25" align="center">First Name</th>
	         	<th width="12" align="center">Phone</th>
	         	<th width="31" align="center">Address Line1</th>
	         	<th width="43" align="center">Address Line2</th>
	         	<th width="20" align="center">City</th>
	         	<th width="15" align="center">State</th>
	         	<th width="32" align="center">Postal Code</th>
	         	<th width="20" align="center">Country</th>
	         	<th width="20" align="center">SalesRepEmpNum</th>
	         	<th width="32" align="center">Credit Limit</th>
	        </tr>
         <c:forEach var="row" items="${users.rows}">
  		 	<tr onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);" onclick=DoNav(this) >
               <td width="10"><c:out value="${row.customerNumber}"/></td>
               <td width="150"><c:out value="${row.customerName}"/></td>
               <td width="100"><c:out value="${row.contactLastName}"/></td>
               <td width="100"><c:out value="${row.contactFirstName}"/></td>
               <td width="12"><c:out value="${row.phone}"/></td>
               <td width="150"><c:out value="${row.addressLine1}"/></td>
               <td width="150"><c:out value="${row.addressLine2}"/></td>
               <td width="20"><c:out value="${row.city}"/></td>
               <td width="12"><c:out value="${row.state}"/></td>
               <td width="8"><c:out value="${row.postalCode}"/></td>
               <td width="30"><c:out value="${row.country}"/></td>
               <td width="10"><c:out value="${row.salesRepEmployeeNumber}"/></td>
               <td width="28"><c:out value="${row.creditLimit}"/></td>
           	</tr>
         </c:forEach >
		</table>
	</div>
</body>
</html>