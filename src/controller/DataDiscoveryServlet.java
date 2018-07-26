package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;

import dao.*;

public class DataDiscoveryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ResultSet rs = null;
	public static Connection con;
	public static String rowid=null;
	public JSONArray jArray ;
	
	public DataDiscoveryServlet(){
		
	}
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con=DBConnection.createConnection();
		if(request.getParameter("rowid")!= null){
			rowid = request.getParameter("rowid");
		}
        response.setContentType("application/text");
    	try {
 			response.getWriter().print(showData());
		}
    	catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	public JSONArray showData() throws JSONException {
		String query =  "SELECT orders.orderNumber, orders.orderDate,orders.shippedDate,orders.requiredDate,orders.comments,"+
						"orders.status,customers.customerName,customers.customerNumber,products.productCode,products.productName,"+ 
						"products.productLine,products.productScale,products.productVendor,products.productDescription,"+
						"products.quantityInStock,products.buyPrice,products.MSRP "+
						"FROM orders "+
						"INNER JOIN customers ON orders.customerNumber=customers.customerNumber "+
						"INNER JOIN orderdetails ON orders.orderNumber=orderdetails.orderNumber "+
						"INNER JOIN products ON orderdetails.productCode=products.productCode "+
						"WHERE orders.customerNumber = ?"+
						"ORDER BY orders.orderDate DESC";
		try{
//			JSON.stringify()
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, rowid);
			ps.execute();
			rs = ps.getResultSet();
	   		jArray=JsonConverter.convert(rs);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return jArray;
	}
}