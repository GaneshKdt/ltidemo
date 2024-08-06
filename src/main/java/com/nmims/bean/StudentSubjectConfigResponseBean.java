package com.nmims.bean;

import java.io.Serializable;

public class StudentSubjectConfigResponseBean implements Serializable{

	private StudentSubjectConfig studentSubjectConfig;

	public StudentSubjectConfig getStudentSubjectConfig() {
		return studentSubjectConfig;
	}

	public void setStudentSubjectConfig(StudentSubjectConfig studentSubjectConfig) {
		this.studentSubjectConfig = studentSubjectConfig;
	}
}
