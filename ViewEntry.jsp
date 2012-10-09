<jsp:useBean id="viewentrySessionBean" scope="session" class="user.UserEntry"/>
<html>
<head>
<title>Address Book</title>
<%@page import="user.*" import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>

</head>
<body>
<form action="EditEntry.jsp" method="post">

<h2 align="center">Address Entry</h2>
<% 
UserEntry ue=(UserEntry)(session.getAttribute("ViewEntry"));

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
			
if(fname.equals("null"))
	fname="";
if(lname.equals("null"))
	lname="";
if(address.equals("null"))
	address="";
if(city.equals("null"))
	city="";
if(state.equals("null"))
	state="";
if(zip.equals("null"))
	zip="";
if(hphone.equals("null"))
	hphone="";
if(ophone.equals("null"))
	ophone="";
if(fax.equals("null"))
	fax="";
if(cphone.equals("null"))
	cphone="";
if(email.equals("null"))
	email="";

if(url.equals("null"))
	url="";

%>
<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr><td align="left" >First Name:</td>
<td align="left" ><%= fname %></td></tr>
<tr><td align="left" >Last Name:</td>
<td align="left" ><%= lname%></td></tr>
<tr><td align="left" >Address:</td>
<td align="left" ><%= address %></td></tr>
<tr><td align="left" >City:</td>
<td align="left" ><%= city %></td></tr>
<tr><td align="left" >State:</td>
<td align="left" ><%= state %></td></tr>
<tr><td align="left" >Zip:</td>
<td align="left" ><%= zip %></td></tr>
<tr><td align="left" >Home Phone:</td>
<td align="left" ><%= hphone %></td></tr>
<tr><td align="left" >Office Phone:</td>
<td align="left" ><%= ophone %></td></tr>
<tr><td align="left" >Fax:</td>
<td align="left" ><%= fax %></td></tr>
<tr><td align="left" >Cell Phone:</td>
<td align="left" ><%= cphone %></td></tr>
<tr><td align="left" >Email Address:</td>
<td align="left" ><%= email %></td></tr>

<tr><td align="left" >URL:</td>

<td align="left" ><%= url %></td>
</tr>

<tr><td></td><td><input type="submit" name="sub" value="Edit" align="center"></td></tr>

</table>

</form>
 
<%
out.println("<P align=\"center\"><a href=\"Viewaddressbook.jsp\">Go back to Contact list");
%>

</body>
</html>
