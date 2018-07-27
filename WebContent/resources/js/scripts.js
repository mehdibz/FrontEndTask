 function ChangeColor(tableRow, highLight)
  {
    if (highLight){
      tableRow.style.backgroundColor = '#dcfac9';
    }
    else{
      tableRow.style.backgroundColor = 'white';
    }
  }

 function loadPage(e){
	 document.getElementById("result1").style.visibility = "hidden";
	 document.getElementById("resDivCaption").style.visibility = "hidden";
	 document.getElementById("SearchOnRes").style.visibility = "hidden";
	 search(e);
 }
 function search(e){
	 $(document).ready(function() {
		    $('#srcTable').DataTable();
		    $('#srcTable_filter').hide();
		    $('#Search').on('keyup', function() {
		        $('#srcTable')
		            .DataTable()
		            .search($('#Search').val(), false, true)
		            .draw();
		    });
		});
 }
 
 function SearchOnRes(e){
	 $(document).ready(function() {
		    $('#resDiv').DataTable();
		    $('#resDiv_filter').hide();
		    $('#SearchOnRes').on('keyup', function() {
		        $('#resDiv')
		            .DataTable()
		            .search($('#SearchOnRes').val(), false, true)
		            .draw();
		    });
		});
 } 
 
 
 function ChooseRecord(e)
 {
	  var bid = e.id; // button ID
  document.getElementById("result1").style.visibility = "visible";
  document.getElementById("resDivCaption").style.visibility = "visible";
  document.getElementById("SearchOnRes").style.visibility = "visible";
 $(document).ready(function() {
 		        $.ajax({
	            type: "POST",
	            url: "DataDiscoveryServlet", 
	            data: {
   		                rowid : bid
	            	  },
	            success: function(msg){	
    	 		//console.log(msg);
				table1 = $('#resDiv').DataTable();
				table1.destroy();
				table1 = $('#resDiv').DataTable({
					 		paging:true,
				        	bFilter:true,
				        	ordering:true,
	   		            	"processing" : true,
	   		        		  "retrieve" : true,
	   		                "ajax": {"url": "DataDiscoveryServlet",
	   		                		 "contentType": "application/json",
	   		                		 "type" : "POST",
	   		                		 "dataSrc" : ""
	   		                		 },
	   		                
	   		                "columns": [
	   		                    { "data": "customerNumber" },
	   		            		{ "data": "customerName" },
	   		            		{ "data": "productCode" },
	   		                    { "data": "productName" },
	   		            		{ "data": "productLine" },
	   		    				{ "data": "productScale" },
	   							{ "data": "productVendor" },
								{ "data": "productDescription" },
								{ "data": "quantityInStock" },
								{ "data": "buyPrice" },
								{ "data": "MSRP" },
	   		            		{ "data": "orderNumber" },
	   		                    { "data": "orderDate" },
	   		                    { "data": "shippedDate" },
	   		                    { "data": "requiredDate" },
	   		                    { "data": "comments" },
	   		                    { "data": "status" }
  		   		                ],
	  			           } );
				
            		}});
  		});
 	SearchOnRes(e);
  }