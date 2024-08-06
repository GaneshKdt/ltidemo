package com.nmims.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.nmims.bean.ConsumerTypes;
import com.nmims.bean.GroupBean;
import com.nmims.bean.GroupResponseBean;
import com.nmims.bean.GroupsMembers;
import com.nmims.bean.RequestBeanLtidemoBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.helpers.ExcelHelper;
import com.nmims.services.PostService;


@Controller
@CrossOrigin(origins="*", allowedHeaders="*")
public class GroupController {
	
	@Autowired
	PostService postService;

	@RequestMapping(value="/addGroupsNameForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String addGroupsName(HttpServletRequest request, Model m) {
		
		String userId = (String)request.getSession().getAttribute("userId");
		GroupBean groups = new GroupBean();
		List<GroupBean> groupList = postService.getGroupsForFaculty(userId);
		List<ConsumerTypes> consumerType = postService.getConsumerType();
		m.addAttribute("consumerType", consumerType);
		m.addAttribute("groupList", groupList);
		m.addAttribute("groups", groups);
		return "addGroupsName";
	}
	
	@RequestMapping(value = "/addGroupsName", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addGroupsName(HttpServletRequest request, @ModelAttribute GroupBean groups) {
		
		String userId = (String)request.getSession().getAttribute("userId");
		ModelAndView modelnView = new ModelAndView("addGroupsName");
		groups.setCreatedBy(userId);
		groups.setLastModifiedBy(userId);
		groups.setActive("Y");
		
		String timeBoundId = postService.getTimeBoundId(groups.getProgram_sem_subject_id());
		groups.setTimeBoundId(timeBoundId);
		List<ConsumerTypes> consumerType = postService.getConsumerType();
		
		Long message = postService.insertGroups(groups);
		if (message != null) {
			List<GroupBean> groupList = postService.getGroupsForFaculty(userId);
			modelnView.addObject("groups", new GroupBean());
			modelnView.addObject("groupList", groupList);
			modelnView.addObject("consumerType", consumerType);
			request.setAttribute("success","true");
			request.setAttribute("successMessage","Group created successfully");
		} else {
			modelnView.addObject("groups", new GroupBean());
			modelnView.addObject("consumerType", consumerType); 
			request.setAttribute("error","true");
			request.setAttribute("errorMessage","Error while updating data. "+message);
		}
		
		return modelnView;
	}
	
	@RequestMapping(value="/addRemoveMember", method = {RequestMethod.GET, RequestMethod.POST})
	public String addRemoveMember(HttpServletRequest request, Model m,  @RequestParam("id") long groupId, 
																		@RequestParam("timeBound") String timeBoundId) {
		
		request.getSession().setAttribute("timeBoundId", timeBoundId);
		request.getSession().setAttribute("groupId",groupId);
		List<ConsumerTypes> consumerType = postService.getConsumerType(); 
		List<GroupsMembers> groupMember = postService.getGroupMember(groupId);
		List<StudentLtidemoBean> newGroupMember = postService.getMembersToAdd(groupId, timeBoundId);
		
		for (StudentLtidemoBean student : newGroupMember) {
			student.setGroupid(groupId);
		}
		
		m.addAttribute("fileBean", new GroupBean());
		m.addAttribute("groupId",groupId);
		m.addAttribute("timeBoundId",timeBoundId);
		m.addAttribute("consumerType", consumerType);
		m.addAttribute("groupMember", groupMember);
		m.addAttribute("newGroupMember", newGroupMember);
		m.addAttribute("groupName", postService.groupName(groupId));
		
		return "addRemoveMember";
	}
	
	@RequestMapping(value="/addStudentsInGropsByExcel", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addStudentsInGropsByExcel(GroupBean fileBean, HttpServletRequest request, HttpServletResponse response, Model m){
		
		long groupId = (Long) request.getSession().getAttribute("groupId");
		String timeBoundId = (String) request.getSession().getAttribute("timeBoundId");
		ModelAndView modelnView = new ModelAndView("addRemoveMember");
		try {
			String userId = (String)request.getSession().getAttribute("userId");
			ExcelHelper excelHelper = new ExcelHelper();
			
			ArrayList<String> studentList = postService.getTimeBoundStudentsList(fileBean.getTimeBoundId(), fileBean.getId());
			ArrayList<List> resultList = excelHelper.readSapIdFromExcel(fileBean, studentList, userId);
			
			List<GroupsMembers> studentSapIdList = (ArrayList<GroupsMembers>)resultList.get(0);
			List<GroupsMembers> errorBeanList = (ArrayList<GroupsMembers>)resultList.get(1);
			
			fileBean = new GroupBean();
			m.addAttribute("fileBean",fileBean);
			m.addAttribute("groupId",groupId);
			m.addAttribute("timeBoundId",timeBoundId);
			m.addAttribute("groupMember", postService.getGroupMember(groupId));
			m.addAttribute("newGroupMember", postService.getMembersToAdd(groupId, timeBoundId));
			m.addAttribute("groupName", postService.groupName(groupId));
			
			if(errorBeanList.size() > 0){
				request.setAttribute("errorBeanList", errorBeanList);
				return modelnView; 
			}
			
			ArrayList<String> errorList = postService.batchUpdateStudentToGroup(studentSapIdList);
			
			List<StudentLtidemoBean> newGroupMember = postService.getMembersToAdd(groupId, timeBoundId);
			for (StudentLtidemoBean student : newGroupMember) {
				student.setGroupid(groupId);
			}
			
			if(errorList.size() == 0){
				m.addAttribute("groupMember", postService.getGroupMember(groupId));
				m.addAttribute("newGroupMember", newGroupMember);
				request.setAttribute("success","true");
				request.setAttribute("successMessage",studentSapIdList.size() +" rows out of "+ studentSapIdList.size()+" inserted successfully.");
			}else{
				request.setAttribute("error", "true");
				request.setAttribute("errorMessage", errorList.size() + " records were NOT inserted. Please see row number of rows not inserted. Error row numbers "+errorList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "true");
			request.setAttribute("errorMessage", "Error in inserting rows.");
		}
		
		return modelnView;
		
	}
	
	@RequestMapping(value="/deleteGroup", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteGroup(HttpServletRequest request, @RequestParam("id") long groupId, Model m) {

		String userId = (String)request.getSession().getAttribute("userId");
		boolean isDelete = postService.deleteGroup(groupId);
		if (isDelete) {
			request.setAttribute("success","true");
			request.setAttribute("successMessage","Group Deleted Successfully");
		} else {
			request.setAttribute("error","true");
			request.setAttribute("errorMessage","Error while updating data. ");
		}
		List<GroupBean> groupList = postService.getGroupsForFaculty(userId);
		List<ConsumerTypes> consumerType = postService.getConsumerType(); 
		m.addAttribute("groupList", groupList);
		m.addAttribute("groups", new GroupBean());
		m.addAttribute("consumerType", consumerType);
		m.addAttribute("groupName", postService.groupName(groupId));
		return "addGroupsName";
	}
	
	@RequestMapping(value="/removeFromGroup", method = {RequestMethod.GET, RequestMethod.POST})
	public String removeFromGroup (HttpServletRequest request, @RequestParam("sapId") String sapId, @RequestParam("groupId") long groupId, Model m) {
			
		String timeBoundId = (String)request.getSession().getAttribute("timeBoundId");
		boolean isRemoved =  postService.removeFromGroup(sapId, groupId);
		if (isRemoved) {
			request.setAttribute("success","true");
			request.setAttribute("successMessage","Member Remove Successfully");
		} else {
			request.setAttribute("error","true");
			request.setAttribute("errorMessage","Error while updating data. ");
		}
		
		List<ConsumerTypes> consumerType = postService.getConsumerType(); 
		List<GroupsMembers> groupMember = postService.getGroupMember(groupId);
		List<StudentLtidemoBean> newGroupMember = postService.getMembersToAdd(groupId, timeBoundId);
		for (StudentLtidemoBean student : newGroupMember) {
			student.setGroupid(groupId);
		}
		
		m.addAttribute("fileBean", new GroupBean());
		m.addAttribute("consumerType", consumerType);
		m.addAttribute("groupMember", groupMember);
		m.addAttribute("groupName", postService.groupName(groupId));
		m.addAttribute("newGroupMember", newGroupMember);

		return "addRemoveMember";
		
	}
	
	@RequestMapping(value="/addInGroup", method = {RequestMethod.GET, RequestMethod.POST})
	public String addInGroup (HttpServletRequest request, @RequestParam("sapId") String sapId, @RequestParam("groupId") long groupId, Model m){
		
		String userId = (String)request.getSession().getAttribute("userId");
		String timeBoundId = (String)request.getSession().getAttribute("timeBoundId");
		boolean isAdded =  postService.addInGroup(sapId, groupId, userId);
		
		if (isAdded) {
			request.setAttribute("success","true");
			request.setAttribute("successMessage","New Member Added !!! ");
		} else {
			request.setAttribute("error","true");
			request.setAttribute("errorMessage","Error while updating data. ");
		}
		
		List<ConsumerTypes> consumerType = postService.getConsumerType(); 
		List<GroupsMembers> groupMember = postService.getGroupMember(groupId);
		List<StudentLtidemoBean> newGroupMember = postService.getMembersToAdd(groupId, timeBoundId);
		
		for (StudentLtidemoBean student : newGroupMember) {
			student.setGroupid(groupId);
		} 
		m.addAttribute("fileBean", new GroupBean());
		m.addAttribute("consumerType", consumerType);
		m.addAttribute("groupMember", groupMember);
		m.addAttribute("groupName", postService.groupName(groupId));
		m.addAttribute("newGroupMember", newGroupMember);
		return "addRemoveMember";
	}
	
	@RequestMapping(value = "/getGroupsNameForFaculty", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<GroupResponseBean> getGroupsNameForFaculty(@RequestBody GroupBean group, HttpServletRequest request) {
		
		String userId = (String) request.getSession().getAttribute("userId"); 
		//String userId = "NGASCE0287";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		
		List<GroupBean> groupList = postService.getGroupsNameForFaculty(group.getTimeBoundId(), userId);
		GroupResponseBean responseBean = new GroupResponseBean();
		responseBean.setGroups(groupList);
		
		return new ResponseEntity<GroupResponseBean>(responseBean, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/m/getGroupsNameByTimeBoundId", method = RequestMethod.POST)
	public ResponseEntity<GroupResponseBean> getGroupsNameByTimeBoundId(@RequestBody RequestBeanLtidemoBean requestBean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		GroupResponseBean response = new GroupResponseBean();
       	List groupsForStudents = postService.getGroupsForStudentByTimeBoundId(requestBean.getUserId(), requestBean.getTimeBoundId());
		response.setGroupsForStudentByTimeBoundId(groupsForStudents);

		return new ResponseEntity<GroupResponseBean>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getGroupsMemberForStudent", method = RequestMethod.POST)
	public ResponseEntity<GroupResponseBean> getGroupsMemberForStudent(@RequestBody RequestBeanLtidemoBean requestBean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		GroupResponseBean response = new GroupResponseBean();
       	List groupsForStudents = postService.getListOfGroupsMembersForStudent(requestBean.getUserId(),requestBean.getTimeBoundId());
		response.setGroupsMemberForStudent(groupsForStudents);

		return new ResponseEntity<GroupResponseBean>(response, headers, HttpStatus.OK);
	}
	
}
