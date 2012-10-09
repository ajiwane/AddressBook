<jsp:useBean id="loginSessionBean" scope="session" class="user.CheckLogin"/>
<%@ page errorPage="errorpage.jsp" %>
<head>
<title>Welcome</title>
<body>
<form action="Loginconfirm.jsp" method="POST">
<h1 align="center">  Welcome to AddressBook</h1>
<h2 align="center">Login</h2>
<form>
<h3 align="center">Username:
<input type="text" name="username" ></h3>
<h3 align="center">Password:
<input type="password" name="password" ><br></h3>
<p align="center"><input type="submit" name="sub" value="Submit" ><br>
</form>
New user?  Register <a href="Register.jsp">here<br></p>

</body>
</html>
