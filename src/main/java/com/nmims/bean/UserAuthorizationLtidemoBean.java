package com.nmims.bean;

import java.io.Serializable;
import java.util.ArrayList;

//spring security related changes rename UserAuthorizationBean to UserAuthorizationLtidemoBean
public class UserAuthorizationLtidemoBean implements Serializable{

	private String userId;
	private String roles;
	private String authorizedLC;
	private String authorizedCenters;
	
	private String allCenter;
	private String allLC;
	private ArrayList<String> allRoles;
	private String commaSeparatedAuthorizedCenterCodes;
	private ArrayList<String> authorizedCenterCodes;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getAuthorizedLC() {
		return authorizedLC;
	}
	public void setAuthorizedLC(String authorizedLC) {
		this.authorizedLC = authorizedLC;
	}
	public String getAuthorizedCenters() {
		return authorizedCenters;
	}
	public void setAuthorizedCenters(String authorizedCenters) {
		this.authorizedCenters = authorizedCenters;
	}
	public String getAllCenter() {
		return allCenter;
	}
	public void setAllCenter(String allCenter) {
		this.allCenter = allCenter;
	}
	public String getAllLC() {
		return allLC;
	}
	public void setAllLC(String allLC) {
		this.allLC = allLC;
	}
	public ArrayList<String> getAllRoles() {
		return allRoles;
	}
	public void setAllRoles(ArrayList<String> allRoles) {
		this.allRoles = allRoles;
	}
	public String getCommaSeparatedAuthorizedCenterCodes() {
		return commaSeparatedAuthorizedCenterCodes;
	}
	public void setCommaSeparatedAuthorizedCenterCodes(String commaSeparatedAuthorizedCenterCodes) {
		this.commaSeparatedAuthorizedCenterCodes = commaSeparatedAuthorizedCenterCodes;
	}
	public ArrayList<String> getAuthorizedCenterCodes() {
		return authorizedCenterCodes;
	}
	public void setAuthorizedCenterCodes(ArrayList<String> authorizedCenterCodes) {
		this.authorizedCenterCodes = authorizedCenterCodes;
	}
	
	
}
