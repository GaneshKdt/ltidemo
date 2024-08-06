package com.nmims.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;

//@Table(name="lti.test_lostfocuslogs") 
public class LostFocusLogBean implements Serializable{
	
	private String id;
	private String sapid;
	private String testId;
	private String initialTimeStamp;
	private String timeAway;
	private String ipAddress;
	private String createdBy;
	private Timestamp createdDate;
	private String lastModifiedBy;
	private Timestamp lastModifiedDate;
	private BigDecimal timeAwayInMins;
	private BigInteger timeAwayInSecs;
	private BigDecimal totalTimeAwayInSecs;
	private BigDecimal totalTimeAwayInMins;
	private String emailId;
	private BigInteger count;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getInitialTimeStamp() {
		return initialTimeStamp;
	}
	public void setInitialTimeStamp(String initialTimeStamp) {
		this.initialTimeStamp = initialTimeStamp;
	}
	public String getTimeAway() {
		return timeAway;
	}
	public void setTimeAway(String timeAway) {
		this.timeAway = timeAway;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public BigDecimal getTimeAwayInMins() {
		return timeAwayInMins;
	}
	public void setTimeAwayInMins(BigDecimal timeAwayInMins) {
		this.timeAwayInMins = timeAwayInMins;
	}
	public BigInteger getTimeAwayInSecs() {
		return timeAwayInSecs;
	}
	public void setTimeAwayInSecs(BigInteger timeAwayInSecs) {
		this.timeAwayInSecs = timeAwayInSecs;
	}
	public Timestamp getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(Timestamp lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public BigInteger getCount() {
		return count;
	}
	public void setCount(BigInteger count) {
		this.count = count;
	}
	public BigDecimal getTotalTimeAwayInSecs() {
		return totalTimeAwayInSecs;
	}
	public void setTotalTimeAwayInSecs(BigDecimal totalTimeAwayInSecs) {
		this.totalTimeAwayInSecs = totalTimeAwayInSecs;
	}
	public BigDecimal getTotalTimeAwayInMins() {
		return totalTimeAwayInMins;
	}
	public void setTotalTimeAwayInMins(BigDecimal totalTimeAwayInMins) {
		this.totalTimeAwayInMins = totalTimeAwayInMins;
	}
	@Override
	public String toString() {
		return "LostFocusLogBean [sapid=" + sapid + ", testId=" + testId + ", initialTimeStamp=" + initialTimeStamp
				+ ", timeAway=" + timeAway + ", ipAddress=" + ipAddress + ", createdBy=" + createdBy + ", createdDate="
				+ createdDate + ", lastModifiedBy=" + lastModifiedBy + ", lastModifiedDate=" + lastModifiedDate
				+ ", timeAwayInMins=" + timeAwayInMins + ", timeAwayInSecs=" + timeAwayInSecs + "]";
	}
}
