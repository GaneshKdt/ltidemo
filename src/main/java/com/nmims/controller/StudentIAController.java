package com.nmims.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nmims.bean.LostFocusLogBean;
import com.nmims.dao.IATestDAO;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class StudentIAController {

	@Autowired
	IATestDAO iATestDAO;
	
	@RequestMapping(value = "/api/saveIATestLostFocusLogs", method = { RequestMethod.POST})
	public ResponseEntity<HashMap<String, String>> saveIATestLostFocusLogs(@RequestBody LostFocusLogBean bean,HttpServletRequest request) {
		
		HashMap<String, String> response = new HashMap<String, String>();
		try {
			bean.setIpAddress(request.getRemoteAddr());
			if(iATestDAO.saveLostFocusLogs(bean)) {
				response.put("status", "success");
			}else {
				response.put("status", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ResponseEntity.ok(response);
	}
}
