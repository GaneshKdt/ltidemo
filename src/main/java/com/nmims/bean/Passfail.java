package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.passfail")
public class Passfail implements Serializable{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	String sapid;
	String subject;
	String sem;
	String isPass;
	public String getSapid() {
		return sapid;
	}
	public void setSapid(String sapid) {
		this.sapid = sapid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getIsPass() {
		return isPass;
	}
	public void setIsPass(String isPass) {
		this.isPass = isPass;
	}
	

}
