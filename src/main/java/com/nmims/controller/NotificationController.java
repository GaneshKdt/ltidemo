//package com.nmims.controller;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import ltidemo.helpers.MailSender; 
//
//import ltidemo.helpers.EmailHelper;
//
//
//import ltidemo.bean.Response;
//
//@Controller
//@CrossOrigin(origins = "*", allowedHeaders = "*")
//public class NotificationController {
//	
//	@Autowired
//	ApplicationContext act;
//	
//	@Autowired
//	private EmailHelper emailHelper;
//	
//	@Autowired
//	MailSender mailer;
//	
//	@RequestMapping(value = "/m/sendEmailForComment", method = RequestMethod.POST)
//	public ResponseEntity<Response> sendEmailForComment(@RequestBody JSONObject inputJsonObj) {
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-Type", "application/json");
//		Response response = new Response();
//       
//		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
//	}
//	
//	@RequestMapping(value = "/m/sendEmail", method = RequestMethod.POST)
//	public String sendEmail(HttpServletRequest request, HttpServletResponse response,@RequestBody Person person) {
//		Person p = new Person();
//		//MailSender mailer = (MailSender)act.getBean("mailer");
//		ArrayList<String> emails = new ArrayList<String>();
//		emails.add(person.getEmail());
//		mailer.sendEmail( "test email subject",person.getMessage(),emails,""); 
//		request.setAttribute("success","true");
//		return "resetPassword";  
//	}
//}
