package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="groups_members")
public class GroupsMembers extends AbstractTimestampEntity implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Long groupid;
	private String sapid;
	private String createdBy;
	private String lastModifiedBy;
	
	@Transient
	private String errorMessage = "";
	@Transient
	private boolean errorRecord = false;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getGroupid() {
		return groupid;
	}
	public void setGroupid(Long groupid) {
		this.groupid = groupid;
	}
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
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
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public boolean isErrorRecord() {
		return errorRecord;
	}
	public void setErrorRecord(boolean errorRecord) {
		this.errorRecord = errorRecord;
	}
	
	@Override
	public String toString() {
		return "GroupsMembers [id=" + id + ", groupid=" + groupid + ", sapid=" + sapid + ", createdBy=" + createdBy
				+ ", lastModifiedBy=" + lastModifiedBy + "]";
	}	
	
}
