package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lti.timebound_user_mapping") 
public class TimeboundUserMapping implements Serializable{
	
	@Id
	@Column(name="id")
	private String id;
	
	@Column(name="userId")
	private String userId;
	
	@Column(name="timebound_subject_config_id")
	private String timebound_subject_config_id;
	
	@Column(name="role")
	private String role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTimebound_subject_config_id() {
		return timebound_subject_config_id;
	}

	public void setTimebound_subject_config_id(String timebound_subject_config_id) {
		this.timebound_subject_config_id = timebound_subject_config_id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "TimeboundUserMapping [id=" + id + ", userId=" + userId + ", timebound_subject_config_id="
				+ timebound_subject_config_id + ", role=" + role + "]";
	}
	
	
}
