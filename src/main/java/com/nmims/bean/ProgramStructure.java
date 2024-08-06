package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.program_structure")
public class ProgramStructure implements Serializable{
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String program_structure;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProgram_structure() {
		return program_structure;
	}
	public void setProgram_structure(String program_structure) {
		this.program_structure = program_structure;
	}
	@Override
	public String toString() {
		return "ProgramStructure [id=" + id + ", program_structure=" + program_structure + "]";
	}
	
	
	
}
