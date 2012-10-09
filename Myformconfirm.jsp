<jsp:useBean id="addentrySessionBean" scope="session" class="user.UserEntry"/>
<jsp:setProperty name="addentrySessionBean" property="*"/>

<HTML>
<head>
<title>Confirming</title>
<%@page contentType="text/html" language="java" %>
<%@ page errorPage="errorpage.jsp" %>
</head>
<BODY>
<%
response.sendRedirect("AddEntry");
%>
</BODY>
</HTML>