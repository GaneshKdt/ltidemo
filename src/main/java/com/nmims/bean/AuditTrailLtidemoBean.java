package com.nmims.bean;

import java.io.Serializable;

//spring security related changes rename AuditTrailBean to AuditTrailLtidemoBean
public class AuditTrailLtidemoBean implements Serializable{

	private long testId;
	private String sapid;
	private String startDate;
	private int duration;

	public long getTestId() {
		return testId;
	}

	public void setTestId(long testId) {
		this.testId = testId;
	}

	public String getSapid() {
		return sapid;
	}

	public void setSapid(String sapid) {
		this.sapid = sapid;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

}