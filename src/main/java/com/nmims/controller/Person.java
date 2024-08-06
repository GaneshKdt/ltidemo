package com.nmims.controller;

public class Person {
String sapId;
String sapid;
String message;
String email;


public String getMessage() {
	return message;
}

public String getEmail() {
	return email;
}

public void setMessage(String message) {
	this.message = message;
}

public void setEmail(String email) {
	this.email = email;
}

public String getSapid() {
	return sapid;
}

public void setSapid(String sapid) {
	this.sapid = sapid;
}

public String getSapId() {
	return sapId;
}

public void setSapId(String sapId) {
	this.sapId = sapId;
}

@Override
public String toString() {
	return "Person [sapId=" + sapId + ", sapid=" + sapid + ", message=" + message + ", email=" + email + "]";
}

}
