
import java.io.*;
/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 */
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import user.*;
//import java.net.*;
import java.sql.*;

public class AddEntry extends HttpServlet {
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
		UserEntry ue = (UserEntry) hs.getAttribute("addentrySessionBean");
		String edit = (String) hs.getAttribute("EditingEntry");
		String delete = (String) hs.getAttribute("DeleteEntry");
		CheckLogin cl = (CheckLogin) hs.getAttribute("loginSessionBean");
		String username, password;
		username = cl.getUsername();

		if(username!=null)
		{
		if (delete == null) {
			String fname, lname, address, city, state, zip, hphone, ophone, fax, cphone, email, url;
			fname = ue.getFname();
			lname = ue.getLname();
			address = ue.getAddress();
			city = ue.getCity();
			state = ue.getState();
			zip = ue.getZip();
			hphone = ue.getHphone();
			ophone = ue.getOphone();
			fax = ue.getFax();
			cphone = ue.getCphone();
			email = ue.getEmail();
			url = ue.getUrl();
			hs.removeAttribute("addentrySessionBean");
			try{
				Class.forName(JDBC_Driver).newInstance();
				dbConn =DriverManager.getConnection(URL, USERNAME, PASSWORD);
			}
			catch (Exception ex) {
				out.println("Unable to connect to database\n"
						+ ex.getMessage());
			}
			if (lname != null && fname!=null) {
				try {
					ins = dbConn.createStatement();
					if (edit != null) {
						String tmpfname=edit.substring(0, edit.indexOf(" "));
						String tmplname=edit.substring(edit.indexOf(" ")+1);
						
						ins.executeUpdate("delete from addressbook where username='"+username+"' and lname='"+tmplname+"' and fname='"+tmpfname+"'");
					}
					ins.executeUpdate("insert into addressbook values('"+username+"','"+fname+"','"+lname+"','"+address+"','"+city+"','"+state+"','"+zip+"','"+hphone+"','"+ophone+"','"+fax+"','"+cphone+"','"+email+"','"+url+"')");
					
						dbConn.close();
				} catch (SQLException e) {
					out.println("Unable to write to database heeeeeeeereee\n");}
							
				if (edit == null) {
					out.println("<P> Entry Added to Your Address Book  <BR>");
					out.println("<p><p align=center > <a href=ReturnList>Go to Contact List </a>");
				} else {
					hs.setAttribute("EditingEntry", null);
					out.println("<P> Entry Updated in Your Address Book  <BR>");
					out.println("<p><p align=center > <a href=ReturnList>Go to Contact List</a>");
				}
			}
			else {
				out.println("<P align=center>Last Name and First Name are Compulsory.<BR>");
				out.println("<p><p align=center > <a href=ReturnList>Go to Contact List</a>");
			}

		} else {
			try{
				Class.forName(JDBC_Driver).newInstance();
				dbConn =DriverManager.getConnection(URL, USERNAME, PASSWORD);
			}
			catch (Exception ex) {
				out.println("Unable to connect to database\n"
						+ ex.getMessage());
			}
			try{				
				ins = dbConn.createStatement();
				
				String tmpfname=delete.substring(0, delete.indexOf(" "));
				String tmplname=delete.substring(delete.indexOf(" ")+1);
				ins.executeUpdate("delete from addressbook where username='"+username+"' and lname='"+tmplname+"' and fname='"+tmpfname+"'");
			
				dbConn.close();
			}catch (SQLException e) {
				out.println("Unable to remove from database\n");}

			hs.setAttribute("DeleteEntry", null);
			out.println("<P> Entry Deleted from Your Address Book  <BR>");
			out.println("<p><p align=center > <a href=ReturnList>Go to Contact List</a>");

		}
		}
		else
		{
			hs.setAttribute("addentrySessionBean",null);
			hs.setAttribute("EditingEntry", null);
			hs.setAttribute("DeleteEntry",null);
			hs.setAttribute("loginSessionBean", null);
			hs.invalidate();
			throw new ServletException(); 
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		doGet(request, response);
	}

}
