package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.program_sem_subject")
public class ProgramSemSubjectBean implements Serializable{
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int consumerProgramStructureId;
	private String subject;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getConsumerProgramStructureId() {
		return consumerProgramStructureId;
	}
	public void setConsumerProgramStructureId(int consumerProgramStructureId) {
		this.consumerProgramStructureId = consumerProgramStructureId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	

}
