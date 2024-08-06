package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="lti.page_visits") 
@DynamicUpdate
public class UserPageVisit implements Serializable {

	@Transient
	private String page;
	
	@Transient
	private UserPageVisit2 userPageVisit;
	
	@Transient
	private String type;

	@Column(name="id", insertable = false, updatable = false)
	private String id; 


	@Id
	@Column(name="sapid")
	private String sapid;

	@Column(name="pageId")
	private int pageId;

	@Id
	@Column(name="initialTimeStamp")
	private String initialTimeStamp;
	
	@Column(name="timeSpent")
	private String timeSpent;
	
	@Column(name="ipAddress")
	private String ipAddress;

	@Column(name = "created_at", insertable = false, updatable = false)
	private String created_at;
	
	@Column(name = "updated_at", insertable = false, updatable = false)
	private String updated_at;
	
	private StudentDeviceDetails client;
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public UserPageVisit2 getUserPageVisit() {
		return userPageVisit;
	}

	public void setUserPageVisit(UserPageVisit2 userPageVisit) {
		this.userPageVisit = userPageVisit;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSapid() {
		return sapid;
	}

	public void setSapid(String sapid) {
		this.sapid = sapid;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
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
		return "UserPageVisit [page=" + page + ", userPageVisit=" + userPageVisit + ", type=" + type + ", id=" + id
				+ ", sapid=" + sapid + ", pageId=" + pageId + ", initialTimeStamp=" + initialTimeStamp + ", timeSpent="
				+ timeSpent + ", ipAddress=" + ipAddress + ", client=" + client + "]";
	}
	
}
