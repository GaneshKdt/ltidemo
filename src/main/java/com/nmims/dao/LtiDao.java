package com.nmims.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.hibernate.type.LongType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmims.bean.LTIConsumerRequestBean;


@SuppressWarnings("deprecation")

@Repository


public class LtiDao {
	@Autowired   
	private SessionFactory sessionFactory;
	
	final String providerList = "'Pearson','Capsim','Stukent','Wiley','Harvard' ";
	
	final String providerNot =  "3";

	public List getLtiResources(String userId){
		Session session = this.sessionFactory.getCurrentSession();

		List lti_resources = null;
		String sql =" SELECT " +  
			    	" 	lr.*, lp.name as provider_name " +
			    	" FROM " +
			        " 	lti.lti_user_resourse_mapping urm " +
			        "		INNER JOIN " +
			        " 	lti.lti_users u ON urm.userId = u.id " + 
			        "		INNER JOIN " +
			        " 	lti.lti_resources lr ON urm.resourceId = lr.id " +
			        "		INNER JOIN " +
			        "	lti.lti_providers lp ON lp.id = lr.providerId " +
		        	" WHERE " +
			        "	u.userId = :userId " + 
		        	"	AND lp.name in ("+providerList+") AND providerId not in ("+providerNot+") order by urm.id DESC " ; 
		try {   
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userId", userId);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
//			query.setResultTransformer(Transformers.aliasToBean(LTIConsumerRequestBean.class));
			lti_resources = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lti_resources;
	}
	

	public Map<String, Object> getPearsonAccessStudent(String sapid){
		Session session = this.sessionFactory.getCurrentSession();

		Map<String, Object> result = new HashMap<String, Object>();
		
		List<LTIConsumerRequestBean> lti_resources = new ArrayList<LTIConsumerRequestBean>();
		String sql = ""
				+ "SELECT "
					+ "* "
				+ "FROM "
					+ "lti.pearson_students "
				+ "WHERE "
					+ "sapid = :sapid"; 
		
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("sapid", sapid);
		List<Object[]> results = query.list();
		if(results.size() > 0) {
			Object[] queryResult = results.get(0);
			result.put("username", (queryResult[1]).toString());
			result.put("password", (queryResult[2]).toString());
			
			if("1".equals(queryResult[3].toString())) {
				result.put("studentHasAccess", true);
			}else {
				result.put("studentHasAccess", false);
			}
		}else {
			result.put("studentHasAccess", false);
		}
		return result;
	}

	
	public LTIConsumerRequestBean getLtiLink(String user_id, String resource_id) {
		Session session = this.sessionFactory.getCurrentSession();

		LTIConsumerRequestBean ltiConsumerRequestBean = new LTIConsumerRequestBean(); 
		
		String sql = "SELECT " +  
	    "users.userId AS user_id, " +
	    "users.lisPersonNameFull AS lis_person_name_full, " +
	    "users.lisPersonNameGiven AS lis_person_name_given, " +
	    "users.lisPersonNameFamily AS lis_person_name_family, " +
	    "users.lisPersonSourcedId AS lis_person_sourced_id, " +
	    "users.lisPersonContactEmailPrimary AS lis_person_contact_email_primary, " +
	    "users.roles, " + 
	    "users.userImage AS user_image, " +
	    "urm.accessCode AS access_token, " +
	    "lr.contextId AS context_id, " +
	    "lr.contextLabel AS context_label, " +
	    "lr.contextTitle AS context_title, " +
	    "lr.contextType AS context_type, " +
	    "lr.resource_link_description, " +
	    "lr.resource_link_id, " +
	    "lr.resource_link_title, " +
	    "lr.custom_parameters, " +
	    "lp.name AS provider_name, " +
	    "lp.launchUrl AS launch_url, " +
	    "lp.oauthConsumerKey AS consumer_key, " + 
	    "lp.sharedSecret AS secret, " +
	    "lc.tool_consumer_info_product_family_code, " +
	    "lc.tool_consumer_info_version, " +
	    "lc.tool_consumer_instance_contact_email, " +
	    "lc.tool_consumer_instance_description, " +
	    "lc.tool_consumer_instance_guid, " +
	    "lc.tool_consumer_instance_name, " +
	    "lc.tool_consumer_instance_url, " +
	    "lm.ltiMessageType AS lti_message_type, " +
	    "lm.ltiVersion AS lti_version " +
	"FROM " + 
	    "lti.lti_users users " + 
	        "INNER JOIN " +
	    "lti.lti_user_resourse_mapping urm ON users.id = urm.userId " +
	        "INNER JOIN " +
	    "lti.lti_resources lr ON urm.resourceId = lr.id " + 
	        "INNER JOIN " + 
	    "lti.lti_providers lp ON lr.providerId = lp.id " +
	        "INNER JOIN " +
	    "lti.lti_consumers lc ON lr.consumerId = lc.id " +
	        "INNER JOIN " +
	    "lti.lti_message lm ON lr.ltiMessageId = lm.id " +
	"WHERE " +
	    "urm.resourceId = '" + resource_id + "' " +
	        "AND users.userId = '" + user_id  + "' ; ";

			try {
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.aliasToBean(LTIConsumerRequestBean.class));
				List<LTIConsumerRequestBean> ltilist= (List<LTIConsumerRequestBean>)query.list();
				ltiConsumerRequestBean = ltilist.get(0);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return ltiConsumerRequestBean;
	}

}
