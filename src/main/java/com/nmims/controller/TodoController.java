package com.nmims.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate; 





import com.nmims.bean.ExamAssignmentResponse;
import com.nmims.bean.ExamRegistrationBeanAPIResponse;
import com.nmims.bean.ProjectBean;

import com.nmims.bean.TodoBean;

@CrossOrigin(origins = "*", allowedHeaders = "*") 
@Controller
public class TodoController {
	
	@Value("${SERVER_PATH}" )
	private String SERVER_PATH;
	
	@RequestMapping(value = "/StudentTodo", method = RequestMethod.POST)
	public @ResponseBody ArrayList<TodoBean> StudentTodo(HttpServletRequest request,HttpServletResponse response,@RequestBody Person person) {
		ArrayList<TodoBean> finalTodoBean = new ArrayList<TodoBean>();
		try {
		person.setSapid(person.getSapId());
		 //final String baseUrl = "http://localhost:8080/"; 
		 final String assignmentUrl = SERVER_PATH + "exam/m/viewAssignmentsForm";
		 final String projectUrl = SERVER_PATH + "exam/m/viewProject?subject=project&sapid=" + person.getSapId();
		 final String examUrl = SERVER_PATH + "exam/m/selectSubjectsForm";
		    RestTemplate restTemplate = new RestTemplate(); 
		  
		    ResponseEntity<ExamAssignmentResponse> assignmentResponse = restTemplate.postForEntity(assignmentUrl, person, ExamAssignmentResponse.class);
//		    ResponseEntity<ProjectBean> projectResponse = restTemplate.postForEntity(projectUrl, person, ProjectBean.class);
		    ResponseEntity<ExamRegistrationBeanAPIResponse> examResponse = restTemplate.postForEntity(examUrl, person, ExamRegistrationBeanAPIResponse.class);
		    
		    for(int i=0;i < assignmentResponse.getBody().getCurrentSemAssignmentFilesList().size();i++) {
		    	if(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getStatus().equalsIgnoreCase("Not Submitted")) {
			    	TodoBean assignmentBean = new TodoBean();
			    	assignmentBean.setSubject(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getSubject());
			    	assignmentBean.setLastDate(assignmentResponse.getBody().getCurrentSemEndDateTime());
			    	assignmentBean.setType("Assignment");
			    	assignmentBean.setSem(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getSem());
			    	finalTodoBean.add(assignmentBean);
		    	}
		    }
		    
		    for(int i=0;i < assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().size();i++) {
		    	if(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getStatus().equalsIgnoreCase("Not Submitted")) {
		    		TodoBean assignmentBean = new TodoBean();
			    	assignmentBean.setSubject(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getSubject());
			    	assignmentBean.setLastDate(assignmentResponse.getBody().getFailSubjectsEndDateTime());
			    	assignmentBean.setType("Assignment");
			    	assignmentBean.setSem(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getSem());
			    	finalTodoBean.add(assignmentBean);
		    	}
		    }
		    
		    try {
//				if(projectResponse.getBody().getStatus().equals("200") && projectResponse.getBody().getAssignmentFile().getStatus().equalsIgnoreCase("Not Submitted")) {
//					TodoBean projectBean = new TodoBean();
//					projectBean.setLastDate(projectResponse.getBody().getAssignmentFile().getEndDate());
//					projectBean.setSubject(projectResponse.getBody().getAssignmentFile().getSubject());
//					projectBean.setType("Project");
//					projectBean.setSem(projectResponse.getBody().getAssignmentFile().getSem());
//					finalTodoBean.add(projectBean);
//				}
				
				if(examResponse.getBody().getStatus().equalsIgnoreCase("200")) {
					 for(int i=0;i < examResponse.getBody().getApplicableSubjectsList().size();i++) {
						 if(examResponse.getBody().getApplicableSubjectsList().get(i).getBookingStatus().equalsIgnoreCase("Not Booked")) {
							 TodoBean examBean = new TodoBean();
							 examBean.setSubject(examResponse.getBody().getApplicableSubjectsList().get(i).getSubject());
							 examBean.setLastDate(examResponse.getBody().getEndDate());
							 examBean.setType("Exam Registration");
							 examBean.setSem(examResponse.getBody().getApplicableSubjectsList().get(i).getSem());
							 finalTodoBean.add(examBean);
						 }
					 }
				}
			} catch (Exception e1) {   
			}
		    int min_idx;
		    for(int i=0;i < finalTodoBean.size() - 1;i++) {
		    	min_idx = i;
		    	for(int j= i +1;j < finalTodoBean.size();j++) {
		    		SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");
		    		try {
						if(formatter1.parse(finalTodoBean.get(j).getLastDate()).compareTo(formatter1.parse(finalTodoBean.get(min_idx).getLastDate())) < 0) {
							//swap
							min_idx = j;
						}
						TodoBean tmp_bean = finalTodoBean.get(min_idx);
						finalTodoBean.set(min_idx,finalTodoBean.get(i));
						finalTodoBean.set(i, tmp_bean);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    	}
		    }
		    
		    
			return finalTodoBean;
		}
		catch (Exception e) {
			e.printStackTrace();
			return finalTodoBean;
		}
	}
	
	
	
	@RequestMapping(value = "/StudentTodoFinished", method = RequestMethod.POST)
	public @ResponseBody ArrayList<TodoBean> StudentTodoFinished(HttpServletRequest request,HttpServletResponse response,@RequestBody Person person) {
		ArrayList<TodoBean> finalTodoBean = new ArrayList<TodoBean>();
		try {
		person.setSapid(person.getSapId());
		 //final String baseUrl = "http://localhost:8080/"; 
		 final String assignmentUrl = SERVER_PATH + "exam/m/viewAssignmentsForm";
		 final String projectUrl = SERVER_PATH + "exam/m/viewProject?subject=project&sapid=" + person.getSapId();
		 final String examUrl = SERVER_PATH + "exam/m/selectSubjectsForm";
		    RestTemplate restTemplate = new RestTemplate(); 
		  
		    ResponseEntity<ExamAssignmentResponse> assignmentResponse = restTemplate.postForEntity(assignmentUrl, person, ExamAssignmentResponse.class);
//		    ResponseEntity<ProjectBean> projectResponse = restTemplate.postForEntity(projectUrl, person, ProjectBean.class);
		    ResponseEntity<ExamRegistrationBeanAPIResponse> examResponse = restTemplate.postForEntity(examUrl, person, ExamRegistrationBeanAPIResponse.class);
		    
		    for(int i=0;i < assignmentResponse.getBody().getCurrentSemAssignmentFilesList().size();i++) {
		    	if(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getStatus().equalsIgnoreCase("Submitted")) {
			    	TodoBean assignmentBean = new TodoBean();
			    	assignmentBean.setSubject(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getSubject());
			    	assignmentBean.setLastDate(assignmentResponse.getBody().getCurrentSemEndDateTime());
			    	assignmentBean.setType("Assignment");
			    	assignmentBean.setSem(assignmentResponse.getBody().getCurrentSemAssignmentFilesList().get(i).getSem());
			    	finalTodoBean.add(assignmentBean);
		    	}
		    }
		    
		    for(int i=0;i < assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().size();i++) {
		    	if(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getStatus().equalsIgnoreCase("Submitted")) {
		    		TodoBean assignmentBean = new TodoBean();
			    	assignmentBean.setSubject(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getSubject());
			    	assignmentBean.setLastDate(assignmentResponse.getBody().getFailSubjectsEndDateTime());
			    	assignmentBean.setType("Assignment");
			    	assignmentBean.setSem(assignmentResponse.getBody().getFailSubjectsAssignmentFilesList().get(i).getSem());
			    	finalTodoBean.add(assignmentBean);
		    	}
		    }
		    
//		    if(projectResponse.getBody().getStatus().equals("200") && projectResponse.getBody().getAssignmentFile().getStatus().equalsIgnoreCase("Submitted")) {
//		    	TodoBean projectBean = new TodoBean();
//		    	projectBean.setLastDate(projectResponse.getBody().getAssignmentFile().getEndDate());
//		    	projectBean.setSubject(projectResponse.getBody().getAssignmentFile().getSubject());
//		    	projectBean.setType("Project");
//		    	projectBean.setSem(projectResponse.getBody().getAssignmentFile().getSem());
//		    	finalTodoBean.add(projectBean);
//		    }
		    
		    if(examResponse.getBody().getStatus().equalsIgnoreCase("200")) {
		    	 for(int i=0;i < examResponse.getBody().getApplicableSubjectsList().size();i++) {
		    		 if(examResponse.getBody().getApplicableSubjectsList().get(i).getBookingStatus().equalsIgnoreCase("Booked")) {
		    			 TodoBean examBean = new TodoBean();
						 examBean.setSubject(examResponse.getBody().getApplicableSubjectsList().get(i).getSubject());
						 examBean.setLastDate(examResponse.getBody().getEndDate());
						 examBean.setType("Exam Registration");
						 examBean.setSem(examResponse.getBody().getApplicableSubjectsList().get(i).getSem());
						 finalTodoBean.add(examBean);
		    		 }
				 }
		    }
		    int min_idx;
		    for(int i=0;i < finalTodoBean.size() - 1;i++) {
		    	min_idx = i;
		    	for(int j= i +1;j < finalTodoBean.size();j++) {
		    		SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");
		    		try {
						if(formatter1.parse(finalTodoBean.get(j).getLastDate()).compareTo(formatter1.parse(finalTodoBean.get(min_idx).getLastDate())) < 0) {
							//swap
							min_idx = j;
						}
						TodoBean tmp_bean = finalTodoBean.get(min_idx);
						finalTodoBean.set(min_idx,finalTodoBean.get(i));
						finalTodoBean.set(i, tmp_bean);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    	}
		    }
		    
		    
			return finalTodoBean;
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return finalTodoBean;
		}
	}
}
