package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.exams_schedule") 
public class MettlScheduleBean implements Serializable{

	@Id
	@Column(name="id")
	private String id;
	
	@Column(name="timebound_id")
	private String timebound_id;
	
	@Column(name="assessments_id")
	private String assessments_id;
	
	@Column(name="schedule_id")
	private String schedule_id;
	
	@Column(name="schedule_name")
	private String schedule_name;
	
	@Column(name="schedule_accessKey")
	private String schedule_accessKey;
	
	@Column(name="schedule_accessUrl")
	private String schedule_accessUrl;
	
	@Column(name="schedule_status")
	private String schedule_status;
	
	@Column(name="exam_start_date_time")
	private String exam_start_date_time;
	
	@Column(name="exam_end_date_time")
	private String exam_end_date_time;
	
	@Column(name="active")
	private String active;

	@Column(name="max_score")
	private String max_score;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAssessments_id() {
		return assessments_id;
	}

	public void setAssessments_id(String assessments_id) {
		this.assessments_id = assessments_id;
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

	public String getSchedule_accessKey() {
		return schedule_accessKey;
	}

	public void setSchedule_accessKey(String schedule_accessKey) {
		this.schedule_accessKey = schedule_accessKey;
	}

	public String getSchedule_accessUrl() {
		return schedule_accessUrl;
	}

	public void setSchedule_accessUrl(String schedule_accessUrl) {
		this.schedule_accessUrl = schedule_accessUrl;
	}

	public String getSchedule_status() {
		return schedule_status;
	}

	public void setSchedule_status(String schedule_status) {
		this.schedule_status = schedule_status;
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

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getMax_score() {
		return max_score;
	}

	public void setMax_score(String max_score) {
		this.max_score = max_score;
	}

	@Override
	public String toString() {
		return "MettlScheduleBean [id=" + id + ", assessments_id=" + assessments_id 
				+ ", schedule_id=" + schedule_id + ", schedule_name=" + schedule_name + ", schedule_accessKey="
				+ schedule_accessKey + ", schedule_accessUrl=" + schedule_accessUrl + ", schedule_status="
				+ schedule_status + ", exam_start_date_time=" + exam_start_date_time + ", exam_end_date_time="
				+ exam_end_date_time + ", active=" + active + ", max_score=" + max_score + "]";
	}
	
}
