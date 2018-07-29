package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.BatchSize;

import com.sun.istack.internal.NotNull;
import com.sun.istack.internal.Nullable;

@Entity
@Table(name="my_users")
public class User {
	@Id
	@Column(name="user_id")
	private String userName;
	@NotNull
	@BatchSize(size =10)
	private String userPass;
	@Column(name="status") 
    private String status="pending"; 
	public User() {
		super();
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
}
