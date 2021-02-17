package User;

public class UserDTO {
	
	private String id;
	private String pw;
	private String name;
	private String startDate;
	
	public void setUser(String id,String pw,String name,String startDate) {
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.startDate=startDate;
	}
	
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getStartDate() {
		return startDate;
	}
	
	public void setpw(String pw) {
		this.pw=pw;		
	}
	public void setStartDate(String startDate) {
		this.startDate=startDate;
	}
}
