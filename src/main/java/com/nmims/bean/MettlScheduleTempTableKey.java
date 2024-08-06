package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class MettlScheduleTempTableKey implements Serializable{

	@Column(name="timebound_id")
	private String timebound_id;
	
	@Column(name="acessKey")
	private String schedule_accessKey;
	
	@Column(name="sapid")
	private String sapid;

	public String getTimebound_id() {
		return timebound_id;
	}

	public void setTimebound_id(String timebound_id) {
		this.timebound_id = timebound_id;
	}

	public String getSchedule_accessKey() {
		return schedule_accessKey;
	}

	public void setSchedule_accessKey(String schedule_accessKey) {
		this.schedule_accessKey = schedule_accessKey;
	}

	public String getSapid() {
		return sapid;
	}

	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	
	
}
