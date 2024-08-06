package com.nmims.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.assignment_live_setting") 
//spring security related changes rename AssignmentLiveSetting to AssignmentLiveSettingLtidemo
public class AssignmentLiveSettingLtidemo implements Serializable{
	@Id  
	int examYear;
	String examMonth;
	String liveType;
	int consumerProgramStructureId;
	public int getExamYear() {
		return examYear;
	}
	public String getExamMonth() {
		return examMonth;
	}
	public String getLiveType() {
		return liveType;
	}
	public int getConsumerProgramStructureId() {
		return consumerProgramStructureId;
	}
	public void setExamYear(int examYear) {
		this.examYear = examYear;
	}
	public void setExamMonth(String examMonth) {
		this.examMonth = examMonth;
	}
	public void setLiveType(String liveType) {
		this.liveType = liveType;
	}
	public void setConsumerProgramStructureId(int consumerProgramStructureId) {
		this.consumerProgramStructureId = consumerProgramStructureId;
	}
	@Override
	public String toString() {
		return "AssignmentLiveSetting [examYear=" + examYear + ", examMonth=" + examMonth + ", liveType=" + liveType
				+ ", consumerProgramStructureId=" + consumerProgramStructureId + "]";
	}
	
	
}
