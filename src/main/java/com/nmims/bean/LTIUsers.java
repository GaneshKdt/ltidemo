package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lti_users")
public class LTIUsers extends AbstractTimestampEntity implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String userId;
	private String lisPersonNameFull;
	private String lisPersonNameGiven;
	private String lisPersonNameFamily;
	private String lisPersonSourcedId;
	private String lisPersonContactEmailPrimary;
	private String roles;
	private String userImage;
	private String createdBy;
	private String lastModifiedBy;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLisPersonNameFull() {
		return lisPersonNameFull;
	}
	public void setLisPersonNameFull(String lisPersonNameFull) {
		this.lisPersonNameFull = lisPersonNameFull;
	}
	public String getLisPersonNameGiven() {
		return lisPersonNameGiven;
	}
	public void setLisPersonNameGiven(String lisPersonNameGiven) {
		this.lisPersonNameGiven = lisPersonNameGiven;
	}
	public String getLisPersonNameFamily() {
		return lisPersonNameFamily;
	}
	public void setLisPersonNameFamily(String lisPersonNameFamily) {
		this.lisPersonNameFamily = lisPersonNameFamily;
	}
	public String getLisPersonSourcedId() {
		return lisPersonSourcedId;
	}
	public void setLisPersonSourcedId(String lisPersonSourcedId) {
		this.lisPersonSourcedId = lisPersonSourcedId;
	}
	public String getLisPersonContactEmailPrimary() {
		return lisPersonContactEmailPrimary;
	}
	public void setLisPersonContactEmailPrimary(String lisPersonContactEmailPrimary) {
		this.lisPersonContactEmailPrimary = lisPersonContactEmailPrimary;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
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
		return "LTIUsers [id=" + id + ", userId=" + userId + ", lisPersonNameFull=" + lisPersonNameFull
				+ ", lisPersonNameGiven=" + lisPersonNameGiven + ", lisPersonNameFamily=" + lisPersonNameFamily
				+ ", lisPersonSourcedId=" + lisPersonSourcedId + ", lisPersonContactEmailPrimary="
				+ lisPersonContactEmailPrimary + ", roles=" + roles + ", userImage=" + userImage + ", createdBy="
				+ createdBy + ", lastModifiedBy=" + lastModifiedBy + "]";
	}
	
}
