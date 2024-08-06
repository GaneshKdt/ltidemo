package com.nmims.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.nmims.dao.ContactUsDao;

@Controller
public class ContactUsController 
{
	
	
	@Autowired
	ContactUsDao contactUs;
	//To add course Coordinator
	
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@RequestMapping(value = "/getCurrentCourseCoordinator",  method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity getCourseCoordinator(@RequestBody JSONObject inputJsonObj){
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");			
			String timeboundId = (String) inputJsonObj.get("timeboundId");
			String CourseCoordinator = contactUs.getCurrentCourseCoordinator(timeboundId);
			
			
			return new ResponseEntity(CourseCoordinator, headers, HttpStatus.OK);		
		}
		

}
