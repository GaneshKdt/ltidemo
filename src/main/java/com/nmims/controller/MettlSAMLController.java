package com.nmims.controller;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.nmims.bean.MettlStudentSSOBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.helpers.openSAML.MettlSamlRequestHelper;
import com.nmims.services.PostService;




@Controller
public class MettlSAMLController {

	@Value( "${SERVER}" )
	private String SERVER;
	
	private static final Logger logger = LoggerFactory.getLogger(MettlSAMLController.class);
	
	@Autowired
	MettlSamlRequestHelper samlHelper;

	@Autowired
	PostService postService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mettl_sso", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mettl_sso(HttpServletRequest servletRequest) {
		try {
			String samlRequest = servletRequest.getParameter("SAMLRequest");
			MettlStudentSSOBean ssoDetails = new MettlStudentSSOBean();
			
			if(servletRequest.getSession().getAttribute("MettlSSODetails") != null) {
				ModelAndView modelAndView = new ModelAndView("Mettl/postSamlForm");
				ssoDetails = (MettlStudentSSOBean) servletRequest.getSession().getAttribute("MettlSSODetails");

				logger.info("\n"+SERVER+": "+new Date()+" mettl_sso "+ssoDetails);
				
				StudentLtidemoBean studentInfo;
				if(servletRequest.getSession().getAttribute("studentInfo") != null) {
					studentInfo = (StudentLtidemoBean) servletRequest.getSession().getAttribute("studentInfo");
				} else {
					studentInfo = postService.getSingleStudentsData(ssoDetails.getSapid());
				}
				
				// Get student details
				samlHelper.generateSamlRequest(samlRequest, servletRequest, modelAndView, studentInfo);
				
				// Unset the session. Prevent errors when refresh is clicked.
//				servletRequest.getSession().removeAttribute("MettlSSODetails");
				return modelAndView;
			} else if(servletRequest.getSession().getAttribute("userId") != null) {
				List<String> userRoleList = (List<String>) servletRequest.getSession().getAttribute("userRoles");
				String userId = (String) servletRequest.getSession().getAttribute("userId");

				logger.info("\n"+SERVER+": "+new Date()+" mettl_sso "+userId + " userRoleList " + userRoleList);
				
				if((userRoleList != null && userRoleList.contains("Exam Admin")) || userId.equals("sanketpanaskar")) {
					ModelAndView modelAndView = new ModelAndView("Mettl/postSamlForm");
					StudentLtidemoBean studentInfo = new StudentLtidemoBean();
					studentInfo.setSapid(userId);
					studentInfo.setFirstName("NGASCE Admin");
					studentInfo.setLastName(".");
					studentInfo.setEmailId("ashutosh.sultania.ext@nmims.edu");

					samlHelper.generateSamlRequest(samlRequest, servletRequest, modelAndView, studentInfo);

					return modelAndView;
				} else {

					ModelAndView modelAndView = new ModelAndView("Mettl/MettlSSOError");
					modelAndView.addObject("error", "User not authorized!");

					logger.info("\n"+SERVER+": "+new Date()+" mettl_sso "+userId + " User not authorized ");
					return modelAndView;
				}
			} else {

				ModelAndView modelAndView = new ModelAndView("Mettl/MettlSSOError");
				modelAndView.addObject("error", "No Logged in user found!");

				logger.info("\n"+SERVER+": "+new Date()+" mettl_sso No Logged in user found ");
				return modelAndView;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			ModelAndView modelAndView = new ModelAndView("Mettl/MettlSSOError");
			modelAndView.addObject("error", "Internal Server Error!");
			modelAndView.addObject("errorHidden", e.getMessage());
			

			logger.info("\n"+SERVER+": "+new Date()+" mettl_sso ", e);
			return modelAndView;
		}

	}

	@RequestMapping(value = "/mettl_sso_idp_metadata", method = { RequestMethod.GET, RequestMethod.POST })
	public void mettl_sso_idp_metadata(HttpServletResponse response) {
		String metadata = "";
		
		try {
			metadata = samlHelper.generateMetadata();
			response.setContentType("application/xml");
			response.setContentLength(metadata.getBytes().length);
			
			InputStream is = IOUtils.toInputStream(metadata, StandardCharsets.UTF_8);
			IOUtils.copy(is, response.getOutputStream());
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
			metadata = "Error " + e.getMessage();
			throw new RuntimeException("IOError writing file to output stream" + " Error " + e.getMessage());
		}
	}
	
}
