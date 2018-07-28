<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.*"
	import="javax.sql.*" import="java.util.*" import="model.Orders" import="model.Customers"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
	
<% String user=null;
	try{
		session = request.getSession();
		user = session.getAttribute("userName").toString();
		if(user.length() ==0){
			response.sendRedirect("login.jsp");
		}
	}catch(Exception e){
		out.println(e.toString());
		response.sendRedirect("login.jsp");
	}
%>

<sql:setDataSource var="dataSource" driver="org.gjt.mm.mysql.Driver" url="jdbc:mysql://localhost:3306/classicmodels" user="root" password="admin" scope="session" />
<sql:query var = "users" dataSource="${dataSource}">
	SELECT * FROM customers
</sql:query>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="css/style.css">
		<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
    	<script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
    	<script type="text/javascript" src="resources/js/scripts.js"></script>
	</head>
<body onload="loadPage(this)">
	<div id="UserTitle">
		<label id="uTitle"> Welcome back <%= user %></label>
	</div>
		<table>
			<tr>
				<td>
					<label for="srcTableFrame">Customers Table:</label>
				</td>
				<td>
					<div class="btn_space"></div>
				</td>
				<td>
					<div class="search">
						<label><input class="" type="text" id="Search" value="" placeholder="Search by ..." onchange="search(this)"/></label>
					</div>
				</td>
			</tr>
		</table>
	<div class="table-wrapper1" id="srcTableFrame">
         <table cellpadding="2" cellspacing="0" class="tbl_reg" id="srcTable">
         <thead class="t_head">
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
	     </thead>
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
		<table>
			<tr>
				<td>
					<label for="resDiv" id="resDivCaption">Products the customer ordered:</label>
				</td>
				<td>
					<div class="btn_space"></div>
				</td>
				<td>
					<div class="search">
						<input class="" type="text" id="SearchOnRes" value="" placeholder="Search by ..." onchange="SearchOnRes(this)"/>
					</div>
				</td>
			</tr>
		</table>
		<div class="table-wrapper2" id="result1">
         <table id="resDiv" class="display" style="width:100%">
		  	<thead class="t_head">
            	<tr>
	                <th>customerNumber</th>
	                <th>customerName</th>
	                <th>productCode</th>
	                <th>productName</th>
	                <th>productLine</th>
	                <th>productScale</th>
	                <th>productVendor</th>
	                <th>productDescription</th>
	                <th>quantityInStock</th>
	                <th>buyPrice</th>
	                <th>MSRP</th>
	                <th>orderNumber</th>
	                <th>orderDate</th>
	                <th>shippedDate</th>
	                <th>requiredDate</th>
	                <th>comments</th>
	                <th>status</th>
            	</tr>
        	</thead>
		</table>
	</div>
</body>
</html>