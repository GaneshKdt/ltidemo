package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class StudentDeviceDetails implements Serializable{

	@Column(name="latitude")
	private String latitude;
	
	@Column(name="longitude")
	private String longitude;
	
	@Column(name="applicationVersion")
	private String applicationVersion;
	
	@Column(name="applicationType")
	private String applicationType;
	
	@Column(name="browserName")
	private String browserName;
	
	@Column(name="browserVersion")
	private String browserVersion;
	
	@Column(name="deviceOS")
	private String deviceOS;
	
	@Column(name="deviceSystemVersion")
	private String deviceSystemVersion;
	
	@Column(name="deviceName")
	private String deviceName;
	
	@Column(name="deviceType")
	private String deviceType;
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getApplicationVersion() {
		return applicationVersion;
	}
	public void setApplicationVersion(String applicationVersion) {
		this.applicationVersion = applicationVersion;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getDeviceSystemVersion() {
		return deviceSystemVersion;
	}
	public void setDeviceSystemVersion(String deviceSystemVersion) {
		this.deviceSystemVersion = deviceSystemVersion;
	}
	public String getDeviceOS() {
		return deviceOS;
	}
	public void setDeviceOS(String deviceOS) {
		this.deviceOS = deviceOS;
	}
	public String getApplicationType() {
		return applicationType;
	}
	public void setApplicationType(String applicationType) {
		this.applicationType = applicationType;
	}
	public String getBrowserName() {
		return browserName;
	}
	public void setBrowserName(String browserName) {
		this.browserName = browserName;
	}
	public String getBrowserVersion() {
		return browserVersion;
	}
	public void setBrowserVersion(String browserVersion) {
		this.browserVersion = browserVersion;
	}
	@Override
	public String toString() {
		return "StudentDeviceDetails [latitude=" + latitude + ", longitude=" + longitude + ", applicationVersion="
				+ applicationVersion + ", applicationType=" + applicationType + ", browserName=" + browserName
				+ ", browserVersion=" + browserVersion + ", deviceOS=" + deviceOS + ", deviceSystemVersion="
				+ deviceSystemVersion + ", deviceName=" + deviceName + ", deviceType=" + deviceType + "]";
	}
}
