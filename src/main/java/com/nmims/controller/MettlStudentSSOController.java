package com.nmims.controller;

import java.util.Date;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.MettlStudentSSOBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.dao.MettlAssessmentDAO;
import com.nmims.helpers.AESencrp;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MettlStudentSSOController {

	@Autowired
	ApplicationContext act;
	
	@Value( "${SERVER}" )
	private String SERVER;

	@Value("${PAYTM_MERCHANTKEY}")
	private String PAYTM_MERCHANTKEY;
	
	private static final Logger logger = LoggerFactory.getLogger(MettlStudentSSOController.class);
	
	@RequestMapping(value = "/start_mettl_assessment", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mettl_sso(HttpServletRequest servletRequest) {

		String sapid = servletRequest.getParameter("sapid");
		String scheduleId = servletRequest.getParameter("scheduleId");
		String timeboundId = servletRequest.getParameter("timeboundId");

		ModelAndView errorRedirect = new ModelAndView("redirect: /timeline/startTEEAssessment");
		
		if(sapid == null || scheduleId == null || timeboundId == null) {
			errorRedirect.addObject("error", "true");
			errorRedirect.addObject("scheduleId", scheduleId);
			errorRedirect.addObject("timeboundId", timeboundId);
			errorRedirect.addObject("errorMessage", "Error Initiating Assessment.");
			
			logger.info("\n"+SERVER+": "+new Date()+""
				+ " start_mettl_assessment "
				+ " sapid : " + sapid
				+ " timeboundId : " + timeboundId
				+ " scheduleId : " + scheduleId
			+ " Error : Error Initiating Assessment."
			);
			return errorRedirect;
		}
		MettlAssessmentDAO assessmentDAO = (MettlAssessmentDAO) act.getBean("mettlAssessmentDAO");
		try {

			MettlStudentSSOBean ssoDetails = assessmentDAO.checkIfStudentCanAttemptTest(scheduleId, sapid, timeboundId,servletRequest);
			servletRequest.getSession().setAttribute("MettlSSODetails", ssoDetails);
			
			if(ssoDetails.getError() == null) {

				ModelAndView modelAndView = new ModelAndView("Mettl/MettlRedirect");
				modelAndView.addObject("redirectURL", ssoDetails.getScheduleAccessUrl());
				
				logger.info("\n"+SERVER+": "+new Date()+""
					+ " start_mettl_assessment "
					+ " sapid : " + sapid
					+ " timeboundId : " + timeboundId
					+ " scheduleId : " + scheduleId
					+ " Success "
				);
				
				return modelAndView;
			} else {
				errorRedirect.addObject("error", "true");
				errorRedirect.addObject("scheduleId", scheduleId);
				errorRedirect.addObject("timeboundId", timeboundId);
				errorRedirect.addObject("errorMessage", ssoDetails.getError());
				
				logger.info("\n"+SERVER+": "+new Date()+""
					+ " start_mettl_assessment "
					+ " sapid : " + sapid
					+ " timeboundId : " + timeboundId
					+ " scheduleId : " + scheduleId
					+ " Error : " + ssoDetails.getError()
				);
				return errorRedirect;
			}
	
		}catch (Exception e) {
			e.printStackTrace();
			errorRedirect.addObject("error", "true");
			errorRedirect.addObject("scheduleId", scheduleId);
			errorRedirect.addObject("timeboundId", timeboundId);
			errorRedirect.addObject("errorMessage", "Error Initiating Assessment!<br/> Info : " + e.getMessage());
			
			logger.info("\n"+SERVER+": "+new Date()+""
				+ " start_mettl_assessment "
				+ " sapid : " + sapid
				+ " timeboundId : " + timeboundId
				+ " scheduleId : " + scheduleId
				+ " Error : " + e.getMessage()
			);
			return errorRedirect;
		}
		
	}
	
	@RequestMapping(value="mettl_sso_mbawx_demo_student", method=RequestMethod.GET)
	public ModelAndView demoExamSSOMbaWx(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("Mettl/MettlRedirect");

		try {
			String joinKey = (String) request.getParameter("joinKey");
			TreeMap<String, String> params = decryptParameters(joinKey);
			StudentLtidemoBean studentInfo = new StudentLtidemoBean();
			MettlStudentSSOBean ssoDetails =  new MettlStudentSSOBean();
			if(params.get("error").equalsIgnoreCase("false")) {
				
			ssoDetails.setSapid(params.get("sapid"));
			ssoDetails.setScheduleAccessUrl(params.get("accessUrl"));
			studentInfo.setSapid(params.get("sapid"));
			studentInfo.setEmailId(params.get("emailId"));
			studentInfo.setFirstName(params.get("firstname"));
			studentInfo.setLastName(params.get("lastname"));
			ssoDetails.setScheduleName(params.get("scheduleName"));
			ssoDetails.setScheduleId(params.get("scheduleId"));

			request.getSession().setAttribute("studentInfo", studentInfo);
			request.getSession().setAttribute("MettlSSODetails", ssoDetails);
			
			logger.info("student info details from session:"+studentInfo.toString());
			logger.info("mettl info details from session:"+ssoDetails.toString());
			
			modelAndView.addObject("redirectURL", ssoDetails.getScheduleAccessUrl());
			
			logger.info("\n"+SERVER+": "+new Date()+""
					+ " mettl_sso_demo_student "
					+ " joinKey : " + joinKey
					+ " params : " + params
				);
			}
			else {
				modelAndView = new ModelAndView("Mettl/MettlErrorRedirectMBAWX");
				modelAndView.addObject("showError", true);
				modelAndView.addObject("joinKey", joinKey);
				modelAndView.addObject("error", params.get("errorMessage"));
				
				logger.info("\n"+SERVER+": "+new Date()+""
					+ " mettl_sso_demo_student Error"
					+ " joinKey : " + joinKey
					+ " error : " + params.get("errorMessage")
				);
			}

		}catch (Exception e) {
			//e.printStackTrace();
			logger.info("Exception:"+e);
			String joinKey = (String) request.getParameter("joinKey");
			
			modelAndView = new ModelAndView("Mettl/MettlErrorRedirectMBAWX");
			modelAndView.addObject("showError", true);
			modelAndView.addObject("joinKey", joinKey);
			modelAndView.addObject("error", e.getMessage());
			
			logger.info("\n"+SERVER+": "+new Date()+""
				+ " mettl_sso_student Error"
				+ " joinKey : " + joinKey
				+ " error : " + e.getMessage()
			);
		}
		
		return modelAndView;
	}
	
	private TreeMap<String, String> decryptParameters(String encryptedDataBase64) throws Exception {
		String encryptedData = getStringBase64Decoded(encryptedDataBase64);
		String data = AESencrp.decrypt(encryptedData);

//		System.out.println(data);
		TreeMap<String, String> params = new TreeMap<String, String>();
		for (String entry : StringUtils.split(data, "\n")) {
			String key = StringUtils.split(entry, "=")[0];
			String value = StringUtils.split(entry, "=")[1];
			params.put(key, value);
		}
		return params;
	}
	
	private String getStringBase64Decoded(String input) {
		return new String(Base64.decodeBase64(input.getBytes()));
	}
}
