package com.nmims.bean;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
//spring security related changes rename Users to UsersLtidemoBean
public class UsersLtidemoBean implements Serializable{
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	BigInteger id;
	 String username;
	 String password;
	
	public UsersLtidemoBean() {
		super();
	}
	
	public BigInteger getId() {
		return id;
	}
	public void setId(BigInteger id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
