package com.nmims.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="analytics.network_logs") 
@DynamicUpdate
public class TestAuditNetworkLogBean implements Serializable{
	
	@Transient
	private String api;
	
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="sapid")
	private String sapid;

	@Column(name="api_id")
	private int api_id;
	
	@Column(name="name")
	private String name;

	@Column(name="resquest_time")
	private String resquest_time;

	@Column(name="response_time")
	private String response_time;

	@Column(name="duration")
	private double duration;

	@Column(name="response_payload_size")
	private String response_payload_size;

	@Column(name="networkInfo")
	private String networkInfo;

	@Column(name="status")
	private String status;

	@Column(name="error_message")
	private String error_message;

	@Column(name="carrier")
	private String carrier;

	@Column(name="platform")
	private String platform;

	@Column(name="description")
	private String description;

	@Column(name="created_at", insertable=false, updatable=false)
	private Date created_at;

	@Column(name="updated_at", insertable=false, updatable=false)
	private String updated_at;


	public String getApi() {
		return api;
	}

	public void setApi(String api) {
		this.api = api;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSapid() {
		return sapid;
	}

	public void setSapid(String sapid) {
		this.sapid = sapid;
	}

	public int getApi_id() {
		return api_id;
	}

	public void setApi_id(int api_id) {
		this.api_id = api_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public String getResquest_time() {
		return resquest_time;
	}

	public void setResquest_time(String resquest_time) {
		this.resquest_time = resquest_time;
	}

	public String getResponse_time() {
		return response_time;
	}

	public void setResponse_time(String response_time) {
		this.response_time = response_time;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public String getResponse_payload_size() {
		return response_payload_size;
	}

	public void setResponse_payload_size(String response_payload_size) {
		this.response_payload_size = response_payload_size;
	}

	public String getNetworkInfo() {
		return networkInfo;
	}

	public void setNetworkInfo(String networkInfo) {
		this.networkInfo = networkInfo;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getError_message() {
		return error_message;
	}

	public void setError_message(String error_message) {
		this.error_message = error_message;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "NetworkLogsBean [api=" + api + ", id=" + id + ", sapid=" + sapid + ", api_id=" + api_id
				+ ", resquest_time=" + resquest_time + ", response_time=" + response_time + ", duration=" + duration
				+ ", response_payload_size=" + response_payload_size + ", networkInfo=" + networkInfo + ", status="
				+ status + ", error_message=" + error_message + ", carrier=" + carrier + ", platform=" + platform
				+ ", created_at=" + created_at+ ", updated_at=" + updated_at + "]";
	}
}
