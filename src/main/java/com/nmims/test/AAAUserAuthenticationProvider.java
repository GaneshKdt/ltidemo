///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template fileName, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.nmims.test;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.GrantedAuthority;
//
//import ltidemo.dao.UserDao;
//import ltidemo.bean.Users;
//
//
///**
// *
// * @author hcadavid
// */
//public class AAAUserAuthenticationProvider implements AuthenticationProvider {
//
//	@Autowired
//	private UserDao service;
//
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//		String user = authentication.getPrincipal().toString();
//		String pwd = authentication.getCredentials().toString();
//
//		// PUT Auth Bean here
//
//		Users user1 = service.retrieveUser("user1");
//		// System.out.println("-----" +user1.getUsername()
//		// +"-----"+user1.getPassword());
////		 System.out.println("user is "+user1);
//		boolean result = user.equals(user1.getUsername()) && pwd.equals(user1.getPassword());
//		// = aaaProxy.isValidUser(authentication.getPrincipal()
//		// .toString(), authentication.getCredentials().toString());
//		// System.out.println("result is: "+result);
//		if (result) {
//
//			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
//			AAAUserAuthenticationToken auth = new AAAUserAuthenticationToken(authentication.getPrincipal(),
//					authentication.getCredentials(), grantedAuthorities);
//			// System.out.println(auth);
//			return auth;
//		} else {
//			throw new BadCredentialsException("Bad User Credentials.");
//		}
//
//	}
//
//	public boolean supports(Class<?> type) {
//		return true;
//	}
//
//}
