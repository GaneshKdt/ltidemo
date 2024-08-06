package com.nmims.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
import com.nmims.dao.MBAXMettlAssessmentDAO;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MBAXMettlStudentSSOController {


	@Value( "${SERVER}" )
	private String SERVER;

	private static final Logger logger = LoggerFactory.getLogger(MBAXMettlStudentSSOController.class);
	
	@Autowired
	ApplicationContext act;

	@Autowired
	MBAXMettlAssessmentDAO assessmentDAO;
	
	
	@RequestMapping(value = "/start_mettl_assessment_mbax", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView start_mettl_assessment_mbax(HttpServletRequest servletRequest) {

		String sapid = servletRequest.getParameter("sapid");
		String scheduleId = servletRequest.getParameter("scheduleId");
		String timeboundId = servletRequest.getParameter("timeboundId");

		ModelAndView errorRedirect = new ModelAndView("redirect: /ssoservices/mbax/startAssessment");
		
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
		try {

			MettlStudentSSOBean ssoDetails = assessmentDAO.checkIfStudentCanAttemptTest(scheduleId, sapid, timeboundId);
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
	
}
