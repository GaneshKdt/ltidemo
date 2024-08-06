package com.nmims.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="lti_user_resourse_mapping")
public class LTIUserResourcesMapping implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int userId;
	private int resourceId;
	private String accessCode;
	private String startDate;
	private String endDate;
	private int active;
	@Transient
	private String timeBoundId;
	@Transient
	private String year;
	@Transient
	private String month;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdDate", updatable=false) 
	private Date createdDate;
	private String createdBy;
	 
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modifiedDate")
    private Date lastModifiedDate;
	
	@Column(name="modifiedBy")
	private String lastModifiedBy;
	
	@PrePersist
    protected void onCreate() {
    	 createdDate = new Date();
    	 lastModifiedDate = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
    	lastModifiedDate = new Date();
    }
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getResourceId() {
		return resourceId;
	}
	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}
	public String getAccessCode() {
		return accessCode;
	}
	public void setAccessCode(String accessCode) {
		this.accessCode = accessCode;
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
	public String getTimeBoundId() {
		return timeBoundId;
	}
	public void setTimeBoundId(String timeBoundId) {
		this.timeBoundId = timeBoundId;
	}
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	
	
	@Override
	public String toString() {
		return "LTIUserResourcesMapping [id=" + id + ", userId=" + userId + ", resourceId=" + resourceId
				+ ", accessCode=" + accessCode + ", startDate=" + startDate + ", endDate=" + endDate + ", active="
				+ active + ", createdBy=" + createdBy + ", lastModifiedBy=" + lastModifiedBy + "]";
	}
	
	
}
