package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="analytics.download_logs") 
@DynamicUpdate
public class DownloadLogsBean implements Serializable {

	@Id
	@Column(name="track_id", updatable = false)
	private String track_id;

	@Id
	@Column(name="sapid", updatable = false)
	private String sapid;
	
	@Column(name="subject_name", updatable = false)
	private String subject_name;
	
	@Column(name="download_url", updatable = false)
	private String download_url;
	
	@Column(name="type", updatable = false)
	private String type;
	
	@Column(name="status")
	private String status;
	
	@Column(name="message")
	private String message;
	
	@Column(name="created_at", insertable = false, updatable = false)
	private String created_at;
	
	@Column(name="updated_at", insertable = false, updatable = false)
	private String updated_at;
	
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	
	public String getTrack_id() {
		return track_id;
	}
	public void setTrack_id(String track_id) {
		this.track_id = track_id;
	}
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getDownload_url() {
		return download_url;
	}
	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
