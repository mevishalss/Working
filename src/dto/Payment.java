package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table (name="paydetails")
public class Payment {
	
	@Id
	@Column(name="transId")
    @GenericGenerator(name = "sequence", strategy = "sequence", parameters = {
            @Parameter(name = "sequenceName", value = "sequence"),
            @Parameter(name = "allocationSize", value = "1000000"),})
	private int transId;
	private String userId;
	private int orderId;
	private double transAmount;
	@Column(name="transStatus")
	private String transStatus="pending";
	private String transDate;
	private String modeOfTrans;

	public Payment() {
		super();
	}

	
	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public int getTransId() {
		return transId;
	}

	public void setTransId(int transId) {
		this.transId = transId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public double getTransAmount() {
		return transAmount;
	}

	public void setTransAmount(double transAmount) {
		this.transAmount = transAmount;
	}

	public String getTransStatus() {
		return transStatus;
	}

	public void setTransStatus(String transStatus) {
		this.transStatus = transStatus;
	}

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	public String getModeOfTrans() {
		return modeOfTrans;
	}

	public void setModeOfTrans(String modeOfTrans) {
		this.modeOfTrans = modeOfTrans;
	}

	@Override
	public String toString() {
		return "Payment [transId=" + transId + ", orderId=" + orderId + ", userId=" + userId + ", transAmount=" + transAmount
				+ ", transStatus=" + transStatus + ", transDate=" + transDate + ", modeOfTrans=" + modeOfTrans + "]";
	}
	
	
	
	
	

}
