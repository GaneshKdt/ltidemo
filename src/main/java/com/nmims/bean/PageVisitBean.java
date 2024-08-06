package com.nmims.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity
@Table(name="lti.pages") 
@SecondaryTable(name="lti.page_visits") 
public class PageVisitBean implements Serializable{
	
	@Column(name="path")
	private String path;
	
	@Column(name="visiteddate")
	private Timestamp visiteddate;
	
	@Column(name="timespent")
	private Timestamp timespent;
	
	@Column(name="deviceName")
	private String deviceName;
	
	@Column(name="deviceOS")
	private String deviceOS;
	
	@Column(name="deviceSystemVersion")
	private String deviceSystemVersion;
	
	@Column(name="ipAddress")
	private String ipAddress;

	@Column(name="applicationType")
	private String applicationType;

	@Column(name="description")
	private String description;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Timestamp getVisiteddate() {
		return visiteddate;
	}
	public void setVisiteddate(Timestamp visiteddate) {
		this.visiteddate = visiteddate;
	}
	public Timestamp getTimespent() {
		return timespent;
	}
	public void setTimespent(Timestamp timespent) {
		this.timespent = timespent;
	}
	
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getDeviceOS() {
		return deviceOS;
	}
	public void setDeviceOS(String deviceOS) {
		this.deviceOS = deviceOS;
	}
	public String getDeviceSystemVersion() {
		return deviceSystemVersion;
	}
	public void setDeviceSystemVersion(String deviceSystemVersion) {
		this.deviceSystemVersion = deviceSystemVersion;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getApplicationType() {
		return applicationType;
	}
	public void setApplicationType(String applicationType) {
		this.applicationType = applicationType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "PageVisitBean [path=" + path + ", visiteddate=" + visiteddate + ", timespent=" + timespent + "]";
	}
	
}
