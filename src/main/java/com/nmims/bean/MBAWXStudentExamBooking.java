package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.mba_wx_bookings") 
public class MBAWXStudentExamBooking implements Serializable{
	@Id
	@Column(name="bookingId")
	private String bookingId;
	
	@Column(name="sapid")
	private String sapid;

	@Column(name="timeboundId")
	private String timeboundId;
	
	@Column(name="bookingStatus")
	private String bookingStatus;
	
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getTimeboundId() {
		return timeboundId;
	}
	public void setTimeboundId(String timeboundId) {
		this.timeboundId = timeboundId;
	}
}
