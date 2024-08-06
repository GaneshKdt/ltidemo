package com.nmims.bean;

import java.io.Serializable;

public class MettlSSODetails implements Serializable{

	private String destinationURL;
	private String ID;
	private String metadata;
	private String error;
	private String audience;
	private StudentLtidemoBean studentInfo;
	
	public String getDestinationURL() {
		return destinationURL;
	}
	public void setDestinationURL(String destinationURL) {
		this.destinationURL = destinationURL;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getMetadata() {
		return metadata;
	}
	public void setMetadata(String metadata) {
		this.metadata = metadata;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getAudience() {
		return audience;
	}
	public void setAudience(String audience) {
		this.audience = audience;
	}
	@Override
	public String toString() {
		return "MettlSSODetails [destinationURL=" + destinationURL + ", ID=" + ID + ", metadata=" + metadata
				+ ", error=" + error + ", audience=" + audience + "]";
	}
	public StudentLtidemoBean getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentLtidemoBean studentInfo) {
		this.studentInfo = studentInfo;
	}
}
