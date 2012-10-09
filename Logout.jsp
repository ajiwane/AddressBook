
<html>
<head>

<title>Logout</title>


</head>
<body>
<% 
session.invalidate();
response.sendRedirect("LoggingOut");
 %>

</body>
</html>
