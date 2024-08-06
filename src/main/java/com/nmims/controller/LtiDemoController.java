package com.nmims.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;
import org.imsglobal.lti.launch.LtiLaunch;
import org.imsglobal.lti.launch.LtiOauthSigner;
import org.imsglobal.lti.launch.LtiSigner;
import org.imsglobal.lti.launch.LtiSigningException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.nmims.helpers.AESencrp;
import com.nmims.bean.ChatUserBean;
import com.nmims.bean.ExamOrderBean;
import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.LTIConsumer;
import com.nmims.bean.LTIConsumerRequestBean;
import com.nmims.bean.LTIResponseBean;
import com.nmims.bean.LtiPost; 

import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.Registration;
import com.nmims.bean.ProgramSubjectMappingBean;

import com.nmims.bean.StudentBean;
import com.nmims.bean.UserResourseMapping;
import com.nmims.dao.LtiDao;
import com.nmims.services.LoginService;
import com.nmims.services.LtiService;
import com.nmims.services.PostService; 

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class LtiDemoController {
	
	
	@Autowired
	PostService postService;
	
	@Autowired
	LoginService logService;
	
//	@Autowired
//	 ContentService contentService;
//	
	

	private static final Logger logger = LoggerFactory.getLogger(LtiDemoController.class);
	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
	
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
	
	/*@RequestMapping(value="/home", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ltiProviderPostForm(HttpServletRequest request) {
		//LtiSigner ltiSigner = new LtiOauthSigner();
		
		LtiPost contactForm = new LtiPost();
		contactForm.setContactMap(parameters);
		System.out.println("Parameters");
		///Map<String, String> signedParameters = new HashMap<String, String>();
		return new ModelAndView("ltiProviderPostForm", "contactForm", contactForm);
	}*/
	 
	@RequestMapping(value="/header", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView header(HttpServletRequest request) {
		//LtiSigner ltiSigner = new LtiOauthSigner();
		
		LtiPost contactForm = new LtiPost();
		contactForm.setContactMap(parameters);
//		System.out.println("Parameters");
		///Map<String, String> signedParameters = new HashMap<String, String>();
		return new ModelAndView("header", "contactForm", contactForm);
	}
	  
//	@RequestMapping(value="viewELearn", method= {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView viewELearnResources(HttpServletRequest request)  {
//		System.out.println("-------------------------->viewELearn");
//		Student student = (Student)request.getSession().getAttribute("student");
//		List<LTIConsumerRequestBean> resources_list = new ArrayList<LTIConsumerRequestBean>();
//
//		resources_list = postService.getLtiResources(student.getSapid());
//		request.getSession().setAttribute("resources_list", resources_list);
//
//		return new ModelAndView("viewELearn"); 
//	}

	@RequestMapping(value="/checkStudentPearsonAccess", method= RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Map<String, Object>> viewELearnResources(HttpServletRequest request, @RequestBody Map<String, String> requestParams)  {

		Map<String, Object> result = new HashMap<String, Object>();
		if(requestParams.containsKey("sapid")) {
			
			String sapid = requestParams.get("sapid");
			result = postService.getPearsonAccess(sapid);
		}else {
			result.put("studentHasAccess", false);
		}
		return ResponseEntity.ok(result); 
	}
	
	@RequestMapping(value="/m/viewELearnResources", method= {RequestMethod.GET, RequestMethod.POST}, consumes = "application/json", produces = "application/json")
	public ResponseEntity<LTIResponseBean> mviewELearnResources(@RequestBody StudentBean input ) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","application/json");
		LTIResponseBean response = new LTIResponseBean();
		List resources_list = resources_list = postService.getLtiResources(input.getSapid());
		
		if (resources_list.isEmpty()) {
			response.setStatus("Fail");
			return new ResponseEntity<LTIResponseBean>(response, headers, HttpStatus.INTERNAL_SERVER_ERROR);
		}else {
			response.setStatus("Success");
			response.setLtiResources(resources_list);
			return new ResponseEntity<LTIResponseBean>(response, headers, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="addLTIConsumerForm", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addLTIConsumerForm(){
		
		ModelAndView abc = new ModelAndView();
		LTIConsumer ltiConsumer = new LTIConsumer();
		//ltiConsumer.setId(9);
		ltiConsumer.setId(9);
		return abc;
	}
	
	@RequestMapping(value="/m/viewLTIResource", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mViewLTIResource(HttpServletRequest request, @RequestParam ("rid") String rid,
																	 @RequestParam ("sapid") String sapid,
																	 Model m)  {
		
//		System.out.println("-------------------------->In viewLTIResource sapid : "+sapid);

		LTIConsumerRequestBean conumer_request = new LTIConsumerRequestBean();

		conumer_request = postService.getLtiLink(sapid,rid);
//		System.out.println(conumer_request);
		LtiSigner ltiSigner = new LtiOauthSigner();
		
		Map<String, String> parameters = new HashMap<String, String>();
		
		parameters.put("context_id",conumer_request.getContext_id());
		parameters.put("context_label",conumer_request.getContext_label());
		parameters.put("context_title",conumer_request.getContext_title());
		parameters.put("context_type", conumer_request.getContext_type());
		parameters.put("custom_context_memberships_url", conumer_request.getCustom_context_memberships_url());
		parameters.put("custom_context_setting_url", conumer_request.getCustom_context_setting_ur1());
		parameters.put("custom_lineitem_url", conumer_request.getCustom_lineitem_url());
		parameters.put("custom_lineitems_url", conumer_request.getCustom_lineitems_url());
		parameters.put("custom_link_memberships_url", conumer_request.getCustom_link_memberships_url());
		parameters.put("custom_link_setting_url", conumer_request.getCustom_link_setting_url());
		parameters.put("custom_result_url", conumer_request.getCustom_result_url());
		parameters.put("custom_results_url", conumer_request.getCustom_results_url());
		parameters.put("custom_tc_profile_url", conumer_request.getCustom_tc_profile_url());
		parameters.put("ext_ims_lis_basic_outcome_url", conumer_request.getExt_ims_lis_basic_outcome_url());
		parameters.put("ext_ims_lis_memberships_id", conumer_request.getExt_ims_lis_memberships_id());
		parameters.put("ext_ims_lis_memberships_url", conumer_request.getExt_ims_lis_memberships_url());
		parameters.put("ext_ims_lis_resultvalue_sourcedids", conumer_request.getExt_ims_lis_resultvalue_sourcedids());
		parameters.put("ext_ims_lti_tool_setting_id", conumer_request.getExt_ims_lti_tool_setting_id());
		parameters.put("ext_ims_lti_tool_setting_url", conumer_request.getExt_ims_lti_tool_setting_url());
		parameters.put("launch_presentation_css_url", conumer_request.getLaunch_presentation_css_url());
		parameters.put("launch_presentation_document_target", conumer_request.getLaunch_presentation_document_target());
		parameters.put("launch_presentation_locale", conumer_request.getLaunch_presentation_locale());
		parameters.put("launch_presentation_return_url", conumer_request.getLaunch_presentation_return_url());
		parameters.put("lis_course_offering_sourcedid", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("lis_course_section_sourcedid", conumer_request.getLis_course_section_sourcedid());
		parameters.put("lis_outcome_service_url", conumer_request.getLis_outcome_service_url());
		parameters.put("lis_person_contact_email_primary", conumer_request.getLis_person_contact_email_primary());
		parameters.put("lis_person_name_family", conumer_request.getLis_person_name_family());
		parameters.put("lis_person_name_full", conumer_request.getLis_person_name_full());
		parameters.put("lis_person_name_given", conumer_request.getLis_person_name_given());
		parameters.put("lis_person_sourcedid", conumer_request.getLis_person_sourced_id());
		parameters.put("lis_result_sourcedid", conumer_request.getLis_result_sourcedid());
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles", conumer_request.getRoles()); 
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles",conumer_request.getRoles());
		parameters.put("tool_consumer_info_product_family_code", conumer_request.getTool_consumer_info_product_family_code());
		parameters.put("tool_consumer_info_version", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("tool_consumer_instance_contact_email", conumer_request.getTool_consumer_instance_contact_email());
		parameters.put("tool_consumer_instance_description", conumer_request.getTool_consumer_instance_description());
		parameters.put("tool_consumer_instance_guid", conumer_request.getTool_consumer_instance_guid());
		parameters.put("tool_consumer_instance_name", conumer_request.getTool_consumer_instance_name());
		parameters.put("tool_consumer_instance_url", conumer_request.getTool_consumer_instance_url());
		parameters.put("user_id", conumer_request.getUser_id());
		parameters.put("user_image", conumer_request.getUser_image());
		parameters.put("custom_countrycode", "IN");
		if(conumer_request.getCustom_parameters() != null) {
			//System.out.println(conumer_request.getCustom_parameters());
			//parameters.put("custom_capsim_auth_key", "2047");
			//Map<String, String> map = new HashMap<>();
		    String[] tokens = conumer_request.getCustom_parameters().split(",");
		

//		    for (int i=0; i<tokens.length -1; ) {
//		    	System.out.println(tokens);
//		    	parameters.put(tokens[i++], tokens[i++]);
//		    	
//		    }
		    
		    for (int i=0; i<tokens.length; i++) {
		    	int delimiterIndex = tokens[i].indexOf("=");
	        	parameters.put(tokens[i].substring(0 , delimiterIndex), tokens[i].substring(delimiterIndex + 1 , tokens[i].length()));
	    	
		    }
		
		}
		   
//		System.out.println("Parameters");
		Map<String, String> signedParameters = new HashMap<String, String>();

		try {
			signedParameters = ltiSigner.signParameters(parameters, conumer_request.getConsumer_key() , conumer_request.getSecret(), conumer_request.getLaunch_url(), "POST");
//			System.out.println(signedParameters);
			
			m.addAttribute("launch_url", conumer_request.getLaunch_url());
//			LtiLaunch ltiLaunch = new LtiLaunch(signedParameters);
//			System.out.println(signedParameters.toString());

			return new ModelAndView("welcome", "contactForm", signedParameters);

			
		} catch (LtiSigningException e) {
			// TODO Auto-generated catch block
//			System.out.println("Error");
			System.out.println(e);

			e.printStackTrace();
			return new ModelAndView("welcome", "contactForm", signedParameters);

		}
	
	}
	

	
	@RequestMapping(value = "/m/getPearsonMobileSSOUrl", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> getPearsonMobileSSOUrl(HttpServletRequest request,@RequestBody JSONObject inputJsonObj) { 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		
		String sapid = (String) inputJsonObj.get("sapId");
		String rid = (String) inputJsonObj.get("rid");
		
		LTIConsumerRequestBean conumer_request = new LTIConsumerRequestBean();

		conumer_request = postService.getLtiLink(sapid,rid);
//		System.out.println(conumer_request);
		LtiSigner ltiSigner = new LtiOauthSigner();
		
		Map<String, String> parameters = new HashMap<String, String>();
		
		parameters.put("context_id",conumer_request.getContext_id());
		parameters.put("context_label",conumer_request.getContext_label());
		parameters.put("context_title",conumer_request.getContext_title());
		parameters.put("context_type", conumer_request.getContext_type());
		parameters.put("custom_context_memberships_url", conumer_request.getCustom_context_memberships_url());
		parameters.put("custom_context_setting_url", conumer_request.getCustom_context_setting_ur1());
		parameters.put("custom_lineitem_url", conumer_request.getCustom_lineitem_url());
		parameters.put("custom_lineitems_url", conumer_request.getCustom_lineitems_url());
		parameters.put("custom_link_memberships_url", conumer_request.getCustom_link_memberships_url());
		parameters.put("custom_link_setting_url", conumer_request.getCustom_link_setting_url());
		parameters.put("custom_result_url", conumer_request.getCustom_result_url());
		parameters.put("custom_results_url", conumer_request.getCustom_results_url());
		parameters.put("custom_tc_profile_url", conumer_request.getCustom_tc_profile_url());
		parameters.put("ext_ims_lis_basic_outcome_url", conumer_request.getExt_ims_lis_basic_outcome_url());
		parameters.put("ext_ims_lis_memberships_id", conumer_request.getExt_ims_lis_memberships_id());
		parameters.put("ext_ims_lis_memberships_url", conumer_request.getExt_ims_lis_memberships_url());
		parameters.put("ext_ims_lis_resultvalue_sourcedids", conumer_request.getExt_ims_lis_resultvalue_sourcedids());
		parameters.put("ext_ims_lti_tool_setting_id", conumer_request.getExt_ims_lti_tool_setting_id());
		parameters.put("ext_ims_lti_tool_setting_url", conumer_request.getExt_ims_lti_tool_setting_url());
		parameters.put("launch_presentation_css_url", conumer_request.getLaunch_presentation_css_url());
		parameters.put("launch_presentation_document_target", conumer_request.getLaunch_presentation_document_target());
		parameters.put("launch_presentation_locale", conumer_request.getLaunch_presentation_locale());
		parameters.put("launch_presentation_return_url", conumer_request.getLaunch_presentation_return_url());
		parameters.put("lis_course_offering_sourcedid", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("lis_course_section_sourcedid", conumer_request.getLis_course_section_sourcedid());
		parameters.put("lis_outcome_service_url", conumer_request.getLis_outcome_service_url());
		parameters.put("lis_person_contact_email_primary", conumer_request.getLis_person_contact_email_primary());
		parameters.put("lis_person_name_family", conumer_request.getLis_person_name_family());
		parameters.put("lis_person_name_full", conumer_request.getLis_person_name_full());
		parameters.put("lis_person_name_given", conumer_request.getLis_person_name_given());
		parameters.put("lis_person_sourcedid", conumer_request.getLis_person_sourced_id());
		parameters.put("lis_result_sourcedid", conumer_request.getLis_result_sourcedid());
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles", conumer_request.getRoles()); 
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles",conumer_request.getRoles());
		parameters.put("tool_consumer_info_product_family_code", conumer_request.getTool_consumer_info_product_family_code());
		parameters.put("tool_consumer_info_version", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("tool_consumer_instance_contact_email", conumer_request.getTool_consumer_instance_contact_email());
		parameters.put("tool_consumer_instance_description", conumer_request.getTool_consumer_instance_description());
		parameters.put("tool_consumer_instance_guid", conumer_request.getTool_consumer_instance_guid());
		parameters.put("tool_consumer_instance_name", conumer_request.getTool_consumer_instance_name());
		parameters.put("tool_consumer_instance_url", conumer_request.getTool_consumer_instance_url());
		parameters.put("user_id", conumer_request.getUser_id());
		parameters.put("user_image", conumer_request.getUser_image());
		parameters.put("custom_countrycode", "IN");
		
//		System.out.println("Parameters");
		Map<String, String> signedParameters = new HashMap<String, String>();

		try {
			signedParameters = ltiSigner.signParameters(parameters, conumer_request.getConsumer_key() , conumer_request.getSecret(), conumer_request.getLaunch_url(), "POST");
//			System.out.println(signedParameters);
			String lis_person_name_given =  signedParameters.get("lis_person_name_given");
			lis_person_name_given = lis_person_name_given.replace(' ', '_');
			signedParameters.replace("lis_person_name_given", lis_person_name_given);
			String lis_person_name_family =  signedParameters.get("lis_person_name_family");
			lis_person_name_family = lis_person_name_family.replace(' ', '_');
			signedParameters.replace("lis_person_name_family", lis_person_name_family);
			
//			String pearsonMobileSSOUrl = "elibrary://lti-launch?";
//			
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "oauth_consumer_key="+signedParameters.get("oauth_consumer_key")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "user_id="+signedParameters.get("user_id")+"&";
//			
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "context_id="+signedParameters.get("context_id")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "context_type="+signedParameters.get("context_type")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "tool_consumer_instance_guid="+signedParameters.get("tool_consumer_instance_guid")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "resource_link_title="+signedParameters.get("resource_link_title")+"&";
//			
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "lis_person_contact_email_primary="+signedParameters.get("lis_person_contact_email_primary")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "resource_link_id="+signedParameters.get("resource_link_id")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "oauth_nonce="+signedParameters.get("oauth_nonce")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "oauth_timestamp="+signedParameters.get("oauth_timestamp")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "oauth_signature="+URLEncoder.encode(signedParameters.get("oauth_signature"))+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "custom_countrycode="+signedParameters.get("custom_countrycode")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "oauth_signature_method="+signedParameters.get("oauth_signature_method")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "lti_message_type="+signedParameters.get("lti_message_type")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "roles="+signedParameters.get("roles")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "lis_person_name_full="+URLEncoder.encode(signedParameters.get("lis_person_name_full"))+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "lis_person_name_given="+signedParameters.get("lis_person_name_given")+"&";
//			pearsonMobileSSOUrl = pearsonMobileSSOUrl + "lis_person_name_family="+signedParameters.get("lis_person_name_family");
			
			
			
			//Map<String, String> response = new HashMap<String, String>();
			//response.put("ssoUrl",pearsonMobileSSOUrl);
			signedParameters.put("error","false");
			signedParameters.put("errorMsg","");


			return new ResponseEntity<Map<String, String>>(signedParameters, HttpStatus.OK);

			
		} catch (LtiSigningException e) {
			// TODO Auto-generated catch block
		//	System.out.println("Error");
//			System.out.println(e.getMessage());

			e.printStackTrace();
//			Map<String, String> response = new HashMap<String, String>();
			signedParameters.put("error","true");
			signedParameters.put("errorMsg",e.toString());
			return new ResponseEntity<Map<String, String>>(signedParameters, HttpStatus.INTERNAL_SERVER_ERROR);

		}
		
		
		
	}
	
	
	
	@RequestMapping(value="/viewLTIResource", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewLTIResource(HttpServletRequest request, @RequestParam ("rid") String rid, Model m)  {
//		System.out.println("-------------------------->Welcome");
		
		//Student student = (Student)request.getSession().getAttribute("student");
		String userId = (String) request.getSession().getAttribute("userId");
		//System.out.println(userId);
		//System.out.println(rid);

		LTIConsumerRequestBean conumer_request = new LTIConsumerRequestBean();

		conumer_request = postService.getLtiLink(userId,rid);
//		System.out.println(conumer_request);
		LtiSigner ltiSigner = new LtiOauthSigner();
		
		Map<String, String> parameters = new HashMap<String, String>();
		
		parameters.put("context_id",conumer_request.getContext_id());
		parameters.put("context_label",conumer_request.getContext_label());
		parameters.put("context_title",conumer_request.getContext_title());
		parameters.put("context_type", conumer_request.getContext_type());
		parameters.put("custom_context_memberships_url", conumer_request.getCustom_context_memberships_url());
		parameters.put("custom_context_setting_url", conumer_request.getCustom_context_setting_ur1());
		parameters.put("custom_lineitem_url", conumer_request.getCustom_lineitem_url());
		parameters.put("custom_lineitems_url", conumer_request.getCustom_lineitems_url());
		parameters.put("custom_link_memberships_url", conumer_request.getCustom_link_memberships_url());
		parameters.put("custom_link_setting_url", conumer_request.getCustom_link_setting_url());
		parameters.put("custom_result_url", conumer_request.getCustom_result_url());
		parameters.put("custom_results_url", conumer_request.getCustom_results_url());
		parameters.put("custom_tc_profile_url", conumer_request.getCustom_tc_profile_url());
		parameters.put("ext_ims_lis_basic_outcome_url", conumer_request.getExt_ims_lis_basic_outcome_url());
		parameters.put("ext_ims_lis_memberships_id", conumer_request.getExt_ims_lis_memberships_id());
		parameters.put("ext_ims_lis_memberships_url", conumer_request.getExt_ims_lis_memberships_url());
		parameters.put("ext_ims_lis_resultvalue_sourcedids", conumer_request.getExt_ims_lis_resultvalue_sourcedids());
		parameters.put("ext_ims_lti_tool_setting_id", conumer_request.getExt_ims_lti_tool_setting_id());
		parameters.put("ext_ims_lti_tool_setting_url", conumer_request.getExt_ims_lti_tool_setting_url());
		parameters.put("launch_presentation_css_url", conumer_request.getLaunch_presentation_css_url());
		parameters.put("launch_presentation_document_target", conumer_request.getLaunch_presentation_document_target());
		parameters.put("launch_presentation_locale", conumer_request.getLaunch_presentation_locale());
		parameters.put("launch_presentation_return_url", conumer_request.getLaunch_presentation_return_url());
		parameters.put("lis_course_offering_sourcedid", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("lis_course_section_sourcedid", conumer_request.getLis_course_section_sourcedid());
		parameters.put("lis_outcome_service_url", conumer_request.getLis_outcome_service_url());
		parameters.put("lis_person_contact_email_primary", conumer_request.getLis_person_contact_email_primary());
		parameters.put("lis_person_name_family", conumer_request.getLis_person_name_family());
		parameters.put("lis_person_name_full", conumer_request.getLis_person_name_full());
		parameters.put("lis_person_name_given", conumer_request.getLis_person_name_given());
		parameters.put("lis_person_sourcedid", conumer_request.getLis_person_sourced_id());
		parameters.put("lis_result_sourcedid", conumer_request.getLis_result_sourcedid());
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles", conumer_request.getRoles()); 
		parameters.put("lti_message_type",conumer_request.getLti_message_type());
		parameters.put("lti_version", conumer_request.getLti_version());
		parameters.put("resource_link_description", conumer_request.getResource_link_description());
		parameters.put("resource_link_id", conumer_request.getResource_link_id());
		parameters.put("resource_link_title", conumer_request.getResource_link_title());
		parameters.put("roles",conumer_request.getRoles());
		parameters.put("tool_consumer_info_product_family_code", conumer_request.getTool_consumer_info_product_family_code());
		parameters.put("tool_consumer_info_version", conumer_request.getLis_course_offering_sourcedid());
		parameters.put("tool_consumer_instance_contact_email", conumer_request.getTool_consumer_instance_contact_email());
		parameters.put("tool_consumer_instance_description", conumer_request.getTool_consumer_instance_description());
		parameters.put("tool_consumer_instance_guid", conumer_request.getTool_consumer_instance_guid());
		parameters.put("tool_consumer_instance_name", conumer_request.getTool_consumer_instance_name());
		parameters.put("tool_consumer_instance_url", conumer_request.getTool_consumer_instance_url());
		parameters.put("user_id", conumer_request.getUser_id());
		parameters.put("user_image", conumer_request.getUser_image());
		//System.out.println(conumer_request.getUser_id());
		//System.out.println(conumer_request.getCustom_parameters());
		if(conumer_request.getCustom_parameters() != null) {
			//System.out.println(conumer_request.getCustom_parameters());
			parameters.put("custom_capsim_auth_key", "2047");
			//Map<String, String> map = new HashMap<>();
		   // String[] tokens = conumer_request.getCustom_parameters().split("=");
		

//		    for (int i=0; i<tokens.length -1; ) {
//		    	System.out.println(tokens);
//		    	parameters.put(tokens[i++], tokens[i++]);
//		    	
//		    }
		}
	
		
		
		 
		
//		parameters.put("context_id", 	"S3294476");
//		parameters.put("context_label", "ST101");
//		parameters.put("context_title", "Telecommuncations 101");
//		parameters.put("context_type", "CourseSection");
//		parameters.put("lis_course_offering_sourcedid", "DD-ST101");
//		parameters.put("lis_course_section_sourcedid", "DD-ST101:C1");		
//		parameters.put("lis_person_contact_email_primary", "jbaird@uni.ac.uk");
//		parameters.put("lis_person_name_family", "Baird");
//		parameters.put("lis_person_name_full", "John Logie Baird");
//		parameters.put("lis_person_name_given", "John");
//		parameters.put("lti_version","LTI-1p0");
//		parameters.put("lti_message_type","basic-lti-launch-request");
//		parameters.put("resource_link_description", "Will ET phone home, or not; click to discover more.");
//		parameters.put("resource_link_id", "429785226");
//		parameters.put("resource_link_title", "Phone home");
//		parameters.put("roles", "Instructor"); 
//		parameters.put("tool_consumer_info_product_family_code", "jisc");
//		parameters.put("tool_consumer_info_version", "1.2");
//		parameters.put("tool_consumer_instance_contact_email", "vle@uni.ac.uk");
//		parameters.put("tool_consumer_instance_description", "A Higher Education establishment in a land far, far away.");
//		parameters.put("tool_consumer_instance_guid", "vle.uni.ac.uk");
//		parameters.put("tool_consumer_instance_name", "University of JISC");
//		parameters.put("tool_consumer_instance_url", "https://vle.uni.ac.uk/");
//		parameters.put("user_id", "29123");
//		parameters.put("user_image", conumer_request.getUser_image());
		
		
		
//		parameters.put("context_id", conumer_request.getContext_id());
//		parameters.put("context_label", conumer_request.getContext_label());
//		parameters.put("context_title", conumer_request.getContext_title());
//		parameters.put("context_type", conumer_request.getContext_type());
//		parameters.put("custom_context_memberships_url", conumer_request.getCustom_context_memberships_url());
//		parameters.put("custom_context_setting_url", conumer_request.getCustom_context_setting_ur1());
//		parameters.put("custom_lineitem_url", conumer_request.getCustom_lineitem_url());
//		parameters.put("custom_lineitems_url", conumer_request.getCustom_lineitems_url());
//		parameters.put("custom_link_memberships_url", conumer_request.getCustom_link_memberships_url());
//		parameters.put("custom_link_setting_url", conumer_request.getCustom_link_setting_url());
//		parameters.put("custom_result_url", conumer_request.getCustom_result_url());
//		parameters.put("custom_results_url", conumer_request.getCustom_results_url());
//		parameters.put("custom_tc_profile_url", conumer_request.getCustom_tc_profile_url());
//		parameters.put("ext_ims_lis_basic_outcome_url", conumer_request.getExt_ims_lis_basic_outcome_url());
//		parameters.put("ext_ims_lis_memberships_id", conumer_request.getExt_ims_lis_memberships_id());
//		parameters.put("ext_ims_lis_memberships_url", conumer_request.getExt_ims_lis_memberships_url());
//		parameters.put("ext_ims_lis_resultvalue_sourcedids", conumer_request.getExt_ims_lis_resultvalue_sourcedids());
//		parameters.put("ext_ims_lti_tool_setting_id", conumer_request.getExt_ims_lti_tool_setting_id());
//		parameters.put("ext_ims_lti_tool_setting_url", conumer_request.getExt_ims_lti_tool_setting_url());
//		parameters.put("launch_presentation_css_url", conumer_request.getLaunch_presentation_css_url());
//		parameters.put("launch_presentation_document_target", conumer_request.getLaunch_presentation_document_target());
//		parameters.put("launch_presentation_locale", conumer_request.getLaunch_presentation_locale());
//		parameters.put("launch_presentation_return_url", conumer_request.getLaunch_presentation_return_url());
//		parameters.put("lis_course_offering_sourcedid", conumer_request.getLis_course_offering_sourcedid());
//		parameters.put("lis_course_section_sourcedid", conumer_request.getLis_course_section_sourcedid());
//		parameters.put("lis_outcome_service_url", conumer_request.getLis_outcome_service_url());
//		parameters.put("lis_person_contact_email_primary", conumer_request.getLis_person_contact_email_primary());
//		parameters.put("lis_person_name_family", conumer_request.getLis_person_name_family());
//		parameters.put("lis_person_name_full", conumer_request.getLis_person_name_full());
//		parameters.put("lis_person_name_given", conumer_request.getLis_person_name_given());
//		parameters.put("lis_person_sourcedid", conumer_request.getLis_person_sourced_id());
//		parameters.put("lis_result_sourcedid", conumer_request.getLis_result_sourcedid());
//		parameters.put("lti_message_type",conumer_request.getLti_message_type());
//		parameters.put("lti_version", conumer_request.getLti_version());
//		parameters.put("resource_link_description", conumer_request.getResource_link_description());
//		parameters.put("resource_link_id", conumer_request.getResource_link_id());
//		parameters.put("resource_link_title", conumer_request.getResource_link_title());
//		parameters.put("roles", conumer_request.getRoles()); 
//		parameters.put("tool_consumer_info_product_family_code", conumer_request.getTool_consumer_info_product_family_code());
//		parameters.put("tool_consumer_info_version", conumer_request.getLis_course_offering_sourcedid());
//		parameters.put("tool_consumer_instance_contact_email", conumer_request.getTool_consumer_instance_contact_email());
//		parameters.put("tool_consumer_instance_description", conumer_request.getTool_consumer_instance_description());
//		parameters.put("tool_consumer_instance_guid", conumer_request.getTool_consumer_instance_guid());
//		parameters.put("tool_consumer_instance_name", conumer_request.getTool_consumer_instance_name());
//		parameters.put("tool_consumer_instance_url", conumer_request.getTool_consumer_instance_url());
//		parameters.put("user_id", conumer_request.getUser_id());
//		parameters.put("user_image", conumer_request.getUser_image());

		
//		parameters.put("custom_realm","mhhe"); 
//		parameters.put("custom_application_type","MHCampus");
//		parameters.put("mhcampus_isbn","125960585X");
//		parameters.put("mhcampus_provider","CONNECT");
//		
//		parameters.put("context_id","S3294476");
//		parameters.put("context_title","Telecommuncations 101");
//		parameters.put("context_label","ST101");
//		parameters.put("userId","77119252688");
//		parameters.put("lis_person_name_full","Jovin Mathias");
//		parameters.put("lis_person_name_given","Jovin");
//		parameters.put("lis_person_name_family","Mathias");
//		parameters.put("lis_person_sourcedid","");
//		parameters.put("lis_course_offering_sourcedid","");
//		parameters.put("lis_person_contact_email_primary","jovinm97@gmail.com");
//		parameters.put("roles","urn:lti:instrole:ims/lis/Student");
//		parameters.put("resource_link_id","4297852261111");
		//parameters.put("launch_presentation_return_url","http://login.tegrity.com");
//		parameters.put("lti_version","LTI-1p0");
//		parameters.put("lti_message_type","basic-lti-launch-request");
//		parameters.put("custom_realm","mhhe"); 
//		parameters.put("custom_application_type","MHCampus");
//		parameters.put("mhcampus_isbn","125960585X");
//		parameters.put("mhcampus_provider","CONNECT");
		

	
//		System.out.println("Parameters");
		Map<String, String> signedParameters = new HashMap<String, String>();

		try {
			signedParameters = ltiSigner.signParameters(parameters, conumer_request.getConsumer_key() , conumer_request.getSecret(), conumer_request.getLaunch_url(), "POST");
//			System.out.println(signedParameters);
			m.addAttribute("launch_url", conumer_request.getLaunch_url());
 
//			LtiLaunch ltiLaunch = new LtiLaunch(signedParameters);
//			System.out.println(signedParameters.toString());

			return new ModelAndView("welcome", "contactForm", signedParameters);

			
		} catch (LtiSigningException e) {
			// TODO Auto-generated catch block
//			System.out.println("Error");
//			System.out.println(e);

			e.printStackTrace();
			return new ModelAndView("welcome", "contactForm", signedParameters);

		}
	}
	
//	@RequestMapping(value = "/loginforSSO", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody String loginforSSO(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String userId = (String)request.getSession().getAttribute("userId");
//		Boolean logout = false;
//		request.getSession().setAttribute("logout", logout);
//		if(userId != null){
//			//Session already created. Don't fire another query on DB
//			System.out.println("LTI App :"+userId + " already logged in");
//			return null;
//		}
//		request.getSession().setAttribute("validityExpired","No");
//		request.getSession().setAttribute("earlyAccess", "No");
//		String userIdEncrypted = request.getParameter("uid");
//		System.out.println("Logging in Encrypted = ACADS"+userIdEncrypted);
//		userId = ltidemo.helpers.AESencrp.decrypt(userIdEncrypted);
//		return null;
//		//request.getSession().setAttribute("userId", userId);
//		
//	}
	
	
	@RequestMapping(value="/postToProvider", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView postToProvider(@ModelAttribute("contactForm") LtiPost ltiPost) {
		LtiSigner ltiSigner = new LtiOauthSigner();
		
//		Map<String, String> parameters = new HashMap<String, String>();
//		
//		parameters.put("context_id","S3294476");
//		parameters.put("context_title","Telecommuncations 101");
//		parameters.put("context_label","ST101");
//		parameters.put("userId","7837467321");
//		parameters.put("lis_person_name_full","Jane Public");
//		parameters.put("lis_person_name_given","Jane");
//		parameters.put("lis_person_name_family","Public");
//		parameters.put("lis_person_sourcedid","");
//		parameters.put("lis_course_offering_sourcedid","");
//		parameters.put("lis_person_contact_email_primary","sanketpanaskar@gmail.com");
//		parameters.put("roles","Student");
//		parameters.put("resource_link_id","9e822d48-2f8d-411e-a3f4-bbeeedc801a51");
//		parameters.put("launch_presentation_return_url","http://login.tegrity.com");
//		parameters.put("lti_version","LTI-1p0");
//		parameters.put("lti_message_type","basic-lti-launch-request");
//		parameters.put("custom_realm","mhhe"); 
//		parameters.put("custom_application_type","MHCampus");
//		parameters.put("mhcampus_isbn","125960585X");
//		parameters.put("mhcampus_provider","CONNECT");
//		

	
//		System.out.println("Parameters");
//		System.out.println(ltiPost.getContactMap());
		Map<String, String> signedParameters = new HashMap<String, String>();

		try {
			signedParameters = ltiSigner.signParameters(ltiPost.getContactMap(), "2FO2-J2FJ-E8HB", "E0936D", "https://aairs.tegrity.com/Service/RedirectCMSLink.aspx" , "POST");
//			System.out.println(signedParameters);

//			LtiLaunch ltiLaunch = new LtiLaunch(signedParameters);
//			System.out.println(signedParameters.toString());

			return new ModelAndView("welcome", "contactForm", signedParameters);

			
		} catch (LtiSigningException e) {
			// TODO Auto-generated catch block
//			System.out.println("Error");
//			System.out.println(e);

			e.printStackTrace();
			return new ModelAndView("welcome", "contactForm", signedParameters);

		}
	}
	@RequestMapping(value="/api/getLTIparams", method = RequestMethod.GET, produces = "application/json")
	public  ResponseEntity<Map<String, String>> getLTIparams() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","application/json");
		LtiSigner ltiSigner = new LtiOauthSigner();
		Map<String, String> parameters = new HashMap<String, String>();
//		System.out.println("Parameters");
		

		parameters.put("context_id","S3294476");
		parameters.put("context_title","Telecommuncations 101");
		parameters.put("context_label","ST101");
		parameters.put("userId","7837467321");
		parameters.put("lis_person_name_full","Jane Public");
		parameters.put("lis_person_name_given","Jane");
		parameters.put("lis_person_name_family","Public");
		parameters.put("lis_person_sourcedid","");
		parameters.put("lis_course_offering_sourcedid","");
		parameters.put("lis_person_contact_email_primary","sanketpanaskar@gmail.com");
		parameters.put("roles","Student");
		parameters.put("resource_link_id","9e822d48-2f8d-411e-a3f4-bbeeedc801a51");
		parameters.put("launch_presentation_return_url","http://login.tegrity.com");
		parameters.put("lti_version","LTI-1p0");
		parameters.put("lti_message_type","basic-lti-launch-request");
		parameters.put("custom_realm","mhhe"); 
		parameters.put("custom_application_type","MHCampus");
		parameters.put("mhcampus_isbn","125960585X");
		parameters.put("mhcampus_provider","CONNECT");
	
		
		Map<String, String> signedParameters = new HashMap<String, String>();
		
		try {
			signedParameters = ltiSigner.signParameters(parameters, "2FO2-J2FJ-E8HB", "E0936D", "https://aairs.tegrity.com/Service/RedirectCMSLink.aspx" , "POST");
//			System.out.println(signedParameters);

			
			return new ResponseEntity<Map<String, String>>(signedParameters, headers, HttpStatus.OK);

		} catch (LtiSigningException e) {
			// TODO Auto-generated catch block
//			System.out.println("Error");
//			System.out.println(e);

			e.printStackTrace();
			return new ResponseEntity<Map<String, String>>(signedParameters, headers, HttpStatus.OK);

		}
	}
	@RequestMapping(value="/", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request) {
		//LtiSigner ltiSigner = new LtiOauthSigner();
		
//		System.out.println("logout:Logging out from LTI");
		request.getSession().invalidate();
		LtiPost contactForm = new LtiPost();
		
		contactForm.setContactMap(parameters);
//		System.out.println("Parameters");
		return new ModelAndView("login");
	}


   @RequestMapping(value = "/LtiloginAs", method = RequestMethod.POST)
	public ModelAndView loginAs(HttpServletRequest request, HttpServletResponse respnse) throws Exception {
		//logger.info("HomeController:home", "");
//		System.out.println("testt");
		ModelAndView modelnView = null;
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
//		System.out.println("userId"+userId); System.out.println("password"+password);
		boolean authenticated = false;
		if("ngasce@admin20".equals(password)){
			authenticated = true;
		}else{
			authenticated = false;
		}

		//request.setAttribute("SERVER_PATH", SERVER_PATH);

		if(authenticated){
			request.getSession().setAttribute("userId", userId);
			//return new ModelAndView("redirect:/Timeline");
			return executePostAuthenticationActivities(request,respnse );
		}else{
			modelnView = new ModelAndView("login");
			request.setAttribute("error", "true");
			request.setAttribute("errorMessage", "Invalid Credentials. Please re-try.");
		}

		return modelnView;
	}
	
	
	public ModelAndView executePostAuthenticationActivities(HttpServletRequest request, HttpServletResponse respnse) throws Exception {
		String userId = (String)request.getSession().getAttribute("userId");
		if(!(userId.startsWith("77") || userId.startsWith("79"))){
			request.getSession().setAttribute("role", "Faculty");
			return new ModelAndView("redirect:/FacultyTimeline");
		}else {
			StudentLtidemoBean student = postService.getSingleStudentsData(userId);
			request.getSession().setAttribute("studentLtidemo", student);
			request.getSession().setAttribute("role", "Student");
			List<ExamOrderBean> liveFlagList = postService.getLiveFlagDetails();
			postService.getStudentHomePageDetails(student, request, liveFlagList);
			return new ModelAndView("redirect:/Timeline");
		}
	}
	 

	/* code for get single subject for 15 days
	 private ArrayList<String> getSubjectForStudent(Student student){
		
		ArrayList<String> subjects = new ArrayList<>();
		List<ProgramSubjectMappingBean> programSubjectMappingList = postService.getProgramSubjectSemMappingList(student);
		System.out.println("programSubjectMappingList "+programSubjectMappingList);
		
		for (ProgramSubjectMappingBean bean : programSubjectMappingList) {
			if ("TimeBond".equalsIgnoreCase(bean.getStudentType())) {
				String activeSubject = postService.getCurrentActiveSubject();
				subjects.add(activeSubject);
			}else{
				subjects.add(bean.getSubject());
			}			
		}
		return subjects;	
	}
 
	 * */
	


	
//	@RequestMapping(value = "/loginforSSO", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody String loginforSSO(HttpServletRequest request, HttpServletResponse respnse) throws Exception {
//		
//		String userId = (String)request.getSession().getAttribute("userId");
//		
//		Boolean logout = false;
//		request.getSession().setAttribute("logout", logout);
//		if(userId != null){
//			//Session already created. Don't fire another query on DB
//		
//			return null;
//		}
//		
//		request.getSession().setAttribute("validityExpired","No");
//		request.getSession().setAttribute("earlyAccess", "No");
//		String userIdEncrypted = request.getParameter("uid");
//
//		userId = AESencrp.decrypt(userIdEncrypted);
//		request.getSession().setAttribute("userId", userId);
//		
//
//	
//		Student student = postService.getSingleStudentsData(userId);
//		
//
//		request.getSession().setAttribute("studentLtidemo", student);
//		
////		boolean isValid = isStudentValid(student, userId);
////		if(!isValid){
////			request.getSession().setAttribute("validityExpired","Yes");
////		}
//		
//	
//		
//		
//
//		
//		Person person = new Person();
//		person.setUserId(userId);
//		
////		if(student != null){
////			
////		
////		
////			
////	
////			//Check if student is lateral student and has done program with NGASCE in past. In this case his passed subjects will become waived off subjects
////			// course Waiver is not applicable for Jul2009 program Structure Students
////			if(student.getPreviousStudentId() != null && !"".equals(student.getPreviousStudentId()) && !"Jul2009".equals(student.getPrgmStructApplicable())  && student.getIsLateral().equalsIgnoreCase("Y")){
////				student.setWaivedOffSubjects(contentService.getPassSubjectsNamesForAStudent(student.getPreviousStudentId()));
////				request.getSession().setAttribute("student", student);
////			}
////			
////			person.setFirstName(student.getFirstName());
////			person.setLastName(student.getLastName());
////			person.setProgram(student.getProgram());
////			person.setEmail(student.getEmailId());
////			person.setContactNo(student.getMobile());
////		}
//		
//		
//		
//		
//		
//		
////		if(!userId.startsWith("77") && !userId.startsWith("79")){
////			//Admin user. Fetch information from LDAP
////		//	LDAPDao dao = (LDAPDao)act.getBean("ldapdao");
////			person = LDAPService.findPerson(userId);
////			person.setUserId(userId);
////			//System.out.println("User roles in login for sso acads"+person.getRoles());
////			request.getSession().setAttribute("user", person);
////			
////			//Fetch and store User Authorization in session
////			UserAuthorizationBean userAuthorization = contentService.getUserAuthorization(userId);
////			if(userAuthorization == null){
////				userAuthorization = new UserAuthorizationBean();
////			}
////			
////			ArrayList<String> authorizedCenterCodes = contentService.getAuthorizedCenterCodes(userAuthorization);//List of all center codes
////			String commaSeparatedAuthorizedCenterCodes = StringUtils.join(authorizedCenterCodes.toArray(), ",");//Comma separated center codes
////			
////			userAuthorization.setAuthorizedCenterCodes(authorizedCenterCodes);
////			userAuthorization.setCommaSeparatedAuthorizedCenterCodes(commaSeparatedAuthorizedCenterCodes);
////			
////			request.getSession().setAttribute("userAuthorization", userAuthorization);
////		}
//		request.getSession().setAttribute("user", person);
//		
//		
//		System.out.println("Acads APP: User logged in");
//		return null;
//	}
//	
//	
	
	
	@RequestMapping(value="/updatePearsonMapping", method= {RequestMethod.GET, RequestMethod.POST})
	public void updatePearsonMapping(HttpServletRequest request) {
//		System.out.println("Called updatePearsonMapping Start");
		//String userId = (String)request.getSession().getAttribute("userId");
		String consumerProgramStructureId = request.getParameter("consumerProgramStructureId");
		String sem = request.getParameter("sem");
		
		List<StudentLtidemoBean> studentList = postService.getAllStudentsForPearsonMapping(consumerProgramStructureId,sem);
		List<String> pearsonResourcesIds = null;
		
		if ("2".equals(sem)) {
			pearsonResourcesIds = Arrays.asList("18","19","20","21","22","23","24","25","26","27");
		}else if ("1".equals(sem)) {
			pearsonResourcesIds = Arrays.asList("18","19","20","21","22");
		}

		for (StudentLtidemoBean student : studentList) {
			int count = 0;
			UserResourseMapping userMapping = new UserResourseMapping();
			Integer userReourcesId = postService.getLTIUserMappingId(student.getSapid());
			userMapping.setUserId(userReourcesId);
			userMapping.setCreatedBy("sanketpanaskar");
			userMapping.setModifiedBy("sanketpanaskar");
			
			if (!userReourcesId.equals(0)) {
				for (String id : pearsonResourcesIds) {
					userMapping.setResourceId(id);
					if ("2".equalsIgnoreCase(sem)) {
						userMapping.setStartDate("2019-06-01 00:00:00");
						userMapping.setEndDate("2020-05-31 11:59:59");
					}else {
						userMapping.setStartDate("2019-11-01 00:00:00");
						userMapping.setEndDate("2020-10-31 11:59:59");
					}
					Long resourcesMappingId = postService.insertPearsonResourcesMapping(userMapping);
					if (resourcesMappingId > 0) {
						count++;
					}
				}
			}
//			System.out.println("Added "+count+ " Mapping for sapid : "+student.getSapid());
		}
//		System.out.println("updatePearsonMapping End.");
	}
	
	@RequestMapping(value="/studentHome", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView studentHome(HttpServletRequest request) {
		//LtiSigner ltiSigner = new LtiOauthSigner();
		
		LtiPost contactForm = new LtiPost();
		contactForm.setContactMap(parameters);
//		System.out.println("Parameters");
		///Map<String, String> signedParameters = new HashMap<String, String>();
		return new ModelAndView("studentHome");
	}
	
	

	@RequestMapping(value="/login2", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView taketologin(HttpServletRequest request) {
		
		return new ModelAndView("login2", "msg", "hello"); 
	}
	
	@RequestMapping(value="/login3", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView taketologin1(HttpServletRequest request) {
		
		return new ModelAndView("login3", "msg", "hello");
	}
	
	@RequestMapping(value="/todo", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView gototodo(HttpServletRequest request) {
		
		return new ModelAndView("todo", "msg", "hello");
	}
	
	@RequestMapping(value="/studentProgress", method= {RequestMethod.GET, RequestMethod.POST})
	public String studentProgress (){
		
		return "studentProgress";
	}
	
	@RequestMapping(value="/viewAllAssignment", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewAllAssignment (){
		
		return "viewAllAssignment";
	}
	
	@RequestMapping(value="/viewAllNotification", method= {RequestMethod.GET, RequestMethod.POST})
	public String viewAllNotification (){
		
		return "viewAllNotification";
	}
	
	@RequestMapping(value="/accountEditUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String editAccountUser() {
		return "account-edit";
	}

	@RequestMapping(value="/profileNameUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String profileNameUser() {
		return "profileName-user";
	}
	
	@RequestMapping(value="/profileNameInstructor", method = {RequestMethod.GET, RequestMethod.POST})
	public String profileNameInstructor() {
		return "profileName-instructor";
	}
	
	@RequestMapping(value="/profileNameInstructor2", method = {RequestMethod.GET, RequestMethod.POST})
	public String profileNameInstructor2() {
		return "instructor-profileName";
	}

	@RequestMapping(value="/calendar", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendar() {
		return "calendar";
	}
	
	@RequestMapping(value="/chat", method = {RequestMethod.GET, RequestMethod.POST})
	public String chat() {
		return "chat";
	}
	
	@RequestMapping(value="/homeTimeline2", method = {RequestMethod.GET, RequestMethod.POST})
	public String homeTimeline2() {
		return "homeTimeline2";
	}
	
	@RequestMapping(value="/onlinePeople", method = {RequestMethod.GET, RequestMethod.POST})
	public String onlinePeople() {
		return "onlinePeople";
	}
	
	@RequestMapping(value="/message", method = {RequestMethod.GET, RequestMethod.POST})
	public String message() {
		return "message";
	}
	
	@RequestMapping(value="/home", method = {RequestMethod.GET, RequestMethod.POST})
	public String home() {
		return "home2";
	}
	
	@RequestMapping(value="/videoGallery2", method = {RequestMethod.GET, RequestMethod.POST})
	public String videoGallery2() {
		return "videoGallery2";
	}
	
	@RequestMapping(value="/notification", method = {RequestMethod.GET, RequestMethod.POST})
	public String notification() {
		return "notifications";
	}
	
	@RequestMapping(value="/publicProfileName", method = {RequestMethod.GET, RequestMethod.POST})
	public String publicProfileName() {
		return "public-profileName";
	}
	
	@RequestMapping(value="/digital2", method = {RequestMethod.GET, RequestMethod.POST})
	public String digital2() {
		return "digitalLibrary2";
	}
	
	@RequestMapping(value="/account-settings", method = {RequestMethod.GET, RequestMethod.POST})
	public String accountSettings() {
		return "account-settings";
	}
	
//	private ModelAndView executePostAuthenticationActivities(HttpServletRequest request, HttpServletResponse respnse, String userId, String password) throws Exception {
//		PortalDao pDao = (PortalDao)act.getBean("portalDAO");
//		
//		ModelAndView modelnView = new ModelAndView("home");
//
//		request.getSession().setAttribute("validityExpired","No");//This parameter is kept false initially.It will get set to true only if the validity is expired.
//		request.getSession().setAttribute("earlyAccess","No");
//
//		request.getSession().setAttribute("userId", userId);
//		request.getSession().setAttribute("password", password);
//	//	request.setAttribute("SERVER_PATH", SERVER_PATH);
//		Boolean logout = false;
//		request.getSession().setAttribute("logout", logout);
//
//
//		if(!(userId.startsWith("77") || userId.startsWith("79"))){
//			return sendToPageBasedOnRole(request, userId);
//		}
//
//		//ServiceRequestDao sDao = (ServiceRequestDao)act.getBean("serviceRequestDao");
//		Person person = dao.findPerson(userId);
//		StudentBean student = pDao.getSingleStudentsData(userId);
//		System.out.println(student.toString());
//		
//	
//		
//
//	
//		//boolean isCertificate = isStudentOfCertificate(student.getProgram());
//		boolean isCertificate = student.isCertificateStudent();
//		//System.out.println(" isCertificate authenticate student portal "+isCertificate);
//		request.getSession().setAttribute("isCertificate", isCertificate);
//		boolean isValid = isStudentValid(student, userId);
//		//System.out.println("Valid Student = "+isValid);
//
//		// disable program terminated Student from login 
//		if("Program Terminated".equalsIgnoreCase(student.getProgramStatus()))
//		{
//			request.setAttribute("error", "true");
//			request.setAttribute("errorMessage", "Unable to access your ProfileName for further details call 1800 1025 136 (Mon-Sat) 10am-6pm");
//			return logout(request,respnse);
//		}
//
//		if(!isValid){
//			request.getSession().setAttribute("validityExpired","Yes");
//			request.getSession().setAttribute("student", student);
//			request.getSession().setAttribute("user", person);
//			
//			return new  ModelAndView("support/overview");
//		}
//		String validityEndDate = getValidityEndDate(student);
//
//		request.getSession().setAttribute("validityEndDate", validityEndDate);
//
//		//HashMap<String,BigDecimal> examOrderMap = pDao.getExamOrderMap();
//		List<ExamOrderBean> liveFlagList = pDao.getLiveFlagDetails();
//		HashMap<String,BigDecimal> examOrderMap = generateExamOrderMap(liveFlagList);
//		double examOrderDifference = 0.0;
//		double examOrderOfProspectiveBatch = examOrderMap.get(student.getEnrollmentMonth()+student.getEnrollmentYear()).doubleValue();
//		double maxOrderWhereContentLive = getMaxOrderWhereContentLive(liveFlagList);
//		examOrderDifference = examOrderOfProspectiveBatch - maxOrderWhereContentLive;
//
//		if(examOrderDifference == 1){
//			request.getSession().setAttribute("earlyAccess","Yes");
//		}
//
//		request.getSession().setAttribute("student", student);
//
//		if(student != null){
//			/*
//			 * Commented by Sanket on 20-Aug-2017 for performance improvement. Uncomment when needed.
//			 * String pendingAmount = sDao.getPendingAmountFromSapId(student.getSapid());
//			if(!"".equals(pendingAmount) && pendingAmount !=null){
//				request.getSession().setAttribute("SECURE_SECRET",SECURE_SECRET);
//				ModelAndView modelAndView = new ModelAndView("pendingPaymentForm");
//				request.getSession().setAttribute("pendingAmount",pendingAmount);//Placing it in session since if we cancel payment page should get attributes//
//				AdhocPaymentBean adhocPaymentBean = new AdhocPaymentBean();
//				adhocPaymentBean.setAmount(pendingAmount);
//				adhocPaymentBean.setDescription("Exam Registration Pending Fee");
//				modelAndView.addObject("adhocPaymentBean", adhocPaymentBean);
//				modelAndView.addObject("paymentType",paymentTypeList);
//				return modelAndView;
//			}*/
//
//			//Check if student is lateral student and has done program with NGASCE in past. In this case his passed subjects will become waived off subjects
//			//Course Waiver is not applicable for Jul2009 program Structure Students
//			if(student.getPreviousStudentId() != null && !"".equals(student.getPreviousStudentId()) && !"Jul2009".equals(student.getPrgmStructApplicable())){
//				ArrayList<String> waivedOffSubjects = new ArrayList<String>();
//				waivedOffSubjects = pDao.getPassSubjectsNamesForAStudent(student.getPreviousStudentId());
//				student.setWaivedOffSubjects(waivedOffSubjects);
//				request.getSession().setAttribute("student", student);
//				//System.out.println("Waived of subjects "+waivedOffSubjects);
//				request.getSession().setAttribute("waivedOffSubjects", waivedOffSubjects);
//			}
//			List<ExecutiveExamOrderBean> ResultliveFlagList = new ArrayList<ExecutiveExamOrderBean>();
//
//			if(student.getProgram().equalsIgnoreCase("EPBM") || student.getProgram().equalsIgnoreCase("MPDV")){
//			 ResultliveFlagList = pDao.getResultliveFlagList();
//				HashMap<String,BigDecimal> executiveExamOrderMap = generateExecutiveExamOrderMap(ResultliveFlagList);
//				
//			}
//			
//			getStudentHomePageDetails(student, request, liveFlagList,ResultliveFlagList);
//
//			
//			//String IdentityConfirmed = person.getIdentityConfirmed();
//			//System.out.println(person.toString());
//			modelnView.addObject("displayName", person.getDisplayName() );
//			request.getSession().setAttribute("user", person);
//
//			person.setEmail(student.getEmailId());
//			person.setContactNo(student.getMobile());
//			person.setProgram(student.getProgram());
//
//			//String programStructure = student.getPrgmStructApplicable();
//
//			if(!"Y".equals(student.getUpdatedByStudent())){
//				modelnView = new ModelAndView("confirmParentName");
//				modelnView.addObject("student", student );
//				return modelnView;
//			}
//			
//			ArrayList<StudentMarksBean> allStudentRegistrations = pDao.getAllRegistrationsFromSAPID(student.getSapid());
//			HashMap<String, StudentMarksBean> monthYearAndStudentRegistrationMap = new HashMap<>();
//			for (StudentMarksBean bean : allStudentRegistrations) {
//				monthYearAndStudentRegistrationMap.put(bean.getMonth() + "-" + bean.getYear(), bean);
//			}
//			StudentMarksBean studentRegistrationData = getStudentRegistrationForForSpecificLiveSettings(monthYearAndStudentRegistrationMap, liveFlagList, "acadSessionLive");
//			
//			if(studentRegistrationData !=null){
//				Online_EventBean onlineEvent = pDao.getLiveOnlineEvent(studentRegistrationData.getProgram(),studentRegistrationData.getSem(),student.getPrgmStructApplicable());
//				boolean registeredForEvent = false;
//				if(onlineEvent.getId() != null){
//					registeredForEvent = pDao.getOnlineEventRegistration(student.getSapid(),onlineEvent.getId());
//					if(registeredForEvent == false){
//						return onlineEventRegistration(request, respnse,onlineEvent);
//					}
//				}
//			}
//		}
//
//		//Temporarily Commented on 8-Sep-2017 for Performance Improvements
//		//pDao.insertLoginDetails(userId,getClientIp(request),getClientOs(request),getClientBrowserDetails(request));
//
//		/*Commented by Sanket: 20-Aug-2017
//		 * if(!("Confirmed".equalsIgnoreCase(IdentityConfirmed))){//For first time login of new students
//			modelnView = new ModelAndView("confirmIdentity");
//			modelnView.addObject("displayName", person.getDisplayName() );
//			modelnView.addObject("hideProfileNameLink", "true");
//			return modelnView;
//		}*/
//
//		//Check if student has FAA subject.
//		/*ArrayList<String> studentWithFAASubjectList = new ArrayList<>();
//		studentWithFAASubjectList = pDao.getStudentApplicableForSubject("Financial Accounting & Analysis");
//		if(studentWithFAASubjectList.contains(userId)){
//			//Check if user has never responded to Event Registration. If not then show event registgration pagee
//			boolean registeredForEvent = pDao.checkIfRegisteredForEvent(userId);
//			if(!registeredForEvent){
//				return onlineEventRegistration(request, respnse);
//			}
//		}*/
//		//Check if student has Business Statistics subject.
//
//
//		/*getstudentWithBusinessStatisticsSubjectList();
//		if(getstudentWithBusinessStatisticsSubjectList().contains(userId)){
//			//Check if user has never responded to Event Registration. If not then show event registgration pagee
//			boolean registeredForEvent = pDao.checkIfRegisteredForEvent(userId);
//			if(!registeredForEvent){
//				return onlineEventRegistration(request, respnse);
//			}
//		}*/
//
//		return checkIfPendingfeedback(request, respnse);
//	}



}
