package com.nmims.bean;

import java.io.Serializable;
import java.util.List;

public class DashboardBean implements Serializable {
	
	private int id;
	private String userId;
	private String acadYear;
	private String acadMonth;
	private String batchId;
	private String sem;
	private String name;
	private String studentType;
	private List<String> students;
	private String errorMessage = "";
	private boolean errorRecord = false;
	private String msgBoxData;
	
	public String getMsgBoxData() {
		return msgBoxData;
	}
	public void setMsgBoxData(String msgBoxData) {
		this.msgBoxData = msgBoxData;
	}
	public List<String> getUserIdList() {
		return userIdList;
	}
	public void setUserIdList(List<String> userIdList) {
		this.userIdList = userIdList;
	}
	private List<String> userIdList;
	private  int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProgramId() {
		return programId;
	}
	public void setProgramId(int programId) {
		this.programId = programId;
	}
	public int getProgramStructureId() {
		return programStructureId;
	}
	public void setProgramStructureId(int programStructureId) {
		this.programStructureId = programStructureId;
	}
	public int getConsumerTypeId() {
		return consumerTypeId;
	}
	public void setConsumerTypeId(int consumerTypeId) {
		this.consumerTypeId = consumerTypeId;
	}
	private String examYear;
	private String examMonth;
	private String subject;


	private int programId;
	private int programStructureId;
	private int consumerTypeId;
	
	private String isResit;
	private String studentName;
	private String imageUrl;
	private String emailId;
	private String mobile;
	
	private String consumerType;
	private String prgmStructApplicable;
	private String program;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getBatchId() {
		return batchId;
	}
	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStudentType() {
		return studentType;
	}
	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}
	public List<String> getStudents() {
		return students;
	}
	public void setStudents(List<String> students) {
		this.students = students;
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
	public String getExamYear() {
		return examYear;
	}
	public void setExamYear(String examYear) {
		this.examYear = examYear;
	}
	public String getExamMonth() {
		return examMonth;
	}
	public void setExamMonth(String examMonth) {
		this.examMonth = examMonth;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getIsResit() {
		return isResit;
	}
	public void setIsResit(String isResit) {
		this.isResit = isResit;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getConsumerType() {
		return consumerType;
	}
	public void setConsumerType(String consumerType) {
		this.consumerType = consumerType;
	}
	public String getPrgmStructApplicable() {
		return prgmStructApplicable;
	}
	public void setPrgmStructApplicable(String prgmStructApplicable) {
		this.prgmStructApplicable = prgmStructApplicable;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	@Override
	public String toString() {
		return "DashboardBean [id=" + id + ", userId=" + userId + ", acadYear=" + acadYear + ", acadMonth=" + acadMonth
				+ ", batchId=" + batchId + ", sem=" + sem + ", name=" + name + ", studentType=" + studentType
				+ ", students=" + students + ", errorMessage=" + errorMessage + ", errorRecord=" + errorRecord
				+ ", msgBoxData=" + msgBoxData + ", userIdList=" + userIdList + ", count=" + count + ", examYear="
				+ examYear + ", examMonth=" + examMonth + ", subject=" + subject + ", programId=" + programId
				+ ", programStructureId=" + programStructureId + ", consumerTypeId=" + consumerTypeId + ", isResit="
				+ isResit + ", studentName=" + studentName + ", imageUrl=" + imageUrl + ", emailId=" + emailId
				+ ", mobile=" + mobile + ", consumerType=" + consumerType + ", prgmStructApplicable="
				+ prgmStructApplicable + ", program=" + program + "]";
	}
	
}
