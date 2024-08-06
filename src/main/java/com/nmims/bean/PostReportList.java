package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="post_report_list")
public class PostReportList implements Serializable{
	
	@Id
	private int id;
	private String userId;
	private int postId;
	private String action;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	@Override
	public String toString() {
		return "PostReportList [id=" + id + ", userId=" + userId + ", postId=" + postId + ", action=" + action + "]";
	}
	
	
	
	
	
	
}
