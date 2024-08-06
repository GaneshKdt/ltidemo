package com.nmims.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="exam.exambookings")
@Getter
@Setter
@ToString
public class PGExamBookingBean implements Serializable{

	@Id
	@Column(name="sapid", insertable = false, updatable = false)
	private String sapid;

	@Id
	@Column(name="subject", insertable = false, updatable = false)
	private String subject;

	@Id
	@Column(name="year", insertable = false, updatable = false)
	private String year;
	
	@Id
	@Column(name="month", insertable = false, updatable = false)
	private String month;

	@Id
	@Column(name="trackId", insertable = false, updatable = false)
	private String trackId;
	
	@Column(name="lastModifiedBy", insertable = false)
	private String lastModifiedBy;

	@Column(name="testTaken", insertable = false)
	private String testTaken;
	
}
