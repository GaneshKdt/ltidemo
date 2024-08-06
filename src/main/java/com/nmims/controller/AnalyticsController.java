package com.nmims.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nmims.bean.UserPageVisit;
import com.nmims.bean.UserPageVisit2;
import com.nmims.dao.AnalyticsDAO;
import com.nmims.bean.AuditTrailLtidemoBean;
import com.nmims.bean.DownloadLogsBean;
import com.nmims.bean.LostFocusLogBean;
import com.nmims.bean.NetworkLogsBean;
import com.nmims.bean.PageVisitBean;
import com.nmims.bean.TestAuditNetworkLogBean;
import com.nmims.bean.TestAuditTrailsApiResponseBean;
import com.nmims.services.PostService;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class AnalyticsController {

	@Autowired
	AnalyticsDAO analyticsDAO;

	@Autowired
	PostService postService;

	@RequestMapping(value = "/registerUpdate", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<HashMap<String, String>> registerUpdate(@RequestBody UserPageVisit pageVisit,HttpServletRequest request) {
		if(pageVisit.getUserPageVisit() != null) {
			UserPageVisit2 pageVisit2 = pageVisit.getUserPageVisit();
			pageVisit.setClient(pageVisit2.getClient());
			pageVisit.setInitialTimeStamp(pageVisit2.getInitialTimeStamp());
			pageVisit.setIpAddress(pageVisit2.getIpAddress());;
			pageVisit.setPage(pageVisit2.getPage());
			pageVisit.setSapid(pageVisit2.getSapid());;
			pageVisit.setTimeSpent(pageVisit2.getTimeSpent());
			pageVisit.setType(pageVisit2.getType());
			pageVisit.setUserPageVisit(null);
		}
		
		HashMap<String, String> response = new HashMap<String, String>();
		pageVisit.setIpAddress(request.getRemoteAddr());
		try {
			analyticsDAO.savePageVisit(pageVisit);
			response.put("status", "success");
//			System.out.println("Page Visit : SUCCESS"
//				+ " | Sapid " + pageVisit.getSapid() + " | Page : " + pageVisit.getPage() 
//				+ " | Page Id " + pageVisit.getPageId()
//			);
		}catch (Exception e) {
			response.put("status", "fail");
			e.printStackTrace();
			response.put("message", e.getMessage());
//			System.out.println("Page Visit : FAILURE "
//				+ " | Sapid " + pageVisit.getSapid() + " | Page : " + pageVisit.getPage()
//				+ " | Page Id " + pageVisit.getPageId() + " | Error : " + e.getMessage()
//			);
		}
		
		return ResponseEntity.ok(response);
	}
	
	@RequestMapping(value = "/saveNetworkLogs", method = { RequestMethod.POST })
	public ResponseEntity<HashMap<String, String>> saveNetworkLogs(@RequestBody NetworkLogsBean networkLogsBean,HttpServletRequest request) {
		double duration = Double.parseDouble(networkLogsBean.getResponse_time()) - Double.parseDouble(networkLogsBean.getResquest_time());
		networkLogsBean.setDuration("" + duration);
		HashMap<String, String> response = new HashMap<String, String>();

		try {
			analyticsDAO.saveNetWorkLogs(networkLogsBean);
			response.put("status", "success");
//			System.out.println("Network Logger : SUCCESS "
//				+ " | Sapid " + networkLogsBean.getSapid() + " | API : " + networkLogsBean.getApi() 
//				+ " | API Id " + networkLogsBean.getApi_id()
//			);
		}catch (Exception e) {
			response.put("status", "fail");
			response.put("errorMessage", "Error : " + e.getMessage());

//			System.out.println("Network Logger : FAILURE "
//				+ " | Sapid " + networkLogsBean.getSapid() 
//				+ " | API : " + networkLogsBean.getApi()
//				+ " | API Id " + networkLogsBean.getApi_id()
//				+ " | Error : " + e.getMessage()
//			);
		}
		return ResponseEntity.ok(response);
	}
	
	@RequestMapping(value = "/saveDownloadLogs", method = { RequestMethod.POST })
	public ResponseEntity<HashMap<String, String>> saveDownloadLogs(@RequestBody DownloadLogsBean downloadLogsBean,HttpServletRequest request) {
		HashMap<String, String> response = new HashMap<String, String>();
		try {

			analyticsDAO.createDownloadLog(downloadLogsBean);
//			System.out.println("Download Logger : SUCCESS "
//					+ " | Track Id " + downloadLogsBean.getTrack_id()
//					+ " | Sapid " + downloadLogsBean.getSapid() 
//					+ " | Download URL : " + downloadLogsBean.getDownload_url()
//					+ " | Subject Name : " + downloadLogsBean.getSubject_name()
//					+ " | Type : " + downloadLogsBean.getType()
//					+ " | Message : " + downloadLogsBean.getMessage()
//					+ " | Status : " + downloadLogsBean.getStatus()
//				);
			response.put("status", "success");
		}catch(Exception e) {
//			System.out.println("Download Logger : FAILURE "
//				+ " | Track Id " + downloadLogsBean.getTrack_id()
//				+ " | Sapid " + downloadLogsBean.getSapid() 
//				+ " | Download URL : " + downloadLogsBean.getDownload_url()
//				+ " | Subject Name : " + downloadLogsBean.getSubject_name()
//				+ " | Type : " + downloadLogsBean.getType()
//				+ " | Message : " + downloadLogsBean.getMessage()
//				+ " | Status : " + downloadLogsBean.getStatus()
//				+ " | Error : " + e.getMessage()
//			);
		}
		return ResponseEntity.ok(response);
	}

	//TestAuditTrailsApiResponseBean start
	
	@RequestMapping(value = "/api/getTestAuditTrails", method = { RequestMethod.POST }, consumes = "application/json", produces = "application/json")
	public  ResponseEntity<TestAuditTrailsApiResponseBean> getTestAuditTrails(@RequestBody AuditTrailLtidemoBean bean) {

		TestAuditTrailsApiResponseBean response = new TestAuditTrailsApiResponseBean();
		LostFocusLogBean lostFocusLogBean = new LostFocusLogBean();
		lostFocusLogBean.setSapid(bean.getSapid());
		lostFocusLogBean.setTestId(Long.toString( bean.getTestId()));
		List<TestAuditNetworkLogBean> networkLogs = new ArrayList<>();
		List<PageVisitBean> pageVisits = new ArrayList<>();
		List<LostFocusLogBean> lostFocusLog = new ArrayList<>();
		
		try {
			networkLogs = analyticsDAO.getNetworkLogsBySapidCreatedDate( bean.getSapid(), bean.getStartDate(), Integer.toString(bean.getDuration()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			pageVisits = analyticsDAO.getPageVisits( bean.getSapid(), bean.getStartDate(), Integer.toString(bean.getDuration()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			lostFocusLog = analyticsDAO.getStudentLostFocusDetails(lostFocusLogBean);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setLostFocusLog(lostFocusLog);
		response.setNetworkLogs(networkLogs);
		response.setPageVisits(pageVisits);
		
		return ResponseEntity.ok(response);
	}

	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@RequestMapping(value = "/api/getTestLostFocusDetails", method = { RequestMethod.POST }, consumes = "application/json", produces = "application/json")
	public  ResponseEntity<ArrayList<LostFocusLogBean>> getTestLostFocusDetails(@RequestBody LostFocusLogBean bean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		ArrayList<LostFocusLogBean> response = new ArrayList<>(); 

		try {
			response = analyticsDAO.getLostFocusDetails(bean);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(response,headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/api/getRecentTestLostFocusDetails", method = { RequestMethod.POST }, consumes = "application/json", produces = "application/json")
	public  ResponseEntity<HashMap<String, ArrayList<LostFocusLogBean>>> getRecentTestLostFocusDetails(HttpServletRequest request, @RequestBody List<LostFocusLogBean> testList) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		HashMap<String, ArrayList<LostFocusLogBean>> testLostFocusDetails = new HashMap<String, ArrayList<LostFocusLogBean>>();

		for(LostFocusLogBean bean : testList) {
			try {
				testLostFocusDetails.put(bean.getTestId(), analyticsDAO.getLostFocusDetails(bean));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(testLostFocusDetails,headers, HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	@RequestMapping(value = "/m/getStudentLostFocusDetails", method = { RequestMethod.POST }, consumes = "application/json", produces = "application/json")
	public  ResponseEntity<ArrayList<LostFocusLogBean>> getStudentLostFocusDetails(@RequestBody LostFocusLogBean bean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		ArrayList<LostFocusLogBean> response = new ArrayList<>(); 
		
		try {
			response = analyticsDAO.getStudentLostFocusDetails(bean);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(response,headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/m/getLostFocusDetailsForBatchJob", method = { RequestMethod.POST }, consumes = "application/json", produces = "application/json")
	public  ResponseEntity<ArrayList<LostFocusLogBean>> getLostFocusDetailsForBatchJob(HttpServletRequest request, @RequestBody LostFocusLogBean bean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		ArrayList<LostFocusLogBean> testLostFocusDetails = new  ArrayList<LostFocusLogBean>();

		try {
			testLostFocusDetails = analyticsDAO.getLostFocusDetailsForBatchJob(bean);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(testLostFocusDetails,headers, HttpStatus.OK);
	}
	

	@RequestMapping(value = "/m/getIndividualStudentLostFocusLogs", method = { RequestMethod.POST }, 
			consumes = "application/json", produces = "application/json")
	public  ResponseEntity<ArrayList<LostFocusLogBean>> getIndividualStudentLostFocusLogs( @RequestBody AuditTrailLtidemoBean bean ) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		ArrayList<LostFocusLogBean> testLostFocusDetails = new  ArrayList<LostFocusLogBean>();

		try {
			testLostFocusDetails = analyticsDAO.getIndividualStudentLostFocusLogs(bean);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(testLostFocusDetails,headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/m/getNetworkLogsForBatchJob", method = { RequestMethod.POST }, 
			consumes = "application/json", produces = "application/json")
	public  ResponseEntity<List<TestAuditNetworkLogBean>> getNetworkLogsForBatchJob( @RequestBody AuditTrailLtidemoBean bean ) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		List<TestAuditNetworkLogBean> testLostFocusDetails = new  ArrayList<TestAuditNetworkLogBean>();

		try {
			testLostFocusDetails =  analyticsDAO.getNetworkLogsBySapidCreatedDate(bean.getSapid(), bean.getStartDate(), 
					Integer.toString(bean.getDuration()) );
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(testLostFocusDetails,headers, HttpStatus.OK);
	}
	
	//TestAuditTrailsApiResponseBean end

}
