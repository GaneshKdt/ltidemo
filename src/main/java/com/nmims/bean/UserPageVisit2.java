package com.nmims.bean;

import java.io.Serializable;

public class UserPageVisit2 implements Serializable{
	private String sapid;
	private String page;
	private String initialTimeStamp;
	private String timeSpent;
	private String ipAddress;
	private String type;
	private StudentDeviceDetails client;
	
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getInitialTimeStamp() {
		return initialTimeStamp;
	}
	public void setInitialTimeStamp(String initialTimeStamp) {
		this.initialTimeStamp = initialTimeStamp;
	}
	public String getTimeSpent() {
		return timeSpent;
	}
	public void setTimeSpent(String timeSpent) {
		this.timeSpent = timeSpent;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public StudentDeviceDetails getClient() {
		return client;
	}
	public void setClient(StudentDeviceDetails client) {
		this.client = client;
	}
	@Override
	public String toString() {
		return "UserPageVisit [sapid=" + sapid + ", page=" + page + ", initialTimeStamp=" + initialTimeStamp
				+ ", timeSpent=" + timeSpent + ", ipAddress=" + ipAddress
				+ ", client=" + client + "]";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
