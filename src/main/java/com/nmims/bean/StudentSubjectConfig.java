package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_subject_config")
public class StudentSubjectConfig implements Serializable{
	
	@Id
	private int id;
	//private String prgm_sem_subj_id;
	private String startDate;
	private String endDate;
	private String acadYear;
	private String acadMonth;
	private String createdBy;
	private String createdDate;
	private String lastModifiedBy;
	private String lastModifiedDate;
	
	@OneToOne(cascade=CascadeType.MERGE, fetch=FetchType.EAGER  )        
	@JoinColumn(name="prgm_sem_subj_id")
	private ProgramSemSubject programSemSubject;
	
	public ProgramSemSubject getProgramSemSubject() {
		return programSemSubject;
	}
	public void setProgramSemSubject(ProgramSemSubject programSemSubject) {
		this.programSemSubject = programSemSubject;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
//	public String getPrgm_sem_subj_id() {
//		return prgm_sem_subj_id;
//	}
//	public void setPrgm_sem_subj_id(String prgm_sem_subj_id) {
//		this.prgm_sem_subj_id = prgm_sem_subj_id;
//	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAcadYear() {
		return acadYear;
	}
	public void setAcadYear(String acadYear) {
		this.acadYear = acadYear;
	}
	public String getAcadMonth() {
		return acadMonth;
	}
	public void setAcadMonth(String acadMonth) {
		this.acadMonth = acadMonth;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	@Override
	public String toString() {
		return "StudentSubjectConfig [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", acadYear="
				+ acadYear + ", acadMonth=" + acadMonth + ", createdBy=" + createdBy + ", createdDate=" + createdDate
				+ ", lastModifiedBy=" + lastModifiedBy + ", lastModifiedDate=" + lastModifiedDate
				+ ", programSemSubject=" + programSemSubject + "]";
	}
	

	
	
}
