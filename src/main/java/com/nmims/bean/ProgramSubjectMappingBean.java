package com.nmims.bean;


import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="exam.program_sem_subject")
public class ProgramSubjectMappingBean implements Serializable{

	@Id
	private int id;
	private int consumerProgramStructureId;
	private String subject;
	private String active;
	private int sem;
	private String hasAssignment;
	private String assignmentNeededBeforeWritten ;
	private String writtenScoreModel;
	private String assignmentScoreModel;
	private String isGraceApplicable;
	private int maxGraceMarks;
	private String createCaseForQuery;
	private String assignQueryToFaculty;
	private int sifySubjectCode;
	private String hasTest;
	private int passScore;
    private String createdBy;
    private Timestamp createdDate;
    private String lastModifiedBy;
    private Timestamp lastModifiedDate;
	//EMBA
	
    @Transient
	private String studentType;


	public String getCreatedBy() {
		return createdBy;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy;
	}

	public Timestamp getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public void setLastModifiedDate(Timestamp lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public int getPassScore() {
		return passScore;
	}

	public void setPassScore(int passScore) {
		this.passScore = passScore;
	}

	

	public int getSem() {
		return sem;
	}

	public void setSem(int sem) {
		this.sem = sem;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHasAssignment() {
		return hasAssignment;
	}

	public void setHasAssignment(String hasAssignment) {
		this.hasAssignment = hasAssignment;
	}

	public String getAssignmentNeededBeforeWritten() {
		return assignmentNeededBeforeWritten;
	}

	public void setAssignmentNeededBeforeWritten(String assignmentNeededBeforeWritten) {
		this.assignmentNeededBeforeWritten = assignmentNeededBeforeWritten;
	}

	public String getWrittenScoreModel() {
		return writtenScoreModel;
	}

	public void setWrittenScoreModel(String writtenScoreModel) {
		this.writtenScoreModel = writtenScoreModel;
	}

	public String getAssignmentScoreModel() {
		return assignmentScoreModel;
	}

	public void setAssignmentScoreModel(String assignmentScoreModel) {
		this.assignmentScoreModel = assignmentScoreModel;
	}

	public String getIsGraceApplicable() {
		return isGraceApplicable;
	}

	public void setIsGraceApplicable(String isGraceApplicable) {
		this.isGraceApplicable = isGraceApplicable;
	}

	public int getMaxGraceMarks() {
		return maxGraceMarks;
	}

	public void setMaxGraceMarks(int maxGraceMarks) {
		this.maxGraceMarks = maxGraceMarks;
	}

	public String getAssignQueryToFaculty() {
		return assignQueryToFaculty;
	}

	public void setAssignQueryToFaculty(String assignQueryToFaculty) {
		this.assignQueryToFaculty = assignQueryToFaculty;
	}

	public String getCreateCaseForQuery() {
		return createCaseForQuery;
	}

	public void setCreateCaseForQuery(String createCaseForQuery) {
		this.createCaseForQuery = createCaseForQuery;
	}

	public int getSifySubjectCode() {
		return sifySubjectCode;
	}

	public void setSifySubjectCode(int sifySubjectCode) {
		this.sifySubjectCode = sifySubjectCode;
	}

	public String getHasTest() {
		return hasTest;
	}

	public void setHasTest(String hasTest) {
		this.hasTest = hasTest;
	}

	public int getConsumerProgramStructureId() {
		return consumerProgramStructureId;
	}

	public void setConsumerProgramStructureId(int consumerProgramStructureId) {
		this.consumerProgramStructureId = consumerProgramStructureId;
	}

	public String getStudentType() {
		return studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

	@Override
	public String toString() {
		return "ProgramSubjectMappingBean [id=" + id + ", consumerProgramStructureId=" + consumerProgramStructureId
				+ ", subject=" + subject + ", active=" + active + ", sem=" + sem + ", hasAssignment=" + hasAssignment
				+ ", assignmentNeededBeforeWritten=" + assignmentNeededBeforeWritten + ", writtenScoreModel="
				+ writtenScoreModel + ", assignmentScoreModel=" + assignmentScoreModel + ", isGraceApplicable="
				+ isGraceApplicable + ", maxGraceMarks=" + maxGraceMarks + ", createCaseForQuery=" + createCaseForQuery
				+ ", assignQueryToFaculty=" + assignQueryToFaculty + ", sifySubjectCode=" + sifySubjectCode
				+ ", hasTest=" + hasTest + ", studentType=" + studentType + "]";
	}




	
	
}
