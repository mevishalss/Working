package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.BatchSize;

import com.sun.istack.internal.NotNull;

@Entity
@Table (name="user_details")
public class UserDetails {
	@Id
	@Column(name="user_id")
	private String userName;
	@NotNull
	private String userPass;
	@NotNull
	private String fName;
	@NotNull
	private String lName;
	@NotNull
	private String phoneNo;
	@NotNull
	private String bithDate;
	@NotNull
	private String emailId;
	@NotNull
	private String prnNo;
	@NotNull
	private String course;
	@NotNull
	private String yearOfCourse;
	@NotNull
	private String address;
	@NotNull
	private String city;
	@NotNull
	private String state;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getCollegeName() {
		return CollegeName;
	}
	public void setCollegeName(String collegeName) {
		CollegeName = collegeName;
	}
	public String getCollegeCode() {
		return CollegeCode;
	}
	public void setCollegeCode(String collegeCode) {
		CollegeCode = collegeCode;
	}
	private String pinCode;
	private String CollegeName;
	private String CollegeCode;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getBithDate() {
		return bithDate;
	}
	public void setBithDate(String bithDate) {
		this.bithDate = bithDate;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPrnNo() {
		return prnNo;
	}
	public void setPrnNo(String prnNo) {
		this.prnNo = prnNo;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getYearOfCourse() {
		return yearOfCourse;
	}
	public void setYearOfCourse(String yearOfCourse) {
		this.yearOfCourse = yearOfCourse;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserDetails [userName=" + userName + ", userPass=" + userPass + ", fName=" + fName + ", lName=" + lName
				+ ", phoneNo=" + phoneNo + ", bithDate=" + bithDate + ", emailId=" + emailId + ", prnNo=" + prnNo
				+ ", course=" + course + ", yearOfCourse=" + yearOfCourse + ", address=" + address + ", city=" + city
				+ ", state=" + state + ", pinCode=" + pinCode + "]";
	}
	
	
	
	
}
