
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

public class LoggingOut extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException // This method is called
	{
		//request.getSession().invalidate();
		HttpSession hs = request.getSession();
		hs.setAttribute("addentrySessionBean",null);
		hs.setAttribute("EditingEntry", null);
		hs.setAttribute("DeleteEntry",null);
		hs.setAttribute("loginSessionBean", null);
		hs.invalidate();
		response.sendRedirect("Welcome.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		doGet(request, response);
	}
}
