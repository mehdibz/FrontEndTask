package controller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customers;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.List;
import org.apache.taglibs.standard.tlv.JstlCoreTLV;


import dao.DBConnection;

public class DataDiscoveryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public String text1,query;
	public Connection con;
	public Vector<String> base_result;
	
	public DataDiscoveryServlet(){
		con=DBConnection.createConnection();
	}
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rowid = request.getParameter("rowid");
		
        //System.out.println("Row ID = " + rowid);
        response.setContentType("text/plain"); 
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Row ID = " + rowid);
        
    }
}


/*
if ((request.getParameter("accsub") != null)) {
    if (request.getParameter("accuser") != null) {
    	org.hibernate.Session session = null;

        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        session = sessionFactory.openSession();
        org.hibernate.Transaction tx = session.beginTransaction();

        //String i = request.getParameter("accuser");
        //String Q = " from Customers where userid= :id ";
        String Q = " from Customers";
        Query query = session.createQuery(Q);
        //query.setParameter("id", i);

        List profile = (List) query.list();
        request.setAttribute("profile", profile);

        tx.commit();
        session.flush();
        session.close();

        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    } else {
        System.out.println("error");

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewprofile.jsp");
        dispatcher.forward(request, response);
    }
}	*/