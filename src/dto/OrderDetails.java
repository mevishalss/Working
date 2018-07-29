package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters = {
            @Parameter(name = "sequenceName", value = "sequence"),
            @Parameter(name = "allocationSize", value = "1000000"),})
	private String orderId;
	
	private String userId;
	private String orderDate;
	private int noOfInstalments;
	private String orderPrice;
	
		public String getOrderStatus() {
		return OrderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		OrderStatus = orderStatus;
	}
		private String description;
	private int remainingInst;
	private int EMIAmount;
	
	
	@Column(name="OrderStatus") 
	private String OrderStatus="pending";
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
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
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
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
	public int getEMIAmount() {
		return EMIAmount;
	}
	public void setEMIAmount(int eMIAmount) {
		EMIAmount = eMIAmount;
	}
	
	

}
