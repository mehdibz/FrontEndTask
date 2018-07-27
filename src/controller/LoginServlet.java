package controller;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	public LoginServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		LoginBean loginBean = new LoginBean();
		loginBean.setUserName(userName);
		loginBean.setPassword(password);
		session = request.getSession();
		Boolean userValidate = authenticateUser(loginBean);

		if (userValidate) 
		{
			session.setAttribute("userName", userName);
			session.setMaxInactiveInterval(5*60);
			request.setAttribute("userName", userName);
			response.sendRedirect("dataDiscovery.jsp");
		} else {
			request.setAttribute("errMessage", "Sorry! UserName or Password is wrong"); 
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	private boolean authenticateUser(LoginBean loginBean){
		
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
