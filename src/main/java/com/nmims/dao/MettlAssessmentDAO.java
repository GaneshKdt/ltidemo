package com.nmims.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.MBAWXStudentAssessmentResult;
import com.nmims.bean.MBAWXStudentExamBooking;
import com.nmims.bean.MettlScheduleBean;
import com.nmims.bean.MettlScheduleTempTableBean;
import com.nmims.bean.MettlStudentSSOBean;
import com.nmims.bean.PGExamBookingBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.TimeboundUserMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Transactional
@Repository
public class MettlAssessmentDAO {

	@Autowired   
	private SessionFactory sessionFactory;
	
	private static final Logger logger = LoggerFactory.getLogger(MettlAssessmentDAO.class);
	
	public MettlStudentSSOBean checkIfStudentCanAttemptTest(String scheduleId, String sapid, String timeboundId,HttpServletRequest servletRequest) {
		MettlStudentSSOBean studentSSOBean = new MettlStudentSSOBean();
		StudentLtidemoBean studentInfo = new StudentLtidemoBean();
		boolean isDataFromTempTable=false;
		// find the schedule for this scheduleId
		Object obj = getScheduleFromTempTable(scheduleId, timeboundId, sapid);
		
		if(obj != null)
		{
			isDataFromTempTable=true;
		}
		else
		{
			obj = getSchedule(scheduleId, timeboundId);
			if(obj == null) {
				// if no schedule found, return an error 
				studentSSOBean.setError("No Assessment Found");
				return studentSSOBean;
			}
		}
		
		studentSSOBean.setSapid(sapid);
		setStudentSSO(studentSSOBean,obj,isDataFromTempTable);
		
		// check if the student is mapped for the timebound id
		TimeboundUserMapping timeboundStudentMapping = getTimeboundMappingForStudent(sapid, timeboundId);

		if(timeboundStudentMapping == null) {
			// if no timebound mapping found, return error
			studentSSOBean.setError("Student not eligible for this subject!");
			return studentSSOBean;
		}
//		System.out.println(timeboundStudentMapping);
		

		// check if the test is 30 marks or 100 marks
		// if 30 marks then check if student has given a 30 marks test
		// if 100 marks then check if student has a booking for this schedule
		
		String maxMarks = isDataFromTempTable?((MettlScheduleTempTableBean)obj).getMax_score():((MettlScheduleBean)obj).getMax_score();
		
		if("100".equals(maxMarks)) {
			MBAWXStudentExamBooking examBooking = getExamBookingsForStudentSubject(sapid, timeboundId);
			if(examBooking == null) {
				studentSSOBean.setError("Student has not applied for re-exam!");
				return studentSSOBean;
			}
			
//			System.out.println(examBooking);
		} else {
			if(isDataFromTempTable)
			{
				List<MettlScheduleTempTableBean> studentAttempts = getStudentAttemptsFromTempTable(sapid, timeboundId);
				if(studentAttempts != null && studentAttempts.size() > 0) {
					studentSSOBean.setError("Student has already appeared for a exam for this subject!");
					return studentSSOBean;
				}
			}
			else
			{
				List<MBAWXStudentAssessmentResult> studentAttempts = getStudentAttempts(sapid, timeboundId);
				if(studentAttempts != null && studentAttempts.size() > 0) {
					studentSSOBean.setError("Student has already appeared for a exam for this subject!");
					return studentSSOBean;
				}
			}
			//			System.out.println(studentAttempts);
			
		}
		
		if(isDataFromTempTable)
		{
			studentInfo.setSapid(((MettlScheduleTempTableBean)obj).getKey().getSapid());
			studentInfo.setFirstName(((MettlScheduleTempTableBean)obj).getFirstname());
			studentInfo.setLastName(((MettlScheduleTempTableBean)obj).getLastname());
			studentInfo.setEmailId(((MettlScheduleTempTableBean)obj).getEmailId());
			servletRequest.getSession().setAttribute("studentInfo", studentInfo);
			logger.info("student info data"+studentInfo.toString());
			//System.out.println("session data"+servletRequest.getSession().getAttribute("studentInfo").toString());
			
		}
		return studentSSOBean;
	}
	
	private void setStudentSSO(MettlStudentSSOBean studentSSOBean, Object obj,boolean isDataFromTempTable)
	{
		
		if(isDataFromTempTable)
		{
			studentSSOBean.setScheduleAccessUrl(((MettlScheduleTempTableBean)obj).getSchedule_accessUrl());
			studentSSOBean.setScheduleAccessKey(((MettlScheduleTempTableBean)obj).getKey().getSchedule_accessKey());
			studentSSOBean.setScheduleId(((MettlScheduleTempTableBean)obj).getSchedule_id());
			studentSSOBean.setScheduleName(((MettlScheduleTempTableBean)obj).getSchedule_name());
		}
		else
		{
			studentSSOBean.setScheduleAccessUrl(((MettlScheduleBean)obj).getSchedule_accessUrl());
			studentSSOBean.setScheduleAccessKey(((MettlScheduleBean)obj).getSchedule_accessKey());
			studentSSOBean.setScheduleId(((MettlScheduleBean)obj).getSchedule_id());
			studentSSOBean.setScheduleName(((MettlScheduleBean)obj).getSchedule_name());
		}
	}
	
	private MBAWXStudentExamBooking getExamBookingsForStudentSubject(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MBAWXStudentExamBooking> cr = cb.createQuery(MBAWXStudentExamBooking.class);
		Root<MBAWXStudentExamBooking> root = cr.from(MBAWXStudentExamBooking.class);

		cr.select(root).where(
			cb.equal(root.get("sapid"), sapid),
			cb.equal(root.get("timeboundId"), timeboundId),
			cb.equal(root.get("bookingStatus"), "Y")
		);
		
		Query<MBAWXStudentExamBooking> query = session.createQuery(cr);

		List<MBAWXStudentExamBooking> bookings = query.getResultList();

		return bookings.size() == 0 ? null : bookings.get(0);
	}

	private List<MBAWXStudentAssessmentResult> getStudentAttempts(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MBAWXStudentAssessmentResult> cr = cb.createQuery(MBAWXStudentAssessmentResult.class);
		Root<MBAWXStudentAssessmentResult> root = cr.from(MBAWXStudentAssessmentResult.class);

		cr.select(root).where(
			cb.equal(root.get("sapid"), sapid),
			cb.equal(root.get("timebound_id"), timeboundId),
			(
				cb.or(
					cb.equal(root.get("status"), "Attempted"), 
					cb.equal(root.get("status"), "RIA"),
					cb.equal(root.get("status"), "NV"),
					cb.equal(root.get("status"), "AB"),
					cb.equal(root.get("status"), "CC")	
				)
			)
		);
		
		Query<MBAWXStudentAssessmentResult> query = session.createQuery(cr);

		List<MBAWXStudentAssessmentResult> attempts = query.getResultList();

		return attempts;
	}
	
	private List<MettlScheduleTempTableBean> getStudentAttemptsFromTempTable(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MettlScheduleTempTableBean> cr = cb.createQuery(MettlScheduleTempTableBean.class);
		Root<MettlScheduleTempTableBean> root = cr.from(MettlScheduleTempTableBean.class);

		cr.select(root).where(
			cb.equal(root.get("key").get("sapid"), sapid),
			cb.equal(root.get("key").get("timebound_id"), timeboundId),
			cb.equal(root.get("testTaken"), "Attempted")
		);
		
		Query<MettlScheduleTempTableBean> query = session.createQuery(cr);

		List<MettlScheduleTempTableBean> attempts = query.getResultList();

		return attempts;
	}
	

	private TimeboundUserMapping getTimeboundMappingForStudent(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<TimeboundUserMapping> cr = cb.createQuery(TimeboundUserMapping.class);
		Root<TimeboundUserMapping> root = cr.from(TimeboundUserMapping.class);

		cr.select(root).where(
			cb.equal(root.get("userId"), sapid),
			cb.equal(root.get("timebound_subject_config_id"), timeboundId)
		);
		
		Query<TimeboundUserMapping> query = session.createQuery(cr);

		List<TimeboundUserMapping> timeboundMappings = query.getResultList();

//		System.out.println(timeboundMappings);
		
		return timeboundMappings.size() == 0 ? null : timeboundMappings.get(0);
	}

	private MettlScheduleBean getSchedule(String scheduleId, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MettlScheduleBean> cr = cb.createQuery(MettlScheduleBean.class);
		Root<MettlScheduleBean> root = cr.from(MettlScheduleBean.class);

		cr.select(root).where(
			cb.equal(root.get("schedule_id"), scheduleId),
			cb.equal(root.get("timebound_id"), timeboundId)
		);
		
		Query<MettlScheduleBean> query = session.createQuery(cr);

		List<MettlScheduleBean> assessments = query.getResultList();

		return assessments.size() == 0 ? null : assessments.get(0);
	}
	
	private MettlScheduleTempTableBean getScheduleFromTempTable(String scheduleId, String timeboundId, String sapid) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MettlScheduleTempTableBean> cr = cb.createQuery(MettlScheduleTempTableBean.class);
		Root<MettlScheduleTempTableBean> root = cr.from(MettlScheduleTempTableBean.class);

		cr.select(root).where(
			cb.equal(root.get("schedule_id"), scheduleId),
			cb.equal(root.get("key").get("timebound_id"), timeboundId),
			cb.equal(root.get("key").get("sapid"), sapid)
		);
		
		Query<MettlScheduleTempTableBean> query = session.createQuery(cr);

		List<MettlScheduleTempTableBean> assessments = query.getResultList();

		return assessments.size() == 0 ? null : assessments.get(0);
	}


	public MettlStudentSSOBean checkIfStudentCanAttemptTestForPG(String scheduleId, String subject, String sapid) {

		MettlStudentSSOBean studentSSOBean = new MettlStudentSSOBean();
		
//		// find the schedule for this scheduleId
//		MettlScheduleBean scheduleBean = getScheduleForPG(scheduleId);
//		
//		if(scheduleBean == null) {
//			// if no schedule found, return an error 
//			studentSSOBean.setError("No Assessment Found");
//			return studentSSOBean;
//		}
//		
//		studentSSOBean.setSapid(sapid);
//		studentSSOBean.setScheduleAccessUrl(scheduleBean.getSchedule_accessUrl());
//		studentSSOBean.setScheduleAccessKey(scheduleBean.getSchedule_accessKey());
//		studentSSOBean.setScheduleId(scheduleBean.getSchedule_id());
//		studentSSOBean.setScheduleName(scheduleBean.getSchedule_name());
		
		// check if exam booked for this subject and schedule
		
		
		MettlStudentSSOBean tempBean = new MettlStudentSSOBean();
		tempBean.setSapid(sapid);
		tempBean.setScheduleAccessKey("1i8peyvq4g");
		tempBean.setScheduleAccessUrl("https://tests.mettl.com/authenticateKey/1pax5968zk");
		tempBean.setScheduleName("Test Link");
		tempBean.setScheduleId("2032958");
		return tempBean;
	}

	private MettlScheduleBean getScheduleForPG(String scheduleId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MettlScheduleBean> cr = cb.createQuery(MettlScheduleBean.class);
		Root<MettlScheduleBean> root = cr.from(MettlScheduleBean.class);

		cr.select(root).where(
			cb.equal(root.get("schedule_id"), scheduleId)
		);
		
		Query<MettlScheduleBean> query = session.createQuery(cr);

		List<MettlScheduleBean> assessments = query.getResultList();

		return assessments.size() == 0 ? null : assessments.get(0);
	}
	
	public void saveBookingStudent(PGExamBookingBean booking) {
		Session session = sessionFactory.getCurrentSession();
		session.update(booking);
	}
}
