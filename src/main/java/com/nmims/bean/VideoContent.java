package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acads.video_content") 
public class VideoContent implements Serializable{

	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	int sessionId;
	String fileName;
	String facultyId;
	String keywords;
	String description;
	String subject;
	String defaultVideo;
	String duration;
	String sessionDate;
	String addedOn;
	String year;
	String month;
	String createdBy;
	String lastModifiedDate;
	String lastModifiedBy;
	String videoLink;
	String thumbnailUrl;
	String mobileUrlHd;
	String mobileUrlSd1;
	String mobileUrlSd2;
	public int getId() {
		return id;
	}
	public int getSessionId() {
		return sessionId;
	}
	public String getFileName() {
		return fileName;
	}
	public String getFacultyId() {
		return facultyId;
	}
	public String getKeywords() {
		return keywords;
	}
	public String getDescription() {
		return description;
	}
	public String getSubject() {
		return subject;
	}
	public String getDefaultVideo() {
		return defaultVideo;
	}
	public String getDuration() {
		return duration;
	}
	public String getSessionDate() {
		return sessionDate;
	}
	public String getAddedOn() {
		return addedOn;
	}
	public String getYear() {
		return year;
	}
	public String getMonth() {
		return month;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public String getMobileUrlHd() {
		return mobileUrlHd;
	}
	public String getMobileUrlSd1() {
		return mobileUrlSd1;
	}
	public String getMobileUrlSd2() {
		return mobileUrlSd2;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setDefaultVideo(String defaultVideo) {
		this.defaultVideo = defaultVideo;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
	}
	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public void setMobileUrlHd(String mobileUrlHd) {
		this.mobileUrlHd = mobileUrlHd;
	}
	public void setMobileUrlSd1(String mobileUrlSd1) {
		this.mobileUrlSd1 = mobileUrlSd1;
	}
	public void setMobileUrlSd2(String mobileUrlSd2) {
		this.mobileUrlSd2 = mobileUrlSd2;
	}
	@Override
	public String toString() {
		return "VideoContent [id=" + id + ", sessionId=" + sessionId + ", fileName=" + fileName + ", facultyId="
				+ facultyId + ", keywords=" + keywords + ", description=" + description + ", subject=" + subject
				+ ", defaultVideo=" + defaultVideo + ", duration=" + duration + ", sessionDate=" + sessionDate
				+ ", addedOn=" + addedOn + ", year=" + year + ", month=" + month + ", createdBy=" + createdBy
				+ ", lastModifiedDate=" + lastModifiedDate + ", lastModifiedBy=" + lastModifiedBy + ", videoLink="
				+ videoLink + ", thumbnailUrl=" + thumbnailUrl + ", mobileUrlHd=" + mobileUrlHd + ", mobileUrlSd1="
				+ mobileUrlSd1 + ", mobileUrlSd2=" + mobileUrlSd2 + "]";
	}
	
	
}
