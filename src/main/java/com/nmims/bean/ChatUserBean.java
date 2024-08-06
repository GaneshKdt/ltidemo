package com.nmims.bean;

import java.io.Serializable;

public class ChatUserBean implements Serializable{
	
	String firstName;
	String lastName;
	String sapId;
	String imageUrl;
	String program;
	String batch;
	String subject;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getSapId() {
		return sapId;
	}
	public void setSapId(String sapId) {
		this.sapId = sapId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "chatUserBean [firstName=" + firstName + ", lastName=" + lastName + ", sapid=" + sapId + ", imageUrl="
				+ imageUrl + "]";
	}
	


}
