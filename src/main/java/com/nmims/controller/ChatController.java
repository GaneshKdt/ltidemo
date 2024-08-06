package com.nmims.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.ChatUserBean;
import com.nmims.bean.StarMessageBean;
import com.nmims.dao.ChatDAO;
import com.nmims.services.LoginService;
import com.nmims.services.PostService;


@Controller
@CrossOrigin(origins="*", allowedHeaders="*")
public class ChatController {

	@Autowired
	PostService postService;

	@Autowired
	LoginService logService;

	@Autowired
	ChatDAO chatDAO;
	
	@RequestMapping(value = "/getContactsForChat", method = RequestMethod.POST)
	public ResponseEntity<List<ChatUserBean>> getContactsForChat(HttpServletRequest request, @RequestBody JSONObject inputJsonObj) { 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		String sapid = (String) inputJsonObj.get("sapId");

		List<ChatUserBean> chatUserList = postService.getContactsForChatBasedOnBatch(sapid);
		ChatUserBean courseCoordinator = new ChatUserBean();

		if(chatUserList == null) {
			chatUserList = new ArrayList<ChatUserBean>();
		}

		return new ResponseEntity<List<ChatUserBean>>(chatUserList, headers, HttpStatus.OK);
	}


	@RequestMapping(value="/fullViewChat")
	public ModelAndView FullView( @RequestParam(required = false) String userId, HttpServletRequest request, HttpServletResponse response ){

		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}

		ModelAndView modelAndView = new ModelAndView("fullView");
		Boolean loadPrivateChat = Boolean.FALSE;

		if( !StringUtils.isBlank(userId) )
			loadPrivateChat = Boolean.TRUE;

		modelAndView.addObject( "loadPrivateChat", loadPrivateChat );
		modelAndView.addObject( "loadPrivateChatWith", userId );

		return modelAndView ;

	}
	
	@RequestMapping(value = "/starMessage", method = RequestMethod.POST)
	public ResponseEntity<String> Star(@RequestBody StarMessageBean strbean) { 

		try {
			
			chatDAO.starDao(strbean);
			return new ResponseEntity<String>("Message Star Successful.",HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return new ResponseEntity<String>("Message is already Star!",HttpStatus.OK);
			
		}

	}

	@RequestMapping(value = "/displayMessage", method = {RequestMethod.POST, RequestMethod.GET}, 
			consumes = "application/json", produces = "application/json")
	public ResponseEntity<List<StarMessageBean>> DisplayMessage(@RequestBody StarMessageBean strbean) {



		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		List<StarMessageBean> userList = new ArrayList<>();
		try {
		userList = chatDAO.displayData(strbean.getSapId());
		}
		catch(Exception e)
		{ 
			e.printStackTrace();
			
		}
		return new ResponseEntity<List<StarMessageBean>>(userList, headers, HttpStatus.OK);

	}

	@RequestMapping(value = "/unstarMessage", method = {RequestMethod.POST}, 
			consumes = "application/json", produces = "application/json")
	public ResponseEntity<StarMessageBean> UnstarMessage(@RequestBody StarMessageBean messageBean) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		try{
		boolean status = chatDAO.deleteStarMessage(messageBean.getMessageId());
		messageBean.setStatus( status );
		return new ResponseEntity<>(messageBean, headers, HttpStatus.OK);
		}catch(Exception e)
		{ 
			e.printStackTrace();
			return new ResponseEntity<>(messageBean, headers, HttpStatus.OK); 

		}
	
	}

}