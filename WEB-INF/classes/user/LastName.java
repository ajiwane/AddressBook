package user;

public class LastName {

	String lastname;
	Boolean flag;

	public void setLastname( String value )
    {
        lastname = value;
        
    }
	public void setView( Boolean value )
    {
        flag = value;
        
    }
	 public String getLastname() { return lastname; }
	 public Boolean getView() { return flag; }
}
