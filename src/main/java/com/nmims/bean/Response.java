package com.nmims.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.persistence.Transient;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Response implements Serializable{

	private Post post ;
	
	private List<Post> listOfPosts ;
	
	int postCount = 0;

	String status;
	List<Programs> programData;
	List<ProgramStructure> programStructureData;
	List<ProgramSemSubject> subjectsData;
	List<FacultyLtidemoBean> faculties;
	List<ConsumerTypes> consumerTypes;
	List<ProgramSubjectMappingBean> currentSemSubjectsIdStatusMap;
	HashMap<String, String> subjects;
	
	private List<String> subjectIds ;
    private List activeSubjects;
    private List upcomingSubjects;
    private List archiveSubjects; 
    private List pendingSubjects;
    private List activeUpcomingSubject;

    List groupsForStudentBySubjectId;
	List<Hashtag> hashtags;
	List comments;
    
    private String title;
    private String image;
    private String description;
    private String serverPath;
    private int id ;
    private int commentCount;
    private int genericTimeBoundId;
    
    private long reactionCount;
    private long alreadyLiked;
    
    private List<PostReactionsLtidemoBean>  reactions;
    private List<String> keywordList;
	private Boolean isStudentWorkEx;
    private String myReaction;
	private int timeboundId;
	List<ProgramSemSubjectBean> applicableSubjects;
	boolean  flag;
	private StudentLtidemoBean student;
	
	
    
	public StudentLtidemoBean getStudent() {
		return student;
	}

	public void setStudent(StudentLtidemoBean student) {
		this.student = student;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getTimeboundId() {
		return timeboundId;
	}

	public void setTimeboundId(int timeboundId) {
		this.timeboundId = timeboundId;
	}

	public String getMyReaction() {
		return myReaction;
	}

	public void setMyReaction(String myReaction) {
		this.myReaction = myReaction;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public String getServerPath() {
		return serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}

	public long getReactionCount() {
		return reactionCount;
	}

	public List<PostReactionsLtidemoBean> getReactions() {
		return reactions;
	}

	public void setReactionCount(long reactionCount) {
		this.reactionCount = reactionCount;
	}

	public void setReactions(List<PostReactionsLtidemoBean> reactions) {
		this.reactions = reactions;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public String getImage() {
		return image;
	}

	public String getDescription() {
		return description;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List getComments() {
		return comments;
	}

	public void setComments(List comments) {
		this.comments = comments;
	}

	public int getGenericTimeBoundId() {
		return genericTimeBoundId;
	}

	public void setGenericTimeBoundId(int genericTimeBoundId) {
		this.genericTimeBoundId = genericTimeBoundId;
	}

	public List getPendingSubjects() {
		return pendingSubjects;
	}

	public void setPendingSubjects(List pendingSubjects) {
		this.pendingSubjects = pendingSubjects;
	}

	public List getActiveSubjects() {
		return activeSubjects;
	}

	public List getUpcomingSubjects() {
		return upcomingSubjects;
	}

	public List getArchiveSubjects() {
		return archiveSubjects;
	}



	public void setActiveSubjects(List activeSubjects) {
		this.activeSubjects = activeSubjects;
	}

	public void setUpcomingSubjects(List upcomingSubjects) {
		this.upcomingSubjects = upcomingSubjects;
	}

	public void setArchiveSubjects(List archiveSubjects) {
		this.archiveSubjects = archiveSubjects;
	}

	public List getSubjectIds() {
		return subjectIds;
	}

	public void setSubjectIds(List subjectIds) {
		this.subjectIds = subjectIds;
	}


	public List<ProgramSubjectMappingBean> getCurrentSemSubjectsIdStatusMap() {
		return currentSemSubjectsIdStatusMap;
	}

	public void setCurrentSemSubjectsIdStatusMap(List<ProgramSubjectMappingBean> currentSemSubjectsIdStatusMap) {
		this.currentSemSubjectsIdStatusMap = currentSemSubjectsIdStatusMap;
	}

	public List<FacultyLtidemoBean> getFaculties() {
		return faculties;
	}

	public void setFaculties(List<FacultyLtidemoBean> faculties) {
		this.faculties = faculties;
	}

	public List<ConsumerTypes> getConsumerTypes() {
		return consumerTypes;
	}

	public void setConsumerTypes(List<ConsumerTypes> consumerTypes) {
		this.consumerTypes = consumerTypes;
	}

	public HashMap<String,String> getSubjects() {
		return subjects;
	}

	public void setSubjects(HashMap<String, String> subjects) {
		this.subjects = subjects;
	}
	public List<Programs> getProgramData() {
		return programData;
	}
	public void setProgramData(List<Programs> programData) {
		this.programData = programData;
	}
	public List<ProgramStructure> getProgramStructureData() {
		return programStructureData;
	}
	public void setProgramStructureData(List<ProgramStructure> programStructureData) {
		this.programStructureData = programStructureData;
	}
	public List<ProgramSemSubject> getSubjectsData() {
		return subjectsData;
	}
	public void setSubjectsData(List<ProgramSemSubject> subjectsData) {
		this.subjectsData = subjectsData;
	}
	public Response(){
		
	}
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public List<Post> getListOfPosts() {
		return listOfPosts;
	}

	public void setListOfPosts(List<Post> listOfPosts) {
		this.listOfPosts = listOfPosts;
	}

	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List getGroupsForStudentBySubjectId() {
		return groupsForStudentBySubjectId;
	}

	public void setGroupsForStudentBySubjectId(List groupsForStudentBySubjectId) {
		this.groupsForStudentBySubjectId = groupsForStudentBySubjectId;
	}
	
	public List<Hashtag> getHashtags() {
		return hashtags;
	}

	public void setHashtags(List<Hashtag> hashtags) {
		this.hashtags = hashtags;
	}
	
	
	public List<String> getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List<String> keywordList) {
		this.keywordList = keywordList;
	}
	public Boolean getIsStudentWorkEx() {
		return isStudentWorkEx;
	}

	public void setIsStudentWorkEx(Boolean isStudentWorkEx) {
		this.isStudentWorkEx = isStudentWorkEx;
	}
	
	

	public long getAlreadyLiked() {
		return alreadyLiked;
	}

	public void setAlreadyLiked(long alreadyLiked) {
		this.alreadyLiked = alreadyLiked;
	}

	public List getActiveUpcomingSubject() {
		return activeUpcomingSubject;
	}

	public void setActiveUpcomingSubject(List activeUpcomingSubject) {
		this.activeUpcomingSubject = activeUpcomingSubject;
	}

	public List<ProgramSemSubjectBean> getApplicableSubjects() {
		return applicableSubjects;
	}

	public void setApplicableSubjects(List<ProgramSemSubjectBean> applicableSubjects) {
		this.applicableSubjects = applicableSubjects;
	}

	@Override
	public String toString() {
		return "Response [post=" + post + ", listOfPosts=" + listOfPosts + ", postCount=" + postCount + ", status="
				+ status + ", programData=" + programData + ", programStructureData=" + programStructureData
				+ ", subjectsData=" + subjectsData + ", faculties=" + faculties + ", consumerTypes=" + consumerTypes
				+ ", currentSemSubjectsIdStatusMap=" + currentSemSubjectsIdStatusMap + ", subjects=" + subjects
				+ ", subjectIds=" + subjectIds + ", activeSubjects=" + activeSubjects + ", upcomingSubjects="
				+ upcomingSubjects + ", archiveSubjects=" + archiveSubjects + ", pendingSubjects=" + pendingSubjects
				+ ", activeUpcomingSubject=" + activeUpcomingSubject + ", groupsForStudentBySubjectId="
				+ groupsForStudentBySubjectId + ", hashtags=" + hashtags + ", comments=" + comments + ", title=" + title
				+ ", image=" + image + ", description=" + description + ", serverPath=" + serverPath + ", id=" + id
				+ ", commentCount=" + commentCount + ", genericTimeBoundId=" + genericTimeBoundId + ", reactionCount="
				+ reactionCount + ", alreadyLiked=" + alreadyLiked + ", reactions=" + reactions + ", keywordList="
				+ keywordList + ", isStudentWorkEx=" + isStudentWorkEx + ", myReaction=" + myReaction + ", timeboundId="
				+ timeboundId + ", applicableSubjects=" + applicableSubjects + ", flag=" + flag + "]";
	}



	
}
