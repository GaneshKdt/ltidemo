package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="harvard_modules_dates")
public class HarvardBean extends AbstractTimestampEntity implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer year;
	private String month;
	private String module;
	private String terms;
	private String beforeDate;
	private String contentPath;
	private String createdBy;
	private String lastModifiedBy;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	
	
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getBeforeDate() {
		return beforeDate;
	}
	public void setBeforeDate(String beforeDate) {
		this.beforeDate = beforeDate;
	}
	public String getContentPath() {
		return contentPath;
	}
	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	
	
}
