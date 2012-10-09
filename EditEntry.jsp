<jsp:useBean id="addentrySessionBean" scope="session" class="user.UserEntry"/>
<html>
<head>
<title>Address Book</title>
<%@page import="user.*" import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>

</head>
<body>
<form action="DirectingEdit.jsp" method="post">

<h2 align="center">Address Entry</h2>
<% 
UserEntry ue=(UserEntry)(session.getAttribute("ViewEntry"));

session.setAttribute("EditingEntry",ue.getFname()+" "+ue.getLname());

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
<tr><td align="right" >*First Name:</td>
<td align="left" ><input type="text" name="fname" value="<%= fname %>"></td></tr>
<tr><td align="right" >*Last Name:</td>
<td align="left" ><input type="text" name="lname" value="<%= lname %>"></td></tr>
<tr><td align="right" >Address:</td>
<td align="left" ><input type="text" name="address" value="<%= address %>"></td></tr>
<tr><td align="right" >City:</td>
<td align="left" ><input type="text" name="city" value="<%= city %>"></td></tr>
<tr><td align="right" >State:</td>
<td align="left" ><input type="text" name="state" value="<%= state %>"></td></tr>
<tr><td align="right" >Zip:</td>
<td align="left" ><input type="text" name="zip" value="<%= zip %>"></td></tr>
<tr><td align="right" >Home Phone:</td>
<td align="left" ><input type="text" name="hphone" value="<%= hphone %>"></td></tr>
<tr><td align="right" >Office Phone:</td>
<td align="left" ><input type="text" name="ophone" value="<%= ophone %>"></td></tr>
<tr><td align="right" >Fax:</td>
<td align="left" ><input type="text" name="fax" value="<%= fax %>"></td></tr>
<tr><td align="right" >Cell Phone:</td>
<td align="left" ><input type="text" name="cphone" value="<%= cphone %>"></td></tr>
<tr><td align="right" >Email Address:</td>
<td align="left" ><input type="text" name="email" value="<%= email %>"></td></tr>
<tr><td align="right" >URL:</td>
<td align="left" ><input type="text" name="url" value="<%= url %>"></td></tr>


<tr><td></td><td><input type="submit" name="submit" value="Confirm Edit"></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="Delete Contact"></td></tr>
<tr><td></td><td>*marked are compulsory</td></tr>

</table>
</form>



<%

%>

</body>
</html>
