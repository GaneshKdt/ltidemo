package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="timebound_student_mapping")
public class TimeBoundStudentMapping extends AbstractTimestampEntity implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;
	private String sapid;
	private int student_subject_config_id;
	private String batch;
	private String createdBy;
	private String lastModifiedBy;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public int getStudent_subject_config_id() {
		return student_subject_config_id;
	}
	public void setStudent_subject_config_id(int student_subject_config_id) {
		this.student_subject_config_id = student_subject_config_id;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
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
	
	
}
