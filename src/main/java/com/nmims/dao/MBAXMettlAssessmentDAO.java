package com.nmims.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.MBAXMettlScheduleBean;
import com.nmims.bean.MBAXStudentAssessmentResult;
import com.nmims.bean.MBAXStudentExamBooking;
import com.nmims.bean.MettlStudentSSOBean;
import com.nmims.bean.TimeboundUserMapping;

@Transactional
@Repository
public class MBAXMettlAssessmentDAO {

	@Autowired   
	private SessionFactory sessionFactory;
	
	public MettlStudentSSOBean checkIfStudentCanAttemptTest(String scheduleId, String sapid, String timeboundId) {
		MettlStudentSSOBean studentSSOBean = new MettlStudentSSOBean();
		
		// find the schedule for this scheduleId
		MBAXMettlScheduleBean scheduleBean = getSchedule(scheduleId, timeboundId);
		
		if(scheduleBean == null) {
			// if no schedule found, return an error 
			studentSSOBean.setError("No Assessment Found");
			return studentSSOBean;
		}
		
		studentSSOBean.setSapid(sapid);
		studentSSOBean.setScheduleAccessUrl(scheduleBean.getSchedule_accessUrl());
		studentSSOBean.setScheduleAccessKey(scheduleBean.getSchedule_accessKey());
		studentSSOBean.setScheduleId(scheduleBean.getSchedule_id());
		studentSSOBean.setScheduleName(scheduleBean.getSchedule_name());
		
		// check if the student is mapped for the timebound id
		TimeboundUserMapping timeboundStudentMapping = getTimeboundMappingForStudent(sapid, timeboundId);

		if(timeboundStudentMapping == null) {
			// if no timebound mapping found, return error
			studentSSOBean.setError("Student not eligible for this subject!");
			return studentSSOBean;
		}

		// check if the test is 30 marks or 100 marks
		// if 30 marks then check if student has given a 30 marks test
		// if 100 marks then check if student has a booking for this schedule
		
		String maxMarks = scheduleBean.getMax_score();
		
		if("100".equals(maxMarks)) {
			MBAXStudentExamBooking examBooking = getExamBookingsForStudentSubject(sapid, timeboundId);
			if(examBooking == null) {
				studentSSOBean.setError("Student has not applied for re-exam!");
				return studentSSOBean;
			}
			
			System.out.println(examBooking);
		} else {
			List<MBAXStudentAssessmentResult> studentAttempts = getStudentAttempts(sapid, timeboundId);
			if(studentAttempts != null && studentAttempts.size() > 0) {
				studentSSOBean.setError("Student has already appeared for a exam for this subject!");
				return studentSSOBean;
			}
		}
		
		return studentSSOBean;
	}
	
	private MBAXStudentExamBooking getExamBookingsForStudentSubject(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MBAXStudentExamBooking> cr = cb.createQuery(MBAXStudentExamBooking.class);
		Root<MBAXStudentExamBooking> root = cr.from(MBAXStudentExamBooking.class);

		cr.select(root).where(
			cb.equal(root.get("sapid"), sapid),
			cb.equal(root.get("timeboundId"), timeboundId),
			cb.equal(root.get("bookingStatus"), "Y")
		);
		
		Query<MBAXStudentExamBooking> query = session.createQuery(cr);

		List<MBAXStudentExamBooking> bookings = query.getResultList();

		return bookings.size() == 0 ? null : bookings.get(0);
	}

	private List<MBAXStudentAssessmentResult> getStudentAttempts(String sapid, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MBAXStudentAssessmentResult> cr = cb.createQuery(MBAXStudentAssessmentResult.class);
		Root<MBAXStudentAssessmentResult> root = cr.from(MBAXStudentAssessmentResult.class);

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
		
		Query<MBAXStudentAssessmentResult> query = session.createQuery(cr);

		List<MBAXStudentAssessmentResult> attempts = query.getResultList();

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

		System.out.println(timeboundMappings);
		
		return timeboundMappings.size() == 0 ? null : timeboundMappings.get(0);
	}

	private MBAXMettlScheduleBean getSchedule(String scheduleId, String timeboundId) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<MBAXMettlScheduleBean> cr = cb.createQuery(MBAXMettlScheduleBean.class);
		Root<MBAXMettlScheduleBean> root = cr.from(MBAXMettlScheduleBean.class);

		cr.select(root).where(
			cb.equal(root.get("schedule_id"), scheduleId),
			cb.equal(root.get("timebound_id"), timeboundId)
		);
		
		Query<MBAXMettlScheduleBean> query = session.createQuery(cr);

		List<MBAXMettlScheduleBean> assessments = query.getResultList();

		return assessments.size() == 0 ? null : assessments.get(0);
	}
}
