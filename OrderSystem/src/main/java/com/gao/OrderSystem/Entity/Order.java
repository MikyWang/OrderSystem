package com.gao.OrderSystem.Entity;

import java.util.Date;

public class Order {
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

    private byte[] linePicture;

    public String getLineId() {
        return lineId;
    }

    public void setLineId(String lineId) {
        this.lineId = lineId == null ? null : lineId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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
        this.spendMinutes = spendMinutes == null ? null : spendMinutes.trim();
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
        this.lineName = lineName == null ? null : lineName.trim();
    }

    public String getLinePicturePrefix() {
        return linePicturePrefix;
    }

    public void setLinePicturePrefix(String linePicturePrefix) {
        this.linePicturePrefix = linePicturePrefix == null ? null : linePicturePrefix.trim();
    }

    public byte[] getLinePicture() {
        return linePicture;
    }

    public void setLinePicture(byte[] linePicture) {
        this.linePicture = linePicture;
    }
}