package com.nmims.controller;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.DashboardBean;
import com.nmims.bean.ProgramSubjectMappingBean;
import com.nmims.dao.ChatDAO;
import com.nmims.services.LoginService;


@Controller
public class AdminDashController {

	@Autowired(required=false)
	ApplicationContext act;

	String data;
	@Autowired   
	ChatDAO chatDAO;

	@Autowired
	LoginService logService;
	
	@Value("${SERVER_PATH}")
	private String SERVER_PATH;

	@Value("#{'${ACAD_YEAR_LIST}'.split(',')}")
	private List<String> ACAD_YEAR_LIST;

	@Value("#{'${ACAD_MONTH_LIST}'.split(',')}")
	private List<String> ACAD_MONTH_LIST;

	public ArrayList<String> semesterList = new ArrayList<String>(Arrays.asList( 
			"1","2","3","4","5","6","7","8","9","10")); 


	@RequestMapping(value = "/searchBatchUserForm", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView StudentBatchMapping(HttpServletRequest request, HttpServletResponse response) {
		
		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}
		
		DashboardBean mappingBean = new DashboardBean();
		ModelAndView m = new ModelAndView("dashboardUserMapping");
		ChatDAO chatDAO = (ChatDAO)act.getBean("chatDAO");
		m.addObject("mappingBean", new DashboardBean());
		m.addObject("consumerType", chatDAO.getConsumerTypeList());
		m.addObject("programSubjectMappingBean", mappingBean);
		m.addObject("yearList", ACAD_YEAR_LIST);
		m.addObject("monthList", ACAD_MONTH_LIST);
		m.addObject("semesterList", semesterList);

		return m;
	}
	
	@RequestMapping(value = "/mappedUserList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchStudentBatchMapping(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute DashboardBean mappingBean) {
		
		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}

		ChatDAO chatDAO = (ChatDAO)act.getBean("chatDAO");
		String userId = (String) request.getSession().getAttribute("userId");
		ModelAndView modelnView = new ModelAndView("dashboardUserMapping");
		List<DashboardBean> userList = new ArrayList<>();
		try {

			userList = chatDAO.getStudentBatchMapping(mappingBean.getSubject(), mappingBean.getBatchId(), mappingBean.getIsResit());
			
			if (userList.size() == 0) {

				request.setAttribute("error", "true");
				request.setAttribute("errorMessage", "None students found for selected batch/subject.");

				modelnView.addObject("mappingBean", new DashboardBean());
				modelnView.addObject("consumerType", chatDAO.getConsumerTypeList());
				modelnView.addObject("programSubjectMappingBean", mappingBean);
				modelnView.addObject("semesterList", semesterList);
				modelnView.addObject("yearList", ACAD_YEAR_LIST);
				modelnView.addObject("monthList", ACAD_MONTH_LIST);
				modelnView.addObject("rowCount", userList.size());

				return modelnView;

			} else {
				request.setAttribute("success", "true");
				request.setAttribute("successMessage", "Successfully fetched student batch mapping.");			
			}			


		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "true");
			request.setAttribute("errorMessage", "Error while fetching student batch mapping.");
		}					

		modelnView.addObject("mappingBean", mappingBean);
		modelnView.addObject("consumerType", chatDAO.getConsumerTypeList());
		modelnView.addObject("programSubjectMappingBean", mappingBean);
		modelnView.addObject("yearList", ACAD_YEAR_LIST);
		modelnView.addObject("monthList", ACAD_MONTH_LIST);
		modelnView.addObject("semesterList", semesterList);
		modelnView.addObject("userList", userList);
		modelnView.addObject("rowCount", userList.size());

		request.getSession().setAttribute("studentBatchMapList", userList);
		return modelnView;
	}
	
}
