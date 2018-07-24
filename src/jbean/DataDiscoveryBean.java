package jbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServlet;
import dao.DBConnection;

public class DataDiscoveryBean extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public String text1,query;
	public Connection con;
	public Vector<String> base_result, v;
	
	public DataDiscoveryBean(){
		con=DBConnection.createConnection();
	}
	
	public Vector<String> getList()
	{
		v = new Vector<String>();
		try
		{	
    		PreparedStatement stat = con.prepareStatement("select * from Customers");
    		ResultSet rs= stat.executeQuery();
    		while(!(rs.isLast())){
    			if(rs.next())
        		{	
        			v.addElement(rs.getString("customerName"));
        			v.addElement(rs.getString("contactLastName"));
        			v.addElement(rs.getString("contactFirstName"));
        			v.addElement(rs.getString("phone"));
        			v.addElement(rs.getString("addressLine1"));
        			v.addElement(rs.getString("addressLine2"));
        			v.addElement(rs.getString("city"));
        			v.addElement(rs.getString("state"));
        			v.addElement(rs.getString("postalCode"));
        			v.addElement(rs.getString("country"));
        			v.addElement(rs.getString("salesRepEmployeeNumber"));
        			v.addElement(rs.getString("creditLimit"));
        			v.add("|");
        			System.out.println(rs.getString("customerName"));
        			System.out.println(rs.getString("contactLastName"));
        			System.out.println(rs.getString("contactFirstName"));
        			
        		}
    		}
    	}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return v;
	}
}
