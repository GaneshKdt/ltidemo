package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name="groups")
public class GroupBean extends AbstractTimestampEntity implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String timeBoundId;
	@Transient
	private String program_sem_subject_id;
	private String groupName;
	private String groupDescription;
	private String groupProfilePic;
	private String active;
	private String createdBy;
	private String lastModifiedBy;
	
	@Transient
	private CommonsMultipartFile fileData;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTimeBoundId() {
		return timeBoundId;
	}
	public void setTimeBoundId(String timeBoundId) {
		this.timeBoundId = timeBoundId;
	}
	public String getProgram_sem_subject_id() {
		return program_sem_subject_id;
	}
	public void setProgram_sem_subject_id(String program_sem_subject_id) {
		this.program_sem_subject_id = program_sem_subject_id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupDescription() {
		return groupDescription;
	}
	public void setGroupDescription(String groupDescription) {
		this.groupDescription = groupDescription;
	}
	public String getGroupProfilePic() {
		return groupProfilePic;
	}
	public void setGroupProfilePic(String groupProfilePic) {
		this.groupProfilePic = groupProfilePic;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "GroupBean [id=" + id + ", timeBoundId=" + timeBoundId + ", groupName=" + groupName + ", groupDescription="
				+ groupDescription + ", groupProfilePic=" + groupProfilePic + ", active=" + active + ", createdBy="
				+ createdBy + ", lastModifiedBy=" + lastModifiedBy + "]";
	}
	
}
