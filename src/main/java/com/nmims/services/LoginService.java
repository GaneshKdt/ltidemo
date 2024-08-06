package com.nmims.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class LoginService {

	public boolean checkSession(HttpServletRequest request, HttpServletResponse respnse){
		String userId = (String)request.getSession().getAttribute("userId");
		if(userId != null){
			return true;
		}else{
			setError(request,"Session Expired, Please login again.");
			return false;
		}
	}
	
	public void setSuccess(HttpServletRequest request, String successMessage){
		request.setAttribute("success","true");
		request.setAttribute("successMessage",successMessage);
	}
	
	public void setError(HttpServletRequest request, String errorMessage){
		request.setAttribute("error", "true");
		request.setAttribute("errorMessage", errorMessage);
	}
}
