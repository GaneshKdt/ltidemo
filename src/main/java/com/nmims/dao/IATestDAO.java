package com.nmims.dao;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.LostFocusLogBean;

	@Transactional
	@Repository
	public class IATestDAO {

		@Autowired   
		private SessionFactory sessionFactory;

		@SuppressWarnings("deprecation")
		public boolean saveLostFocusLogs(LostFocusLogBean bean) {
			try {
				String sql = ""
						+ "INSERT INTO "
						+ "`lti`.`test_lostfocuslogs` "
						+ "( "
							+ "`sapid`, `testId`, "
							+ "`initialTimeStamp`, `timeAway`, "
							+ "`ipAddress`, `createdBy`, `createdDate`, `lastModifiedBy`, `lastModifiedDate` "
						+ ") "
						+ "VALUES "
						+ "( "
							+ ":sapid, :testId, "
							+ ":initialTimeStamp, :timeAway, "
							+ ":ipAddress, :sapid, sysdate(), :sapid, sysdate() "
						+ ") "
						+ "ON DUPLICATE KEY "
							+ "UPDATE "
								+ "`timeAway` = :timeAway, `lastModifiedDate` = sysdate()  ";
				Session session = sessionFactory.getCurrentSession();
				SQLQuery upsertQuery = session
						.createSQLQuery(sql);
				upsertQuery.setParameter("sapid", bean.getSapid());
				upsertQuery.setParameter("testId", bean.getTestId());
				
				upsertQuery.setParameter("initialTimeStamp", bean.getInitialTimeStamp());
				upsertQuery.setParameter("timeAway", bean.getTimeAway());
				
				upsertQuery.setParameter("ipAddress", bean.getIpAddress());
				
				upsertQuery.executeUpdate();

				return true;
			}catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
}
