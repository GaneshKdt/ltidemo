package com.nmims.bean;

import java.io.Serializable;
import java.util.List;

public class GroupResponseBean implements Serializable{
	
	private List<GroupBean> groups;
	List groupsForStudentByTimeBoundId;
	List groupsMemberForStudent;

	public List<GroupBean> getGroups() {
		return groups;
	}

	public void setGroups(List<GroupBean> groups) {
		this.groups = groups;
	}

	public List getGroupsForStudentByTimeBoundId() {
		return groupsForStudentByTimeBoundId;
	}

	public void setGroupsForStudentByTimeBoundId(List groupsForStudentByTimeBoundId) {
		this.groupsForStudentByTimeBoundId = groupsForStudentByTimeBoundId;
	}

	public List getGroupsMemberForStudent() {
		return groupsMemberForStudent;
	}

	public void setGroupsMemberForStudent(List groupsMemberForStudent) {
		this.groupsMemberForStudent = groupsMemberForStudent;
	}

}
