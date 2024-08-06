package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity 
@Table(name="lti.mentioned_users")
public class MentionedUsersBean implements Serializable{
	
	@Id
	private int id;
	private String mention_to;
	private int comment_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMention_to() {
		return mention_to;
	}
	public void setMention_to(String mention_to) {
		this.mention_to = mention_to;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	
	@Override
	public String toString() {
		return "MentionedUsersBean [id=" + id + ", mention_to=" + mention_to + ", comment_id=" + comment_id + "]";
	}
	
}
