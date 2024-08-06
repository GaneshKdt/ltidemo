package com.nmims.bean;

import java.io.Serializable;

public class StarMessageBean implements Serializable {
		
	private String messageId;
	private String sapId;
	private String message ;
	private String userId;
	private boolean isGroup;
	private String date;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGroup(boolean isGroup) {
		this.isGroup = isGroup;
	}
	public boolean getIsGroup() {
		return isGroup;
	}
	public void setIsGroup(boolean isGroup) {
		this.isGroup = isGroup;
	}
	private Boolean status;
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public String getSapId() {
		return sapId;
	}
	public void setSapId(String sapId) {
		this.sapId = sapId;
	}
		public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "StarMessageBean [messageId=" + messageId + ", sapId=" + sapId + ", message=" + message + ", userId="
				+ userId + ", isGroup=" + isGroup + ", date=" + date + ", name=" + name + ", status=" + status + "]";
	}
	
}
