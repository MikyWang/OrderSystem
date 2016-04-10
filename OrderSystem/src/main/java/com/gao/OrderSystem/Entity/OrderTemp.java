package com.gao.OrderSystem.Entity;

import java.util.Date;

public class OrderTemp {

	private String lineId;

	private String orderId;

	private String customerName;

	private String status;

	private Date startTime;

	private Date completeTime;

	private String spendMinutes;

	private Integer lineNumber;

	private Long linePrice;

	private String lineName;

	private String linePicturePrefix;

	private String linePicture;

	public String getLineId() {
		return lineId;
	}

	public void setLineId(String lineId) {
		this.lineId = lineId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	public String getSpendMinutes() {
		return spendMinutes;
	}

	public void setSpendMinutes(String spendMinutes) {
		this.spendMinutes = spendMinutes;
	}

	public Integer getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(Integer lineNumber) {
		this.lineNumber = lineNumber;
	}

	public Long getLinePrice() {
		return linePrice;
	}

	public void setLinePrice(Long linePrice) {
		this.linePrice = linePrice;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public String getLinePicturePrefix() {
		return linePicturePrefix;
	}

	public void setLinePicturePrefix(String linePicturePrefix) {
		this.linePicturePrefix = linePicturePrefix;
	}

	public String getLinePicture() {
		return linePicture;
	}

	public void setLinePicture(String linePicture) {
		this.linePicture = linePicture;
	}

}
