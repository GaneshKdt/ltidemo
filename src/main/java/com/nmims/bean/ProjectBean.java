package com.nmims.bean;

import java.io.Serializable;
import java.util.ArrayList;

public class ProjectBean implements Serializable{
	private AssignmentFileLtidemoBean studentSubmissionStatus;
	private ArrayList<String> timeExtendedStudentIdSubjectList;
	private boolean  paymentApplicable;
	private boolean submitted;
	private boolean canSubmit;
	private int maxAttempts;
	private String Status;
	private String Message;
	private AssignmentFileLtidemoBean assignmentFile;
	
	

	public AssignmentFileLtidemoBean getAssignmentFile() {
		return assignmentFile;
	}

	public void setAssignmentFile(AssignmentFileLtidemoBean assignmentFile) {
		this.assignmentFile = assignmentFile;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getMessage() {
		return Message;
	}

	public void setMessage(String message) {
		Message = message;
	}

	public ArrayList<String> getTimeExtendedStudentIdSubjectList() {
		return timeExtendedStudentIdSubjectList;
	}

	public void setTimeExtendedStudentIdSubjectList(ArrayList<String> timeExtendedStudentIdSubjectList) {
		this.timeExtendedStudentIdSubjectList = timeExtendedStudentIdSubjectList;
	}


	public boolean isPaymentApplicable() {
		return paymentApplicable;
	}

	public void setPaymentApplicable(boolean paymentApplicable) {
		this.paymentApplicable = paymentApplicable;
	}

	public int getMaxAttempts() {
		return maxAttempts;
	}

	public void setMaxAttempts(int maxAttempts) {
		this.maxAttempts = maxAttempts;
	}

	public boolean getSubmitted() {
		return submitted;
	}

	public void setSubmitted(boolean submitted) {
		this.submitted = submitted;
	}

	public boolean getCanSubmit() {
		return canSubmit;
	}

	public void setCanSubmit(boolean canSubmit) {
		this.canSubmit = canSubmit;
	}

	public AssignmentFileLtidemoBean getStudentSubmissionStatus() {
		return studentSubmissionStatus;
	}

	public void setStudentSubmissionStatus(AssignmentFileLtidemoBean studentSubmissionStatus) {
		this.studentSubmissionStatus = studentSubmissionStatus;
	}
}

