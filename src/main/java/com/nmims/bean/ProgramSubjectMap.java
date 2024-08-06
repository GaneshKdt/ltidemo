package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
   public class ProgramSubjectMap implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String  program;
	 String subject;
	 
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
		@Override
		public String toString() {
			return "ProgramSubjectMap [program=" + program + ", subject=" + subject + "]";
		}
		
 }