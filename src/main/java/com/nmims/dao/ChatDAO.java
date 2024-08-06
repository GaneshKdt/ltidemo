package com.nmims.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.ChatBean;
import com.nmims.bean.DashboardBean;
import com.nmims.bean.StarMessageBean;

@Transactional
@Repository
public class ChatDAO {
	
	@Autowired   
	private SessionFactory sessionFactory;


	@SuppressWarnings({ "unchecked", "deprecation" })
	public ArrayList<ChatBean> getCourseCoordinators() {
		Session session = sessionFactory.getCurrentSession();

		ArrayList<ChatBean> courseCoordinatorList  = new ArrayList<ChatBean>(); 
		
		String sql = "SELECT  " + 
				"    userId " + 
				"FROM " + 
				"    lti.timebound_user_mapping " + 
				"WHERE " + 
				"    role = 'Course Coordinator' " + 
				"GROUP BY userId;";

			try {
				
				@SuppressWarnings("rawtypes")
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.aliasToBean(ChatBean.class));
				courseCoordinatorList = (ArrayList<ChatBean>)query.list();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return courseCoordinatorList;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public ArrayList<ChatBean> getCourseCoordinatorSubjectSem() {
		Session session = sessionFactory.getCurrentSession();

		ArrayList<ChatBean> courseCoordinatorList  = new ArrayList<ChatBean>(); 
		
		String sql = "SELECT " + 
				"    tum.userId, " + 
				"    pss.subject, " + 
				"    pss.sem, " + 
				"    st.specializationType, " + 
				"    ag.chat_group_name AS groupName " + 
				"FROM " + 
				"    exam.program_sem_subject pss " + 
				"        LEFT JOIN " + 
				"    lti.student_subject_config ssc ON ssc.prgm_sem_subj_id = pss.id " + 
				"        INNER JOIN " + 
				"    lti.timebound_user_mapping tum ON tum.timebound_subject_config_id = ssc.id " + 
				"        LEFT JOIN " + 
				"    exam.specialization_type st ON pss.specializationType = st.id " + 
				"        INNER JOIN " + 
				"    lti.subject_groups sg on tum.id=sg.timebound_user_mapping_id " + 
				"		inner join  " + 
				"	lti.applozic_groups ag on sg.applozic_group_id=ag.id " + 
				"WHERE " + 
				"    tum.role = 'Course Coordinator' " + 
				"        AND SYSDATE() BETWEEN ssc.startDate AND ssc.endDate";

			try {
				
				@SuppressWarnings("rawtypes")
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.aliasToBean(ChatBean.class));
				courseCoordinatorList = (ArrayList<ChatBean>)query.list();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return courseCoordinatorList;
	}

	public ArrayList<DashboardBean> getConsumerTypeList(){
		
		ArrayList<DashboardBean> mappingBean = new ArrayList<>();
		String sql =  "SELECT id,name FROM exam.consumer_type";
		
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Transformers.aliasToBean(DashboardBean.class));
		mappingBean = (ArrayList<DashboardBean>)query.list();
		
		return mappingBean;  
		
	}

	public List<DashboardBean> getStudentBatchMapping(String subjectId, String batchId, String isResit){
		
		List<DashboardBean> mappingBean = new ArrayList<>();
		
		String sql =" SELECT " +
				"    userId, " +
				"    b.name, " +
				"    pss.subject, " +
				"    CONCAT(firstName, ' ', lastname) AS studentName, " +
				"    emailId, " +
				"    imageUrl, " +
				"    mobile " +
				"FROM " +
				"    lti.timebound_user_mapping AS tum " +
				"        INNER JOIN " +
				"    exam.students AS s ON s.sapid = tum.userId " +
				"        INNER JOIN " +
				"    lti.student_subject_config AS ssc ON tum.timebound_subject_config_id = ssc.id " +
				"        INNER JOIN " +
				"    exam.batch AS b ON ssc.batchId = b.id " +
				"        INNER JOIN " +
				"    exam.program_sem_subject pss ON pss.id = ssc.prgm_sem_subj_id " +
				"WHERE " +
				"    pss.id =:subjectId  AND b.id =:batchId " +
				"        AND tum.role IN ('Student' ";
		
		if (isResit!=null && isResit.equals("Yes")) {
			sql += " , 'Resit')";
		} else {
			sql += ")";
		}
		
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("subjectId",subjectId);
		query.setParameter("batchId", batchId);
		query.setResultTransformer(Transformers.aliasToBean(DashboardBean.class));
		mappingBean = (List<DashboardBean>) query.list();
		
		return mappingBean;
		
	}

	public void starDao(StarMessageBean strbean) throws Exception{

		String sqlQuery = " INSERT INTO `lti`.`star_message` ( "
				+ "`messageId`, `sapid` , "
				+ "`message`, `userId` , "
				+ "`isGroup`, `date` ,"
				+ "`name`"
				+ ")"
				+ "VALUES" 
				+ "(" 
				+ ":messageId, :sapid, "
				+ ":message, :userId, "
				+ ":isGroup, :date, " 
				+":name"
				+ ")";
		
		Session session = sessionFactory.getCurrentSession();
		SQLQuery upsertQuery = session.createSQLQuery(sqlQuery);
		
		upsertQuery.setParameter("messageId", strbean.getMessageId());
		upsertQuery.setParameter("sapid", strbean.getSapId());
		upsertQuery.setParameter("message", strbean.getMessage());
		upsertQuery.setParameter("userId", strbean.getUserId());
		upsertQuery.setParameter("isGroup", strbean.getIsGroup());
		upsertQuery.setParameter("date", strbean.getDate());
		upsertQuery.setParameter("name", strbean.getName());
		
		upsertQuery.executeUpdate();

	}

		public List<StarMessageBean> displayData(String sapid) throws Exception
		
		{
			List<StarMessageBean> list = new ArrayList<>();
			
				String sql =  "select message, date, messageId from lti.star_message where sapid = :sapid";
		
			Session session = sessionFactory.getCurrentSession();	
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("sapid", message);
			//query.setParameter("date", date);
			query.setParameter("sapid", sapid);
			query.setResultTransformer(Transformers.aliasToBean(StarMessageBean.class));
			list= (List<StarMessageBean>) query.list();
			//ArrayList<String> messageList = (ArrayList<String>)query.list();
		
			return list ;
		}
	
		

		public boolean deleteStarMessage(String messageId) throws Exception {

			
				String sql ="DELETE FROM lti.star_message WHERE messageId =:messageId";
				Session session = sessionFactory.getCurrentSession();
				SQLQuery upsertQuery = session.createSQLQuery(sql);
				upsertQuery.setParameter("messageId",messageId);
				upsertQuery.executeUpdate();
		
				return true ;
			
		}

}

