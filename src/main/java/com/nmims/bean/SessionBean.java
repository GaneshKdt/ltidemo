package com.nmims.bean;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="acads.sessions") 
public class SessionBean implements Serializable{
	
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Basic
	@Temporal(TemporalType.DATE)
	private Date date;
	private Time startTime;
	private String day;
	private String subject;
	private String sessionName;
	private String createdBy;
	private Date createdDate;
	private String lastModifiedBy;
	private Date lastModifiedDate;
	private int year;
	private String month;
	private String facultyId;
	private Time endTime;
	private String ciscoStatus;
	private String tmsConfId;
	private String tmsConfLink;
	private String meetingKey;
	private String meetingPwd;
	private String joinUrl;
	private String hostUrl;
	private String hostKey;
	private String localTollNumber ;
	private String localTollFree ;
	private String globalCallNumber ;
	private String pstnDialNumber ;
	private String participantCode ;
	private String room ;
	private String smsSent ;
	private String emailSent ;
	private String hostId ;
	private String hostPassword ;
	private String altMeetingKey ;
	private String altMeetingPwd ;
	private String altFacultyId ;
	private String sem ;
	private String isCommon ;
	private String corporateName ;
	private String altMeetingKey2 ;
	private String altMeetingPwd2 ;
	private String altFacultyId2 ;
	private String altMeetingKey3; 
	private String altMeetingPwd3 ;
	private String altFacultyId3 ;
	private String programList ;
	private String altHostId ;
	private String altHostPassword ;
	private String altHostId2; 
	private String altHostPassword2 ;
	private String altHostId3 ;
	private String altHostPassword3 ;
	private String isCancelled ;
	private String isVerified ;
	private String reasonForCancellation ;
	private String cancellationSMSBody ;
	private String cancellationEmailBody ;
	private String cancellationSubject ;
	private String cancellationSmsSent ;
	private String cancellationEmailSent ;
	private String eventId ;
	private String facultyLocation ;
	private String altFacultyLocation ;
	private String altFaculty2Location ;
	private String altFaculty3Location ;
	private String track ;
	private String hasModuleId ;
	private int moduleId;
	public int getId() {
		return id;
	}
	public Date getDate() {
		return date;
	}
	public Time getStartTime() {
		return startTime;
	}
	public String getDay() {
		return day;
	}
	public String getSubject() {
		return subject;
	}
	public String getSessionName() {
		return sessionName;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}
	public int getYear() {
		return year;
	}
	public String getMonth() {
		return month;
	}
	public String getFacultyId() {
		return facultyId;
	}
	public Time getEndTime() {
		return endTime;
	}
	public String getCiscoStatus() {
		return ciscoStatus;
	}
	public String getTmsConfId() {
		return tmsConfId;
	}
	public String getTmsConfLink() {
		return tmsConfLink;
	}
	public String getMeetingKey() {
		return meetingKey;
	}
	public String getMeetingPwd() {
		return meetingPwd;
	}
	public String getJoinUrl() {
		return joinUrl;
	}
	public String getHostUrl() {
		return hostUrl;
	}
	public String getHostKey() {
		return hostKey;
	}
	public String getLocalTollNumber() {
		return localTollNumber;
	}
	public String getLocalTollFree() {
		return localTollFree;
	}
	public String getGlobalCallNumber() {
		return globalCallNumber;
	}
	public String getPstnDialNumber() {
		return pstnDialNumber;
	}
	public String getParticipantCode() {
		return participantCode;
	}
	public String getRoom() {
		return room;
	}
	public String getSmsSent() {
		return smsSent;
	}
	public String getEmailSent() {
		return emailSent;
	}
	public String getHostId() {
		return hostId;
	}
	public String getHostPassword() {
		return hostPassword;
	}
	public String getAltMeetingKey() {
		return altMeetingKey;
	}
	public String getAltMeetingPwd() {
		return altMeetingPwd;
	}
	public String getAltFacultyId() {
		return altFacultyId;
	}
	public String getSem() {
		return sem;
	}
	public String getIsCommon() {
		return isCommon;
	}
	public String getCorporateName() {
		return corporateName;
	}
	public String getAltMeetingKey2() {
		return altMeetingKey2;
	}
	public String getAltMeetingPwd2() {
		return altMeetingPwd2;
	}
	public String getAltFacultyId2() {
		return altFacultyId2;
	}
	public String getAltMeetingKey3() {
		return altMeetingKey3;
	}
	public String getAltMeetingPwd3() {
		return altMeetingPwd3;
	}
	public String getAltFacultyId3() {
		return altFacultyId3;
	}
	public String getProgramList() {
		return programList;
	}
	public String getAltHostId() {
		return altHostId;
	}
	public String getAltHostPassword() {
		return altHostPassword;
	}
	public String getAltHostId2() {
		return altHostId2;
	}
	public String getAltHostPassword2() {
		return altHostPassword2;
	}
	public String getAltHostId3() {
		return altHostId3;
	}
	public String getAltHostPassword3() {
		return altHostPassword3;
	}
	public String getIsCancelled() {
		return isCancelled;
	}
	public String getIsVerified() {
		return isVerified;
	}
	public String getReasonForCancellation() {
		return reasonForCancellation;
	}
	public String getCancellationSMSBody() {
		return cancellationSMSBody;
	}
	public String getCancellationEmailBody() {
		return cancellationEmailBody;
	}
	public String getCancellationSubject() {
		return cancellationSubject;
	}
	public String getCancellationSmsSent() {
		return cancellationSmsSent;
	}
	public String getCancellationEmailSent() {
		return cancellationEmailSent;
	}
	public String getEventId() {
		return eventId;
	}
	public String getFacultyLocation() {
		return facultyLocation;
	}
	public String getAltFacultyLocation() {
		return altFacultyLocation;
	}
	public String getAltFaculty2Location() {
		return altFaculty2Location;
	}
	public String getAltFaculty3Location() {
		return altFaculty3Location;
	}
	public String getTrack() {
		return track;
	}
	public String getHasModuleId() {
		return hasModuleId;
	}
	public int getModuleId() {
		return moduleId;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public void setCiscoStatus(String ciscoStatus) {
		this.ciscoStatus = ciscoStatus;
	}
	public void setTmsConfId(String tmsConfId) {
		this.tmsConfId = tmsConfId;
	}
	public void setTmsConfLink(String tmsConfLink) {
		this.tmsConfLink = tmsConfLink;
	}
	public void setMeetingKey(String meetingKey) {
		this.meetingKey = meetingKey;
	}
	public void setMeetingPwd(String meetingPwd) {
		this.meetingPwd = meetingPwd;
	}
	public void setJoinUrl(String joinUrl) {
		this.joinUrl = joinUrl;
	}
	public void setHostUrl(String hostUrl) {
		this.hostUrl = hostUrl;
	}
	public void setHostKey(String hostKey) {
		this.hostKey = hostKey;
	}
	public void setLocalTollNumber(String localTollNumber) {
		this.localTollNumber = localTollNumber;
	}
	public void setLocalTollFree(String localTollFree) {
		this.localTollFree = localTollFree;
	}
	public void setGlobalCallNumber(String globalCallNumber) {
		this.globalCallNumber = globalCallNumber;
	}
	public void setPstnDialNumber(String pstnDialNumber) {
		this.pstnDialNumber = pstnDialNumber;
	}
	public void setParticipantCode(String participantCode) {
		this.participantCode = participantCode;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public void setSmsSent(String smsSent) {
		this.smsSent = smsSent;
	}
	public void setEmailSent(String emailSent) {
		this.emailSent = emailSent;
	}
	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	public void setHostPassword(String hostPassword) {
		this.hostPassword = hostPassword;
	}
	public void setAltMeetingKey(String altMeetingKey) {
		this.altMeetingKey = altMeetingKey;
	}
	public void setAltMeetingPwd(String altMeetingPwd) {
		this.altMeetingPwd = altMeetingPwd;
	}
	public void setAltFacultyId(String altFacultyId) {
		this.altFacultyId = altFacultyId;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public void setIsCommon(String isCommon) {
		this.isCommon = isCommon;
	}
	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
	}
	public void setAltMeetingKey2(String altMeetingKey2) {
		this.altMeetingKey2 = altMeetingKey2;
	}
	public void setAltMeetingPwd2(String altMeetingPwd2) {
		this.altMeetingPwd2 = altMeetingPwd2;
	}
	public void setAltFacultyId2(String altFacultyId2) {
		this.altFacultyId2 = altFacultyId2;
	}
	public void setAltMeetingKey3(String altMeetingKey3) {
		this.altMeetingKey3 = altMeetingKey3;
	}
	public void setAltMeetingPwd3(String altMeetingPwd3) {
		this.altMeetingPwd3 = altMeetingPwd3;
	}
	public void setAltFacultyId3(String altFacultyId3) {
		this.altFacultyId3 = altFacultyId3;
	}
	public void setProgramList(String programList) {
		this.programList = programList;
	}
	public void setAltHostId(String altHostId) {
		this.altHostId = altHostId;
	}
	public void setAltHostPassword(String altHostPassword) {
		this.altHostPassword = altHostPassword;
	}
	public void setAltHostId2(String altHostId2) {
		this.altHostId2 = altHostId2;
	}
	public void setAltHostPassword2(String altHostPassword2) {
		this.altHostPassword2 = altHostPassword2;
	}
	public void setAltHostId3(String altHostId3) {
		this.altHostId3 = altHostId3;
	}
	public void setAltHostPassword3(String altHostPassword3) {
		this.altHostPassword3 = altHostPassword3;
	}
	public void setIsCancelled(String isCancelled) {
		this.isCancelled = isCancelled;
	}
	public void setIsVerified(String isVerified) {
		this.isVerified = isVerified;
	}
	public void setReasonForCancellation(String reasonForCancellation) {
		this.reasonForCancellation = reasonForCancellation;
	}
	public void setCancellationSMSBody(String cancellationSMSBody) {
		this.cancellationSMSBody = cancellationSMSBody;
	}
	public void setCancellationEmailBody(String cancellationEmailBody) {
		this.cancellationEmailBody = cancellationEmailBody;
	}
	public void setCancellationSubject(String cancellationSubject) {
		this.cancellationSubject = cancellationSubject;
	}
	public void setCancellationSmsSent(String cancellationSmsSent) {
		this.cancellationSmsSent = cancellationSmsSent;
	}
	public void setCancellationEmailSent(String cancellationEmailSent) {
		this.cancellationEmailSent = cancellationEmailSent;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public void setFacultyLocation(String facultyLocation) {
		this.facultyLocation = facultyLocation;
	}
	public void setAltFacultyLocation(String altFacultyLocation) {
		this.altFacultyLocation = altFacultyLocation;
	}
	public void setAltFaculty2Location(String altFaculty2Location) {
		this.altFaculty2Location = altFaculty2Location;
	}
	public void setAltFaculty3Location(String altFaculty3Location) {
		this.altFaculty3Location = altFaculty3Location;
	}
	public void setTrack(String track) {
		this.track = track;
	}
	public void setHasModuleId(String hasModuleId) {
		this.hasModuleId = hasModuleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	@Override
	public String toString() {
		return "SessionBean [id=" + id + ", date=" + date + ", startTime=" + startTime + ", day=" + day + ", subject="
				+ subject + ", sessionName=" + sessionName + ", createdBy=" + createdBy + ", createdDate=" + createdDate
				+ ", lastModifiedBy=" + lastModifiedBy + ", lastModifiedDate=" + lastModifiedDate + ", year=" + year
				+ ", month=" + month + ", facultyId=" + facultyId + ", endTime=" + endTime + ", ciscoStatus="
				+ ciscoStatus + ", tmsConfId=" + tmsConfId + ", tmsConfLink=" + tmsConfLink + ", meetingKey="
				+ meetingKey + ", meetingPwd=" + meetingPwd + ", joinUrl=" + joinUrl + ", hostUrl=" + hostUrl
				+ ", hostKey=" + hostKey + ", localTollNumber=" + localTollNumber + ", localTollFree=" + localTollFree
				+ ", globalCallNumber=" + globalCallNumber + ", pstnDialNumber=" + pstnDialNumber + ", participantCode="
				+ participantCode + ", room=" + room + ", smsSent=" + smsSent + ", emailSent=" + emailSent + ", hostId="
				+ hostId + ", hostPassword=" + hostPassword + ", altMeetingKey=" + altMeetingKey + ", altMeetingPwd="
				+ altMeetingPwd + ", altFacultyId=" + altFacultyId + ", sem=" + sem + ", isCommon=" + isCommon
				+ ", corporateName=" + corporateName + ", altMeetingKey2=" + altMeetingKey2 + ", altMeetingPwd2="
				+ altMeetingPwd2 + ", altFacultyId2=" + altFacultyId2 + ", altMeetingKey3=" + altMeetingKey3
				+ ", altMeetingPwd3=" + altMeetingPwd3 + ", altFacultyId3=" + altFacultyId3 + ", programList="
				+ programList + ", altHostId=" + altHostId + ", altHostPassword=" + altHostPassword + ", altHostId2="
				+ altHostId2 + ", altHostPassword2=" + altHostPassword2 + ", altHostId3=" + altHostId3
				+ ", altHostPassword3=" + altHostPassword3 + ", isCancelled=" + isCancelled + ", isVerified="
				+ isVerified + ", reasonForCancellation=" + reasonForCancellation + ", cancellationSMSBody="
				+ cancellationSMSBody + ", cancellationEmailBody=" + cancellationEmailBody + ", cancellationSubject="
				+ cancellationSubject + ", cancellationSmsSent=" + cancellationSmsSent + ", cancellationEmailSent="
				+ cancellationEmailSent + ", eventId=" + eventId + ", facultyLocation=" + facultyLocation
				+ ", altFacultyLocation=" + altFacultyLocation + ", altFaculty2Location=" + altFaculty2Location
				+ ", altFaculty3Location=" + altFaculty3Location + ", track=" + track + ", hasModuleId=" + hasModuleId
				+ ", moduleId=" + moduleId + "]";
	}
	
}
