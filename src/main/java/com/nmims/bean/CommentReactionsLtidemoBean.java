package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="comment_reactions") 
@org.hibernate.annotations.Entity(
		dynamicUpdate = true
)
//spring security related changes rename CommentReactions to CommentReactionsLtidemoBean
public class CommentReactionsLtidemoBean extends AbstractTimestampEntity implements Serializable {
	
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int reactionId;
	
	int postId;
	String userId;
	String reactionType;
	Integer commentId;
	@Transient
	int  reactionCount;
	
	
	
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
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

	public int getReactionCount() {
		return reactionCount;
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

	public void setReactionCount(int reactionCount) {
		this.reactionCount = reactionCount;
	}

	@Override
	public String toString() {
		return "CommentReactions [reactionId=" + reactionId + ", postId=" + postId + ", userId=" + userId
				+ ", reactionType=" + reactionType + ", commentId=" + commentId + ", reactionCount=" + reactionCount
				+ "]";
	}

	


	

	
}
