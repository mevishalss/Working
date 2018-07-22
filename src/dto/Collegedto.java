package dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="clg_login")
public class Collegedto {
	@Id
	private String Userid;
	
	private String password;
	
	
	public Collegedto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserid() {
		return Userid;
	}
	public void setUserid(String userid) {
		Userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}
