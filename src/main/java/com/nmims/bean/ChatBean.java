package com.nmims.bean;

import java.io.Serializable;

public class ChatBean implements Serializable{
	
	private String userId;
	private String role;
	private String subject;
	private int sem;
	private String subjectConfigId;
	private String specializationType;
	private String groupName;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getSem() {
		return sem;
	}
	public void setSem(int sem) {
		this.sem = sem;
	}
	public String getSubjectConfigId() {
		return subjectConfigId;
	}
	public void setSubjectConfigId(String subjectConfigId) {
		this.subjectConfigId = subjectConfigId;
	}
	public String getSpecializationType() {
		return specializationType;
	}
	public void setSpecializationType(String specializationType) {
		this.specializationType = specializationType;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

}
