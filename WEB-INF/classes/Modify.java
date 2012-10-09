
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import user.*;

public class Modify extends HttpServlet {
	Connection dbConn = null;
	Statement ins = null;
	ResultSet results = null;
	String URL="jdbc:mysql://localhost/addressbook";
	String USERNAME="root";
	String PASSWORD="";
	String JDBC_Driver="com.mysql.jdbc.Driver";
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException // This method is called
	{
		PrintWriter out = response.getWriter();
		HttpSession hs = request.getSession();
		LastName ln = (LastName) hs.getAttribute("lastnameSessionBean");
		CheckLogin cl = (CheckLogin) hs.getAttribute("loginSessionBean");
		String username;
		username = cl.getUsername();
		String name = ln.getLastname();
		String firstname=name.substring(0, name.indexOf(" "));
		String lastname=name.substring(name.indexOf(" ")+1);
		try{
			Class.forName(JDBC_Driver).newInstance();
			dbConn =DriverManager.getConnection(URL, USERNAME, PASSWORD);
		}
		catch (Exception ex) {
			out.println("Unable to connect to database\n"
					+ ex.getMessage());
		}

		try {
			
			//out.println(lastname+"ashwin");
			ins = dbConn.createStatement();
			results=ins.executeQuery("select* from addressbook  where lname ='"+lastname+"' and username='"+username+"' and fname='"+firstname+"'");
			
			if(results.next()){
				UserEntry ue = new UserEntry();
				ue.setFname(results.getString(2));
				ue.setLname(results.getString(3));
				ue.setAddress(results.getString(4));
				ue.setCity(results.getString(5));
				ue.setState(results.getString(6));
				ue.setZip(results.getString(7));
				ue.setHphone(results.getString(8));
				ue.setOphone(results.getString(9));
				ue.setFax(results.getString(10));
				ue.setCphone(results.getString(11));
				ue.setEmail(results.getString(12));
				ue.setUrl(results.getString(13));
				hs.setAttribute("ViewEntry", ue);
				dbConn.close();
				response.sendRedirect("ViewEntry.jsp");
			} 

		} catch (Exception exc) {
			out.println("Fatal database error\n" + exc);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		doGet(request, response);
	}
}
