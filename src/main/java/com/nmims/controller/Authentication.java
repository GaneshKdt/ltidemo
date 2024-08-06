package com.nmims.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Authentication {

	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public  String logouttest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		return "login";
	}
	
	@RequestMapping(value="loginFailed", method={RequestMethod.GET, RequestMethod.POST})
	public String loginFailed(ModelMap model) {
		return "login";
	}
	
	
}
