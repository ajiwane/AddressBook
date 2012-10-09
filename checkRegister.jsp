<jsp:useBean id="registerSessionBean" scope="session" class="user.CheckLogin"/>
<jsp:setProperty name="registerSessionBean" property="*"/>
<%@ page errorPage="errorpage.jsp" %>
<html>
   <head>
        <title>  Registration  </title>
        <%!
                boolean check(String str){
                for(int i=0;i<str.length();i++){
                        if(((str.charAt(i)<'A'||str.charAt(i)>'Z')&&(str.charAt(i)<'a'||str.charAt(i)>'z'))
                                &&(!(str.charAt(i)>='0'&&str.charAt(i)<='9')))//not an alphabet and not a number
                                return false;
                }
                return true;
                }
                boolean checkPwd(String str){
                if(str.length()<6)
                        return false;

                int flag=0;
                for(int i=0;i<str.length();i++){
                        if(!((str.charAt(i)<'A'||str.charAt(i)>'Z')&&(str.charAt(i)<'a'||str.charAt(i)>'z')))//is a alphabet
                                {flag++;break;}
                }
                if(flag==0)
                        return false;
                flag=0;
                for(int i=0;i<str.length();i++){
                        if(str.charAt(i)>='0'&&str.charAt(i)<='9')//is a number
                                flag++;
                }
                if(flag==0)
                        return false;
                flag=0;
                for(int i=0;i<str.length();i++){
                        if( ((str.charAt(i)<'A'||str.charAt(i)>'Z')&&(str.charAt(i)<'a'||str.charAt(i)>'z'))//is a spl char
                            &&  (str.charAt(i)<'0'||str.charAt(i)>'9'))
                                flag++;
                }
                if(flag==0)
                        return false;
                return true;
                }
                
        %>
        <%
           	String login = request.getParameter( "username" );
                session.setAttribute( "login", login );
                String password = request.getParameter( "password" );
                session.setAttribute( "password", password );
               String cpassword = request.getParameter( "conpassword" );
                session.setAttribute( "cpassword", cpassword );
                int errorflag=0;
        %>


    </head>
     <body bgcolor="white">
                <%
                //response.sendRedirect("CompleteRegistration");
                 if(login==null||login.length()==0){
                        out.println("<P>Enter a name.");
                        errorflag=1;}
                else  if(!check(login)){
                        out.println("<P>Enter a valid login id.Only alphabets and numbers allowed.");
                        errorflag=2;}
                //else if(!checkAvlbl(login)){
                        //out.println("<P>Login ID already taken.Please try another one");
                       // errorflag=3;}

                if(password==null||password.length()==0){
                        out.println("<P>Enter a password and also confirm it.");
                        errorflag=4;}
                else if(cpassword==null||cpassword.length()==0){
                        out.println("<P>Confirm your password.");
                        errorflag=5;}
                else if(!password.equals(cpassword)){
                       out.println("<P>Passwords do not match.");
                        errorflag=6;}
                else if(!checkPwd(password)){
                        out.println("<P>Enter a valid password.It should contain at least 6 characters and alphabets and at least one number and special character.");
                        errorflag=7;}

                if(errorflag==0){
                        response.sendRedirect("CompleteRegistration");
                        //out.println("<P>Registration successful.");
                        //out.println("<P><a href=\"Login.jsp\">Go to Login Page");
                }
                else{
                        //BD.makeUser(login,password);
                        out.println("<P><a href=\"Register.jsp\">Go back to Registration Page");
                    }
                    
        %>
     </body>
</html>
