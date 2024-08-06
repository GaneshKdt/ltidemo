package com.nmims.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nmims.bean.LTIUserResourcesMapping;
import com.nmims.bean.LTIUsers;
import com.nmims.bean.ProgramSemSubjectBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.TimeBoundStudentMapping;
import com.nmims.services.PostService;

@Controller
public class StudentController {

	@Autowired
	PostService postService;

	//@Scheduled(fixedDelay = 1000 * 60 * 60 * 24)
	@RequestMapping(value = "/insertTimeBoundStudentMapping",  method = {RequestMethod.POST,RequestMethod.GET})
	public void insertTimeBoundStudentMapping() {
		List<StudentLtidemoBean> studentsList = postService.getTimeBoundStudentsForBatchUpload();
		try {
			for (StudentLtidemoBean student : studentsList) {
				
				//To Check Remaining seats in Batch
				//If Batch size > 120 then add into next batch
				
				int batchSize = 4;
				String batchName = "Batch 1";
				List<String> batchList = postService.getBatchNames();
				for (String batch : batchList) {
					int studentCountForBatch = postService.getCountOfBatchStudents(batch);
					if (batchSize >= studentCountForBatch ) {
						batchName = batch;
					}
				}
				List<ProgramSemSubjectBean> subjectList = postService.getAllSubjectForStudent(student);
				for (ProgramSemSubjectBean subject : subjectList) {
					int timeBoundId = postService.getTimeBoundIdBySubjectId(subject.getId(), batchName);
					TimeBoundStudentMapping bean = new TimeBoundStudentMapping();
					
					bean.setStudent_subject_config_id(timeBoundId);
					bean.setSapid(student.getSapid());
					bean.setBatch(batchName);
					bean.setCreatedBy("System");
					bean.setLastModifiedBy("System");
					boolean created = postService.insertTimeBoundStudentMapping(bean);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/insertLTIStudentAndResourcesMapping",  method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity<HashMap<String, Integer>> insertLTIStudentAndResourcesMapping(@RequestBody LTIUserResourcesMapping mappingBean) {
		int count = 0;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		HashMap<String, Integer> response = new HashMap<String, Integer>();
		List<LTIUsers> studentList = postService.getStudentsForPearsonMapping(mappingBean);
		
		for (LTIUsers student : studentList) {
			boolean isInserted = postService.checkExistAndCreateMapping(student.getId(), mappingBean);
			if (isInserted) {
				count++;
			}
		}
		
		response.put("timeBoundId", Integer.parseInt(mappingBean.getTimeBoundId()));
		response.put("totalStudents", studentList.size());
		response.put("studentsAdded", count);
		
		return new ResponseEntity<HashMap<String, Integer>>(response, headers, HttpStatus.OK);		
	}
	
}
