
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
//import javax.swing.JOptionPane;

import user.*;

public class CompleteRegistration extends HttpServlet {
	Connection dbConn = null;
	Statement ins = null;
	ResultSet results = null;
	String URL="jdbc:mysql://localhost/addressbook";
	String USERNAME="root";
	String PASSWORD="";
	String JDBC_Driver="com.mysql.jdbc.Driver";
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException // This method is called
	// whenver we invoke this
	// servlet.
	{

		PrintWriter out = response.getWriter();
		HttpSession hs = request.getSession();
		CheckLogin cl = (CheckLogin) hs.getAttribute("registerSessionBean");
		String username, password;
		username = cl.getUsername();
		password = cl.getPassword();
		try{
			Class.forName(JDBC_Driver).newInstance();
			dbConn =DriverManager.getConnection(URL, USERNAME, PASSWORD);
		}
		catch (Exception ex) {
			out.println("Unable to connect to database hereeeeee\n"
					+ ex.getMessage());
		}

		try {
			ins = dbConn.createStatement();
			results=ins.executeQuery("select* from login where username ='"+username+"'");
			if(results.next()){
				dbConn.close();
				form2(request, response, out);
			}
			else{
				ins.executeUpdate("insert into login values('"+username+"','"+password+"')");
				dbConn.close();
				out.println("<P> Registration Successful  <BR>");
				out.println("<p><p align=center > <a href=Welcome.jsp>Login </a>");
			}

		} catch (SQLException exc) {
			out.println("Fatal database error\n" + exc);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		doGet(request, response);
	}

	public void form2(HttpServletRequest request, HttpServletResponse response,
			PrintWriter out) // This page displays result in new page
	// It contain link back to input form
	{
		String fname, mname;
		String operation;
		fname = request.getParameter("uname");
		mname = request.getParameter("passwd");

		String message = "Username Already Exits";

		out.println("<P> " + message + "<BR>");
		out.println("<p><p align=center > <a href=Register.jsp>Register Again </a>");
	}
}
