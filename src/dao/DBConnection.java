package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import dao.Keys;

public class DBConnection {
	
	
	
	public static Connection createConnection(){
	Connection con = null;
	try 
	{

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(Keys.URL, Keys.User, Keys.Pass);
		
	} 
	catch (ClassNotFoundException e)
	{
		e.printStackTrace();
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return con; 
	}
}

