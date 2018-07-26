package model;

public class Orders {
	private String customerNumber,orderNumber,orderDate,shippedDate,requiredDate,comments,status;

	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNum) {
		this.orderNumber = orderNum;
	}
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderdate) {
		this.orderDate=orderdate;
	}
	
	public String getRequiredDate() {
		return requiredDate;
	}
	public void setRequiredDate(String requireddate) {
		this.requiredDate=requireddate;
	}
	
	public String getShippedDate() {
		return shippedDate;
	}
	public void setShippedDate(String shippedDate) {
		this.shippedDate=shippedDate;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status= status;
	}	
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments=comments;
	}
	
	public String getCustomerNumber() {
		return customerNumber;
	}
	public void setCustomerNumber(String customerumber) {
		this.customerNumber=customerumber;
	}
}
