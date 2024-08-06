
package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="exam.exams_scheduleinfo_mettl") 
public class MettlScheduleTempTableBean{
	
	@EmbeddedId
	private MettlScheduleTempTableKey key;
	
	@Column(name="schedule_id")
	private String schedule_id;
	
	@Column(name="scheduleName")
	private String schedule_name;
	
	@Column(name="joinURL")
	private String schedule_accessUrl;
	
	@Column(name="accessStartDateTime")
	private String exam_start_date_time;
	
	@Column(name="accessEndDateTime")
	private String exam_end_date_time;

	@Column(name="max_score")
	private String max_score;
	
	@Column(name="testTaken")
	private String testTaken;
	
	@Column(name="firstname")
	private String firstname;
	
	@Column(name="lastname")
	private String lastname;
	
	@Column(name="emailId")
	private String emailId;

	public MettlScheduleTempTableKey getKey() {
		return key;
	}

	public void setKey(MettlScheduleTempTableKey key) {
		this.key = key;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getTestTaken() {
		return testTaken;
	}

	public void setTestTaken(String testTaken) {
		this.testTaken = testTaken;
	}

	public String getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	public String getSchedule_accessUrl() {
		return schedule_accessUrl;
	}

	public void setSchedule_accessUrl(String schedule_accessUrl) {
		this.schedule_accessUrl = schedule_accessUrl;
	}

	public String getExam_start_date_time() {
		return exam_start_date_time;
	}

	public void setExam_start_date_time(String exam_start_date_time) {
		this.exam_start_date_time = exam_start_date_time;
	}

	public String getExam_end_date_time() {
		return exam_end_date_time;
	}

	public void setExam_end_date_time(String exam_end_date_time) {
		this.exam_end_date_time = exam_end_date_time;
	}

	public String getMax_score() {
		return max_score;
	}

	public void setMax_score(String max_score) {
		this.max_score = max_score;
	}

//	@Override
//	public String toString() {
//		return "MettlScheduleTempTableBean [timebound_id=" + timebound_id + ", schedule_id=" + schedule_id
//				+ ", schedule_name=" + schedule_name + ", schedule_accessKey=" + schedule_accessKey
//				+ ", schedule_accessUrl=" + schedule_accessUrl + ", exam_start_date_time=" + exam_start_date_time
//				+ ", exam_end_date_time=" + exam_end_date_time + ", max_score=" + max_score + "]";
//	}
	
	
}
