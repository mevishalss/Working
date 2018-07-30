package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.annotations.Parameter;

import com.sun.istack.internal.NotNull;
@Entity
@Table (name="order_details")

public class OrderDetails {
	@Id
	@Column (name="order_id")
	@GeneratedValue(strategy=GenerationType.AUTO)  
	private int orderId;
	private String userId;
	private String orderDate;
	private int noOfInstalments;
	private double orderPrice;
	private String description;
	private double downPayment;
	private int remainingInst;
	private double EMIAmount;
	@Column(name="OrderStatus") 
	private String orderStatus="pending";
	
	
	
	
	public double getDownPayment() {
		return downPayment;
	}
	public void setDownPayment(double downPayment) {
		this.downPayment = downPayment;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getNoOfInstalments() {
		return noOfInstalments;
	}
	public void setNoOfInstalments(int noOfInstalments) {
		this.noOfInstalments = noOfInstalments;
	}
	public double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRemainingInst() {
		return remainingInst;
	}
	public OrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setRemainingInst(int remainingInst) {
		this.remainingInst = remainingInst;
	}
	public double getEMIAmount() {
		return EMIAmount;
	}
	public void setEMIAmount(double eMIAmount) {
		EMIAmount = eMIAmount;
	}
	
	

}
