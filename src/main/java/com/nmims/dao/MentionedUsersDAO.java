package com.nmims.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmims.bean.MentionedUsersBean;

@Repository
public class MentionedUsersDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	public void addMentionedUsers(MentionedUsersBean mu){
		Session session = this.sessionFactory.getCurrentSession();
		session.save(mu);
	}

}
