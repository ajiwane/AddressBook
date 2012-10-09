<jsp:useBean id="lastnameSessionBean" scope="session" class="user.LastName"/>
<html>
<head>
<%@page import="user.*" import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>
<title>Address Book</title>
</head>
<body>

<h2 align="center" >Address Book </h2>
<hr>

<p align="right"><a href="Logout.jsp">Logout</a> </p>
 <TABLE border="0" cellpadding="2" cellspacing="2" align="center">



<form action="DirectingView.jsp" method="post">
    <tr><td>Search:<td><input type="text" name="lastname" > </td> </tr>
    <tr><td><td><input type="submit" name="submit" value="Search"> </td> </tr>
    </form>

</TABLE>
<br> 
<TABLE border="1" cellpadding="2" cellspacing="2" align="center">

<%
Vector listoflastnames=((EntryList)(session.getAttribute("Lastnames"))).getList();
Vector list=((EntryList)(session.getAttribute("Names"))).getList();

   
    for ( int i = 0; i < list.size(); i++ ) {
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
    
    
%>
<form action="addressbook.jsp" method="post">
    <tr><td>New Contact:><td><input type="submit" name="submit" value="Add"> </td> </tr>
    </form>
</table>
   
   

</body>
</html>
