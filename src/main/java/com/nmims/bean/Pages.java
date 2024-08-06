package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="lti.pages") 
@DynamicUpdate
public class Pages implements Serializable{

	@Id
	@GeneratedValue(strategy = javax.persistence.GenerationType.IDENTITY )
	private int id;
	
	@Column(name="path")
	private String path;
	
	@Column(name="url")
	private String url;

	@Column(name="description")
	private String description;
	
	@Column(name="type")
	private String type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Pages [id=" + id + ", path=" + path + ", url=" + url + ", description=" + description + ", type=" + type
				+ "]";
	}
	
}
