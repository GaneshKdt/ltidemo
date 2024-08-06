package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.consumer_program_structure")
//spring security related changes rename ConsumerProgramStructure to ConsumerProgramStructureLtidemoBean
public class ConsumerProgramStructureLtidemoBean implements Serializable{

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	int programId;
	int programStructureId;
	int consumerTypeId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProgramId() {
		return programId;
	}
	
	public void setProgramId(int programId) {
		this.programId = programId;
	}
	public int getProgramStructureId() {
		return programStructureId;
	}
	public void setProgramStructureId(int programStructureId) {
		this.programStructureId = programStructureId;
	}
	public int getConsumerTypeId() {
		return consumerTypeId;
	}
	public void setConsumerTypeId(int consumerTypeId) {
		this.consumerTypeId = consumerTypeId;
	}
	@Override
	public String toString() {
		return "ConsumerProgramStructure [id=" + id + ", programId=" + programId + ", programStructureId="
				+ programStructureId + ", consumerTypeId=" + consumerTypeId + "]";
	}
	
	
}
