package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.program_subject")
public class ProgramSubject implements Serializable{

	@Id
	String program;
	String subject;
	String sem;
	String prgmStructApplicable;
	String sifySubjectCode;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getPrgmStructApplicable() {
		return prgmStructApplicable;
	}
	public void setPrgmStructApplicable(String prgmStructApplicable) {
		this.prgmStructApplicable = prgmStructApplicable;
	}
	@Override
	public String toString() {
		return "ProgramSubject [program=" + program + ", subject=" + subject + ", sem=" + sem
				+ ", prgmStructApplicable=" + prgmStructApplicable + "]";
	}
	
	
}
