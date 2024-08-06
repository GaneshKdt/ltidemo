package com.nmims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmims.bean.Post;

import com.nmims.bean.UsersLtidemoBean;
@Transactional
@Repository
public class UserDao  {
	private DataSource dataSource;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public UsersLtidemoBean retrieveUser(String username) {
		UsersLtidemoBean user =null;
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria cr = session.createCriteria(UsersLtidemoBean.class);
		cr.add(Restrictions.eq("username", username));
		List results = cr.list();
	
         user = (UsersLtidemoBean) results.get(0);

		return user;
		
		
	}

}
