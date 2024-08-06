package com.nmims.bean;

import java.io.Serializable;

public class MettlStudentSSOBean implements Serializable{
	
	private String bookingId;
	private String sapid;
	private String scheduleId;
	private String scheduleAccessUrl;
	private String scheduleAccessKey;
	private String scheduleName;
	private String error;
	private String status;
	
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getScheduleAccessUrl() {
		return scheduleAccessUrl;
	}
	public void setScheduleAccessUrl(String scheduleAccessUrl) {
		this.scheduleAccessUrl = scheduleAccessUrl;
	}
	public String getScheduleAccessKey() {
		return scheduleAccessKey;
	}
	public void setScheduleAccessKey(String scheduleAccessKey) {
		this.scheduleAccessKey = scheduleAccessKey;
	}
	public String getScheduleName() {
		return scheduleName;
	}
	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MettlStudentSSOBean [sapid=" + sapid + ", scheduleId=" + scheduleId + ", scheduleAccessUrl="
				+ scheduleAccessUrl + ", scheduleAccessKey=" + scheduleAccessKey + ", scheduleName=" + scheduleName
				+ ", error=" + error + ", status=" + status + "]";
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	
	
}
