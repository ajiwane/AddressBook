<jsp:useBean id="addentrySessionBean" scope="session" class="user.UserEntry"/>
<%@ page errorPage="errorpage.jsp" %>
<html>
<head>
<title>Address Book</title>
</head>
<body>
<form action="Myformconfirm.jsp" method="post">

<h2 align="center">New Address Entry</h2>

<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr><td align="right" >*First Name:</td>
<td align="left" ><input type="text" name="fname"></td></tr>
<tr><td align="right" >*Last Name:</td>
<td align="left" ><input type="text" name="lname"></td></tr>
<tr><td align="right" >Address:</td>
<td align="left" ><input type="text" name="address"></td></tr>
<tr><td align="right" >City:</td>
<td align="left" ><input type="text" name="city"></td></tr>
<tr><td align="right" >State:</td>
<td align="left" ><input type="text" name="state"></td></tr>
<tr><td align="right" >Zip:</td>
<td align="left" ><input type="text" name="zip"></td></tr>
<tr><td align="right" >Home Phone:</td>
<td align="left" ><input type="text" name="hphone"></td></tr>
<tr><td align="right" >Office Phone:</td>
<td align="left" ><input type="text" name="ophone"></td></tr>
<tr><td align="right" >Fax:</td>
<td align="left" ><input type="text" name="fax"></td></tr>
<tr><td align="right" >Cell Phone:</td>
<td align="left" ><input type="text" name="cphone"></td></tr>
<tr><td align="right" >Email Address:</td>
<td align="left" ><input type="text" name="email"></td></tr>
<tr><td align="right" >URL:</td>
<td align="left" ><input type="text" name="url"></td></tr>
<tr><td></td><td><input type="submit" name="sub" value="Add"></td></tr>
<tr><td></td><td>*marked are compulsory</td></tr>
</table>
</form>

<%

%>

</body>
</html>
