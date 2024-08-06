package com.nmims.bean;

import java.io.Serializable;
import java.util.List;

public class LTIResponseBean implements Serializable{

	private String status;
	private String message;
	private List ltiResources;

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

	public List getLtiResources() {
		return ltiResources;
	}

	public void setLtiResources(List ltiResources) {
		this.ltiResources = ltiResources;
	}

}
