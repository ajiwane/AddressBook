<jsp:useBean id="registerSessionBean" scope="session" class="user.CheckLogin"/>
<%@ page errorPage="errorpage.jsp" %>
<html>
<head>
<title align="center">Register</title>
</head>
<body>
<form action="checkRegister.jsp" method="post">
<h1 align="center">Register</h1>
<form>
<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr><td align="right" >Desired Username:</td>
<td align="left" ><input type="text" name="username" ></td></tr>
<tr><td align="right" >Password:</td>
<td align="left" ><input type="password" name="password" ></td></tr>

<tr><td align="right" >Confirm Password:</td>
<td align="left" ><input type="password" name="conpassword" ></td></tr>


<tr><td></td><td><input type="submit" name="sub" value="Submit"></td></tr>
</table>
</form>

</body>
</html>
