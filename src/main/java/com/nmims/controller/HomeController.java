package com.nmims.controller;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.ExamOrderBean;
import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.PersonLtidemoBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.dao.PostDao;
import com.nmims.helpers.AESencrp;
import com.nmims.services.PostService;

@Controller
public class HomeController {

	@Autowired
	PostService postService;
	
	@Autowired
	PostDao postDao;
	 
	@RequestMapping(value = "/loginforSSO", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String loginforSSO(HttpServletRequest request, HttpServletResponse respnse) throws Exception {
		
		String userId = (String)request.getSession().getAttribute("userId");
		
		Boolean logout = false;
		request.getSession().setAttribute("logout", logout);
		if(userId != null){
			//Session already created. Don't fire another query on DB
			return null;
		}
		
		String userIdEncrypted = request.getParameter("uid");
		userId = AESencrp.decrypt(userIdEncrypted);
		request.getSession().setAttribute("userId", userId);
		//userId = "77218101888";
		
		StudentLtidemoBean student = postService.getSingleStudentsData(userId);
		request.getSession().setAttribute("studentLtidemo", student);
		List<ExamOrderBean> liveFlagList = postService.getLiveFlagDetails();
		HashMap<String,BigDecimal> examOrderMap = generateExamOrderMap(liveFlagList);
	
		PersonLtidemoBean person = new PersonLtidemoBean();
		person.setUserId(userId);
		
       postService.getStudentHomePageDetails(student,request,liveFlagList);
       
		if (student != null && student.getSapid() != null) {
			double examOrderDifference = 0.0;
			double getExamOrderOfProspectiveBatch = examOrderMap.get(student.getEnrollmentMonth()+student.getEnrollmentYear()) !=null ?examOrderMap.get(student.getEnrollmentMonth()+student.getEnrollmentYear()).doubleValue():0.0;
			double getMaxOrderWhereContentLive = postService.getMaxOrderWhereContentLive();
			examOrderDifference = getExamOrderOfProspectiveBatch - getMaxOrderWhereContentLive;
			
			if(examOrderDifference == 1){
		    	request.getSession().setAttribute("earlyAccess","Yes");
		    }
			
			boolean isCertificate = isStudentOfCertificate(student.getProgram());
			request.getSession().setAttribute("isCertificate", isCertificate);
			
			/*if(student.getPreviousStudentId() != null && !"".equals(student.getPreviousStudentId()) && !"Jul2009".equals(student.getPrgmStructApplicable())  && student.getIsLateral().equalsIgnoreCase("Y")){
				student.setWaivedOffSubjects(postService.getPassSubjectsNamesForAStudent(student.getPreviousStudentId()));
				request.getSession().setAttribute("studentLtidemo", student);
			}*/
			
			person.setFirstName(student.getFirstName());
			person.setLastName(student.getLastName());
			person.setProgram(student.getProgram());
			person.setEmail(student.getEmailId());
			person.setContactNo(student.getMobile());
			
		}
		if(!userId.startsWith("77") && !userId.startsWith("79")){
			//person = postDao.findPerson(userId);

			String userRoles =  postService.getUserRole(userId);
			
			List<String> userRoleList = Arrays.asList(userRoles.split(","));
			request.getSession().setAttribute("userRoles", userRoleList);
			
			person.setUserId(userId);
			request.getSession().setAttribute("userLtidemo", person);
			
			
		} else {
			FacultyLtidemoBean faculty=  postService.getFacultyData(userId);
			request.getSession().setAttribute("facultyLtidemo", faculty);
			
			String userRoles =  postService.getUserRole(userId);
			
			List<String> userRoleList = Arrays.asList(userRoles.split(","));
			request.getSession().setAttribute("userRoles", userRoleList);
			
		}
		
		request.getSession().setAttribute("userLtidemo", person);
		System.out.println("LTIDEMO APP: User logged in "+person.getUserId());
		return null;
		 
	}
	
	@RequestMapping(value = "/logoutforSSO", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String logoutforSSO(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		return null;
	}

	private HashMap<String, BigDecimal> generateExamOrderMap(List<ExamOrderBean> liveFlagList) {
		HashMap<String, BigDecimal> orderMap = new HashMap<String, BigDecimal>();
		for (ExamOrderBean row : liveFlagList) {
			orderMap.put(row.getMonth()+row.getYear(),BigDecimal.valueOf((long)Double.parseDouble( row.getOrder())));
			orderMap.put(row.getAcadMonth()+row.getYear(),BigDecimal.valueOf((long)Double.parseDouble( row.getOrder())));
		}
		return orderMap;
	}
	
	public boolean isStudentOfCertificate(String program){
		if(program.startsWith("C")){
			return true;
		}else{
			return false;
		}
	}
}
