package com.nmims.bean;


	import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;


	@Entity
	@Table(name="lti.post_comments") 
	@DynamicUpdate
	//spring security related changes rename Comments to CommentsLtidemoBean
	public class CommentsLtidemoBean extends AbstractTimestampEntity implements Serializable{

		@Id  
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		int id;
		int post_id;
		String sapid;
		String comment;
		int visibility;
		int master_comment_id;
		@Column(name="postId")
		Integer postId;

		@javax.persistence.Transient
		List<CommentsLtidemoBean> replies = new ArrayList<>();
		 
		//added to merge profile details of commenter
		@javax.persistence.Transient
		String firstName;
		@javax.persistence.Transient
		String lastName;
		@javax.persistence.Transient
		String imageUrl;
		@javax.persistence.Transient
		int subcomments_count;
		
		
		
		public Integer getPostId() {
			return postId;
		}
		public void setPostId(Integer postId) {
			this.postId = postId;
		}
		public int getSubcomments_count() {
			return subcomments_count;
		}
		public void setSubcomments_count(int subcomments_count) {
			this.subcomments_count = subcomments_count;
		}
		public String getFirstName() {
			return firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public String getImageUrl() {
			return imageUrl;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}
		public List<CommentsLtidemoBean> getReplies() {
			return replies;
		}
		public void setReplies(List<CommentsLtidemoBean> replies) {
			this.replies = replies;
		}
		public int getId() {
			return id;
		}
		
		public int getPost_id() {
			return post_id;
		}
		public void setPost_id(int post_id) {
			this.post_id = post_id;
		}
		public String getSapid() {
			return sapid;
		}
		public String getComment() {
			return comment;
		}
		public int getVisibility() {
			return visibility;
		}
		public int getMaster_comment_id() {
			return master_comment_id;
		}
		public void setId(int id) {
			this.id = id;
		}

		public void setSapid(String sapid) {
			this.sapid = sapid;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		public void setVisibility(int visibility) {
			this.visibility = visibility;
		}
		public void setMaster_comment_id(int master_comment_id) {
			this.master_comment_id = master_comment_id;
		}
		@Override
		public String toString() {
			return "Comments [id=" + id + ", post_id=" + post_id + ", sapid=" + sapid + ", comment=" + comment
					+ ", visibility=" + visibility + ", master_comment_id=" + master_comment_id + ", replies=" + replies
					+ ", firstName=" + firstName + ", lastName=" + lastName + ", imageUrl=" + imageUrl + "]";
		}
		


		
		
}
