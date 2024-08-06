package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="post_reactions") 
@org.hibernate.annotations.Entity(
		dynamicUpdate = true
)
//spring security related changes rename PostReactions to PostReactionsLtidemoBean
public class PostReactionsLtidemoBean extends AbstractTimestampEntity implements Serializable {
	
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int reactionId;
	
	int postId;
	String userId;
	String reactionType;
	
	@Transient
	int  reactionCount;
	
	@Transient
	String fullName;
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getReactionCount() {
		return reactionCount;
	}
	public void setReactionCount(int reactionCount) {
		this.reactionCount = reactionCount;
	}
	public int getReactionId() {
		return reactionId;
	}
	public int getPostId() {
		return postId;
	}
	public String getUserId() {
		return userId;
	}
	public String getReactionType() {
		return reactionType;
	}
	
	
	public void setReactionId(int reactionId) {
		this.reactionId = reactionId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setReactionType(String reactionType) {
		this.reactionType = reactionType;
	}
	
//	@Override
//	public String toString() {
//		return "PostReaction [reactionId=" + reactionId + ", postId=" + postId + ", userId=" + userId + ", reactionType=" + reactionType
//				+ "]";
//	}
	
}
