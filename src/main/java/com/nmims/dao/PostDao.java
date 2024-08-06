package com.nmims.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.nmims.bean.ChatUserBean;
import com.nmims.bean.CommentReactionsLtidemoBean;
import com.nmims.bean.CommentsLtidemoBean;
import com.nmims.bean.ConsumerProgramStructureLtidemoBean;
import com.nmims.bean.ConsumerTypes;
import com.nmims.bean.ExamOrderBean;
import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.GroupBean;
import com.nmims.bean.GroupsMembers;
import com.nmims.bean.Hashtag;
import com.nmims.bean.LTIUserResourcesMapping;
import com.nmims.bean.LTIUsers;
import com.nmims.bean.Post;
import com.nmims.bean.PostReactionsLtidemoBean;
import com.nmims.bean.PostReportList;
import com.nmims.bean.ProgramSemSubject;
import com.nmims.bean.ProgramSemSubjectBean;
import com.nmims.bean.ProgramStructure;
import com.nmims.bean.ProgramSubjectMappingBean;
import com.nmims.bean.Programs;
import com.nmims.bean.Registration;
import com.nmims.bean.RequestBeanLtidemoBean;
import com.nmims.bean.SessionBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.StudentSubjectConfig;
import com.nmims.bean.SubjectsList;
import com.nmims.bean.TimeBoundStudentMapping;
import com.nmims.bean.UserResourseMapping;

import com.nmims.helpers.RegistrationHelper;

@SuppressWarnings("deprecation")

@Repository

public class PostDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Value("${CURRENT_ACAD_YEAR}")
	private String CURRENT_ACAD_YEAR;

	@Value("${CURRENT_ACAD_MONTH}")
	private String CURRENT_ACAD_MONTH;
	
	@Value("${CURRENT_MBAWX_ACAD_YEAR}")
	private String CURRENT_MBAWX_ACAD_YEAR;

	@Value("${CURRENT_MBAWX_ACAD_MONTH}")
	private String CURRENT_MBAWX_ACAD_MONTH;
	
	@Value("${TEST_USER_SAPIDS}")
	private String TEST_USER_SAPIDS;
	
	@Value("${SERVER_PATH}")
	private String SERVER_PATH;
	
	@Value("${NEXT_MBAWX_ACAD_MONTH}")
	private String NEXT_MBAWX_ACAD_MONTH;
	
	@Value("${NEXT_MBAWX_ACAD_YEAR}")
	private String NEXT_MBAWX_ACAD_YEAR;
	
	private static final Logger logger = LoggerFactory.getLogger(PostDao.class);
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	public double getMaxOrderWhereContentLive(){
		
		Session session = sessionFactory.getCurrentSession();
		Double examOrder = 0.0;
		try{

			SQLQuery query = session.createSQLQuery("SELECT * FROM exam.examorder e where e.order = (SELECT max(examorder.order) FROM exam.examorder where acadContentLive = 'Y')");
			query.addEntity(ExamOrderBean.class);
			ExamOrderBean examBean = (ExamOrderBean) query.list().get(0);
			examOrder = Double.parseDouble(examBean.getOrder());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return examOrder;
		
	}
	public ArrayList<String> getPassSubjectsNamesForAStudent(String sapid){
		
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery("select subject from exam.passfail where isPass = 'Y' and sapid = :sapid order by sem  asc");
		query.setParameter("sapid", sapid);
		ArrayList<String> listt = (ArrayList<String>) query.list();
		return listt;
	}
	public List getConsumerTypes(String facultyId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT  " + 
				"    c_ps.consumerTypeId AS consumerId, " + 
				"    c.name AS consumerType, " + 
				"    c_ps.programId AS p_id, " + 
				"    p.code AS program, " + 
				"    c_ps.programStructureId AS ps_id, " + 
				"    ps.program_structure AS program_structure, " + 
				"    sc.prgm_sem_subj_id AS pss_id, " + 
				"    pss.subject, " + 
				"    sc.id AS config_id, " + 
				"    b.name AS batchName " + 
				"FROM " + 
				"    lti.timebound_user_mapping tm " + 
				"        INNER JOIN " + 
				"    lti.student_subject_config sc ON tm.timebound_subject_config_id = sc.id " + 
				"        INNER JOIN " + 
				"    exam.program_sem_subject pss ON pss.id = sc.prgm_sem_subj_id " + 
				"        INNER JOIN " + 
				"    exam.consumer_program_structure c_ps ON pss.consumerProgramStructureId = c_ps.id " + 
				"        INNER JOIN " + 
				"    exam.consumer_type c ON c.id = c_ps.consumerTypeId " + 
				"        INNER JOIN " + 
				"    exam.program p ON p.id = c_ps.programId " + 
				"        INNER JOIN " + 
				"    exam.program_structure ps ON ps.id = c_ps.programStructureId " + 
				"        INNER JOIN " + 
				"    exam.batch b ON b.id = sc.batchId " + 
				"WHERE " + 
				"    tm.userId =:facultyId " + 
				"        AND tm.role = 'Faculty' " + 
				"        AND sc.acadYear = '" + CURRENT_MBAWX_ACAD_YEAR + "' " + 
				"        AND sc.acadMonth = '" + CURRENT_MBAWX_ACAD_MONTH + "'" ;
		SQLQuery query = session.createSQLQuery(sql);
		
		/*SQLQuery query = session.createSQLQuery("select "
				+ " c_ps.consumerTypeId as consumerId , "
				+ " c.name as consumerType , "
				+ " c_ps.programId as  p_id, "
				+ " p.code as program , "
				+ " c_ps.programStructureId as ps_id , "
				+ " ps.program_structure as program_structure, "
				+ " sc.prgm_sem_subj_id as pss_id,sc.id as config_id ,"
				+ " pss.subject,sc.batchId "
				+ " from lti.timebound_user_mapping tm "
				+ " INNER JOIN lti.student_subject_config sc ON tm.timebound_subject_config_id =sc.id "
				+ " INNER JOIN exam.program_sem_subject pss ON pss.id=sc.prgm_sem_subj_id "
				+ " INNER JOIN exam.consumer_program_structure c_ps ON pss.consumerProgramStructureId =c_ps.id "
				+ " INNER JOIN exam.consumer_type c ON  c.id= c_ps.consumerTypeId "
				+ " INNER JOIN exam.program p ON p.id=c_ps.programId "
				+ " INNER JOIN exam.program_structure ps ON ps.id=c_ps.programStructureId "
				+ " where tm.userId = :facultyId "
				+ " and tm.role= 'Faculty' "
				+ " and sc.acadYear="+CURRENT_MBAWX_ACAD_YEAR+" and sc.acadMonth='"+CURRENT_MBAWX_ACAD_MONTH+"' " );*/
		
		query.setParameter("facultyId", facultyId); 
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		
		return list;
	}

	public List<Programs> getPrograms() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Programs");// here persistent class name is ConsumerType
		List<Programs> list = query.list();
		return list;
	}

	public List<ConsumerProgramStructureLtidemoBean> getConsumerProgramStructure() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from  ConsumerProgramStructureLtidemoBean");// here persistent class name is ConsumerType
		List<ConsumerProgramStructureLtidemoBean> list = query.list();
		return list;
	}

	public List<ProgramSemSubject> getProgramSemSubject() {
		Session session = this.sessionFactory.getCurrentSession();
		List<ProgramSemSubject> res = session
				.createSQLQuery("select id,consumerProgramStructureId,subject,sem from exam.program_sem_subject")
				.setResultTransformer(Transformers.aliasToBean(ProgramSemSubject.class)).list();

		return res;
	}



	public StudentLtidemoBean getSingleStudentsData(String sapid) {

		Session session = this.sessionFactory.getCurrentSession();
		StudentLtidemoBean student = new StudentLtidemoBean();
		String sql =  " SELECT * from exam.students s "
					+ " WHERE s.sapid=:sapid and s.sem = (Select max(sem) from exam.students where sapid =:sapid ) ";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(StudentLtidemoBean.class);
		query.setParameter("sapid", sapid);

		try {
			student = (StudentLtidemoBean) query.list().get(0);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return student;
	}

	public List<Registration> getAllRegistrationsFromSAPID(String sapid) {

		Session session = this.sessionFactory.getCurrentSession();
		String sql = "select * from exam.registration where sapid = :sapid order by sem ";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Registration.class);
		query.setParameter("sapid", sapid);
		List<Registration> studentData = query.list();

		return studentData;

	}

	public List<ExamOrderBean> getLiveFlagDetails() {

		Session session = sessionFactory.getCurrentSession();
		// Query query = session.createQuery("from ExamOrderBean e order by e.order");
		SQLQuery query = session.createSQLQuery("select * from exam.examorder e order by e.order");
		query.addEntity(ExamOrderBean.class);
		List<ExamOrderBean> liveFlagList = query.list();
 
		return liveFlagList;

	} 
	public List failSubjects(StudentLtidemoBean student) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "select s.id,s.subject  from exam.passfail f ,exam.program_sem_subject s where f.isPass = 'N' and f.sapid = :sapid "
				+ "and s.consumerProgramStructureId =:consumerProgramStructureId  and s.subject=f.subject";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("sapid", student.getSapid());
		query.setParameter("consumerProgramStructureId", student.getConsumerProgramStructureId());
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List failSubjects = query.list();
		return failSubjects;
	}

	public List<SubjectsList> getProgramSubjectSemMappingList(StudentLtidemoBean student,String type) {
		
		
	
		
		Session session = this.sessionFactory.getCurrentSession();
		List<SubjectsList> programSubjectSemMappingList = new ArrayList<SubjectsList>();
		String acadMonthYear = "";
		
		if(RegistrationHelper.checkCurrentCycleReg("01/"+student.getMonth()+"/"+student.getYear() ,"01/"+CURRENT_MBAWX_ACAD_MONTH+"/"+CURRENT_MBAWX_ACAD_YEAR, student.getConsumerProgramStructureId()) == 1) {
			 acadMonthYear =  " and sc.acadYear = "+ NEXT_MBAWX_ACAD_YEAR
		  			  + " and sc.acadmonth = '" + NEXT_MBAWX_ACAD_MONTH + "' ";
			
		}else {
		 acadMonthYear =  " and sc.acadYear = "+ CURRENT_MBAWX_ACAD_YEAR
				  			  + " and sc.acadmonth = '" + CURRENT_MBAWX_ACAD_MONTH + "' ";
		
		}
		String pendingSubject = " and pss.id in (select prgm_sem_subj_id from exam.mba_passfail "
							  + " where sapid = '"+student.getSapid()+"' and isPass = 'N')";
		
		String subjectTypes = "";
		if(type.equalsIgnoreCase("active")) {
			subjectTypes = " and sc.startDate <= CURDATE() and CURDATE() <= sc.endDate " + acadMonthYear;
		}else if(type.equalsIgnoreCase("archive")) {
			subjectTypes = " and CURDATE() > sc.endDate ";  
		}else if(type.equalsIgnoreCase("upcoming")) {
			subjectTypes = " and CURDATE() < sc.startDate " + acadMonthYear + " ORDER BY startDate "; 
		}else if(type.equalsIgnoreCase("activeUpcoming")) {
			subjectTypes = acadMonthYear + " order by sc.startDate limit 1 ";
		}else if(type.equalsIgnoreCase("pending")) {
			subjectTypes = acadMonthYear + pendingSubject;
		}
		
		String sql =  " Select cast(sc.id as char(10)) as timeBoundId, pss.subject, sc.acadMonth, sc.acadYear, "
					+ " date_format(sc.startDate, '%d %b') as startDate, date_format(sc.endDate, '%d %b') as endDate"
					+ " FROM lti.student_subject_config sc "
					+ " INNER JOIN lti.timebound_user_mapping tm on tm.timebound_subject_config_id = sc.id "
					+ " INNER JOIN exam.program_sem_subject pss on pss.id = sc.prgm_sem_subj_id  "
					+ " where tm.userId=:userId " 
					+ subjectTypes ;  
		
		try {
			SQLQuery query = session.createSQLQuery(sql); 
			query.setParameter("userId", student.getSapid());
//			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
//			List programSubjectSemMappingList = query.list();
			query.setResultTransformer(Transformers.aliasToBean(SubjectsList.class));
			programSubjectSemMappingList= (List<SubjectsList>)query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return programSubjectSemMappingList;
	} 

	public List<ProgramSubjectMappingBean> getCurrentSemSubject(List<String> subject_id) {

		Session session = sessionFactory.getCurrentSession();
		// Query query = session.createQuery("from ProgramSubjectMappingBean pg where
		// pg.id IN :subject_id");
		List<ProgramSubjectMappingBean> subject_list = new ArrayList<ProgramSubjectMappingBean>();
		try {
			SQLQuery query = session.createSQLQuery("SELECT * FROM exam.program_sem_subject where id in :subject_id");
			query.addEntity(ProgramSubjectMappingBean.class);
			query.setParameterList("subject_id", subject_id);
			subject_list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subject_list;

	}

	public Integer getCurrentActiveSubject(String sapid) {

		HashMap<String, String> listOfPgrmSubMappingBean = new HashMap<>();
		List<StudentSubjectConfig> listOfPgrmSubBean = new ArrayList<StudentSubjectConfig>();
		
		Session session = this.sessionFactory.getCurrentSession();
		Integer list =null;
		try {
			String sql =  " SELECT tm.timebound_subject_config_id FROM lti.timebound_user_mapping tm,lti.student_subject_config sc"
						+ "  where tm.userId='"+sapid+"'  and tm.timebound_subject_config_id=sc.id and " 
						+ "  sc.startDate <= curdate() and sc.endDate >= curdate()";
			SQLQuery query = session.createSQLQuery(sql);
			list = (Integer) query.list().get(0); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public List<Integer> getCurrentPreviousActiveSubject(String sapid) {

		HashMap<String, String> listOfPgrmSubMappingBean = new HashMap<>();
		List<StudentSubjectConfig> listOfPgrmSubBean = new ArrayList<StudentSubjectConfig>();
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Integer> list = new ArrayList<>();
		try {
			String sql =  " SELECT sc.prgm_sem_subj_id FROM lti.timebound_user_mapping tm,lti.student_subject_config sc"
						+ " where tm.userId='"+sapid+"'  and tm.timebound_subject_config_id=sc.id and " 
						+ " startDate <= curdate() ";
			SQLQuery query = session.createSQLQuery(sql);
			list = query.list(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<String> getSubjectsList(StudentLtidemoBean student) {
		Session session = this.sessionFactory.getCurrentSession();
		List<String> ps = new ArrayList<String>();
		String sql = "select subject from exam.program_subject ps  where ps.prgmStructApplicable=:psApplicable and ps.sem=:sem and ps.program=:program "
				+ "union " + "select subject from exam.passfail where isPass = 'N' and sapid = :sapid ";

		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("psApplicable", student.getPrgmStructApplicable());
			query.setParameter("sem", student.getSem());
			query.setParameter("program", student.getProgram());
			query.setParameter("sapid", student.getSapid());
			ps = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	public List getAllPosts(RequestBeanLtidemoBean request) {
		
		Session session = this.sessionFactory.getCurrentSession();
		List postList = new ArrayList<>();
		
		String keyword =request.getKeyword();
		String facultyIds=request.getFacultyId();
		String fileType=request.getFileType();
		String userId =request.getUserId();
		String timeBoundIds=request.getTimeBoundIds();
		Long groupid =request.getGroup_id();
		int post_id = request.getPost_id();
		int sessionPlanModuleId =request.getSessionPlanModuleId();
		int pageId =request.getPageId();
		int total=8; 
		String sql = "";
		
		String role = getUserRole(userId);
		
		try {
		String queryForGroups = "";
		if(groupid != null){ 
			queryForGroups = " and p.group_id = "+groupid+" " ;
		}
		
		String singlePostCase = "";
		if(post_id >0 ) {
			singlePostCase ="and  p.post_id='"+post_id+"'";
		}
		String sessionPlanModuleIdCase = "";
		if(sessionPlanModuleId > 0 ) {
			singlePostCase =" and  p.session_plan_module_id='"+sessionPlanModuleId+"' ";
		}
		String searchKeywordCase = "";
		if(!keyword.equalsIgnoreCase("")) {
			searchKeywordCase =" and ( content like '%"+ keyword +"%' or hashtags like '%"+ keyword +"%' or type like '%"+ keyword +"%')";
		}
		String filter = ""  ;
		if(facultyIds != null && !facultyIds.isEmpty()) {
			String facultyIdsInQuotes=facultyIds.replace(",","','");   
		     filter = "and p.userId in('"+facultyIdsInQuotes+"')"  ;
		} 
		String SearchFileType="";
		if(fileType != null && !fileType.isEmpty()) {
			String fileTypeInQuotes=fileType.replace(",","','");  
			SearchFileType = "and p.type in('"+fileTypeInQuotes+"')"  ;
		}   
		
		if (role.indexOf("Acads Admin") != -1 || role.indexOf("MBA-WX Admin") != -1) {
				sql = " SELECT p.* ,  IFNULL(concat('Prof. ',f.firstName), 'System') as  firstName,IFNULL(f.lastName, ' ') as lastName, f.imgUrl as profilePicFilePath "
					+ " FROM lti.post as p "
					+ " LEFT JOIN acads.faculty f ON p.userId=f.facultyId where p.scheduleFlag='N' "
					+ " order by p.createdDate desc limit "  
					+ ((pageId - 1) * total) + ", " + total;
				
		}else if (facultyIds.equals(userId)) { //Load faculties timeline posts
				sql = " SELECT p.* , IFNULL(concat('Prof. ',f.firstName), 'System') as  firstName,IFNULL(f.lastName, ' ') as lastName, f.imgUrl as profilePicFilePath "
					+ " FROM lti.post as p "
					+ " LEFT JOIN acads.faculty f ON p.userId=f.facultyId "
					+ " where "
					// Now Faculty can view all post for allocated TimeBoundId
					// + " p.userId in ('" + facultyIds + "') "
					// + " and acadYear = "+CURRENT_MBAWX_ACAD_YEAR+" and acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+ "' "
					+ " p.subject_config_id in(" + timeBoundIds + ") " 
					+ " and p.scheduleFlag='N' " +queryForGroups
					+ " order by p.createdDate desc limit "  
					+ ((pageId - 1) * total) + ", " + total;
				
		}else {    
				sql = " SELECT p.* , IFNULL(f.firstName, 'System') as  firstName,IFNULL(f.lastName, ' ') as lastName, f.imgUrl as profilePicFilePath "
					+ " FROM lti.post as p "
					+ " LEFT JOIN acads.faculty f  ON p.userId = f.facultyId "
					+ " where p.subject_config_id in(" + timeBoundIds + ")  "
					//+ " and acadYear = "+CURRENT_MBAWX_ACAD_YEAR+" and acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+ "' "
					+ " "+filter+ " " +singlePostCase+ " " +queryForGroups+ " "
					+ " " +searchKeywordCase+" "+SearchFileType+ " " +sessionPlanModuleIdCase+ " "
					+ " and p.scheduleFlag='N' and scheduledDate<now()  "
					+ " order by p.scheduledDate desc limit " + ((pageId - 1) * total) + ", " + total;
		} 
		
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			postList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postList;
	}
//	
//	public int checkNewPost(int postId,String timeboundId) {
//		Session session = this.sessionFactory.getCurrentSession();
//		int postCount = 0;
//		String sql = "";
//		try {
//			sql = "SELECT count(*) from lti.post "
//					+ "where subject_config_id in("+timeboundId+") "
//							+ "and scheduleFlag='N' "
//							+ "and post_id >"+postId+" order by createdDate desc ";
//		
//		
//			SQLQuery query = session.createSQLQuery(sql);
//			postCount = query.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return postCount;
//	}
	
	public int checkNewPost(String createdDate,String timeboundId) {
		Session session = this.sessionFactory.getCurrentSession();
		
		String sql = "SELECT count(*) from Post "
				+ "where subject_config_id in("+timeboundId+") "
						+ "and scheduleFlag='N' "
						+ "and createdDate >'"+createdDate+"' order by createdDate desc ";
		
		int count = ((Long)session.createQuery(sql).uniqueResult()).intValue();
		return count;
	}
	

	public List getAllPostsByKeyword(String userId,String role,String timeBoundIds,int pageId,int pageLimit,String keyword) {
		Session session = this.sessionFactory.getCurrentSession();
		List postList = new ArrayList<>();
		String sql = "";
		
		try {
if(role!="Student") {
				
			}
	
	sql ="SELECT * from lti.post where subject_config_id in ("+timeBoundIds+") "
			+ "and scheduleFlag='N' and content Like '%"+keyword+"%'  ";
			if (role != "Student") {
				sql = sql + " and role = 'faculty'";
			}
			sql = sql + "order by createdDate desc limit " + ((pageId - 1) * pageLimit) + ", " + pageLimit;
	
	
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			postList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postList;
	}

	public List<StudentSubjectConfig> getCurrentPreviousActiveSubject() {

		Session session = this.sessionFactory.getCurrentSession();
		String sql = " SELECT  sc FROM lti.student_subject_config sc where sc.startDate <= curdate() and sc.acadYear = :year and sc.acadmonth= :month ";
		List<StudentSubjectConfig> currentPreviousActiveSubject = new ArrayList<StudentSubjectConfig>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(StudentSubjectConfig.class);
			query.setParameter("year", CURRENT_MBAWX_ACAD_YEAR);
			query.setParameter("month", CURRENT_MBAWX_ACAD_MONTH);
			currentPreviousActiveSubject = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currentPreviousActiveSubject;

	}
	
	
	public List<Integer> getCurrentPrevTimeBoundIdBasedOnUserid(String userId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =" SELECT " + 
					"    id " + 
					" FROM " + 
					"    lti.student_subject_config " + 
					" WHERE " + 
					"    id IN (SELECT  " + 
					"            timebound_subject_config_id " + 
					"        FROM " + 
					"            lti.timebound_user_mapping " + 
					"        WHERE " + 
					"            userId = '" +userId+ "') " + 
					"        AND acadYear = '" +CURRENT_MBAWX_ACAD_YEAR+ "'" + 
					"        AND acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+"' " + 
					"        AND startDate <= CURDATE()";
		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	

	//Commented as Duplicate query called in getCurrentPrevTimeBoundIdBasedOnUserid
	/*
	public List<Integer> getFacultyCurrentPrevTimeBoundIdBasedOnUserid(String userid) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " select id from lti.student_subject_config where id in "
				+ "(select timebound_subject_config_id from lti.timebound_user_mapping "
				+ "where userId = '"+userid+"' ) "
				+ "and acadYear="+CURRENT_ACAD_YEAR+" "
				+ "and acadMonth='"+CURRENT_ACAD_MONTH+"' "
				+ "and startDate <= curdate() ";
		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	*/

	public List<String> getFacultyIdBasedOnTimeBoundid(String timeBoundId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " select userId from lti.timebound_user_mapping "
					+ " where timebound_subject_config_id in ("+timeBoundId+") and role='Faculty' ";
		List<String> facultyId = new ArrayList<String>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			facultyId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return facultyId;
		}
	
	//Commented as query not used anywhere
	/*
	public List<Integer> getFacultyIdsBasedOnSubjectId(String subjectId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " select id from lti.timebound_user_mapping "
					+ " where role = 'Faculty' and timebound_subject_config_id = "
					+ " (select id from lti.student_subject_config "
					+ " where prgm_sem_subj_id = "+ subjectId +" and batchId = 1 "
					+ " and acadYear="+ CURRENT_ACAD_YEAR +" "
					+ " and acadMonth="+ CURRENT_ACAD_MONTH +" ); ";
		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	*/

	public List<FacultyLtidemoBean> getFacultyIds(String subjectsIds) {
		Session session = this.sessionFactory.getCurrentSession();

		List<FacultyLtidemoBean> facultyList = new ArrayList<FacultyLtidemoBean>();
		try {
			String sql =" SELECT  " + 
						"    sc.id AS timeBoundId, " + 
						"    f.id, " + 
						"    f.email, " + 
						"    f.facultyId, " + 
						"    f.firstName, " + 
						"    f.lastname, " + 
						"    f.imgUrl " + 
						" FROM " + 
						"    lti.student_subject_config sc " + 
						"        INNER JOIN " + 
						"    lti.timebound_user_mapping tm ON tm.timebound_subject_config_id = sc.id " + 
						"        INNER JOIN " + 
						"    acads.faculty f ON f.facultyId = tm.userId " + 
						"	INNER JOIN " + 
						"   (SELECT  " + 
						"        s.facultyId, MAX(id) AS latest " + 
						"    FROM " + 
						"        acads.sessions s " + 
						"    GROUP BY s.facultyId )	ss ON ss.facultyId = f.facultyId  "+
						" WHERE tm.role = 'Faculty' " + 
						"        AND sc.acadYear = '" +CURRENT_MBAWX_ACAD_YEAR+ "' " + 
						"        AND sc.acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+ "' " + 
						"        AND sc.id IN (" +subjectsIds+ ")  ORDER BY ss.latest DESC limit 1";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(FacultyLtidemoBean.class);
			facultyList = (List<FacultyLtidemoBean>) query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return facultyList;

	}

	public Post getPost(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Post post = null;
		try {
			post = (Post) session.get(Post.class, new Integer(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}

	public String addPost(Post post) {
		
		Session session = this.sessionFactory.getCurrentSession();
		try {
            post.setAcadYear(CURRENT_MBAWX_ACAD_YEAR);
			post.setAcadMonth(CURRENT_MBAWX_ACAD_MONTH);
			post.setCreatedBy(post.getUserId());   
			if(post.getUrl().length()>3) {
				post.setType("Link");
			}
			if(post.getPost_id()==0) {

				post.setTimeboundId(post.getSubject_config_id());
				session.save(post);
				//insertToRedis(post);

				return post.getPost_id()+"";
			}else {
				Post p = session.find(Post.class, post.getPost_id());
				p.setContent(post.getContent());  
//				Commented for now as it's changing type of existing post
//				p.setUrl(post.getUrl());
//				p.setType(post.getType()); 
				if(post.getFileName()!=null) {
					p.setFileName(post.getFileName());
					p.setFilePath(post.getFilePath());
					p.setFileType(post.getFileType());
				}
				if(post.getEmbedUrl().length()>3) { 
					p.setEmbedDescription(post.getEmbedDescription());
					p.setEmbedImage(post.getEmbedImage());
					p.setEmbedTitle(post.getEmbedTitle());
					p.setEmbedUrl(post.getEmbedUrl());  
				} 
//				p.setUrl( p.getUrl().replaceAll("(,)*$", "")); 
				p.setTimeboundId(p.getSubject_config_id());
				session.update(p);
				//insertToRedis(p);

				return p.getPost_id()+"";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return e.getMessage();
		}

	}
	public String insertToRedis(Post posts) {
		RestTemplate restTemplate = new RestTemplate();
		try {
	  	    String url = SERVER_PATH+"timeline/api/post/refreshRedisDataByTimeboundIdForAllIntances";
			HttpHeaders headers = new HttpHeaders();
			  headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			  HttpEntity<Post> entity = new HttpEntity<Post>(posts,headers);
			  
			  return restTemplate.exchange(
				 url,
			     HttpMethod.POST, entity, String.class).getBody();
		} catch (RestClientException e) {
			e.printStackTrace();
			return "Error IN rest call got "+e.getMessage();
		}
	}
	public boolean updatePost(Post post) {

		Session session = this.sessionFactory.getCurrentSession();
		try {
			post.setRole("faculty");
			post.setLastModifiedBy(post.getUserId());
			Query qry1 = session.createQuery(
					"update Post set userId=:user,role=:role,content=:cnt,fileName=:fname where post_id=:post_id");
			qry1.setParameter("cnt", post.getContent());
			qry1.setParameter("fname", post.getFileName());
			qry1.setParameter("post_id", post.getPost_id());
			qry1.executeUpdate();
			
			/*Query qry = session.createQuery("delete  from PostProgramSemSubject where post_id=:post_id");
			qry.setParameter("post_id", post.getPost_id());
			qry.executeUpdate();
			for (String ids : subjectIds) {
				post.setProgram_sem_subject_id(ids); 
				session.save(post); 
			}*/
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	public boolean updateSinglePost(Post post) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(post);
		return true;
	}
	public boolean deletePost(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			Post p = (Post) session.load(Post.class, new Integer(id));
			if (null != p) {
				Post postToDelete = new Post();
				postToDelete.setPost_id(p.getPost_id());     
				postToDelete.setSubject_config_id(p.getSubject_config_id());
				deleteFromRedis(postToDelete); 
				session.delete(p); 
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public String deleteFromRedis(Post posts) {
		RestTemplate restTemplate = new RestTemplate();
		try {
	  	    String url = SERVER_PATH+"timeline/api/post/deletePostByTimeboundIdAndPostId";
			HttpHeaders headers = new HttpHeaders();
			  headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			  HttpEntity<Post> entity = new HttpEntity<Post>(posts,headers);
			  
			  return restTemplate.exchange(
				 url,
			     HttpMethod.POST, entity, String.class).getBody();
		} catch (RestClientException e) {
			e.printStackTrace();
			return "Error IN rest call got "+e.getMessage();
		}
	}
	public List<ProgramSemSubject> programSemSubjectsList(String psId, String pId, String ctId) {
		Session session = this.sessionFactory.getCurrentSession();

		List<ProgramSemSubject> programSemSubjectsList = null;
		try {
			SQLQuery query = session.createSQLQuery("select id from exam.consumer_program_structure where  "
					+ "programId=:psId  and  programStructureId=:pId   and consumerTypeId=:ctId ");

			query.setParameter("psId", psId);
			query.setParameter("pId", pId);
			query.setParameter("ctId", ctId);
			int cpsId = (int) query.list().get(0);

			SQLQuery query2 = session.createSQLQuery(
					"select id,subject from exam.program_sem_subject where  " + "consumerProgramStructureId=:cpsId   ");

			query2.setParameter("cpsId", cpsId);
			programSemSubjectsList = query2.list();
		} catch (Exception e) {

		}
		return programSemSubjectsList;
	}

//////////////////////////////////////////////

	public List<ProgramStructure> getProgramStructureByConsumerType(int id) {
		Session session = this.sessionFactory.getCurrentSession();

		String sql = "select p_s.program_structure ,p_s.id as id " + "from exam.consumer_program_structure as c_p_s "
				+ "left join exam.program_structure as p_s on p_s.id = c_p_s.programStructureId "
				+ "where c_p_s.consumerTypeId = :consumerTypeId group by p_s.id";

		// int cpsId = (int) query.list();
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(ProgramStructure.class);
		query.setParameter("consumerTypeId", id);
		List<ProgramStructure> programsByConsumerType = query.list();
		return programsByConsumerType;
	}

	public List<Programs> getProgramByConsumerType(int id) {

		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery("select p.* from exam.consumer_program_structure"
				+ " as c_p_s left join exam.program as p on p.id = c_p_s.programId "
				+ "where c_p_s.consumerTypeId = :consumerTypeId  group by p.id");
		query.addEntity(Programs.class);
		query.setParameter("consumerTypeId", id);
		List<Programs> programsByConsumerType = query.list();
		return programsByConsumerType;
	}

	public List<ProgramSemSubject> getSubjectByConsumerType(int consumerTypeId, String programDataId,
			String programStructureDataId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "select p_s_s.subject,p_s_s.id  from exam.program_sem_subject as p_s_s "
				+ "where p_s_s.consumerProgramStructureId in "
				+ "(select c_p_s.id as id from exam.consumer_program_structure as c_p_s where c_p_s.programId in("
				+ programDataId + ") " + "and c_p_s.programStructureId in(" + programStructureDataId
				+ ") and c_p_s.consumerTypeId in(" + consumerTypeId + ")) group by p_s_s.subject";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

		List<ProgramSemSubject> ConsumerProgramStructure = query.list();
		return ConsumerProgramStructure;
	}

	public List<Programs> getProgramByConsumerTypeAndPrgmStructure(int consumerTypeId, int programStructureId) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Programs> programsByConsumerTypeAndPrgmStructure = null;

		String sql = "select p.* from exam.consumer_program_structure"
				+ " as c_p_s left join exam.program as p on p.id = c_p_s.programId "
				+ "where c_p_s.consumerTypeId = :consumerTypeId and c_p_s.programStructureId in (" + programStructureId
				+ ") group by p.id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Programs.class);
		query.setParameter("consumerTypeId", consumerTypeId);
		programsByConsumerTypeAndPrgmStructure = query.list();
		return programsByConsumerTypeAndPrgmStructure;
	}
	public int subCommentCount(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		int count = ((Long)session.createQuery("select count(*) from CommentsLtidemoBean where master_comment_id=:id").setParameter("id", id).uniqueResult()).intValue();
		return count;
	}
	/////////////////////////////////////////
	public List<CommentsLtidemoBean> getComments(int post_id,String role, Integer limit, Integer offset) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "";
		String subcomments_count=" (select count(c2.id) from lti.post_comments c2 where c.id=c2.master_comment_id ) as subcomments_count";
		
			sql = " from CommentsLtidemoBean " + 
					"   where post_id=:post_id  and master_comment_id=0 order by id "; 
		
		Query query = session.createQuery(sql);
		query.setParameter("post_id", post_id);
		query.setFirstResult( offset ); 
		query.setMaxResults( limit);
		List<CommentsLtidemoBean> list = query.list();
		return list;
	}

	public int getCountofComments(int post_id) {
		Session session = this.sessionFactory.getCurrentSession();
		int count = ((Long)session.createQuery("select count(*) from CommentsLtidemoBean where post_id=:post_id and visibility=0")
				.setParameter("post_id", post_id).uniqueResult()).intValue();
		return count;
	}
	public boolean IfMyComments(String sapid,int post_id) {
		Session session = this.sessionFactory.getCurrentSession();
		int count = ((Long)session.createQuery("select count(*) from CommentsLtidemoBean where post_id=:post_id and visibility=0 and sapid=:sapid")
				.setParameter("sapid", sapid).setParameter("post_id", post_id).uniqueResult()).intValue();
		return (count>0)? true:false; 
	}
	
//	public List<PostReactions> getHelpfulReactionCountForStudent(String sapId, String postId) {
	public String getHelpfulReactionCountForStudent(RequestBeanLtidemoBean req) {
		int post_id = req.getPost_id();
		String post_type=req.getPostType();
		String sapId = req.getSapid();
		
		//String table =(post_type.equalsIgnoreCase("comment")) ? "comment_reactions":"post_reactions"; //by default PostReactions table is selected
		String table ="";
		String sql = "";
		if(post_type.equalsIgnoreCase("comment")) {
			table = "comment_reactions";

			 sql =  "select reactionType from "+table+" where "
					+ "userId ='"+sapId+"' and commentId='"+post_id+"'";
		}else {
			table = "post_reactions";

			 sql =  "select reactionType from "+table+" where "
					+ "userId ='"+sapId+"' and postId='"+post_id+"'";
			
		}
		
		Session session = this.sessionFactory.getCurrentSession();
		String reactions="";
		int count = 0;
		SQLQuery query = session.createSQLQuery(sql);
		try {
			reactions = (String) query.list().get(0);
		} catch (Exception e) {
		}
		
//		count = reactions.get(0);
		return reactions;
		
		
	}
	
//	public List<PostReactions> getNotHelpfulReactionCountForStudent(String sapId, String postId) {
	public int getNotHelpfulReactionCountForStudent(String sapId, String postId) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Integer> reactions;
		Integer count = 0;
		String sql =  "select * from Post_Reactions where "
				+ "userId ='"+sapId+"' and type='nothelful' and post_id='"+ postId+"'";
		SQLQuery query = session.createSQLQuery(sql);
		reactions = query.list();
		count = reactions.size();
//		count = reactions.get(0);
		return count;
		
		
	}
	
	public void setReactionForStudent(PostReactionsLtidemoBean postReactions) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(postReactions);
		
	}
	public void setCommentReactionForStudent(CommentReactionsLtidemoBean cr) {
		Session session = this.sessionFactory.getCurrentSession();
		cr.setCommentId(cr.getPostId());
		
		session.save(cr);
		
	}

	public void updateReactionForStudent(PostReactionsLtidemoBean postReactions) {
		Session session = this.sessionFactory.getCurrentSession();
//		session.update(postReactions);
		Query qry1=null;
		if(postReactions.getReactionType().isEmpty() ) {
			qry1 = session.createQuery( 
					"delete from PostReactionsLtidemoBean where postId=:postId and userId=:userId");
			qry1.setParameter("postId", postReactions.getPostId());
			qry1.setParameter("userId", postReactions.getUserId());
		}else {
			qry1 = session.createQuery(
					"update PostReactionsLtidemoBean set reactionType=:reactionType where postId=:postId and userId=:userId");
			qry1.setParameter("reactionType", postReactions.getReactionType());
			qry1.setParameter("postId", postReactions.getPostId());
			qry1.setParameter("userId", postReactions.getUserId());
		}
		qry1.executeUpdate();
	
	}
	
	public void updateCommentReactionForStudent(CommentReactionsLtidemoBean cr) {
		Session session = this.sessionFactory.getCurrentSession();
//		session.update(postReactions);
		Query qry1=null;
		if(cr.getReactionType().isEmpty() ) {
			qry1 = session.createQuery( 
					"delete from CommentReactionsLtidemoBean where postId=:postId and userId=:userId");
			qry1.setParameter("postId", cr.getPostId());
			qry1.setParameter("userId", cr.getUserId());
		}else {
			qry1 = session.createQuery(
					"update  CommentReactionsLtidemoBean set reactionType=:reactionType where postId=:postId and userId=:userId");
			qry1.setParameter("reactionType", cr.getReactionType());
			qry1.setParameter("postId", cr.getPostId());
			qry1.setParameter("userId", cr.getUserId());
		}
		qry1.executeUpdate();
	
	}

	public long getCountofReactions(RequestBeanLtidemoBean req) {
		int post_id = req.getPost_id();
		String post_type=req.getPostType();
		Session session = this.sessionFactory.getCurrentSession();
       String table =(post_type.equalsIgnoreCase("comment")) ? "CommentReactionsLtidemoBean":"PostReactionsLtidemoBean"; //by default PostReactions table is selected
       long count = 0;
       if(post_type.equalsIgnoreCase("comment")) {

  			count = ((Long)session.createQuery("select count(*) from "+table+"  where commentId=:post_id").setParameter("post_id", post_id).uniqueResult()).intValue();

       }else {

   			count = ((Long)session.createQuery("select count(*) from "+table+"  where postId=:post_id").setParameter("post_id", post_id).uniqueResult()).intValue();

       }

		return count;
	}
	
	public long getUserAlreadyLiked(int postId,String userId) {
		Session session = this.sessionFactory.getCurrentSession();

		long count = ((Long)session.createQuery("select count(*) from PostReactionsLtidemoBean where postId=:postId and userId=:userId")
				.setParameter("postId", postId)
				.setParameter("userId", userId)
				.uniqueResult()).intValue();

		return count;
	}

	public List getReactions(RequestBeanLtidemoBean req) {
		int post_id = req.getPost_id();
		String post_type=req.getPostType();
		String table =(post_type.equalsIgnoreCase("comment")) ? "CommentReactionsLtidemoBean":"PostReactionsLtidemoBean"; //by default PostReactions table is selected
		
		Session session = this.sessionFactory.getCurrentSession(); 
 
		Query query  = session.createQuery("select distinct reactionType from "+table+"  where postId=:post_id");  
		query.setParameter("post_id", post_id);
		query.setMaxResults( 3);
		List list = query.list();
		return list;
	}
	
	public List<PostReactionsLtidemoBean> getReactedUserList(int post_id) {

		Session session = this.sessionFactory.getCurrentSession();
 
		Query query  = session.createQuery(" from PostReactionsLtidemoBean where postId=:post_id");  
		query.setParameter("post_id", post_id);
		query.setMaxResults( 6);
		List<PostReactionsLtidemoBean> list = query.list();
		return list;
	}
	
	public List<CommentsLtidemoBean> getSubComments(RequestBeanLtidemoBean req) {
		Session session = this.sessionFactory.getCurrentSession();
		
		String sql = " FROM CommentsLtidemoBean WHERE master_comment_id=:id order by createdDate " ;
		
		Query query = session.createQuery(sql);
		query.setParameter("id", req.getId());
		query.setFirstResult(( req.getOffset() - 1) * req.getLimit());
		query.setMaxResults( req.getLimit());
		List<CommentsLtidemoBean> list = query.list();
		
		return list;
	}
	
	public List mGetSubComments(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "select c.id,c.post_id,c.comment,c.createdDate,c.master_comment_id, "
			 		+ "s.firstName,s.lastName, s.imageUrl from lti.post_comments c, exam.students s "   
					+ "where c.master_comment_id=:id and s.sapid=c.sapid order by createdDate desc";
			    
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		query.setParameter("id", id);
		return query.list();
	}
	
	
	
	public int submitComment(CommentsLtidemoBean comment) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(comment); 
		return comment.getId();
	} 

	public Long insertGroups(GroupBean groups) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(groups);
		return groups.getId();
		
	}
	
	public List<GroupBean> getGroupsForFaculty(String userId) {
		Session session = this.sessionFactory.getCurrentSession();
		
//		String sql = "from GroupBean where createdBy=:userId";
//		SQLQuery query = session.createSQLQuery(sql);
//		query.addEntity(GroupBean.class);
		List<GroupBean> groupList = new ArrayList<GroupBean>();
		try {
		Query query = session.createQuery("from GroupBean where createdBy=:userId");
		query.setParameter("userId", userId);
		groupList = query.list();
		
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return groupList;
	}
	
	public boolean deleteGroup(long groupId) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			GroupBean group = (GroupBean) session.load(GroupBean.class, new Long(groupId));
			if (null != group) {
				session.delete(group);
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<GroupsMembers> getGroupMember(long groupId){
		Session session = this.sessionFactory.getCurrentSession();
		List<GroupsMembers> listOfMember = null;
		try {
			Query query = session.createQuery("from GroupsMembers where groupid=:groupId");
			query.setParameter("groupId", groupId);
			listOfMember = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return listOfMember;
	}
	
	public List<StudentLtidemoBean> getMembersToAdd(long groupId, String timeBoundId){
		Session session = this.sessionFactory.getCurrentSession();
		List<StudentLtidemoBean> listOfMember = null;
		try {
			String sql =  " select s.* from exam.students s, exam.program_sem_subject pss, exam.registration r "
						+ " where r.month = '" +CURRENT_MBAWX_ACAD_MONTH+ "' and r.year = "+CURRENT_MBAWX_ACAD_YEAR+" "
						+ " and s.sapid = r.sapid "
						+ " and s.sapid not in (select sapid from lti.groups_members where groupid =:groupId) "
						+ " and (s.programStatus <> 'Program Terminated' or s.programStatus is null) "
						+ " and s.consumerProgramStructureId = pss.consumerProgramStructureId "
						+ " and pss.sem = r.sem and pss.active = 'Y' "
						+ " and pss.id =( select prgm_sem_subj_id from lti.student_subject_config where id=:timeBoundId )  " ;
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(StudentLtidemoBean.class);
			query.setParameter("groupId", groupId);
			query.setParameter("timeBoundId", timeBoundId);
			listOfMember = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return listOfMember;
	}
	
	public boolean removeFromGroup (String sapId, long groupId){
		Session session = this.sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("DELETE FROM GroupsMembers WHERE groupid=:groupId and sapid=:sapId");
			query.setParameter("groupId", groupId);
			query.setParameter("sapId", sapId);
			int result = query.executeUpdate();
			if (result != 0) {
				return true;
			} else {
				return false;
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
			
	}
	
	public boolean addInGroup (String sapId, long groupId, String userId){
		Session session = this.sessionFactory.getCurrentSession();
		try {
			GroupsMembers member = new GroupsMembers();
			member.setGroupid(groupId);
			member.setSapid(sapId);
			member.setCreatedBy(userId);
			member.setLastModifiedBy(userId);
			
			session.save(member);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
			
	}
	
	public String getTimeBoundId (String Prgm_Sem_Sub_Id){
		Session session = this.sessionFactory.getCurrentSession();
		String timeBoundId = (String)session.createCriteria(StudentSubjectConfig.class)
										.add(Restrictions.eq("prgm_sem_subj_id", Prgm_Sem_Sub_Id))
										.add(Restrictions.eq("acadYear", CURRENT_MBAWX_ACAD_YEAR))
										.add(Restrictions.eq("acadMonth", CURRENT_MBAWX_ACAD_MONTH))
										.setProjection(Property.forName("id"))
										.uniqueResult();
		return timeBoundId;
		
	}
	
	public List<ConsumerTypes> getConsumerType() {
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("from ConsumerTypes");// here persistent class name is ConsumerType
		List<ConsumerTypes> list = query.list();
		return list;
	}
	
	public String groupName (long groupId){
		Session session = this.sessionFactory.getCurrentSession();
		String name = (String)session.createCriteria(GroupBean.class).add(Restrictions.eq("id", groupId))
																	 .setProjection(Property.forName("groupName"))
																	 .uniqueResult();
		return name;
	}
	
	public FacultyLtidemoBean getFacultyData (String userId){
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from FacultyLtidemoBean F where F.facultyId=:facultyId");
		query.setParameter("facultyId", userId);
		
		FacultyLtidemoBean facultyData;
		try {
			facultyData = (FacultyLtidemoBean) query.list().get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			facultyData = new FacultyLtidemoBean();
			logger.error("getFacultyData Error "+e.getMessage());
		}
		return facultyData; 
	}
	
	public List getGroupsForStudent(String userId){
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT gm.*,g.groupName FROM lti.groups_members gm, lti.groups g where gm.groupid = g.id and sapid=:sapid ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		query.setParameter("sapid", userId);
		List listOfGroups = query.list();
		return listOfGroups;
	}
	
	public List getGroupsForStudentByTimeBoundId(String userId, int timeboundId){
		Session session = this.sessionFactory.getCurrentSession();
		String sql  = " SELECT gm.*,g.groupName, g.timeBoundId "
					+ " FROM lti.groups_members gm, lti.groups g where gm.groupid = g.id and sapid=:sapid "
					+ " and g.timeboundId=:timeboundId " ;
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		query.setParameter("sapid", userId);
		query.setParameter("timeboundId", timeboundId);
		List listOfGroups = query.list();
		return listOfGroups;
	}
	
	public List getListOfGroupsMembersForStudent(String userId, int timeboundId){
		Session session = this.sessionFactory.getCurrentSession();
		String sql  = " SELECT g.groupName,  g.timeBoundId, s.firstName, s.lastName, s.imageUrl , gm.* FROM lti.groups_members gm "
					+ " inner join lti.groups g on g.id = gm.groupid "
					+ " inner join exam.students s on s.sapid = gm.sapid"
					+ " where g.timeboundId=:timeboundId and gm.sapid!=:sapid "
					+ " group by gm.sapid ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		query.setParameter("timeboundId", timeboundId);
		query.setParameter("sapid", userId);
		List listOfMember = query.list();
		return listOfMember;
	}
	
	
	public List getGroupsForFacculty(String userId){
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT gm.*,g.groupName FROM lti.groups_members gm, lti.groups g where gm.groupid = g.id and sapid=:sapid ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		query.setParameter("sapid", userId);
		List listOfGroups = query.list();
		return listOfGroups;
	}
	
	public String facultyImgUrl (String userId){
		Session session = this.sessionFactory.getCurrentSession();
		String imgUrl = (String)session.createCriteria(FacultyLtidemoBean.class).add(Restrictions.eq("facultyId", userId))
																	 .setProjection(Property.forName("imgUrl"))
																	 .uniqueResult();
		return imgUrl;
	}
	public Post getPostDetailById(int post_id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Post  where post_id=:post_id");
		query.setParameter("post_id", post_id);
		Post post = (Post) query.list().get(0);
		return post;
	}
	
	public FacultyLtidemoBean getFacultyDetailsByUserId(String userId){
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "select * from acads.faculty where facultyId =:userId";
		FacultyLtidemoBean facultyDetails = null;
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(FacultyLtidemoBean.class);
			query.setParameter("userId", userId);
			facultyDetails = (FacultyLtidemoBean) query.list().get(0);
		} catch (Exception e){
			//e.printStackTrace();
		}
		return facultyDetails;
	}	
	
	public List<GroupBean> getGroupsNameForFaculty(String timeBoundId, String userId){
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GroupBean G where G.timeBoundId=:timeBoundId and createdBy=:userId ");
		query.setParameter("timeBoundId", timeBoundId);
		query.setParameter("userId", userId);
		List<GroupBean> groupList = query.list();
		return groupList;
		
	}

	public List<Post> getPostWithScheduleTime() {
		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery("select * from lti.post  where scheduleFlag=:flag ");
		query.addEntity(Post.class);
		query.setParameter("flag","Y");
		List<Post> post =  query.list();
		return post; 
	}
	
	public List<Hashtag> getHashtags(String program_sem_subject_id){
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Hashtag H where H.program_sem_subject_id=:program_sem_subject_id ");
		query.setParameter("program_sem_subject_id", program_sem_subject_id);
		List<Hashtag> listOfHashtags = query.list();
		return listOfHashtags;

	}
	
	public ArrayList<String> getTimeBoundStudentsList(String timeBoundId, long groupId){
		
		Session session = sessionFactory.getCurrentSession();
		String sql =  " select s.sapid from exam.students s "
					+ " INNER JOIN  exam.program_sem_subject pss on s.consumerProgramStructureId = pss.consumerProgramStructureId "
					+ " INNER JOIN  exam.registration r on s.sapid = r.sapid  and r.sem = pss.sem "
					+ " where r.month = '" + CURRENT_MBAWX_ACAD_MONTH + "' and r.year = "+ CURRENT_MBAWX_ACAD_YEAR +" "
					+ " and pss.id=(select prgm_sem_subj_id from lti.student_subject_config where id=:timeBoundId ) "
					+ " and pss.active = 'Y' and (s.programStatus <> 'Program Terminated' or s.programStatus is null) "
					+ " and s.sapid not in (select sapid from lti.groups_members where groupid =:groupId) ";
		
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("timeBoundId", timeBoundId);
		query.setParameter("groupId", groupId);
		ArrayList<String> studentList = (ArrayList<String>) query.list();
		return studentList;
	}
	
	public List<String> getSearchKeywordList(String keyword){
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery("SELECT hashtag FROM lti.hashtag where hashtag LIKE '%"+keyword+"%';");
		List<String> keywordList = query.list();
		return keywordList;
	}
	 
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public ArrayList<String> batchUpdateStudentToGroup(final List<GroupsMembers> studentSapIdList){
		
		ArrayList<String> errorList = new ArrayList<>();
		int i = 0;
		for (i = 0; i < studentSapIdList.size(); i++) {
			try {
				GroupsMembers bean = studentSapIdList.get(i);
				insertGroupMember(bean);
			} catch (Exception e) {
				e.printStackTrace();
				errorList.add(2+i+"");
			}
		}
		return errorList;
	}
	
	public void insertGroupMember(GroupsMembers bean) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.save(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Integer> getTimeBoundIdBasedOnSubjectId(String subjectId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " SELECT id from lti.student_subject_config WHERE prgm_sem_subj_id in"
					+ " ("+subjectId+") "
					+ " AND acadYear = "+CURRENT_MBAWX_ACAD_YEAR+" "
					+ " AND acadMonth = '"+CURRENT_MBAWX_ACAD_MONTH+"' "
					+ " AND startDate <= curdate() ";

		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	
	public List<Integer> getTimeBoundIdForFaculty(String userId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =" SELECT timebound_subject_config_id FROM lti.timebound_user_mapping tum " + 
					" 	INNER JOIN " + 
					" lti.student_subject_config ssc ON ssc.id = tum.timebound_subject_config_id " + 
					" 	AND userId ='"+userId+"' and role IN ('Faculty','Grader') " +
					" 	AND acadYear = "+CURRENT_MBAWX_ACAD_YEAR+" " +
					" 	AND acadMonth = '"+CURRENT_MBAWX_ACAD_MONTH+"' ";
		
		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	
	public List<Integer> getCurrentPreviousTimeBoundIdBasedOnUserId(String userId,String type) {
		
		String timePeriod = " and CURDATE() >= sc.startDate ";
		if(type.equalsIgnoreCase("Active")) {
			timePeriod = " and sc.startDate <= CURDATE() and CURDATE() <= sc.endDate ";
		}
		  
		Session session = this.sessionFactory.getCurrentSession();
		String sql =    " SELECT " + 
						"    sc.id " + 
						" FROM " + 
						"    lti.student_subject_config sc " + 
						"        INNER JOIN " + 
						"    lti.timebound_user_mapping tm ON tm.timebound_subject_config_id = sc.id " + 
						"        INNER JOIN " + 
						"    exam.program_sem_subject pss ON pss.id = sc.prgm_sem_subj_id " + 
						" WHERE " + 
						"    tm.userId = '"+userId+"' " + 
						"	 AND sc.acadYear = '" + CURRENT_MBAWX_ACAD_YEAR+ "' " +
						"	 AND sc.acadMonth = '" + CURRENT_MBAWX_ACAD_MONTH + "' " +
							 timePeriod ;
		
		List<Integer> timeBoundId = new ArrayList<Integer>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			timeBoundId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return timeBoundId;
	}
	
//	public String reportPost(String userId,int postid,String action){
//		
//		Session session = sessionFactory.getCurrentSession();
//		String sql =  " INSERT INTO lti.post_report_list (userId, postId, action) VALUES (userId,postId,action) ";
//		SQLQuery query = session.createSQLQuery(sql);
//		query.setParameter("userId", userId);
//		query.setParameter("postId", postid);
//		query.setParameter("action", action);
//		return studentList;
//	}
	
	public String reportPost(PostReportList postReportList) {
		String msg = "";
		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.save(postReportList);
			msg = "success";
			return msg;	
		} catch (Exception e) {
			msg = "error";
			return msg;
		}
		
		
	}
	
	public Boolean checkForReport(PostReportList postReportList) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " SELECT * FROM lti.post_report_list "
					+ " WHERE userId = "+ postReportList.getUserId() +" "
					+ " AND postId = "+ postReportList.getPostId() +" "
					+ " AND action = '"+ postReportList.getAction() +"' ";
		List<Integer> list = new ArrayList<Integer>();
			SQLQuery query = session.createSQLQuery(sql);
			list = query.list();
			
			if(list.size()>0) {
				return true;
			}else {
				return false;
			}
	}


	public String deleteCommentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		String returnFlag;
		try {
			CommentsLtidemoBean c = (CommentsLtidemoBean) session.load(CommentsLtidemoBean.class, new Integer(id));
			int post_id = c.getPost_id();
			
			if (null != c) {
				session.delete(c);
				Query qry = session.createQuery("DELETE from CommentsLtidemoBean where master_comment_id=:id");
				qry.setParameter("id",id);
				int result = qry.executeUpdate();
				/*
				Post post = getPost(post_id);
				post.setTimeboundId(post.getSubject_config_id());
				insertToRedis(post);
				*/
				
				
				returnFlag= post_id+"";
			}else {
				returnFlag= "";
			}
			
			//hitRefreshCacheByPostId(post_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			returnFlag= e.getMessage();
		}
		
		
		
		return returnFlag;
	}
	
	public void hitRefreshCacheByPostId(int post_id) {
		
		try {

			Post post = getPost(post_id);
			post.setTimeboundId(post.getSubject_config_id());
			insertToRedis(post);
		} catch (Exception e) {
			e.printStackTrace();
		}
    
	}
	
	public List<StudentLtidemoBean> getTimeBoundStudentsForBatchUpload(){
		
		Session session = this.sessionFactory.getCurrentSession();
		List<StudentLtidemoBean> listOfStudent = null;
		try {
			String sql =  " SELECT * from exam.students "
						+ " WHERE sapid not in (SELECT userId from lti.timebound_user_mapping where role = 'Student') " 
						+ " AND program = 'MBA - WX' and consumerProgramStructureId = 111 " ;
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(StudentLtidemoBean.class);
			listOfStudent = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return listOfStudent;
	}
	
	public List<ProgramSemSubjectBean> getAllSubjectForStudent(StudentLtidemoBean student) {
		Session session = this.sessionFactory.getCurrentSession();
		List<ProgramSemSubjectBean> listOfSubjects = new ArrayList<ProgramSemSubjectBean>();

		if ("3".equalsIgnoreCase(student.getSem()) || "4".equalsIgnoreCase(student.getSem())) {
			String sql =" SELECT  " + 
					"   pss.* " + 
					" FROM " + 
					"    lti.timebound_user_mapping tum " + 
					"        INNER JOIN " + 
					"    lti.student_subject_config ssc ON ssc.id = tum.timebound_subject_config_id " + 
					"        INNER JOIN " + 
					"    exam.program_sem_subject pss ON pss.id = ssc.prgm_sem_subj_id " + 
					"        INNER JOIN " + 
					"    lti.mba_specialisation_details msd ON msd.sapid = tum.userId " + 
					"        AND tum.userId =:sapid " + 
					"		 AND ssc.acadMonth =:acadMonth " +
					"		 AND ssc.acadYear =:acadYear " +
					"        AND pss.subject IN (SELECT  " + 
					"            subject " + 
					"        FROM " + 
					"            exam.program_sem_subject " + 
					"        WHERE " + 
					"            specializationType IN (SELECT  " + 
					"                    id " + 
					"                FROM " + 
					"                    exam.specialization_type " + 
					"                WHERE " + 
					"                    specializationType <> 'No Specialization')) " ;
			try {
				SQLQuery query = session.createSQLQuery(sql);
				query.addEntity(ProgramSemSubjectBean.class);
				query.setParameter("acadMonth", student.getMonth());
				query.setParameter("acadYear", student.getYear());
				query.setParameter("sapid", student.getSapid());
				listOfSubjects = query.list();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return listOfSubjects;
			
		} else {
			
			String sql =" SELECT  " + 
						"    pss.* " + 
						" FROM " + 
						"	 exam.program_sem_subject pss " + 
						" WHERE " + 
						"    sem = (SELECT " + 
						"            sem " + 
						"        FROM " + 
						"            exam.registration " + 
						"        WHERE " + 
						"            sapid =:sapid " + 
						" 			 AND month=:month " +
						" 			 AND year=:year " +
						"        ORDER BY sem DESC " + 
						"        LIMIT 1) " +
						"        AND pss.consumerProgramStructureId =:consumerProgramStructureId " ;
			
			try {	
				SQLQuery query = session.createSQLQuery(sql);
				query.addEntity(ProgramSemSubjectBean.class);
				query.setParameter("consumerProgramStructureId", student.getConsumerProgramStructureId());
				query.setParameter("sapid", student.getSapid());
				query.setParameter("month", CURRENT_MBAWX_ACAD_MONTH);
				query.setParameter("year", CURRENT_MBAWX_ACAD_YEAR);
				listOfSubjects = query.list();
			} catch (Exception e) { 
				e.printStackTrace();
			}
		}
		return listOfSubjects;
	}
	
	public Integer getTimeBoundIdBySubjectId (int subjectId, String batch) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " select id from lti.student_subject_config where prgm_sem_subj_id =:subjectId "
					+ " and batch =:batch"
					+ " and acadYear="+CURRENT_MBAWX_ACAD_YEAR+" "
					+ " and acadMonth='" +CURRENT_MBAWX_ACAD_MONTH+ "' ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("subjectId", subjectId);
		query.setParameter("batch", batch);
		Integer timeBoundId = (Integer) query.list().get(0);
		return timeBoundId;
	}
	
	public boolean insertTimeBoundStudentMapping(TimeBoundStudentMapping bean) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.save(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public int getCountOfBatchStudents (String batch) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " SELECT COUNT(DISTINCT sapid) FROM TimeBoundStudentMapping where batch =:batch ";
		Query query = session.createQuery(sql);
		query.setParameter("batch", batch);
		int count = ((Long) query.uniqueResult()).intValue();
		return count;
	}
	
	public List<String> getBatchNames(){
		Session session = sessionFactory.getCurrentSession();
		String sql =" SELECT  " + 
					"    name " + 
					" FROM " + 
					"    exam.batch " + 
					" WHERE " + 
					"    acadYear = '" +CURRENT_MBAWX_ACAD_YEAR+ "' AND acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+ "' ";
		
		SQLQuery query = session.createSQLQuery(sql);
		List<String> batchList = query.list();
		return batchList;
	}
	
	
	public StudentSubjectConfig getTimeDetailsByTimeBoundId(int timeBoundId) {

		String id = Integer.toString(timeBoundId);
		Session session = this.sessionFactory.getCurrentSession();
		StudentSubjectConfig bean = new StudentSubjectConfig();
		Query query = session.createQuery("From StudentSubjectConfig where id=:id");
		query.setParameter("id", id);

		try {
			bean = (StudentSubjectConfig) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return bean;
	}
	
	public String getUserRole (String userId) {
		
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT roles FROM portal.user_authorization where userId =:userId";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		String role = "";
		try {
			role = (String) query.list().get(0);
		} catch (Exception e) {
			//e.printStackTrace();
			return role;
		}
		return role;
	}

	public List getConsumerTypesForAdmin() {
		
		Session session = this.sessionFactory.getCurrentSession();
		String sql ="SELECT " + 
				"    cps.consumerTypeId AS consumerId, " + 
				"    ct.name AS consumerType, " + 
				"    cps.programId AS p_id, " + 
				"    p.code AS program, " + 
				"    cps.programStructureId AS ps_id, " + 
				"    ps.program_structure AS program_structure, " + 
				"    pss.id AS pss_id, " + 
				"    pss.subject, " + 
				"    ssc.id AS config_id, " + 
				"    b.name AS batchName " + 
				"FROM " + 
				"    exam.program_sem_subject pss " + 
				"        INNER JOIN " + 
				"    exam.consumer_program_structure cps ON cps.id = pss.consumerProgramStructureId " + 
				"        INNER JOIN " + 
				"    exam.consumer_type ct ON ct.id = cps.consumerTypeId " + 
				"        INNER JOIN " + 
				"    exam.program_structure ps ON ps.id = cps.programStructureId " + 
				"        INNER JOIN " + 
				"    exam.program p ON p.id = cps.programId " + 
				"        INNER JOIN " + 
				"    lti.student_subject_config ssc ON ssc.prgm_sem_subj_id = pss.id " + 
				"		INNER JOIN " + 
				"	exam.batch b ON b.id = ssc.batchId ";
		
		
		/*String sql =  " SELECT cps.consumerTypeId as consumerId, ct.name as consumerType ," 
					+ " cps.programId as  p_id, p.code as program , " 
					+ " cps.programStructureId as ps_id , ps.program_structure as program_structure, " 
					+ " pss.id as pss_id, pss.subject, ssc.id as config_id, ssc.batchId " 
					+ " FROM exam.program_sem_subject pss " 
					+ " INNER JOIN exam.consumer_program_structure cps ON cps.id = pss.consumerProgramStructureId " 
					+ " INNER JOIN exam.consumer_type ct ON ct.id = cps.consumerTypeId " 
					+ " INNER JOIN exam.program_structure ps ON ps.id = cps.programStructureId " 
					+ " INNER JOIN exam.program p on p.id = cps.programId "
					+ " INNER JOIN lti.student_subject_config ssc on ssc.prgm_sem_subj_id = pss.id ";*/
		
		SQLQuery query = session.createSQLQuery(sql);		
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		return list;
	}
	
	public int getConsumerProgramStructureId (Post post) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " Select id from exam.consumer_program_structure "
				 	+ " where programId =:programId and programStructureId =:programStructureId and consumerTypeId =:consumerTypeId ";
		SQLQuery query = session.createSQLQuery(sql);
		
		query.setParameter("programId", Integer.parseInt(post.getProgram()));
		query.setParameter("programStructureId", Integer.parseInt(post.getProgramStructure()));
		query.setParameter("consumerTypeId", Integer.parseInt(post.getConsumerType()));
		int consumerProgramStructureId = 0;
		try {
			consumerProgramStructureId = (Integer) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return consumerProgramStructureId;
	}
	
	public int getGenericTimeBoundId (String consumerProgramStructureId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  " SELECT subject_config_id from lti.post " 
					+ " WHERE acadYear=" +CURRENT_MBAWX_ACAD_YEAR+ "  AND acadMonth = '" +CURRENT_MBAWX_ACAD_MONTH+ "'  "
					+ " AND subject_config_id like '%"+consumerProgramStructureId+"' ";
		
		SQLQuery query = session.createSQLQuery(sql);
		int genericTimeBoundId = 0;
		try {
			genericTimeBoundId = (Integer) query.list().get(0);
		} catch (Exception e) {    
		}
		return genericTimeBoundId;
	}

	public List<ChatUserBean> getContactsForChatBasedOnBatch(String sapId) {
		
		Session session = this.sessionFactory.getCurrentSession();
		List<ChatUserBean> listOfContacts = new ArrayList<ChatUserBean>();
		
		try {
			/*
			 * commented out old query to get more details about student in contact
			String sql =  " SELECT firstName,lastName,sapId,imageUrl from exam.students where sapId in "
						+ " (SELECT userid from lti.timebound_user_mapping where timebound_subject_config_id in "
						+ " (SELECT timebound_subject_config_id from lti.timebound_user_mapping "
						+ " WHERE userId =:sapId) group by userId) "
						// Dont include our test ids
						+ " AND sapId NOT IN ( " + TEST_USER_SAPIDS + " )" 
						+ " UNION "          
  						+ " SELECT 'Course','Coordinator' ,userId, '' from portal.user_authorization where userId in " +
						 " (SELECT userid from lti.timebound_user_mapping where timebound_subject_config_id in " + 
						 " (SELECT timebound_subject_config_id from lti.timebound_user_mapping " +
						  " WHERE userId =:sapId) group by userId) " +
						// # Dont include our test ids
						 " AND userId NOT IN (   " + TEST_USER_SAPIDS + "   )  ";
			*/
			
			String hql = "SELECT "
					+ "    s.firstName, s.lastName, s.sapId, s.imageUrl, s.program, b.name as batch, pss.subject "
					+ "FROM "
					+ "    lti.timebound_user_mapping tum "
					+ "        INNER JOIN "
					+ "    lti.student_subject_config ssc ON tum.timebound_subject_config_id = ssc.id "
					+ "        INNER JOIN "
					+ "    exam.program_sem_subject pss ON ssc.prgm_sem_subj_id = pss.id "
					+ "        INNER JOIN "
					+ "    exam.batch b ON ssc.batchId = b.id "
					+ "        INNER JOIN "
					+ "    exam.students s ON tum.userId = s.sapid "
					+ "WHERE "
					+ "    timebound_subject_config_id IN (SELECT  "
					+ "            timebound_subject_config_id "
					+ "        FROM "
					+ "            lti.timebound_user_mapping "
					+ "        WHERE "
					+ "            userId = :sapId) AND tum.userId NOT IN ( :TEST_USER_SAPIDS )"
					+ "GROUP BY userId "
					+ "UNION "
					+ "SELECT  "
					+ "    'Course', 'Coordinator', userId, '', '', '', '' "
					+ "FROM "
					+ "    portal.user_authorization "
					+ "WHERE "
					+ "    userId IN (SELECT  "
					+ "            userid "
					+ "        FROM "
					+ "            lti.timebound_user_mapping "
					+ "        WHERE "
					+ "            timebound_subject_config_id IN (SELECT  "
					+ "                    timebound_subject_config_id "
					+ "                FROM "
					+ "                    lti.timebound_user_mapping "
					+ "                WHERE "
					+ "                    userId = :sapId) "
					+ "        GROUP BY userId)";
			
//			query.addEntity(ChatUserBean.class);
//			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			Query query = session.createSQLQuery(hql);
			query.setParameter("sapId", sapId);
			query.setParameter("sapId", sapId);
			query.setParameter("TEST_USER_SAPIDS", TEST_USER_SAPIDS);
			query.setResultTransformer(Transformers.aliasToBean(ChatUserBean.class));
			listOfContacts = query.list();
			
//			if(results.size() > 0) {
//				for(int i = 0; i< results.size(); i++) {
//					Object[] result = results.get(i);
//					ChatUserBean user = new ChatUserBean();
//					if(result[0] != null) {
//						user.setFirstName(result[0].toString());
//					}
//					if(result[1] != null) {
//						user.setLastName(result[1].toString());;
//					}
//					if(result[2] != null) {
//						user.setSapId(result[2].toString());
//					}
//					if(result[3] != null) {
//						user.setImageUrl(result[3].toString());
//					}
//					listOfContacts.add(user);
//				}
//			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return listOfContacts;
		
	}
	
	public String getBatchNameBySapId (String userId) {
		
		Session session = this.sessionFactory.getCurrentSession();
		/*String sql =" SELECT b.name as batchname from lti.timebound_user_mapping tum " + 
					" INNER JOIN lti.student_subject_config ssc on tum.timebound_subject_config_id =  ssc.id " + 
					" INNER JOIN exam.batch b on ssc.batchId = b.id " + 
					" where userId = :userId limit 1 ";*/
		
		String sql =" SELECT  " + 
					"    b.name AS batchname " + 
					" FROM " + 
					"    lti.timebound_user_mapping tum " + 
					"        INNER JOIN " + 
					"    lti.student_subject_config ssc ON tum.timebound_subject_config_id = ssc.id " + 
					"        INNER JOIN " + 
					"    exam.batch b ON ssc.batchId = b.id " + 
					"        AND ssc.acadYear = b.acadYear " + 
					"        AND ssc.acadMonth = b.acadMonth " + 
					" WHERE " + 
					"    userId =:userId " + 
					"        AND CONCAT(ssc.acadMonth, '-', ssc.acadYear) = (SELECT  " + 
					"            CONCAT(month, '-', year) " + 
					"        FROM " + 
					"            exam.registration " + 
					"        WHERE " + 
					"            sapid =:userId " + 
					"        ORDER BY sem DESC " + 
					"        LIMIT 1) " + 
					"	GROUP BY b.name " +
					"	ORDER BY COUNT(b.name) DESC " +
					" LIMIT 1 ";
		
		
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("userId", userId);
		String batch = "";
		try {
			batch = (String) query.list().get(0);
		} catch (Exception e) {
			//e.printStackTrace();
			return batch;
		}
		return batch;
	}
	public CommentsLtidemoBean getCommentById(int master_comment_id) {
		Session session = this.sessionFactory.getCurrentSession();
		CommentsLtidemoBean comment= null ;
		try {
			//comment = (Comments) session.get(Comments.class, new Integer(master_comment_id));
			comment = (CommentsLtidemoBean) session.get(CommentsLtidemoBean.class, master_comment_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return comment;
	}
	public StudentLtidemoBean getStudentDataBySapid(String sapid) {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<StudentLtidemoBean> results = new ArrayList<StudentLtidemoBean>();
		try {
			Criteria cr = session.createCriteria(StudentLtidemoBean.class);
			cr.add(Restrictions.eq("sapid", sapid));
			results = cr.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return results.get(0);
	}
	
	public Registration getSingleStudentsRegistrationData(String userId) {

		Session session = this.sessionFactory.getCurrentSession();
		Registration studentRegDeatails = new Registration();
		String sql =  " SELECT * from exam.registration WHERE sapid =:userId order by sem desc " ;
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Registration.class);
		query.setParameter("userId", userId);

		try {
			studentRegDeatails = (Registration) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return studentRegDeatails;
	}
	
	
	public List<String> getSpecialisationTypeBySapid(String userId) {
		Session session = sessionFactory.getCurrentSession();
//		String sql = "SELECT st.specializationType AS specialization_name FROM lti.mba_specialisation_details msd  " + 
//				"inner join exam.specialization_type st  " + 
//				"ON (msd.specialisation1 = st.id OR msd.specialisation2 = st.id)  " + 
//				"where msd.sapid =:userId";
		
		String sql="SELECT  " + 
				"    st.specializationType AS specialization_name " + 
				"FROM " + 
				"    (SELECT 'specialisation1' AS specialisation_rank, sapid, specialisation1 AS specialisation " + 
				"		FROM " + 
				"        lti.mba_specialisation_details " + 
				"    WHERE " + 
				"        sapid =:userId UNION ALL  " + 
				"         " + 
				"	SELECT  'specialisation2' AS specialisation_rank, sapid, specialisation2 AS specialisation " + 
				"		FROM " + 
				"        lti.mba_specialisation_details " + 
				"    WHERE " + 
				"        sapid =:userId ) s " + 
				"	INNER JOIN " + 
				"    exam.specialization_type st ON st.id = s.specialisation " + 
				"ORDER BY specialisation_rank asc";
		
		
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		List<String> specialisationList = query.list();

		return specialisationList;
	}

	public SessionBean getCorrespondingSession(int session_plan_module_id) {
		SessionBean sessionbean = null ;
		
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Query query = session.createQuery("from SessionBean where moduleId=:id");// here persistent class name is ConsumerType
			query.setParameter("id", session_plan_module_id ) ;
			sessionbean = (SessionBean) query.list().get(0);
		} catch (IndexOutOfBoundsException e) {
		}  
		return sessionbean; 
	}

	
	public List getSubjectForFaculty(String facultyId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT  " + 
					"    tum.*, pss.subject, ssc.batchId, b.name AS batchName" + 
					" FROM " + 
					"    lti.timebound_user_mapping tum " + 
					"        INNER JOIN " + 
					"    lti.student_subject_config ssc ON ssc.id = tum.timebound_subject_config_id " + 
					"        INNER JOIN " + 
					"    exam.batch b ON b.id = ssc.batchId " + 
					"        INNER JOIN " + 
					"    exam.program_sem_subject pss ON pss.id = ssc.prgm_sem_subj_id " + 
					" WHERE " + 
					"    userId =:facultyId " + 
					"        AND ssc.acadMonth = '"+CURRENT_MBAWX_ACAD_MONTH+"' " + 
					"        AND ssc.acadYear = '" + CURRENT_MBAWX_ACAD_YEAR + "' ";
		
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("facultyId", facultyId); 
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		
		return list;
	}
	
	public List<StudentLtidemoBean> getAllStudentsForPearsonMapping(String consumerProgramStructureId,String sem){
		
		Session session = this.sessionFactory.getCurrentSession();
		List<StudentLtidemoBean> studentsList = new ArrayList<StudentLtidemoBean>();
		String sql =" SELECT  " + 
					"    * " + 
					" FROM " + 
					"    exam.students s " + 
					"        INNER JOIN " + 
					"    exam.registration r ON s.sapid = r.sapid " + 
					"        AND s.consumerProgramStructureId = '"+consumerProgramStructureId+"' " + 
					"        AND r.sem = '"+sem+"' " + 
					"        AND r.month = 'Oct' " + 
					"        AND year = 2019 " + 
					"        AND (s.programStatus IS NULL " + 
					"        OR s.programStatus = '')";
		
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(StudentLtidemoBean.class);
		
		try {
			studentsList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentsList;
		
	}
	
	public Integer getLTIUserMappingId (String userId) {
		
		Session session = this.sessionFactory.getCurrentSession();
		Integer ltiUserId;
		String sql =  "SELECT id FROM lti.lti_users where userId =:userId ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		try {
			ltiUserId = (Integer) query.list().get(0);
			return ltiUserId;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public Long insertPearsonResourcesMapping(UserResourseMapping userMapping) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(userMapping);
		return userMapping.getId();
	}
	
	public List<LTIUsers> getStudentsForPearsonMapping(LTIUserResourcesMapping mappingBean){
		Session session = this.sessionFactory.getCurrentSession();
		List<LTIUsers> listOfStudent = null;
		try {
			String sql =" SELECT ls.*, ls.modifiedDate AS lastModifiedDate, ls.modifiedBy AS lastModifiedBy FROM " + 
						"    lti.timebound_user_mapping tum " + 
						"        INNER JOIN " + 
						"    lti.student_subject_config ssc ON ssc.id = tum.timebound_subject_config_id " + 
						"		 INNER JOIN " +
						"	 lti.lti_users ls on ls.userId = tum.userId " +
						"        AND ssc.acadYear = '"+mappingBean.getYear()+"' " +
						"		 AND acadMonth = '"+mappingBean.getMonth()+"' " + 
						"        AND ssc.id = '"+mappingBean.getTimeBoundId()+"' AND role = 'Student' " ;
			
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(LTIUsers.class);
			listOfStudent = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return listOfStudent;
	}
	
	public Boolean checkIfAlreadyExits(int userId, int resourceId) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql =  "select * from lti.lti_user_resourse_mapping where userId = '"+userId+"' and resourceId = '"+resourceId+"' ";
		List<Integer> list = new ArrayList<Integer>();
		SQLQuery query = session.createSQLQuery(sql);
		list = query.list();
		
		if(list.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public int insertLTIUsersResourcesMapping(LTIUserResourcesMapping ltiUserResourcesMapping) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.save(ltiUserResourcesMapping);
			return ltiUserResourcesMapping.getId();
			
		}catch (Exception e) {
 			e.printStackTrace();
 			return 0;
 		}
	}

	public String getSemByAcadYearMonth(String userId, int acadYear, String acadMonth) {
		
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "SELECT cast(sem as char(10)) FROM exam.registration where sapid =:userId and year =:acadYear and month =:acadMonth ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("acadYear", acadYear);
		query.setParameter("acadMonth", acadMonth);
		String sem = "";
		try {
			sem = (String) query.list().get(0);
		} catch (Exception e) {
			logger.error("getSemByAcadYearMonth Error "+e.getMessage());
		}
		return sem;
	}
}
