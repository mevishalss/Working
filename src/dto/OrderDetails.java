package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
@Entity
@Table (name="order_details")

public class OrderDetails {
	@Id
	@Column (name="order_id")
	private String orderId;
	@Column(name="user_id")
	private String userId;
	private String orderDate;
	private String noOfInstalments;
	private String orderPrice;
	private String description;
	private String remainingInst;
	private String status;
	
	@ManyToOne
	private User user;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public OrderDetails(String userId) {
		super();
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getNoOfInstalments() {
		return noOfInstalments;
	}
	public void setNoOfInstalments(String noOfInstalments) {
		this.noOfInstalments = noOfInstalments;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	@Override
	public String toString() {
		return "OrderDetails [orderId=" + orderId + ", userId=" + userId + ", orderDate=" + orderDate
				+ ", noOfInstalments=" + noOfInstalments + ", orderPrice=" + orderPrice + "]";
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public OrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetails(String orderId, String orderDate, String noOfInstalments, String orderPrice) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.noOfInstalments = noOfInstalments;
		this.orderPrice = orderPrice;
	}
	

}
