package com.nmims.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
@Entity
@Table(name="acads.content") 
@DynamicUpdate
//spring security related changes rename ContentBean to ContentBeanLtidemoBean
public class ContentBeanLtidemoBean extends AbstractTimestampEntity implements Serializable {
	
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String subject;
	private String description;
	private String createdBy;
	private String lastModifiedBy;
	private String name;
	private String filePath;
	private int year;
	private String month;
	private String urlType;
	private String programStructure;
	private String previewPath;
	private String webFileurl;
	private String contentType;
	private String webFileUrlDownload;
	private Long sessionPlanModuleId;
	public int getId() {
		return id;
	}
	public String getSubject() {
		return subject;
	}
	public String getDescription() {
		return description;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public String getName() {
		return name;
	}
	public String getFilePath() {
		return filePath;
	}
	public int getYear() {
		return year;
	}
	public String getMonth() {
		return month;
	}
	public String getUrlType() {
		return urlType;
	}
	public String getProgramStructure() {
		return programStructure;
	}
	public String getPreviewPath() {
		return previewPath;
	}
	public String getWebFileurl() {
		return webFileurl;
	}
	public String getContentType() {
		return contentType;
	}
	public String getWebFileUrlDownload() {
		return webFileUrlDownload;
	}
	public Long getSessionPlanModuleId() {
		return sessionPlanModuleId;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setUrlType(String urlType) {
		this.urlType = urlType;
	}
	public void setProgramStructure(String programStructure) {
		this.programStructure = programStructure;
	}
	public void setPreviewPath(String previewPath) {
		this.previewPath = previewPath;
	}
	public void setWebFileurl(String webFileurl) {
		this.webFileurl = webFileurl;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public void setWebFileUrlDownload(String webFileUrlDownload) {
		this.webFileUrlDownload = webFileUrlDownload;
	}
	public void setSessionPlanModuleId(Long sessionPlanModuleId) {
		this.sessionPlanModuleId = sessionPlanModuleId;
	}
	@Override
	public String toString() {
		return "ContentBean [id=" + id + ", subject=" + subject + ", description=" + description + ", createdBy="
				+ createdBy + ", lastModifiedBy=" + lastModifiedBy + ", name=" + name + ", filePath=" + filePath
				+ ", year=" + year + ", month=" + month + ", urlType=" + urlType + ", programStructure="
				+ programStructure + ", previewPath=" + previewPath + ", webFileurl=" + webFileurl + ", contentType="
				+ contentType + ", webFileUrlDownload=" + webFileUrlDownload + ", sessionPlanModuleId="
				+ sessionPlanModuleId + "]";
	}
	
	

	
	
}
