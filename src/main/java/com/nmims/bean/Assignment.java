package com.nmims.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="exam.assignments") 
public class Assignment implements Serializable{

	@Id  
	int year;
	String month;
	String subject;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm a z")
	Timestamp startDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm a z")
	Timestamp endDate;
	String instructions;
	String filePath;
	String createdBy;
	Timestamp createdDate;
	String lastModifiedBy;
	Timestamp lastModifiedDate;
	String questionFilePreviewPath;
	String program;
    int consumerProgramStructureId;
	public int getYear() {
		return year;
	}
	public String getMonth() {
		return month;
	}
	public String getSubject() {
		return subject;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public String getInstructions() {
		return instructions;
	}
	public String getFilePath() {
		return filePath;
	}
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
	public String getQuestionFilePreviewPath() {
		return questionFilePreviewPath;
	}
	public String getProgram() {
		return program;
	}
	public int getConsumerProgramStructureId() {
		return consumerProgramStructureId;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	public void setQuestionFilePreviewPath(String questionFilePreviewPath) {
		this.questionFilePreviewPath = questionFilePreviewPath;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public void setConsumerProgramStructureId(int consumerProgramStructureId) {
		this.consumerProgramStructureId = consumerProgramStructureId;
	}
	@Override
	public String toString() {
		return "Assignment [year=" + year + ", month=" + month + ", subject=" + subject + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", instructions=" + instructions + ", filePath=" + filePath + ", createdBy="
				+ createdBy + ", createdDate=" + createdDate + ", lastModifiedBy=" + lastModifiedBy
				+ ", lastModifiedDate=" + lastModifiedDate + ", questionFilePreviewPath=" + questionFilePreviewPath
				+ ", program=" + program + ", consumerProgramStructureId=" + consumerProgramStructureId + "]";
	}
    

	
	
	
}
