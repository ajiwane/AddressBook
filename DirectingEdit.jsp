<jsp:useBean id="addentrySessionBean" scope="session" class="user.UserEntry"/>
<jsp:setProperty name="addentrySessionBean" property="*"/>
<html>
<head>
<%@page import="user.*" import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>
</head>
<body>

<% 
UserEntry ue=(UserEntry)(session.getAttribute("ViewEntry"));
String action = request.getParameter( "submit" );
if(action.equals("Delete Contact")){
session.setAttribute("DeleteEntry",ue.getFname()+" "+ue.getLname());
}
response.sendRedirect("AddEntry");
    
%>



</body>
</html>
