package com.nmims.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmims.bean.HarvardBean;
import com.nmims.bean.StudentSubjectConfig;

@SuppressWarnings("deprecation")

@Repository
public class ResourceDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<StudentSubjectConfig> getSubjectsByTimeboundId(List<Integer> timeboundIds) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select sc  FROM StudentSubjectConfig sc   WHERE sc.id IN :ids")
		.setParameterList("ids", timeboundIds);        
		List<StudentSubjectConfig> subjects  = query.list();
		
		return subjects;   
	} 

	public List<HarvardBean> getHarvardModulesBySapid(String sapid){
		
		Session session = this.sessionFactory.getCurrentSession();
		List<HarvardBean> moduleList = new ArrayList<HarvardBean>();
		String sql =" SELECT " + 
					"    * " + 
					" FROM " + 
					"    lti.harvard_modules_dates " + 
					" WHERE " + 
					"    CONCAT(month, '-', year) = (SELECT " + 
					"            CONCAT(enrollmentMonth, '-', enrollmentYear) " + 
					"        FROM " + 
					"            exam.students " + 
					"        WHERE " + 
					"            sapid =:sapid ) ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("sapid", sapid);
		query.addEntity(HarvardBean.class);
			moduleList = query.list();
		return moduleList;
		
	}
}
