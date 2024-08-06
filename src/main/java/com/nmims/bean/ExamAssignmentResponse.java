package com.nmims.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ExamAssignmentResponse implements Serializable{
   
	private ArrayList<String> currentYearList;	
	private ArrayList<String> subjectList;
	private String error;  
	private String yearMonth; 
	private List<AssignmentFileLtidemoBean> currentSemAssignmentFilesList;
	private String success; 
	private String successMessage; 
	
	private int maxAttempts;


	private int currentSemSubjectsCount;
	private int currentSemSubmissionCount;
	private List<AssignmentFileLtidemoBean> failSubjectsAssignmentFilesList;
	private int failSubjectsCount;
	private int failSubjectSubmissionCount;
	private String currentSemEndDateTime;
	private String failSubjectsEndDateTime;  
	private ArrayList<String> timeExtendedStudentIdSubjectList;
	private ArrayList<String> applicableSubjects;
	private ArrayList<String> subjectsNotAllowedToSubmit;
	private AssignmentFileLtidemoBean assignmentFile;
	private String subject;
	private String ErrorMessage;
	
	public String getSuccessMessage() {
		return successMessage;
	}
	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}
	public String getErrorMessage() {
		return ErrorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		ErrorMessage = errorMessage;
	}
	public int getMaxAttempts() {
		return maxAttempts;
	}
	public void setMaxAttempts(int maxAttempts) {
		this.maxAttempts = maxAttempts;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public AssignmentFileLtidemoBean getAssignmentFile() {
		return assignmentFile;
	}
	public void setAssignmentFile(AssignmentFileLtidemoBean assignmentFile) {
		this.assignmentFile = assignmentFile;
	}
	
	public ArrayList<String> getSubjectsNotAllowedToSubmit() {
		return subjectsNotAllowedToSubmit;
	}
	public void setSubjectsNotAllowedToSubmit(ArrayList<String> subjectsNotAllowedToSubmit) {
		this.subjectsNotAllowedToSubmit = subjectsNotAllowedToSubmit;
	}
	public ArrayList<String> getApplicableSubjects() {
		return applicableSubjects;
	}
	public void setApplicableSubjects(ArrayList<String> applicableSubjects) {
		this.applicableSubjects = applicableSubjects;
	}
	public ArrayList<String> getCurrentYearList() {
		return currentYearList;   
	}
	public void setCurrentYearList(ArrayList<String> currentYearList) {
		this.currentYearList = currentYearList;
	}
	public ArrayList<String> getSubjectList() {
		return subjectList;
	}
	public void setSubjectList(ArrayList<String> subjectList) {
		this.subjectList = subjectList;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public List<AssignmentFileLtidemoBean> getCurrentSemAssignmentFilesList() {
		return currentSemAssignmentFilesList;
	}
	public void setCurrentSemAssignmentFilesList(List<AssignmentFileLtidemoBean> currentSemAssignmentFilesList) {
		this.currentSemAssignmentFilesList = currentSemAssignmentFilesList;
	}
	public int getCurrentSemSubjectsCount() {
		return currentSemSubjectsCount;
	}
	public void setCurrentSemSubjectsCount(int currentSemSubjectsCount) {
		this.currentSemSubjectsCount = currentSemSubjectsCount;
	}
	public int getCurrentSemSubmissionCount() {
		return currentSemSubmissionCount;
	}
	public void setCurrentSemSubmissionCount(int currentSemSubmissionCount) {
		this.currentSemSubmissionCount = currentSemSubmissionCount;
	}
	public List<AssignmentFileLtidemoBean> getFailSubjectsAssignmentFilesList() {
		return failSubjectsAssignmentFilesList;
	}
	public void setFailSubjectsAssignmentFilesList(List<AssignmentFileLtidemoBean> failSubjectsAssignmentFilesList) {
		this.failSubjectsAssignmentFilesList = failSubjectsAssignmentFilesList;
	}
	public int getFailSubjectsCount() {
		return failSubjectsCount;
	}
	public void setFailSubjectsCount(int failSubjectsCount) {
		this.failSubjectsCount = failSubjectsCount;
	}
	public int getFailSubjectSubmissionCount() {
		return failSubjectSubmissionCount;
	}
	public void setFailSubjectSubmissionCount(int failSubjectSubmissionCount) {
		this.failSubjectSubmissionCount = failSubjectSubmissionCount;
	}
	public String getCurrentSemEndDateTime() {
		return currentSemEndDateTime;
	}
	public void setCurrentSemEndDateTime(String currentSemEndDateTime) {
		this.currentSemEndDateTime = currentSemEndDateTime;
	}
	public String getFailSubjectsEndDateTime() {
		return failSubjectsEndDateTime;
	}
	public void setFailSubjectsEndDateTime(String failSubjectsEndDateTime) {
		this.failSubjectsEndDateTime = failSubjectsEndDateTime;
	}
	public ArrayList<String> getTimeExtendedStudentIdSubjectList() {
		return timeExtendedStudentIdSubjectList;
	}
	public void setTimeExtendedStudentIdSubjectList(ArrayList<String> timeExtendedStudentIdSubjectList) {
		this.timeExtendedStudentIdSubjectList = timeExtendedStudentIdSubjectList;
	}
}

