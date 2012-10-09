
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

public class ReturnList extends HttpServlet {
	Connection dbConn = null;
	Statement ins = null;
	ResultSet results = null;
	String URL="jdbc:mysql://localhost/addressbook";
	String USERNAME="root";
	String PASSWORD="";
	String JDBC_Driver="com.mysql.jdbc.Driver";
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException // This method is called whenver we invoke this servlet.
	{   PrintWriter out = response.getWriter();
	HttpSession hs = request.getSession();
	CheckLogin cl = (CheckLogin) hs.getAttribute("loginSessionBean");
	EntryList el1 = new EntryList();
	EntryList el2 = new EntryList();
	
	String username;
	username = cl.getUsername();
	Vector lastnames = new Vector();
	Vector names = new Vector();
	try{
		Class.forName(JDBC_Driver).newInstance();
		dbConn =DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	catch (Exception ex) {
		out.println("Unable to connect to database\n"
				+ ex.getMessage());
	}

	try {
		int entries=0;;
		String tmpfirstname;
		String tmplastname;
		ins = dbConn.createStatement();
		results=ins.executeQuery("select count(*) from addressbook where username='"+username+"'");

		if(results.next()){
			entries=results.getInt(1);
		} 
		results=ins.executeQuery("select fname,lname from addressbook where username='"+username+"'");	
		for (int i = 0; i < entries; i++) {
			if (results.next()) {
				tmpfirstname = results.getString(1);
				tmplastname = results.getString(2);
				lastnames.add(tmplastname);
				names.add(tmpfirstname+" "+tmplastname);
			}
		}
		dbConn.close();
	} catch (SQLException exc) {
		out.println("Fatal database error\n" + exc);
	}

	el1.setList(lastnames);
	el2.setList(names);
	hs.setAttribute("Lastnames", el1);
	hs.setAttribute("Names", el2);
	response.sendRedirect("Viewaddressbook.jsp");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		doGet(request, response);
	}
}
