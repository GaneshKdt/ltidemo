package com.nmims.services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nmims.bean.ChatUserBean;
import com.nmims.bean.CommentReactionsLtidemoBean;
import com.nmims.bean.CommentsLtidemoBean;
import com.nmims.bean.ConsumerTypes;
import com.nmims.bean.ExamOrderBean;
import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.GroupBean;
import com.nmims.bean.GroupsMembers;
import com.nmims.bean.Hashtag;
import com.nmims.bean.LTIConsumerRequestBean;
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
import com.nmims.bean.Response;
import com.nmims.bean.SessionBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.StudentSubjectConfig;
import com.nmims.bean.SubjectsList;
import com.nmims.bean.TimeBoundStudentMapping;
import com.nmims.bean.UserResourseMapping;
import com.nmims.dao.LtiDao;
import com.nmims.dao.PostDao;

@Service("PostService")

@SuppressWarnings("unchecked")
public class PostService {

	@Value( "${POST_FILES_PATH}" )
	private String POST_FILES_PATH;
	
	@Value("${SERVER_PATH}")
	private String SERVER_PATH;

	public int pageLimit = 8;
	
	@Autowired
	PostDao postDao;
	
	@Autowired
	LtiDao ltiDao;
	
	@Transactional
	public LTIConsumerRequestBean getLtiLink(String user_id, String resource_id) {
		return ltiDao.getLtiLink(user_id, resource_id);
	}
	
	@Transactional
	public List getLtiResources(String user_id) {
		return ltiDao.getLtiResources(user_id);
	}
	
	@Transactional
	public List<FacultyLtidemoBean> getFacultyids(String timeBoundIds) {
		return postDao.getFacultyIds(timeBoundIds);
	}

	@Transactional
	public Map<String, Object> getPearsonAccess(String sapid) {
		return ltiDao.getPearsonAccessStudent(sapid);
	}

	@Transactional
	public List getAllPosts(RequestBeanLtidemoBean request) {
		return postDao.getAllPosts(request);
	}
	
//	@Transactional
//	public List getAllPostsByKeyword(int pageId, int total, String subjectsIds, String facultyIds, String userId, String filterBy,String keyword) {
//		return postDao.getAllPostsByKeyword(pageId, total, subjectsIds, facultyIds, userId,filterBy,keyword);
//	}

	@Transactional
	public Post getPost(int id) {
		return postDao.getPost(id);
	}

	@Transactional
	public String addPost(Post post, MultipartFile multipartFile) {

		String fileName = "";
		String result = "";
		try {
			if (multipartFile.isEmpty()) {
				if(post.getUrl().isEmpty()) {
					post.setType("Text");
				}else {
					post.setType("Resource");
				}
			} else {
				fileName = multipartFile.getOriginalFilename();
				String extension = "."+FilenameUtils.getExtension(multipartFile.getOriginalFilename());
				
				// Replace special characters in file
				/*
				fileName = fileName.replaceAll("'", "_");
				fileName = fileName.replaceAll(",", "_");
				fileName = fileName.replaceAll("&", "and");
				fileName = fileName.replaceAll(" ", "_");
				fileName = fileName.replaceAll(":", "_");
				fileName = fileName.replaceAll("'", "_");
		
				fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_"
						+ RandomStringUtils.randomAlphanumeric(10)
						+ fileName.substring(fileName.lastIndexOf("."), fileName.length());
						
				String extention =fileName.substring(fileName.lastIndexOf("."), fileName.length());
				*/
				
				long currentUnixTime = System.currentTimeMillis() / 1000L;
				fileName = currentUnixTime+"_"+RandomStringUtils.randomAlphanumeric(5)+extension;
				
				 switch (extension.toLowerCase()) {
				 case ".jpg":
				 case ".png":
				 case ".jpeg":
					 post.setType("Image");
					 break; 
					 
				 case ".mp4":	 
					 post.setType("Video");
					 break; 
					 
				 case ".doc":
				 case ".docx":
					 post.setType("File");
					 post.setFileType("Doc");
					 break;
					 
				 case ".pdf": 
					 post.setType("File");
					 post.setFileType("PDF");
					 break;
					 
				 case ".ppt":
				 case ".pptx":
					 post.setType("File");
					 post.setFileType("PPT");
					 break;
					 
				 case ".xls": 
				 case ".xlsx":
				 case ".csv":
					 post.setType("File");
					 post.setFileType("Excel");
					 break;
				
				 default: 
					 return "";
				 }
				
//				String timeStamp = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date());
				
				MultipartFile file = multipartFile;
				post.setFileName(POST_FILES_PATH + "/" + post.getUserId() + "/" + fileName);
				post.setFilePath(POST_FILES_PATH + "/" + post.getUserId() + "/");
				String msg = uploadFile(post, multipartFile);
				post.setFileName(fileName);
				post.setFilePath(post.getUserId() + "/" + fileName);
			}
			if(!StringUtils.isBlank(post.getCalendarDate()) ) {
				Date scheduledDate;
				try { //converting calender date format to timestamp
					String postDate = post.getCalendarDate() + " " + post.getCalendarTime();
					SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
					scheduledDate = sdf.parse(postDate);
					post.setScheduledDate(scheduledDate);
				} catch (Exception e) {
					e.printStackTrace();
				} 
				post.setScheduleFlag("Y"); 
			}
				result = postDao.addPost(post);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	@Transactional
	public boolean deletePost(int id) {
		return postDao.deletePost(id);
	}

	@Transactional
	public StudentLtidemoBean getSingleStudentsData(String sapid) {
		return postDao.getSingleStudentsData(sapid);
	}
	
	@Transactional
	public String reportPost(PostReportList postReportList) {
	
		if(postDao.checkForReport(postReportList)) {
			return "Already Reported";
		}else {
			return postDao.reportPost(postReportList);	
		}	
	}

	@Transactional
	public List<String> getSubjectsList(StudentLtidemoBean student) {
		List<String> ps = postDao.getSubjectsList(student);
		return ps;
	}

	@Transactional
	public List getConsumerTypes(String facultyId) {
		List ps = postDao.getConsumerTypes(facultyId);
		return ps;
	}

	@Transactional
	public List<ProgramStructure> getProgramStructureByConsumerType(int id) {
		List<ProgramStructure> res = postDao.getProgramStructureByConsumerType(id);
		return res;
	}

	@Transactional
	public List<Programs> getProgramByConsumerType(int id) {
		List<Programs> res = postDao.getProgramByConsumerType(id);
		return res;
	}

	@Transactional
	public List<ProgramSemSubject> getSubjectByConsumerType(int id, String programDataId,
			String programStructureDataId) {
		List<ProgramSemSubject> res = postDao.getSubjectByConsumerType(id, programDataId, programStructureDataId);
		return res;
	}

	@Transactional
	public List<Programs> getProgramByConsumerTypeAndPrgmStructure(int consumerTypeId, int programStructureId) {
		List<Programs> res = postDao.getProgramByConsumerTypeAndPrgmStructure(consumerTypeId, programStructureId);
		return res;
	}

	private String uploadFile(Post bean, MultipartFile file) {

		InputStream inputStream = null;
		OutputStream outputStream = null;

		String fileName = file.getOriginalFilename();

		try {

			InputStream tempInputStream = file.getInputStream();
			;
			byte[] initialbytes = new byte[4];
			tempInputStream.read(initialbytes);

			tempInputStream.close();
			String fileType = new String(initialbytes);

			inputStream = file.getInputStream();

			File folderPath = new File(bean.getFilePath());
			if (!folderPath.exists()) {
				boolean created = folderPath.mkdirs();
			}

			File newFile = new File(bean.getFileName());
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}

			outputStream.close(); 
			inputStream.close(); 
			return "true";
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}

	}

	@Transactional
	public List<Registration> getAllRegistrationsFromSAPID(String sapid) {
		List<Registration> studentData = postDao.getAllRegistrationsFromSAPID(sapid);
		return studentData;
	}

	@Transactional
	public List<ExamOrderBean> getLiveFlagDetails() {
		List<ExamOrderBean> liveFlagList = postDao.getLiveFlagDetails();
		return liveFlagList;
	}

	@Transactional
	public List<SubjectsList> getProgramSubjectSemMappingList(StudentLtidemoBean student,String type) {
		List<SubjectsList> programSubjectSemMappingList = postDao.getProgramSubjectSemMappingList(student,type);
		return programSubjectSemMappingList;
	}
	
	@Transactional
	public List<Integer> getCurrentPreviousTimeBoundIdBasedOnUserId(String userId,String type) {
		List<Integer> timeBoundIdBasedOnUserId = postDao.getCurrentPreviousTimeBoundIdBasedOnUserId(userId,type);
		return timeBoundIdBasedOnUserId;
	}


	@Transactional
	public Integer getCurrentActiveSubject(String sapid) {
		Integer subject = postDao.getCurrentActiveSubject(sapid);
		return subject;
	}

	@Transactional
	public List<ProgramSubjectMappingBean> getCurrentSemSubject(List<String> subject) {
		List<ProgramSubjectMappingBean> subject_list = postDao.getCurrentSemSubject(subject);
		return subject_list;
	}

	@Transactional
	public List<StudentSubjectConfig> getCurrentPreviousActiveSubject() {
		List<StudentSubjectConfig> subjects = postDao.getCurrentPreviousActiveSubject();
		return subjects;
	}
	@Transactional
	public List<Integer> getCurrentPreviousActiveSubject(String sapid) {
		List<Integer> subjects = postDao.getCurrentPreviousActiveSubject(sapid);
		return subjects;
	}
	@Transactional
	public List<Integer> getCurrentPrevTimeBoundIdBasedOnUserid(String userId) {
		List<Integer> timeBoundId = postDao.getCurrentPrevTimeBoundIdBasedOnUserid(userId);
		return timeBoundId;
	}
	
	@Transactional
	public List<String> getFacultyIdBasedOnTimeBoundid(String timeBoundId) {
		List<String> facultyIds = postDao.getFacultyIdBasedOnTimeBoundid(timeBoundId);
		return facultyIds;
	}
	
	//Not in used
	/*
	@Transactional
	public List<Integer> getFacultyCurrentPrevTimeBoundIdBasedOnUserid(String userid) {
		List<Integer> timeBoundId = postDao.getFacultyCurrentPrevTimeBoundIdBasedOnUserid(userid);
		return timeBoundId;
	}
	*/
	
	//Not in used
	/*
	@Transactional
	public List<Integer> getFacultyIdsBasedOnSubjectId(String subjectId) {
		List<Integer> facultyIds = postDao.getFacultyIdsBasedOnSubjectId(subjectId);
		return facultyIds;
	}
	*/
	
	@Transactional
	public Long insertGroups(GroupBean groups) {
		return postDao.insertGroups(groups);
	}

	@Transactional
	public List getPostList(RequestBeanLtidemoBean request) {
		String filterBy="";
		
		
/*		List<String> facultyIds = new ArrayList<>();
		if (facultyId == "" || facultyId == null) {
			List<Faculty> faculties = getFacultiesForSubjects(subjectId);
			for (Faculty bean : faculties) {
				facultyIds.add(bean.getFacultyId());
			}
			facultyId = "'" + StringUtils.join(facultyIds, "\',\'") + "'";
		}else {
			 filterBy = "Faculty";
			facultyId ="'" + StringUtils.join(facultyId.split(","), "\',\'") + "'";
		}*/
		return getAllPosts(request);
	}
	
	@Transactional
	public int checkNewPost(String createdDate, String timeboundId) {
		return postDao.checkNewPost(createdDate, timeboundId);
	}

	
	@Transactional
	public List getPostListByKeyword(String userId,String role, String timeBoundIds, int pageId,String keyword) {
		
		//return getAllPostsByKeyword(pageId, pageLimit, timeBoundIds, facultyIds, userId, keyword);
		return postDao.getAllPostsByKeyword(userId,role,timeBoundIds,pageId, pageLimit ,keyword);
	}


	@Transactional
	public List<Integer> getTimeBoundIdBasedOnSubjectId(String subjectId) {
		List<Integer> timeBoundId = postDao.getTimeBoundIdBasedOnSubjectId(subjectId);
		return timeBoundId;
	}
/*	public String getEligibleSubjects(String subjectId) {
		String subject_ids = "";
		List<ProgramSubjectMappingBean> subjectList = getCurrentActiveSubject();
		List<Integer> CurrentActiveSubjectList = new ArrayList<>();
		for (ProgramSubjectMappingBean bean : subjectList) {
			CurrentActiveSubjectList.add(bean.getId());
		}
		if (subjectId == null || subjectId.equals("")) {
			subject_ids = StringUtils.join(CurrentActiveSubjectList, ",");
		} else {
			subject_ids = subjectId;
		}
		return subject_ids;
	}*/

	@Transactional
	public List<FacultyLtidemoBean> getFacultiesForSubjects(String timeBoundIds) {
		List<FacultyLtidemoBean> faculties = getFacultyids(timeBoundIds);

		return faculties;
	}

	@Transactional
	public Response getSubjectForStudent(StudentLtidemoBean student) {

		Response response = new Response();
		//Active Subject
		List<SubjectsList> activeSubjects = getProgramSubjectSemMappingList(student,"active");
		
		//Upcoming Subject List
		List<SubjectsList> upcomingSubjects = getProgramSubjectSemMappingList(student,"upcoming");
		
		//Archive Subject List
		List<SubjectsList> archiveSubjects = getProgramSubjectSemMappingList(student,"archive");
		List<SubjectsList> tempArchiveList = new ArrayList<SubjectsList>();

		for (SubjectsList subject : archiveSubjects) {
			String sem = postDao.getSemByAcadYearMonth(student.getSapid(), subject.getAcadYear(), subject.getAcadMonth());
			subject.setSem(sem);
			tempArchiveList.add(subject);
		}
		archiveSubjects = tempArchiveList;
		
		//Pending Subject List
		List<SubjectsList> tempPendingList = new ArrayList<SubjectsList>();
		List<SubjectsList> pendingSubjects = getProgramSubjectSemMappingList(student, "pending");
		for (SubjectsList subject : pendingSubjects) {
			String sem = postDao.getSemByAcadYearMonth(student.getSapid(), subject.getAcadYear(), subject.getAcadMonth());
			subject.setSem(sem);
			tempPendingList.add(subject);
		}
		pendingSubjects = tempPendingList;
		
		List<SubjectsList> currentSubjects = getProgramSubjectSemMappingList(student,"");
		
		//If student don't have any active subject then their 1st Upcoming subject will be active subject.
		List<SubjectsList> activeUpcomingSubject = getProgramSubjectSemMappingList(student,"activeUpcoming");
		
		//If student's course is not active, then this timeBoundForNotActive act as timeBoundId till course start
		int genericTimeBoundId = getGenericTimeBoundId(student.getConsumerProgramStructureId());
		
		//To get all applicable subjects for student by exam registration
		List<ProgramSemSubjectBean> allSubjectForStudent = getAllSubjectForStudent(student);
		
		HashMap<String,String> failSubjects = new HashMap<>();
		//List pendingSubjects =postDao.failSubjects(student);
		
		ArrayList<String> timeBoundIds= new ArrayList<>();
		
		// Commented Old Code 
		/*for (int i = 0; i < currentSubjects.size(); i++) {
			HashMap<String,Integer>  x = (HashMap<String, Integer>) currentSubjects.get(i);
			timeBoundIds.add(x.get("timeBoundId")+"");  
		}*/
		
		for (SubjectsList subject : currentSubjects) {
			timeBoundIds.add(subject.getTimeBoundId());
		}
		response.setSubjectIds(timeBoundIds);
		response.setPendingSubjects(pendingSubjects);
		response.setActiveSubjects(activeSubjects);
		response.setUpcomingSubjects(upcomingSubjects);
		response.setArchiveSubjects(archiveSubjects);
		response.setActiveUpcomingSubject(activeUpcomingSubject);
		response.setGenericTimeBoundId(genericTimeBoundId);
		response.setApplicableSubjects(allSubjectForStudent);
		
		return response;
	}

	@Transactional
	public Response Timeline(String userId) {
		
		Response response = new Response();
        StudentLtidemoBean student = getSingleStudentsData(userId);
        
        Registration registration = getSingleStudentsRegistrationData(userId);
        student.setSem(registration.getSem());
        student.setYear(registration.getYear());
        student.setMonth(registration.getMonth());
        
        if(student.equals(null)) {
	       response.setStatus("Error");
	    }
        response  = getSubjectForStudent(student);
       
        String timeBoundIds = "'" + StringUtils.join( response.getSubjectIds(), "\',\'") + "'";
        
//      String activeTimeBoundId = "'" + StringUtils.join( response.getActiveSubjects(), "\',\'") + "'";
        
        List<FacultyLtidemoBean> faculties = getFacultiesForSubjects(timeBoundIds);
		response.setFaculties(faculties);
		
		
		return response;
	}
	@Transactional
	public double getMaxOrderWhereContentLive(){
		double examOrder = postDao.getMaxOrderWhereContentLive();
		return examOrder;
	}
	
	@Transactional
	public ArrayList<String> getPassSubjectsNamesForAStudent(String sapid){
		ArrayList<String> listt = postDao.getPassSubjectsNamesForAStudent(sapid);
		return listt;
	}
	
	@Transactional
	public void getStudentHomePageDetails(StudentLtidemoBean student, HttpServletRequest request, List<ExamOrderBean> liveFlagList) {
		
		List<Registration> allStudentRegistrations = getAllRegistrationsFromSAPID(student.getSapid());
		HashMap<String, Registration> monthYearAndStudentRegistrationMap = new HashMap<>();
		
		for (Registration bean : allStudentRegistrations) {
			monthYearAndStudentRegistrationMap.put(bean.getMonth() + "-" + bean.getYear(), bean);
		}
		 
		
		String liveTypeForCourses = "acadContentLive";
		Registration studentRegistrationForCourses = getStudentRegistrationForForSpecificLiveSettings(monthYearAndStudentRegistrationMap, liveFlagList, liveTypeForCourses);
		
		getCourses(student, request, studentRegistrationForCourses);
		
	}
	
	private void getCourses(StudentLtidemoBean student, HttpServletRequest request, Registration studentRegistrationData) {
		
		Response currentSemSubjects = new Response();

		if(studentRegistrationData != null){
			student.setSem(studentRegistrationData.getSem());
			student.setProgram(studentRegistrationData.getProgram());
			currentSemSubjects = getSubjectForStudent(student);
			List pendingSubjects =postDao.failSubjects(student);
			request.getSession().setAttribute("pendingSubjects", currentSemSubjects.getPendingSubjects());
			request.getSession().setAttribute("currentSubjects", currentSemSubjects.getActiveSubjects());
			request.getSession().setAttribute("upcomingSubjects", currentSemSubjects.getUpcomingSubjects());
			request.getSession().setAttribute("archiveSubjects", currentSemSubjects.getArchiveSubjects());
		}
			
	}
	
	private Registration getStudentRegistrationForForSpecificLiveSettings(
			HashMap<String, Registration> monthYearAndStudentRegistrationMap,
			List<ExamOrderBean> liveFlagList, 
			String liveType) {

		double liveOrder = 0.0;
		String key = null;
		for (ExamOrderBean bean : liveFlagList) {
			double currentOrder = Double.parseDouble(bean.getOrder());

			if("acadSessionLive".equalsIgnoreCase(liveType)){
				if("Y".equalsIgnoreCase(bean.getAcadSessionLive()) && currentOrder > liveOrder){
					liveOrder = currentOrder;
					key = bean.getAcadMonth() + "-" + bean.getYear();
				}
			}else if("acadContentLive".equalsIgnoreCase(liveType)){
				if("Y".equalsIgnoreCase(bean.getAcadContentLive()) && currentOrder > liveOrder){
					liveOrder = currentOrder;
					key = bean.getAcadMonth() + "-" + bean.getYear();
				}
			}else if("assignmentLive".equalsIgnoreCase(liveType)){
				if("Y".equalsIgnoreCase(bean.getAssignmentLive()) && currentOrder > liveOrder){
					liveOrder = currentOrder;
					key = bean.getAcadMonth() + "-" + bean.getYear();
				}
			}else if("acadContentLiveNextBatch".equalsIgnoreCase(liveType)){
				if("Y".equalsIgnoreCase(bean.getAcadContentLive()) && currentOrder > liveOrder){
					liveOrder = currentOrder;
					key = bean.getAcadMonth() + "-" + bean.getYear();
				}
			}
		}

		if("acadContentLiveNextBatch".equalsIgnoreCase(liveType)){
			for (ExamOrderBean bean : liveFlagList) {
				double currentOrder = Double.parseDouble(bean.getOrder());
				if(currentOrder == (liveOrder + 1) ){
					key = bean.getAcadMonth() + "-" + bean.getYear();
				}
			}
		}
		return monthYearAndStudentRegistrationMap.get(key);
	}
	
	// Added to Concat UserDate with each comments
	public List<CommentsLtidemoBean> DetailedComments(List<CommentsLtidemoBean> commentList) {
		List<CommentsLtidemoBean> commentWithUserData = new ArrayList<>();
		for(CommentsLtidemoBean c : commentList) {
			String sapid = c.getSapid();
			StudentLtidemoBean s=null;
			FacultyLtidemoBean f=null;
				
			if (sapid.startsWith("77") || sapid.startsWith("79")) {
				s = postDao.getSingleStudentsData(sapid);
			} else {
				f = (FacultyLtidemoBean)postDao.getFacultyDetailsByUserId(sapid);
			}
			
				if(s != null) {  
					c.setFirstName(s.getFirstName());
					c.setLastName(s.getLastName());
					c.setImageUrl(s.getImageUrl());
				
				}else if (f != null){
					c.setFirstName("Prof. "+f.getFirstName());
					c.setLastName(f.getLastName());
//					c.setImageUrl("https://studentzone-ngasce.nmims.edu/"+f.getImgUrl());
					if(!StringUtils.isBlank(f.getImgUrl())){
						c.setImageUrl(SERVER_PATH+f.getImgUrl());
					}else {
						c.setImageUrl("assets/images/cover/userImg.jpg");
					}
				
				}else { 
					c.setFirstName("Course Coordinator");
					c.setLastName("");   
					c.setImageUrl(SERVER_PATH+"/ltidemo/assets/images/logo.jpg");
				}
				if(c.getMaster_comment_id()==0) { //for main comments check if subcomments
					int subCommentCount =postDao.subCommentCount(c.getId());
					if(subCommentCount>0) {
						c.setSubcomments_count(subCommentCount);
					}
				}
				commentWithUserData.add(c);
		}
		return commentWithUserData;
	}
	
	@Transactional
	public List<CommentsLtidemoBean> getComments(int post_id,String role, Integer limit, Integer offset) {
		
		List<CommentsLtidemoBean> commentList = postDao.getComments(post_id,role,limit,offset);
		
		//Added to Concat UserDate with each comments
		List<CommentsLtidemoBean> commentWithUserData = DetailedComments(commentList);
		return commentWithUserData;
	}
	
	@Transactional
	public List<GroupBean> getGroupsForFaculty(String userId){
		return postDao.getGroupsForFaculty(userId);
	}
	
	@Transactional
	public boolean deleteGroup(long id) {
		return postDao.deleteGroup(id);
	}
	
	@Transactional
	public List<GroupsMembers> getGroupMember(long groupId){
		return postDao.getGroupMember(groupId);
	}
	
	@Transactional
	public boolean removeFromGroup (String sapId, long groupId){
		return postDao.removeFromGroup(sapId, groupId);
	}
	
	@Transactional
	public boolean addInGroup (String sapId, long groupId, String userId){
		return postDao.addInGroup(sapId, groupId, userId);
	}
	
	@Transactional
	public String groupName (long groupId){
		return postDao.groupName(groupId);
	}
	
	@Transactional
	public List<ConsumerTypes> getConsumerType() {
		List<ConsumerTypes> ps = postDao.getConsumerType();
		return ps;
	}
	
	@Transactional
	public String getTimeBoundId (String Prgm_Sem_Sub_Id){
		return postDao.getTimeBoundId(Prgm_Sem_Sub_Id);
	}

	@Transactional
	public List subComments(RequestBeanLtidemoBean req) {
		
		List<CommentsLtidemoBean> commentList = postDao.getSubComments(req);
		
		//Added to Concat UserDate with each comments
		List<CommentsLtidemoBean> commentWithUserData = DetailedComments(commentList);
		return commentWithUserData;
	}
	
	@Transactional
	public List mSubComments(String id) {
		List comments = postDao.mGetSubComments(id);
		return comments;
	}
	
	@Transactional
	public int submitComment(CommentsLtidemoBean comment) {
		int status = postDao.submitComment(comment);
		return status;
	}
	
	@Transactional
	public FacultyLtidemoBean getFacultyData (String userId){
		return postDao.getFacultyData(userId);
	}
	
	@Transactional
	public List getGroupsForStudent(String userId){
		return postDao.getGroupsForStudent(userId);
	}
	
	@Transactional
	public String facultyImgUrl (String userId){
		return postDao.facultyImgUrl(userId);
	}
	
	@Transactional
	public int getCountofComments(int post_id) {
		int count = postDao.getCountofComments(post_id);
		return count;
	}
	@Transactional
	public boolean IfMyComments(String sapid,int post_id) {
		boolean flag = postDao.IfMyComments(sapid,post_id);
		return flag;
	}
	@Transactional
	public String getUserReaction(RequestBeanLtidemoBean req) {
		String reactions = postDao.getHelpfulReactionCountForStudent(req);
		return reactions;
	}

@Transactional
	public int getReactionCount(RequestBeanLtidemoBean req) {
		int count = 0;
		if(req.getPostType()=="" ||  req.getPostType()==null) { //default table PostReactions 
			PostReactionsLtidemoBean pr = new PostReactionsLtidemoBean();
			pr.setPostId(req.getPost_id());
			pr.setUserId(req.getSapid());
			pr.setReactionType(req.getReactionType());
			
			
			String reactions = postDao.getHelpfulReactionCountForStudent(req);
			count =reactions.isEmpty()?0:1;
		
			if(count == 0) {
				postDao.setReactionForStudent(pr);
			}
			else {
				postDao.updateReactionForStudent(pr);
			}
		}else {
			CommentReactionsLtidemoBean cr = new CommentReactionsLtidemoBean();
			cr.setPostId(req.getPost_id());
			cr.setUserId(req.getSapid());
			cr.setReactionType(req.getReactionType());
			
			String reactions = postDao.getHelpfulReactionCountForStudent(req);
			count =reactions.isEmpty()?0:1;
		
			if(count == 0) {
				postDao.setCommentReactionForStudent(cr);
			}
			else {
				postDao.updateCommentReactionForStudent(cr);
			}
		}
		
		return count;
	}

	@Transactional
	public long getCountofReactions(RequestBeanLtidemoBean req) {
		long reactions = postDao.getCountofReactions(req);
		return reactions;
	}
	@Transactional
	public long getUserAlreadyLiked(int postId,String userId) {
		long reactions = postDao.getUserAlreadyLiked(postId,userId);
		return reactions;
	}
	@Transactional
	public List getReactions(RequestBeanLtidemoBean req) {
		List count = postDao.getReactions(req);
		return count;
	}
	@Transactional
	public Post getPostDetailById(int post_id) {
		Post post = postDao.getPostDetailById(post_id);
		return post;
	}
	
	@Transactional
	public FacultyLtidemoBean getFacultyDetailsByUserId(String userId) {
		FacultyLtidemoBean facultyDetails = postDao.getFacultyDetailsByUserId(userId);
		return facultyDetails;
	}

	@Transactional
	public List<GroupBean> getGroupsNameForFaculty(String timeBoundId, String userId) {
		return postDao.getGroupsNameForFaculty(timeBoundId, userId);
	}
	
	@Transactional
	public List<Post> getPostWithScheduleTime() {
		return postDao.getPostWithScheduleTime();
	}
	
	@Transactional
	public boolean updatePost(Post post) {
		return postDao.updateSinglePost(post);
	}
	
	@Transactional
	public List<StudentLtidemoBean> getMembersToAdd(long groupId, String timeBoundId){
		return postDao.getMembersToAdd(groupId, timeBoundId);
	}
	
	@Transactional
	public List getGroupsForStudentByTimeBoundId(String userId, int timeboundId){
		return postDao.getGroupsForStudentByTimeBoundId(userId, timeboundId);
	}
	
	@Transactional
	public List getListOfGroupsMembersForStudent(String userId, int timeboundId){
		return postDao.getListOfGroupsMembersForStudent(userId, timeboundId);
	}
	
	@Transactional
	public List<Hashtag> getHashtags(String program_sem_subject_id){
		return postDao.getHashtags(program_sem_subject_id);
	}
	
	@Transactional
	public List<String> getSearchKeywordList(String keyword){
		return postDao.getSearchKeywordList(keyword);
	}
	
	@Transactional
	public ArrayList<String> getTimeBoundStudentsList(String timeBoundId, long groupId){
		return postDao.getTimeBoundStudentsList(timeBoundId, groupId);
	}
	
	@Transactional
	public ArrayList<String> batchUpdateStudentToGroup(final List<GroupsMembers> studentSapIdList){
		return postDao.batchUpdateStudentToGroup(studentSapIdList);
	}
		
	@Transactional
	public List<Integer> getTimeBoundIdForFaculty(String userId) {
		return postDao.getTimeBoundIdForFaculty(userId);
	}
	
	@Transactional
	public String deleteCommentById(int id) {
		
		String toReturn = postDao.deleteCommentById(id);
		/*
		//Comments c = (Comments) session.load(Comments.class, new Integer(id));
		Comments c = postDao.getCommentById(id);
		
		int post_id = c.getPost_id();
		
		
		Post post = getPost(post_id);
		post.setTimeboundId(post.getSubject_config_id());
		postDao.insertToRedis(post);
		*/
		
		return toReturn;
	}
	
	@Transactional
	public List<StudentLtidemoBean> getTimeBoundStudentsForBatchUpload(){
		return postDao.getTimeBoundStudentsForBatchUpload();
	}
	
	@Transactional
	public List<ProgramSemSubjectBean> getAllSubjectForStudent(StudentLtidemoBean student) {
		return postDao.getAllSubjectForStudent(student);
	}
	
	@Transactional
	public Integer getTimeBoundIdBySubjectId (int subjectId, String batch) {
		return postDao.getTimeBoundIdBySubjectId(subjectId, batch);
	}
	
	@Transactional
	public boolean insertTimeBoundStudentMapping(TimeBoundStudentMapping bean) {
		return postDao.insertTimeBoundStudentMapping(bean);
	}
	
	@Transactional
	public int getCountOfBatchStudents (String batch) {
		return postDao.getCountOfBatchStudents(batch);
	}
	
	@Transactional
	public List<String> getBatchNames(){
		return postDao.getBatchNames();
	}
	
	@Transactional
	public StudentSubjectConfig getTimeDetailsByTimeBoundId(int timeBoundId){
		return postDao.getTimeDetailsByTimeBoundId(timeBoundId);
	}
	
	@Transactional
	public List<PostReactionsLtidemoBean> getReactedUserList(int post_id) {
		List<PostReactionsLtidemoBean> postReactionList = postDao.getReactedUserList(post_id);
		List<PostReactionsLtidemoBean> reactionWithUserData = new ArrayList<PostReactionsLtidemoBean>();
		for (PostReactionsLtidemoBean reaction : postReactionList) { 
			StudentLtidemoBean student = new StudentLtidemoBean();
			FacultyLtidemoBean faculty = new FacultyLtidemoBean();
			try {
				student = postDao.getSingleStudentsData(reaction.getUserId()); 
				faculty = postDao.getFacultyDetailsByUserId(reaction.getUserId());
			} catch (Exception e) {
//				e.printStackTrace();
			}
			if(!StringUtils.isBlank(student.getSapid())) {
				reaction.setFullName(student.getFirstName()+" "+student.getLastName());
			}else if (!StringUtils.isBlank(faculty.getFacultyId())){
				reaction.setFullName("Prof. "+faculty.getFirstName()+" "+faculty.getLastName());
			}else {
				reaction.setFullName("Course Coordinator");
			}
			reactionWithUserData.add(reaction);
		}
		 return reactionWithUserData;
	}
	
	@Transactional
	public String getUserRole (String userId) {
		 return postDao.getUserRole(userId);
	}
	
	@Transactional
	public List getConsumerTypesForAdmin() {
		return postDao.getConsumerTypesForAdmin();
	}
	
	@Transactional
	public int getConsumerProgramStructureId (Post post) {
		return postDao.getConsumerProgramStructureId(post);
	}
	
	@Transactional
	public int getGenericTimeBoundId (String consumerProgramStructureId) {
		return postDao.getGenericTimeBoundId(consumerProgramStructureId);
	}
	
	@Transactional
	public List<ChatUserBean> getContactsForChatBasedOnBatch (String sapId) {
		return postDao.getContactsForChatBasedOnBatch(sapId);
	}
	
	@Transactional
	public String getBatchNameBySapId (String userId) {
		 return postDao.getBatchNameBySapId(userId);
	}
	
	@Transactional
	public CommentsLtidemoBean getCommentById(int master_comment_id) {
		 return postDao.getCommentById(master_comment_id);
	}
	
	@Transactional
	public StudentLtidemoBean getStudentDataBySapid(String sapid) {
		 return postDao.getStudentDataBySapid(sapid);
	}
	
	@Transactional
	public Registration getSingleStudentsRegistrationData(String userId){
		return postDao.getSingleStudentsRegistrationData(userId);
	}
	
	@Transactional
	public List<String> getSpecialisationTypeBySapid(String userId) {
		return postDao.getSpecialisationTypeBySapid(userId);
	}
	@Transactional
	public SessionBean getCorrespondingSession(int session_plan_module_id) {
		return postDao.getCorrespondingSession(session_plan_module_id);
	}
	
	@Transactional
	public void hitRefreshCacheByPostId(String post_id) {
		
		try {
			postDao.hitRefreshCacheByPostId(Integer.parseInt(post_id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
		

	
	@Transactional
	public List getSubjectForFaculty(String facultyId) {
		return postDao.getSubjectForFaculty(facultyId);
	}
	
	@Transactional
	public List<StudentLtidemoBean> getAllStudentsForPearsonMapping(String consumerProgramStructureId,String sem) {
		return postDao.getAllStudentsForPearsonMapping(consumerProgramStructureId,sem);
	}
	
	@Transactional
	public Integer getLTIUserMappingId (String userId) {
		return postDao.getLTIUserMappingId(userId);
	}
	
	@Transactional
	public Long insertPearsonResourcesMapping (UserResourseMapping userMapping) {
		return postDao.insertPearsonResourcesMapping(userMapping);
	}
	
	@Transactional
	public List<LTIUsers> getStudentsForPearsonMapping(LTIUserResourcesMapping mappingBean){
		return postDao.getStudentsForPearsonMapping(mappingBean);
	}
	
	@Transactional
	public boolean checkExistAndCreateMapping(int userId, LTIUserResourcesMapping mappingBean) {
		
		int id = 0;
		try {
			Boolean isExists = postDao.checkIfAlreadyExits(userId, mappingBean.getResourceId());
			if (!isExists) {
				LTIUserResourcesMapping ltiUserResourcesMapping = new LTIUserResourcesMapping();
				ltiUserResourcesMapping.setUserId(userId);
				ltiUserResourcesMapping.setResourceId(mappingBean.getResourceId());
				ltiUserResourcesMapping.setAccessCode("1");
				ltiUserResourcesMapping.setStartDate(mappingBean.getStartDate());
				ltiUserResourcesMapping.setEndDate(mappingBean.getEndDate());
				ltiUserResourcesMapping.setCreatedBy("Admin");
				ltiUserResourcesMapping.setLastModifiedBy("Admin");
				id = postDao.insertLTIUsersResourcesMapping(ltiUserResourcesMapping);
			}else {
				id = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (id > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
}
