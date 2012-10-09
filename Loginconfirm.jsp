<jsp:useBean id="loginSessionBean" scope="session" class="user.CheckLogin"/>
<jsp:setProperty name="loginSessionBean" property="*"/>
<HTML>
<head>
<title>Confirming</title>
<%@page contentType="text/html" language="java" %>
<%@ page errorPage="errorpage.jsp" %>

<%
   	String login = request.getParameter( "username" );
                session.setAttribute( "login", login );
                String password = request.getParameter( "password" );
                session.setAttribute( "password", password );
                int errorflag=0;
        %>
</head>
<BODY>


<%  

if(login==null||login.length()==0){
                        out.println("<P>Enter a name.");
                        errorflag=1;}
                        
if(password==null||password.length()==0){
                        out.println("<P>Enter a password ");
                        errorflag=4;}
                        
if(errorflag==0){response.sendRedirect("Authenticate");
                }
                else{
                        //BD.makeUser(login,password);
                        out.println("<P><a href=\"Welcome.jsp\">Go back to Login Page");
                    }

%>
</BODY>
</HTML>