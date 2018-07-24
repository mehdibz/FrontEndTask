package dao;

import java.util.Properties;
import model.LoginBean;

public class LoginDao {
	public boolean authenticateUser(LoginBean loginBean){
	
		String userName = loginBean.getUserName(); 
		String password = loginBean.getPassword();
		
		Properties props = new Properties();
		props.setProperty("Test1", "test1@mytest.com"); // (key, value)
		props.setProperty("Test2", "test2@mytest.com"); // (key, value)
		
		if(props.getProperty(userName) != null){
			if(props.getProperty(userName).equals(password)){
				return true;// Authenticated User.
			}else{
				return false; // Invalid User.
			}
		}
		else{
			return false; // Invalid User.
		}
	}
}