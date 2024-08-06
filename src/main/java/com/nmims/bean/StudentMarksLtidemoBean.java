package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="marks", schema="exam")
//spring security related changes rename StudentMarksBean to StudentMarksLtidemoBean
public class StudentMarksLtidemoBean implements Serializable{

	@Id
	private String sapid;
	private long id;
	private String year;
	private String month;
	private String examorder;
	private String studentname;
	private String program;
	private String sem;
	private String subject;
	
	/*
	private String syllabusYear;
	private String grno;
	private String writenscore;
	private String assignmentscore;
	private String gracemarks;
	private String total;
	private String attempt;
	private String source;
	private String location;
	private String centercode;
	private String remarks;
	private String errorMessage = "";
	private boolean errorRecord = false;
	private String createdBy;
	private String createdDate;
	private String lastModifiedBy;
	private String lastModifiedDate;
	private String examMode;
	private String offlineCenterId;
	private String onlineCenterId;
	private String centerId;
	private String firstName;
	private String lastName;
	private String examCenterName;
	private String city;
	private String subjetsCleared;
	private String reason;
	private String markedForRevaluation;
	private String markedForPhotocopy;
	private String toBeEvaluated;
	private String revaulationResultDeclared;
	private String oldWrittenScore;
	private String oldAssignmentScore;
	*/
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getExamorder() {
		return examorder;
	}
	public void setExamorder(String examorder) {
		this.examorder = examorder;
	}
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/*
	public String getGrno() {
		return grno;
	}
	public void setGrno(String grno) {
		this.grno = grno;
	}
	public String getSyllabusYear() {
		return syllabusYear;
	}
	public void setSyllabusYear(String syllabusYear) {
		this.syllabusYear = syllabusYear;
	}
	public String getWritenscore() {
		return writenscore;
	}
	public void setWritenscore(String writenscore) {
		this.writenscore = writenscore;
	}
	public String getAssignmentscore() {
		return assignmentscore;
	}
	public void setAssignmentscore(String assignmentscore) {
		this.assignmentscore = assignmentscore;
	}
	public String getGracemarks() {
		return gracemarks;
	}
	public void setGracemarks(String gracemarks) {
		this.gracemarks = gracemarks;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getAttempt() {
		return attempt;
	}
	public void setAttempt(String attempt) {
		this.attempt = attempt;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCentercode() {
		return centercode;
	}
	public void setCentercode(String centercode) {
		this.centercode = centercode;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public boolean isErrorRecord() {
		return errorRecord;
	}
	public void setErrorRecord(boolean errorRecord) {
		this.errorRecord = errorRecord;
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
	public String getExamMode() {
		return examMode;
	}
	public void setExamMode(String examMode) {
		this.examMode = examMode;
	}
	public String getOfflineCenterId() {
		return offlineCenterId;
	}
	public void setOfflineCenterId(String offlineCenterId) {
		this.offlineCenterId = offlineCenterId;
	}
	public String getOnlineCenterId() {
		return onlineCenterId;
	}
	public void setOnlineCenterId(String onlineCenterId) {
		this.onlineCenterId = onlineCenterId;
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getExamCenterName() {
		return examCenterName;
	}
	public void setExamCenterName(String examCenterName) {
		this.examCenterName = examCenterName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSubjetsCleared() {
		return subjetsCleared;
	}
	public void setSubjetsCleared(String subjetsCleared) {
		this.subjetsCleared = subjetsCleared;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getMarkedForRevaluation() {
		return markedForRevaluation;
	}
	public void setMarkedForRevaluation(String markedForRevaluation) {
		this.markedForRevaluation = markedForRevaluation;
	}
	public String getMarkedForPhotocopy() {
		return markedForPhotocopy;
	}
	public void setMarkedForPhotocopy(String markedForPhotocopy) {
		this.markedForPhotocopy = markedForPhotocopy;
	}
	public String getToBeEvaluated() {
		return toBeEvaluated;
	}
	public void setToBeEvaluated(String toBeEvaluated) {
		this.toBeEvaluated = toBeEvaluated;
	}
	public String getRevaulationResultDeclared() {
		return revaulationResultDeclared;
	}
	public void setRevaulationResultDeclared(String revaulationResultDeclared) {
		this.revaulationResultDeclared = revaulationResultDeclared;
	}
	public String getOldWrittenScore() {
		return oldWrittenScore;
	}
	public void setOldWrittenScore(String oldWrittenScore) {
		this.oldWrittenScore = oldWrittenScore;
	}
	public String getOldAssignmentScore() {
		return oldAssignmentScore;
	}
	public void setOldAssignmentScore(String oldAssignmentScore) {
		this.oldAssignmentScore = oldAssignmentScore;
	}
	*/
	
	@Override
	public String toString() {
		return "StudentMarksBean [sapid=" + sapid + ", id=" + id + ", year=" + year + ", month=" + month
				+ ", examorder=" + examorder + ", studentname=" + studentname + ", program=" + program + ", sem=" + sem
				+ ", subject=" + subject + "]";
	}


	
	
}
