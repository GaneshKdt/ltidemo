package com.nmims.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@SuppressWarnings("deprecation")

@Transactional
@Repository
public class ContactUsDao {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	 
	
	public String getCurrentCourseCoordinator(String timeboundId){
		
		Session session = this.sessionFactory.getCurrentSession(); 
		String coordinatorName = "";
		
		String sql ="select userId from lti.timebound_user_mapping where timebound_subject_config_id =:timeboundId "
				+ "and role = 'course coordinator'";
		try{
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("timeboundId", timeboundId);
			coordinatorName = (String) query.uniqueResult();
		}catch(Exception e){
			e.printStackTrace();
		}		
		return coordinatorName;
	}

}
