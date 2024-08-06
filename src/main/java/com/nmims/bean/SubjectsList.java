package com.nmims.bean;

import java.io.Serializable;

public class SubjectsList implements Serializable{
	
	public String timeBoundId;
	public String subject;
	public String sem;
	public String acadMonth;
	public int acadYear;
	public String startDate;
	public String endDate;
	
	public String getTimeBoundId() {
		return timeBoundId;
	}
	public void setTimeBoundId(String timeBoundId) {
		this.timeBoundId = timeBoundId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getAcadMonth() {
		return acadMonth;
	}
	public void setAcadMonth(String acadMonth) {
		this.acadMonth = acadMonth;
	}
	
	public int getAcadYear() {
		return acadYear;
	}
	public void setAcadYear(int acadYear) {
		this.acadYear = acadYear;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "SubjectsList [timeBoundId=" + timeBoundId + ", subject=" + subject + ", sem=" + sem + ", acadMonth="
				+ acadMonth + ", acadYear=" + acadYear + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	

}
