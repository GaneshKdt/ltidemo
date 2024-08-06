package com.nmims.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.HarvardBean;
import com.nmims.bean.HarvardResponseBean;
import com.nmims.bean.LtiPost;
import com.nmims.bean.RequestBeanLtidemoBean;
import com.nmims.bean.Response;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.StudentSubjectConfig;
import com.nmims.services.PostService;
import com.nmims.services.ResourceService;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class Resources {
	
	@Autowired
	ResourceService rService;
	
	@Autowired
	PostService postService;
	
	@Value("${SERVER_PATH}")
	private String SERVER_PATH;   
	
	private static Map<String, String> parameters = new HashMap<String, String>();
	static {
		//parameters.put("context_id","S32944760001");
		//parameters.put("context_title","Telecommuncations 101");
		//parameters.put("context_label","ST101");
		parameters.put("userId","7837467321222");
		parameters.put("lis_person_name_full","Shiv Golani");
		parameters.put("lis_person_name_given","Shiv");
		parameters.put("lis_person_name_family","Golani");
		parameters.put("lis_person_sourcedid","");
		parameters.put("lis_course_offering_sourcedid","");
		parameters.put("lis_person_contact_email_primary","shivgolani@gmail.com");
		parameters.put("roles","Student");
		parameters.put("resource_link_id","9e822d48-2f8d-411e-a3f4-bbeeedc801a51");
		parameters.put("launch_presentation_return_url","http://login.tegrity.com");
		parameters.put("lti_version","LTI-1p0");
		parameters.put("lti_message_type","basic-lti-launch-request");
		parameters.put("custom_realm","mhhe"); 
		parameters.put("custom_application_type","MHCampus");
		parameters.put("mhcampus_isbn","125960585X");
		parameters.put("mhcampus_provider","CONNECT");
	}
	
	@RequestMapping(value="/viewVideoGallery", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewVideoGallery (HttpServletRequest request, Model m){
		
		try {
		String userId = (String) request.getSession().getAttribute("userId");
		List<Integer> timeboundIds = postService.getTimeBoundIdForFaculty(userId);
		if(timeboundIds.size()>0) {
		List<StudentSubjectConfig> subjectTimeboundMapping = rService.getSubjectsByTimeboundId(timeboundIds) ;
		List<String> subjects = new ArrayList<>();
		
		for(StudentSubjectConfig subject : subjectTimeboundMapping) {
			subjects.add(subject.getProgramSemSubject().getSubject());
		} 
		m.addAttribute("subjects", subjectTimeboundMapping); 
		}
		m.addAttribute("SERVER_PATH", SERVER_PATH);  
		return "videoGallery";
		}
		catch(Exception e) {
			e.printStackTrace();
			return " ";
		}
	}
	
	@RequestMapping(value="/sessionPlanDetails", method= {RequestMethod.GET, RequestMethod.POST})
	public String sessionPlanDetails (HttpServletRequest request, Model m,@RequestParam("id") String id,@RequestParam("active") String active){
		List<String> activeTab =new ArrayList<String>();
		
		if(active.equalsIgnoreCase("S"))activeTab= Arrays.asList("active","","");
		else if(active.equalsIgnoreCase("LR"))activeTab= Arrays.asList("","active","");
		else if(active.equalsIgnoreCase("QA"))activeTab=Arrays.asList("","","active");
		
		m.addAttribute("activeTab", activeTab);
		m.addAttribute("SERVER_PATH", SERVER_PATH);
		m.addAttribute("module_id",id);      
		return "sessionPlanDetails";   
	}
	
	@RequestMapping(value="/courseDetails", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView courseDetails(HttpServletRequest request, Model m,@RequestParam("id") String id,@RequestParam("module") String module) {
		m.addAttribute("video_id",id);    
		m.addAttribute("module_id",module);   
		
		LtiPost contactForm = new LtiPost();
		contactForm.setContactMap(parameters);

		return new ModelAndView("take-course", "contactForm", contactForm);
	}
	
	@RequestMapping(value = "/m/getHarvardModulesDate", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<HarvardResponseBean> getHarvardModulesDate(@RequestBody StudentLtidemoBean student) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String sapid = student.getSapid();
		List<HarvardBean> harvardResources;
		HarvardResponseBean response = new HarvardResponseBean(); ; 

		try {
			harvardResources = rService.getHarvardModulesBySapid(sapid);

			if (harvardResources.isEmpty()) {
				response.setStatus("Error");
			}else {
				response.setHarvardResources(harvardResources);
				response.setStatus("Success");
			}
			return new ResponseEntity<HarvardResponseBean>(response, headers, HttpStatus.OK);

		}catch(Exception e) {
			response.setStatus("Error");
			return new ResponseEntity<HarvardResponseBean>(response, headers, HttpStatus.OK);

		}
	
	
		
	}
}
