package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="hashtag")
public class Hashtag extends AbstractTimestampEntity implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String program_sem_subject_id;
	private String hashtag;
	private String createdBy;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProgram_sem_subject_id() {
		return program_sem_subject_id;
	}
	public void setProgram_sem_subject_id(String program_sem_subject_id) {
		this.program_sem_subject_id = program_sem_subject_id;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	@Override
	public String toString() {
		return "Hashtag [id=" + id + ", program_sem_subject_id=" + program_sem_subject_id + ", Hashtag=" + hashtag
				+ ", createdBy=" + createdBy + "]";
	}
	
}
