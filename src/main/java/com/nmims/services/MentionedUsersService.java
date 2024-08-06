package com.nmims.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.MentionedUsersBean;
import com.nmims.bean.Post;
import com.nmims.dao.MentionedUsersDAO;
import com.nmims.dao.PostDao;

@Service("MentionedUsers")
public class MentionedUsersService {

	@Autowired
	MentionedUsersDAO mentionedUsersDao;
	
	@Transactional
	public void addMentionedUsers(MentionedUsersBean mu) {
		mentionedUsersDao.addMentionedUsers(mu);
	}
}
