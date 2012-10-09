package user;

public class CheckLogin {
	
	String username;
    String password;
    String conpassword;
    
    public void setUsername( String value )
    {
        username = value;
    }

    public void setPassword( String value )
    {
        password = value;
    }
    public void setConPassword( String value )
    {
        conpassword = value;
    }
      
    public String getUsername() { return username; }

    public String getPassword() { return password; }
    
    public String getConPassword() { return conpassword; }
   
    }
