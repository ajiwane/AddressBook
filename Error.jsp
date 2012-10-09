 <%@ page isErrorPage="true" %>
   <% 
    if (exception == null)
       exception = new Exception("Exception UNAVAILABLE");
   %>
   
  <html> 
     <head> 
       <title> Server Error: <%= exception.toString() %></title> 
    </head> 
   <body> 
      <h2>Server Error</h2>
        <font face="Verdana" color="red" size="3">
         <b><em><%= exception.toString() %></em></b>
       </font>
      </h2>

      <p> Please notify the administrator. Thank you. </p>
   </body>
  </html>

