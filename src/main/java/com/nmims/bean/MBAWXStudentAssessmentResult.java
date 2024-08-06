package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.tee_marks") 
public class MBAWXStudentAssessmentResult implements Serializable {

	@Id
	@Column(name="timebound_id")
	private String timebound_id;
	
	@Column(name="schedule_id")
	private String schedule_id;
	
	@Column(name="student_name")
	private String student_name;

	@Id
	@Column(name="sapid")
	private String sapid;
	
	@Column(name="score")
	private String score;
	
	@Column(name="max_score")
	private String max_score;
	
	@Column(name="previous_score")
	private String previous_score;
	
	@Column(name="status")
	private String status;

	public String getTimebound_id() {
		return timebound_id;
	}

	public void setTimebound_id(String timebound_id) {
		this.timebound_id = timebound_id;
	}

	public String getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getSapid() {
		return sapid;
	}

	public void setSapid(String sapid) {
		this.sapid = sapid;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getMax_score() {
		return max_score;
	}

	public void setMax_score(String max_score) {
		this.max_score = max_score;
	}

	public String getPrevious_score() {
		return previous_score;
	}

	public void setPrevious_score(String previous_score) {
		this.previous_score = previous_score;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MBAWXStudentAssessmentResult [timebound_id=" + timebound_id + ", schedule_id=" + schedule_id
				+ ", student_name=" + student_name + ", sapid=" + sapid + ", score=" + score + ", max_score="
				+ max_score + ", previous_score=" + previous_score + ", status=" + status + "]";
	}
}
