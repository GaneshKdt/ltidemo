package com.nmims.bean;

import java.io.Serializable;
import java.util.List;

public class HarvardResponseBean implements Serializable{

	private List<HarvardBean> harvardResources;
	private String status;

	public List<HarvardBean> getHarvardResources() {
		return harvardResources;
	}
	public void setHarvardResources(List<HarvardBean> harvardResources) {
		this.harvardResources = harvardResources;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
