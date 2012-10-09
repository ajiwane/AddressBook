<jsp:useBean id="lastnameSessionBean" scope="session" class="user.LastName"/>
<jsp:setProperty name="lastnameSessionBean" property="*"/>
<html>
<head>
<%@page import="user.*" import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>
</head>
<body>


<% 
Vector listoflastnames=((EntryList)(session.getAttribute("Lastnames"))).getList();
Vector list=((EntryList)(session.getAttribute("Names"))).getList();

String action = request.getParameter( "submit" );
if(action.equals("Search"))
{
	String name=lastnameSessionBean.getLastname();
	String lastname=name.substring(name.indexOf(" ")+1);
	if((listoflastnames.indexOf(lastname)) >=0 ){
%>
<TABLE border="1" cellpadding="2" cellspacing="2" align="center">
<%
 for ( int i = 0; i < list.size(); i++ ) {
	String tmpname=(String)list.elementAt(i);
	String tmplastname=tmpname.substring(tmpname.indexOf(" ")+1);

	if(lastname.equals(tmplastname)){
        %>
        
		<form action="DirectingView.jsp" method="post">
        
        <input type="hidden" name="lastname" value="<%= (String)list.elementAt(i) %>" >
        <TR>
        
        <TD><%= (String)list.elementAt(i) %></TD>
               
 
        <TD><input type="submit" name="submit" value="View"></TD>
        </TR>
        </form>
         
        <%
}
    }
%>
</table>

<%
out.println("<P align=\"center\"><a href=\"Viewaddressbook.jsp\">Back to Contacts");
}
	else
	{
	out.println("<P>Search yielded no Results");
	out.println("<P><a href=\"Viewaddressbook.jsp\">Back to Contacts");
	}
	
}else{
response.sendRedirect("Modify");
}

    
%>
</body>
</html>
