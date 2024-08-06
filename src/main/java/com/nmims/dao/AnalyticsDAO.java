package com.nmims.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.APIListBean;
import com.nmims.bean.AuditTrailLtidemoBean;
import com.nmims.bean.DownloadLogsBean;
import com.nmims.bean.LTIConsumerRequestBean;
import com.nmims.bean.LostFocusLogBean;
import com.nmims.bean.NetworkLogsBean;
import com.nmims.bean.PageVisitBean;
import com.nmims.bean.Pages;
import com.nmims.bean.TestAuditNetworkLogBean;
import com.nmims.bean.UserPageVisit;


@Transactional
@Repository
public class AnalyticsDAO {

	Map<Integer, String> pageIds;
	
	@Autowired   
	private SessionFactory sessionFactory;
	
	public void savePageVisit(UserPageVisit pageVisit) {
			
		if(pageVisit.getType() == null) {
			pageVisit.setType("Mobile");
		}
		int pageId = getPageId(pageVisit.getPage(), pageVisit.getType());
		
		pageVisit.setPageId(pageId);
		
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(pageVisit);
	}
	
	public void saveNetWorkLogs(NetworkLogsBean networkLogsBean) {
		String api = networkLogsBean.getApi();
		String apiName = api.split("\\?")[0];
		int api_id = getNetworkId(apiName);
		networkLogsBean.setApi_id(api_id);

		Session session = sessionFactory.getCurrentSession();
		session.save(networkLogsBean);
	}
	
	public int getPageId(String path, String type) {
		Session session = sessionFactory.getCurrentSession();

		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Pages> cr = cb.createQuery(Pages.class);
		Root<Pages> root = cr.from(Pages.class);

		cr.select(root).where(cb.equal(root.get("path"), path));

		Query<Pages> query = session.createQuery(cr);

		List<Pages> pages = query.getResultList();

		if(pages.size() == 0) {
			return addNewPage(type, path);
		} else {
			return pages.get(0).getId();
		}
	}
	
	
	public void createDownloadLog(DownloadLogsBean downloadLogsBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(downloadLogsBean);
		return;
	}

	public int addNewPage(String type, String path) {
		Pages page = new Pages();
		page.setPath(path);
		page.setUrl(path);
		page.setType(type);

		Session session = sessionFactory.getCurrentSession();
		session.save(page);
		
		return page.getId();
	}
	
	public int getNetworkId(String api) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<APIListBean> cr = cb.createQuery(APIListBean.class);
		Root<APIListBean> root = cr.from(APIListBean.class);
		
		cr.select(root).where(cb.equal(root.get("name"), api));
		
		Query<APIListBean> query = session.createQuery(cr);
		
		List<APIListBean> apis = query.getResultList();
		
		if(apis.size() == 0) {
			return createNewApiEntry(api);
		} else {
			return apis.get(0).getId();
		}
	}
	
	public int createNewApiEntry(String name) {
		Session session = sessionFactory.getCurrentSession();
		APIListBean apiListBean  = new APIListBean();
		apiListBean.setName(name);
		session.save(apiListBean);
		return apiListBean.getId();
	}
	
	@SuppressWarnings("deprecation")
	public List<TestAuditNetworkLogBean>  getNetworkLogsBySapidCreatedDate(String sapid, String created_at, String duration) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		
		String sql = "SELECT " + 
				"    nl.sapid, " + 
				"    duration/1000 AS duration, " + 
				"    nl.status, " + 
				"    nl.created_at, " + 
				"    nl.error_message, " + 
				"    al.`name`, " +  
				"    IFNULL(al.`description`, 'NA') as `description`, " + 
				"    nl.networkInfo " +
				"FROM " + 
				"    analytics.network_logs nl, " + 
				"    analytics.api_list al " + 
				"WHERE " + 
				"    nl.api_id = al.id " +  	
				"		 AND nl.created_at  BETWEEN DATE_SUB('"+created_at+"', INTERVAL ( 60 ) MINUTE) " + 
				"        AND DATE_ADD('"+created_at+"', INTERVAL ( 60+"+ duration + " ) MINUTE) "+
				"		 AND sapid = :sapid ";

		
		@SuppressWarnings("unchecked")
		SQLQuery<TestAuditNetworkLogBean> query = session.createSQLQuery(sql);
		query.setParameter("sapid", sapid);
		query.setResultTransformer(Transformers.aliasToBean(TestAuditNetworkLogBean.class));
		
		List<TestAuditNetworkLogBean> networkLog = (List<TestAuditNetworkLogBean>)query.list();
		return networkLog;
	}
	
	@SuppressWarnings("deprecation")
	public List<PageVisitBean> getPageVisits(String sapid, String created_at, String duration) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		String sql = "SELECT " + 
				"    p.path, " + 
				"    IFNULL(p.description, 'NA') as `description`, " + 
				"    pv.deviceName, " + 
				"    pv.deviceOS, " + 
				"    pv.deviceSystemVersion, " + 
				"    pv.ipAddress, " + 
				" 	 pv.applicationType, "+
				"    FROM_UNIXTIME(pv.initialTimeStamp / 1000) AS visiteddate, " + 
				"    FROM_UNIXTIME(pv.timeSpent / 1000) AS timespent " + 
				"FROM " + 
				"    lti.pages p, " + 
				"    lti.page_visits pv " + 
				"WHERE " + 
				"    pv.pageId = p.id " + 
				"        AND FROM_UNIXTIME(pv.initialTimeStamp / 1000)  BETWEEN DATE_SUB('"+created_at+"', INTERVAL ( 60 ) MINUTE) " + 
				"        AND DATE_ADD('"+created_at+"', INTERVAL ( 60+"+ duration + " ) MINUTE) "+
				"        AND sapid = :sapid ";

		@SuppressWarnings("unchecked")
		SQLQuery<PageVisitBean> query = session.createSQLQuery(sql);
		query.setParameter("sapid", sapid);
		query.setResultTransformer(Transformers.aliasToBean(PageVisitBean.class));
		
		List<PageVisitBean> pageVisit = (List<PageVisitBean>)query.list();
	
		return pageVisit;
	}
	
	@SuppressWarnings("deprecation")
	public ArrayList<LostFocusLogBean> getLostFocusDetails(LostFocusLogBean bean) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		String sql = "SELECT  " + 
				"    COUNT(lfl.sapid) AS count, " + 
				"    lfl.sapid, " + 
				"    lfl.testId, " + 
				"    SUM(ROUND(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))))) AS totalTimeAwayInSecs, " + 
				"    lfl.lastModifiedDate, " + 
				"    lfl.createdDate, " + 
				"    lfl.ipAddress " + 
				"FROM " + 
				"    lti.test_lostfocuslogs lfl " + 
				"WHERE " + 
				"    TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))) > 0 "+
				"AND lfl.testId = :testId and lfl.sapid <> 77777777777 " + 
				"GROUP BY lfl.sapid " + 
				"HAVING totalTimeAwayInSecs > 0 " + 
				"ORDER BY totalTimeAwayInSecs ";
				
		@SuppressWarnings("unchecked")
		SQLQuery<LostFocusLogBean> query = session.createSQLQuery(sql);
		query.setParameter("testId", bean.getTestId());
		query.setResultTransformer(Transformers.aliasToBean(LostFocusLogBean.class));
		
		ArrayList<LostFocusLogBean> lostFocusLogs = (ArrayList<LostFocusLogBean>)query.list();

		return lostFocusLogs;
	}
	
	@SuppressWarnings("deprecation")
	public ArrayList<LostFocusLogBean> getStudentLostFocusDetails(LostFocusLogBean bean) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		String sql = "SELECT  " + 
				"    lfl.sapid, " + 
				"    TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))) / 60 AS timeAwayInMins, " + 
				"    ROUND(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate)))) AS timeAwayInSecs, " + 
				"    lfl.lastModifiedDate, " + 
				"    lfl.createdDate, " + 
				"    lfl.ipAddress " + 
				"FROM " + 
				"    lti.test_lostfocuslogs lfl " + 
				"WHERE " + 
				"    lfl.testId = :testId " + 
				"        AND lfl.sapid = :sapid " + 
				"HAVING timeAwayInSecs <> 0 ";
				
		@SuppressWarnings("unchecked")
		SQLQuery<LostFocusLogBean> query = session.createSQLQuery(sql);
		query.setParameter("testId", bean.getTestId());
		query.setParameter("sapid", bean.getSapid());
		query.setResultTransformer(Transformers.aliasToBean(LostFocusLogBean.class));
		
		ArrayList<LostFocusLogBean> lostFocusLogs = (ArrayList<LostFocusLogBean>)query.list();
		return lostFocusLogs;
	}
	
	@SuppressWarnings("deprecation")
	public ArrayList<LostFocusLogBean> getLostFocusDetailsForBatchJob(LostFocusLogBean bean) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		String sql = "SELECT  " + 
				"    COUNT(lfl.sapid) AS count, " + 
				"    lfl.sapid, " + 
				"    lfl.testId, " + 
				"    SUM(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))) / 60) AS totalTimeAwayInMins, " + 
				"    SUM(ROUND(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))))) AS totalTimeAwayInSecs, " + 
				"    lfl.lastModifiedDate, " + 
				"    lfl.createdDate, " + 
				"    lfl.ipAddress " + 
				"FROM " + 
				"    lti.test_lostfocuslogs lfl " + 
				"WHERE " + 
				"    timeAway <> 0 AND lfl.testId = :testId and lfl.sapid <> 77777777777 " + 
				"GROUP BY lfl.sapid " + 
				"HAVING totalTimeAwayInSecs > 30 " + 
				"ORDER BY totalTimeAwayInSecs ";
				
		@SuppressWarnings("unchecked")
		SQLQuery<LostFocusLogBean> query = session.createSQLQuery(sql);
		query.setParameter("testId", bean.getId());
		query.setResultTransformer(Transformers.aliasToBean(LostFocusLogBean.class));
		
		ArrayList<LostFocusLogBean> lostFocusLogs = (ArrayList<LostFocusLogBean>)query.list();

		return lostFocusLogs;
	}

	@SuppressWarnings("deprecation")
	public ArrayList<LostFocusLogBean> getIndividualStudentLostFocusLogs(AuditTrailLtidemoBean bean) throws Exception{
		Session session = sessionFactory.getCurrentSession(); 
		
		String sql = "SELECT  " + 
				"    COUNT(lfl.sapid) AS count, " + 
				"    lfl.sapid, " + 
				"    lfl.testId, " + 
				"    SUM(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))) / 60) AS totalTimeAwayInMins, " + 
				"    SUM(ROUND(TIME_TO_SEC((TIMEDIFF(lfl.lastModifiedDate, lfl.createdDate))))) AS totalTimeAwayInSecs, " + 
				"    lfl.lastModifiedDate, " + 
				"    lfl.createdDate, " + 
				"    lfl.ipAddress " + 
				"FROM " + 
				"    lti.test_lostfocuslogs lfl " + 
				"WHERE " + 
				"    timeAway <> 0 AND lfl.testId = :testId and lfl.sapid = :sapid " + 
				"GROUP BY lfl.sapid " + 
				"HAVING totalTimeAwayInSecs > 30 " + 
				"ORDER BY totalTimeAwayInSecs ";
				
		@SuppressWarnings("unchecked")
		SQLQuery<LostFocusLogBean> query = session.createSQLQuery(sql);
		query.setParameter("testId", bean.getTestId() );
		query.setParameter("sapid", bean.getSapid() );
		query.setResultTransformer(Transformers.aliasToBean(LostFocusLogBean.class));
		
		ArrayList<LostFocusLogBean> lostFocusLogs = (ArrayList<LostFocusLogBean>)query.list();

		return lostFocusLogs;
	}
	
}
