package com.nmims.bean;

import java.io.Serializable;

public class ExamProgramSubjectMappingBean extends BaseLtidemoBean implements Serializable{
	private String program;
	private String sem;
	private String subject;
	private String prgmStructApplicable;
	private String assignmentSubmitted;
	private String canBook;
	private String canFreeBook;
	private String bookingStatus;
	private String centerName;
	private String examFees;
	private Integer passScore;
	private String active;
	
	//added because of programSubjectEntries :START
	private String activeStatus;
	private int id;
	private String hasAssignment;
	private String assignmentNeededBeforeWritten ;
	private String writtenScoreModel;
	private String assignmentScoreModel ;
	private String isGraceApplicable;
	private int maxGraceMarks;
	private String assignQueryToFaculty;
	private String createCaseForQuery;
	private int sifySubjectCode;
	private String hasTest;
	private String consumerProgramStructureId;
	//END:
	
	public String getAssignmentNeededBeforeWritten() {
		return assignmentNeededBeforeWritten;
	}
	public String getConsumerProgramStructureId() {
		return consumerProgramStructureId;
	}
	public void setConsumerProgramStructureId(String consumerProgramStructureId) {
		this.consumerProgramStructureId = consumerProgramStructureId;
	}
	public String getHasTest() {
		return hasTest;
	}
	public void setHasTest(String hasTest) {
		this.hasTest = hasTest;
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

	
	public String getHasAssignment() {
		return hasAssignment;
	}
	public void setHasAssignment(String hasAssignment) {
		this.hasAssignment = hasAssignment;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public Integer getPassScore() {
		return passScore;
	}
	public void setPassScore(Integer passScore) {
		this.passScore = passScore;
	}
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getExamFees() {
		return examFees;
	}
	public void setExamFees(String examFees) {
		this.examFees = examFees;
	}
	public String getCenterName() {
		if(centerName == null){
			return "";
		}else{
			return centerName;
		}
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getCanFreeBook() {
		return canFreeBook;
	}
	public void setCanFreeBook(String canFreeBook) {
		this.canFreeBook = canFreeBook;
	}
	public String getBookingStatus() {
		return bookingStatus;
	}
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}
	public String getCanBook() {
		return canBook;
	}
	public void setCanBook(String canBook) {
		this.canBook = canBook;
	}
	public String getAssignmentSubmitted() {
		return assignmentSubmitted;
	}
	public void setAssignmentSubmitted(String assignmentSubmitted) {
		this.assignmentSubmitted = assignmentSubmitted;
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
	public String getPrgmStructApplicable() {
		return prgmStructApplicable;
	}
	public void setPrgmStructApplicable(String prgmStructApplicable) {
		this.prgmStructApplicable = prgmStructApplicable;
	}
	@Override
	public String toString() {
		return "ProgramSubjectMappingBean [program=" + program + ", sem=" + sem + ", subject=" + subject
				+ ", prgmStructApplicable=" + prgmStructApplicable + ", assignmentSubmitted=" + assignmentSubmitted
				+ ", canBook=" + canBook + ", canFreeBook=" + canFreeBook + ", bookingStatus=" + bookingStatus
				+ ", centerName=" + centerName + ", examFees=" + examFees + ", passScore=" + passScore + ", active="
				+ active + ", activeStatus=" + activeStatus + ", id=" + id + ", hasAssignment=" + hasAssignment
				+ ", assignmentNeededBeforeWritten=" + assignmentNeededBeforeWritten + ", writtenScoreModel="
				+ writtenScoreModel + ", assignmentScoreModel=" + assignmentScoreModel + ", isGraceApplicable="
				+ isGraceApplicable + ", maxGraceMarks=" + maxGraceMarks + ", assignQueryToFaculty="
				+ assignQueryToFaculty + ", createCaseForQuery=" + createCaseForQuery + "]";
	}
	public int getSifySubjectCode() {
		return sifySubjectCode;
	}
	public void setSifySubjectCode(int sifySubjectCode) {
		this.sifySubjectCode = sifySubjectCode;
	}


}

