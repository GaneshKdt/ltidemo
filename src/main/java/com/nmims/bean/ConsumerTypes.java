package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exam.consumer_type") 
public class ConsumerTypes implements Serializable{

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String name;
	int isCorporate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIsCorporate() {
		return isCorporate;
	}
	public void setIsCorporate(int isCorporate) {
		this.isCorporate = isCorporate;
	}
	@Override
	public String toString() {
		return "ConsumerTypes [id=" + id + ", name=" + name + ", isCorporate=" + isCorporate + "]";
	}
	
	
	
}
