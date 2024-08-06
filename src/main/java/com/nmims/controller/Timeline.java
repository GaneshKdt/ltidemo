package com.nmims.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.ChatBean;
import com.nmims.bean.CommentsLtidemoBean;
import com.nmims.bean.FacultyLtidemoBean;
import com.nmims.bean.Hashtag;
import com.nmims.bean.MentionedUsersBean;
import com.nmims.bean.Post;
import com.nmims.bean.PostReactionsLtidemoBean;
import com.nmims.bean.PostReportList;
import com.nmims.bean.Registration;
import com.nmims.bean.RequestBeanLtidemoBean;
import com.nmims.bean.Response;
import com.nmims.bean.SessionBean;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.bean.StudentSubjectConfig;
import com.nmims.bean.StudentSubjectConfigResponseBean;
import com.nmims.bean.TestLtidemoBean;
import com.nmims.dao.ChatDAO;
import com.nmims.helpers.MailSender;
import com.nmims.helpers.PostHelper;
import com.nmims.services.LoginService;
import com.nmims.services.MentionedUsersService;
import com.nmims.services.PostService; 

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class Timeline {

	@Autowired
	PostService postService;

	@Autowired
	PostHelper postHelper;
	
	@Autowired
	LoginService logService;
	
	@Autowired
	MentionedUsersService mentionedUsersService; 
	
	@Autowired
	ChatDAO chatDAO;

	@Value("${POST_FILES_PATH}")
	private String POST_FILES_PATH;

	@Value("${SERVER_PATH_FEED_FILES}")
	private String SERVER_PATH_FEED_FILES;
	
	@Value("${CONTENT_PREVIEW_PATH}")
	private String CONTENT_PREVIEW_PATH;
	
	@Value("${SERVER_PATH}")
	private String SERVER_PATH;

	@Value("${SERVER}")
	private String SERVER;

	@Value("${ENVIRONMENT}")
	private String ENVIRONMENT;
	
	@Value("${CURRENT_MBAWX_ACAD_YEAR}")
	private String CURRENT_MBAWX_ACAD_YEAR;

	@Value("${CURRENT_MBAWX_ACAD_MONTH}")
	private String CURRENT_MBAWX_ACAD_MONTH;
	
	@Value("#{'${ACAD_YEAR_LIST}'.split(',')}")
	private List<String> ACAD_YEAR_LIST;
	
	@Value("#{'${ACAD_MONTH_LIST}'.split(',')}")
	private List<String> ACAD_MONTH_LIST;
	
	@Value("${TIMEBOUND_PORTAL_LIST}")
	private List<String> TIMEBOUND_PORTAL_LIST;
	
	@Autowired
	MailSender mailer; 
	
	private static final String MBA_WX_PROGRAM_NAME ="MBA - WX";
	private static final String MSC_AIML_PROGRAM_NAME ="M.Sc. (AI & ML Ops)";
	
	private static final int BUFFER_SIZE = 4096;
	
	//HashMap<String, Integer> acadsMonthMap = new HashMap<String, Integer>();
	
	static final Map<String, String> acadsMonthMap;
	
	@Value("${CONTENT_BASE_PATH}")
	private String CONTENT_BASE_PATH;

    static {
    	acadsMonthMap = new LinkedHashMap<>(); 
    	acadsMonthMap.put("Jan", "01");
    	acadsMonthMap.put("Apr", "04");
    	acadsMonthMap.put("Jul", "07");
    	acadsMonthMap.put("Oct", "10");
    }
 
	/* @RequestMapping(value = "/protected/posts", method = RequestMethod.GET) */

	@RequestMapping(value = "/sessionPlanHomePage", method = RequestMethod.GET)
	public ModelAndView sessionPlanHomePage(HttpServletRequest request, HttpServletResponse response, Model model) {

		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}

		return new ModelAndView("sessionPlanHomePage");
	}

	@RequestMapping(value = "/m/loadTimeline", method = RequestMethod.POST)
	public ResponseEntity<Response> MgetPostDetails(@RequestBody JSONObject inputJsonObj) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		Response response = postService.Timeline((String) inputJsonObj.get("userId"));

		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}
 
	@RequestMapping(value = "/facultyByTimeboundId", method = RequestMethod.POST)
	public ResponseEntity<Response> facultyList(@RequestBody RequestBeanLtidemoBean request) {
		String timeBoundId =request.getTimeBoundId()+"";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		List<FacultyLtidemoBean> faculties = postService.getFacultiesForSubjects(timeBoundId);
		Response response = new Response(); 
		response.setFaculties(faculties); 
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}     
	@RequestMapping(value = "/getConsumerTypes", method = RequestMethod.POST)
	public ResponseEntity<List> getConsumerTypes(HttpServletRequest request) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String userId = (String) request.getSession().getAttribute("userId");
		String role = postService.getUserRole(userId);
		List consumerTypes = null;
//		List<String> items = Arrays.asList(role.split("\\s*,\\s*"));
		if(role.indexOf("Acads Admin") != -1 || role.indexOf("MBA-WX Admin") != -1) {
			consumerTypes = postService.getConsumerTypesForAdmin();
		} else {
			consumerTypes = postService.getConsumerTypes(userId);
		}

		return new ResponseEntity<List>(consumerTypes, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/FacultyTimeline", method = RequestMethod.GET)
	public ModelAndView FacultyTimeline(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}

		String userId = (String) request.getSession().getAttribute("userId");
		String role = postService.getUserRole(userId);
		List consumerTypes = null;
		if(role.indexOf("Acads Admin") != -1 || role.indexOf("MBA-WX Admin") != -1) {
			consumerTypes = postService.getConsumerTypesForAdmin();
		}else {
			role = "Faculty";
			//Commented by Somesh to hide 4 dropdown(consumerType,consumerType ) from faculty side.
			//consumerTypes = postService.getConsumerTypes(userId);
			
			consumerTypes = postService.getSubjectForFaculty(userId);
			
			request.getSession().setAttribute("facultyLtidemo", postService.getFacultyData(userId));
			request.getSession().setAttribute("groupForFaculty", postService.getGroupsForFaculty(userId));
			request.getSession().setAttribute("SERVER_PATH", SERVER_PATH);
		}

		/*if (StringUtils.equalsIgnoreCase("Acads Admin", roles)) {
			consumerTypes = postService.getConsumerTypesForAdmin();
		} else {
			consumerTypes = postService.getConsumerTypes(userId);
			request.getSession().setAttribute("faculty", postService.getFacultyData(userId));
			request.getSession().setAttribute("groupForFaculty", postService.getGroupsForFaculty(userId));
		}*/

		Post post = new Post();
		
		request.getSession().setAttribute("role", role);
		model.addAttribute("post", post);
		model.addAttribute("userId", userId);
		model.addAttribute("consumerTypes", consumerTypes);
		model.addAttribute("SERVER_PATH_FEED_FILES", SERVER_PATH_FEED_FILES);
		model.addAttribute("POST_FILES_PATH", POST_FILES_PATH);
		model.addAttribute("SERVER_PATH", SERVER_PATH);
		model.addAttribute("ACAD_YEAR_LIST", ACAD_YEAR_LIST);
		model.addAttribute("ACAD_MONTH_LIST", ACAD_MONTH_LIST);
		model.addAttribute("CONTENT_PREVIEW_PATH", CONTENT_BASE_PATH);
		model.addAttribute("role", role);
		return new ModelAndView("FacultyTimeline");
	}

	@RequestMapping(value = "/listPost", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<Response> listofPosts(@RequestBody RequestBeanLtidemoBean request, HttpServletRequest req) {
		req.getSession().setAttribute("RequestBody", request);
		HttpHeaders headers = new HttpHeaders();
		Response response = new Response();

		int timeBoundId = request.getTimeBoundId();
		int post_id = request.getPost_id();
		String postType = request.getPostType();
		String userId = request.getUserId();
		String facultyId = request.getFacultyId();
		String keyword = request.getKeyword();
		
		List listOfPosts = new ArrayList<>();
		String genericTimeBoundId = "-1";
		if (userId.startsWith("77")) {
			StudentLtidemoBean student = postService.getSingleStudentsData(userId);
			Registration studentRegDetails = postService.getSingleStudentsRegistrationData(userId);
			
			student.setYear(studentRegDetails.getYear());
			student.setMonth(studentRegDetails.getMonth());
			student.setSem(studentRegDetails.getSem());
			
			String month = "0";
			if (acadsMonthMap.containsKey(student.getMonth())) {
				month = acadsMonthMap.get(student.getMonth());
			}
			genericTimeBoundId = student.getConsumerProgramStructureId()+month+student.getYear()+student.getSem();
		}

		try {
			String timeBoundIds = "";
			String role = (String) req.getSession().getAttribute("role");

			if (role == null) {
				role = "Student";
			}

			List<Integer> timeBoundIdBasedOnUserdId = new ArrayList<>();
			// List<String> subjectIdList =Arrays.asList(subjectId.split(","));
			if (role.equalsIgnoreCase("Student")) {
				if(!postType.isEmpty()) {
					timeBoundIdBasedOnUserdId = postService.getCurrentPreviousTimeBoundIdBasedOnUserId(userId, "Activeprevious");
				}
				else if (!keyword.equalsIgnoreCase("")) {
					timeBoundIdBasedOnUserdId = postService.getCurrentPreviousTimeBoundIdBasedOnUserId(userId, "Activeprevious");
				} else if (timeBoundId == 0) {
					if (post_id != 0) {
						timeBoundIdBasedOnUserdId = postService.getCurrentPreviousTimeBoundIdBasedOnUserId(userId, "Activeprevious");

					}  else {
						timeBoundIdBasedOnUserdId = postService.getCurrentPreviousTimeBoundIdBasedOnUserId(userId, "Active");
					}
				} else {
					timeBoundIdBasedOnUserdId.add(timeBoundId);
				}
			} else {

				facultyId = userId;
				timeBoundIdBasedOnUserdId = postService.getTimeBoundIdForFaculty(userId);
			}


			if (!timeBoundIdBasedOnUserdId.contains(genericTimeBoundId)) {
				timeBoundIdBasedOnUserdId.add(Integer.parseInt(genericTimeBoundId));
			}


			if ((timeBoundIdBasedOnUserdId.size() > 0)) {
				timeBoundIds = "'" + StringUtils.join(timeBoundIdBasedOnUserdId, "\',\'") + "'";
				request.setTimeBoundIds(timeBoundIds);
				request.setFacultyId(facultyId);
				listOfPosts = postService.getPostList(request);
			} else {
				response.setStatus("Subject Not Yet Active");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setServerPath(SERVER_PATH_FEED_FILES);
		response.setListOfPosts(listOfPosts);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getFeedsByGroupid", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<Response> getFeedsByGroupid(HttpServletRequest request,
			@RequestParam("group_id") Long groupid/* , @RequestParam ("sapid") String sapid */) {

		RequestBeanLtidemoBean requestBody = (RequestBeanLtidemoBean) request.getSession().getAttribute("RequestBody");
		HttpHeaders headers = new HttpHeaders();
		Response response = new Response();

		List listOfPosts = new ArrayList<>();
		List<String> ActivatedSubjectIds = new ArrayList();

		try {
			String subjectId = requestBody.getSubjectId();
			String role;

			try {
				role = (String) request.getSession().getAttribute("role");
			} catch (Exception e) {
				role = "student";
			}
			List<StudentSubjectConfig> subjectList = postService.getCurrentPreviousActiveSubject();
			for (StudentSubjectConfig bean : subjectList) {
				ActivatedSubjectIds.add(bean.getProgramSemSubject().getId()+"");
			}
			if (!subjectId.equals("")) {
				List<String> subjectIdList = Arrays.asList(subjectId.split(","));
				ActivatedSubjectIds.retainAll(subjectIdList);
				if ((ActivatedSubjectIds.size() > 0)) {
					subjectId = "'" + StringUtils.join(ActivatedSubjectIds, "\',\'") + "'";
					requestBody.setSubjectId(subjectId);
					listOfPosts = postService.getPostList(requestBody);
				} else {
					response.setStatus("Subject Not Yet Active");
				}
			} else {
				listOfPosts = postService.getPostList(requestBody);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setListOfPosts(listOfPosts);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/addPosts", method = RequestMethod.POST, headers = "Accept=application/json")
	public ModelAndView addPost(HttpServletRequest request, HttpServletResponse response, @Valid @ModelAttribute("post") Post post,
			BindingResult theBindingResult, @RequestPart("multipartFile") MultipartFile multipartFile) {

		if (!logService.checkSession(request, response)) {
			return new ModelAndView("redirect:../studentportal/");
		}
		
		if (theBindingResult.hasErrors()) {
			return new ModelAndView("FacultyTimeline");
		}
		String userId = (String) request.getSession().getAttribute("userId");
		String role = postService.getUserRole(userId);
		post.setUserId(userId);
		String month = "0";
		
		if (!(post.getPost_id() > 0)) {
			
			if(role.indexOf("Acads Admin") != -1 || role.indexOf("MBA-WX Admin") != -1) {
				int consumerProgramStructureId = postService.getConsumerProgramStructureId(post);
				post.setRole("Admin");
				
				if(StringUtils.isBlank(post.getSubject())) {
					
					if (acadsMonthMap.containsKey(post.getAcadMonth())) {
						month = acadsMonthMap.get(post.getAcadMonth());
					}
					
					String genericTimeboundId = consumerProgramStructureId+month+post.getAcadYear()+post.getSem();
					post.setSubject_config_id(Integer.parseInt(genericTimeboundId));
					post.setSubject("MBA - WX");
				}
			} else {
				post.setRole("Faculty");
			}
		}

		String status = postService.addPost(post, multipartFile);

		if (StringUtils.isNumeric(status)) {
			postService.hitRefreshCacheByPostId(status);
			setSuccess(request, "Added Successfully");
		} else {
			setError(request, "Failed to Add");
		}

		return new ModelAndView("redirect:/FacultyTimeline");
	}

	@RequestMapping(value = "/m/addPosts", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<Map<String, String>> maddPost(@RequestBody Post post,
			@RequestPart("multipartFile") MultipartFile multipartFile) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		HashMap<String, String> response = new HashMap<>();

		String result = postService.addPost(post, multipartFile);


		if (StringUtils.isNumeric(result)) {
			postService.hitRefreshCacheByPostId(result);
			response.put("success", "true");
			response.put("successMessage", "Posted successfully.");
		}
		return new ResponseEntity<Map<String, String>>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/deletePost/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView deletePost(HttpServletRequest request, @PathVariable("id") int id) {
		boolean status = postService.deletePost(id);
		if (status) {
			setSuccess(request, "Deleted Successfully");
		} else {
			setError(request, "Failed to Delete");
		}

		return new ModelAndView("redirect:/FacultyTimeline");
	}

	@RequestMapping(value = "/m/deletePost/{id}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> mdeletePost(@PathVariable int id) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		postService.deletePost(id);
		HashMap<String, String> response = new HashMap<>();
		response.put("success", "true");
		response.put("successMessage", "Deleted successfully.");
		return new ResponseEntity<Map<String, String>>(response, headers, HttpStatus.OK);
	}

	public void setSuccess(HttpServletRequest request, String successMessage) {
		request.setAttribute("success", "true");
		request.setAttribute("successMessage", successMessage);
	}

	public void setError(HttpServletRequest request, String errorMessage) {
		request.setAttribute("error", "true");
		request.setAttribute("errorMessage", errorMessage);
	}

	/*
	 * @RequestMapping(value = "/getPost/{id}", method = RequestMethod.POST, headers
	 * = "Accept=application/json") public Post getPostById(@PathVariable int id) {
	 * return postService.getPost(id); }
	 * 
	 * @RequestMapping(value = "/m/getPost/{id}", method = RequestMethod.POST)
	 * public ResponseEntity<Post> mgetPostById(@PathVariable int id) throws
	 * Exception { HttpHeaders headers = new HttpHeaders();
	 * headers.add("Content-Type", "application/json"); Post post =
	 * postService.getPost(id); return new ResponseEntity<Post>(post, headers,
	 * HttpStatus.OK); }
	 */

	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String preview(HttpServletRequest request) {
		return "preview";
	}

	@RequestMapping(value = "/subComments", method = RequestMethod.POST)
	public ResponseEntity<Response> subComments(@RequestBody RequestBeanLtidemoBean req, HttpServletRequest request) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		
		List comments = new ArrayList<>();
		comments = postService.subComments(req);
		Response response = new Response();
		response.setComments(comments);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/submitComment", method = RequestMethod.POST)
	public ResponseEntity<Response> submitComment(HttpServletRequest request, @RequestBody RequestBeanLtidemoBean req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		CommentsLtidemoBean commentBean = new CommentsLtidemoBean();
		List<String> mentioned_users = new ArrayList<String>();
		String sapid = req.getSapid();
		String comment = req.getComment();
		int master_comment_id = req.getComment_id();
		int post_id = req.getPost_id();
		commentBean.setMaster_comment_id(master_comment_id);
		commentBean.setComment(comment);
		commentBean.setPost_id(post_id);
		commentBean.setPostId(post_id);
		commentBean.setSapid(sapid);
		commentBean.setId(req.getId());

		int id = postService.submitComment(commentBean);
		
		MentionedUsersBean muBean = new MentionedUsersBean();
		try {
		 mentioned_users = req.getMentioned_users();
		 for (String user : mentioned_users) {
			 
			String subStringUser =user.substring(3,user.length()-2); 
			String[] userData = subStringUser.split("\\|\\|", -1);
			muBean.setComment_id(id);
	        muBean.setMention_to(userData[0]);
	        mentionedUsersService.addMentionedUsers(muBean);
	             
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
			
		Post post = postService.getPost(post_id);

		//mail function
		ArrayList<String> emails = new ArrayList<String>();
		emails.add("coursecoordinator.mbawx@nmims.edu"); 
		
		String message= (master_comment_id==0)?
		 req.getFirstName() +' '+req.getLastName()+" commented on a post "+post.getContent()+" of "+post.getSubject()
		:	 req.getFirstName() +' '+req.getLastName()+" replied on a post "+post.getContent()+" of "+post.getSubject();
		 String subject = (master_comment_id==0)?
			 req.getFirstName() +' '+req.getLastName()+" commented on a post "
			:	 req.getFirstName() +' '+req.getLastName()+" replied on a post ";
		//sent mail to course coordinator 
		String recipientName="Course Coordinator";
		mailer.sendEmail( subject,message,emails,recipientName); 
		
		//sent reply mail to student
		if(master_comment_id!=0) { //for replies
			String masterCommentOwner =postService.getCommentById(master_comment_id).getSapid();
			if(!sapid.equalsIgnoreCase(masterCommentOwner)) { //no need to mail for own replies
				if(masterCommentOwner.startsWith("77") || masterCommentOwner.startsWith("79")){ //if owner is student
					StudentLtidemoBean studentEmail = postService.getStudentDataBySapid(masterCommentOwner);
					emails.set(0, studentEmail.getEmailId());
					recipientName=studentEmail.getFirstName()+" "+studentEmail.getLastName();
					mailer.sendEmail( subject,message,emails,recipientName); 
				}
			}
			
		}
		
		Response response = new Response();
		response.setId(id);
		int commentCount = postService.getCountofComments(post_id);
		response.setCommentCount(commentCount);
		long reactionCount = postService.getCountofReactions(req);
		List reaction = postService.getReactions(req);
		response.setReactionCount(reactionCount);
		response.setReactions(reaction);
		
		post.setTimeboundId(post.getSubject_config_id());
		postHelper.refreshRedis(post);
		
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value = "/viewMoreComments", method = RequestMethod.POST)
	public ResponseEntity<Response> viewMoreComments(HttpServletRequest request, @RequestBody RequestBeanLtidemoBean input, HttpServletRequest req) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String role;
		try {
			role = (String) req.getSession().getAttribute("role");
		} catch (Exception e) {
			role = "student";
		}

		Response response = new Response();
		int post_id = input.getPost_id();
		Integer limit = 10;
		Integer offset = 0;

		try {
			limit = input.getLimit();
			offset = input.getOffset();
		} catch (Exception e) {
			e.printStackTrace();
			if ("student".equalsIgnoreCase(role)) {
				response.setComments(new ArrayList<>());
				return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
			}
		}

		List<CommentsLtidemoBean> comments = postService.getComments(post_id, role, limit, offset);
		response.setComments(comments);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getReactionCount", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
//	public ResponseEntity<List<PostReactions>> getReactionCount(@RequestParam("sapid") String sapid, @RequestParam("flag") String flag) {
	public ResponseEntity<Response> getReactionCount(@RequestBody RequestBeanLtidemoBean req) {
		List<PostReactionsLtidemoBean> reactions = null;
		Response response = (Response) new Response();
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", "application/json");
			int count = 0;
			count = postService.getReactionCount(req);

//		return new ResponseEntity<List<PostReactions>>(reactions, headers, HttpStatus.OK);
			response.setStatus(Integer.toString(count));
			int commentCount = postService.getCountofComments(req.getPost_id());
			response.setCommentCount(commentCount);
			long reactionCount = postService.getCountofReactions(req);
			List reaction = postService.getReactions(req);
			response.setReactionCount(reactionCount);
			response.setReactions(reaction);

			Post post = postService.getPost(req.getPost_id());
			post.setTimeboundId(post.getSubject_config_id());
			postHelper.refreshRedis(post);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);

	}

	@RequestMapping(value = "/getCommentAndReactions", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Response> getPostReactions(@RequestBody RequestBeanLtidemoBean req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		int post_id = req.getPost_id();
		String sapid = req.getSapid();
		Response response = new Response();
		int commentCount = postService.getCountofComments(post_id);
		response.setCommentCount(commentCount);
		long reactionCount = postService.getCountofReactions(req);
		List reactions = postService.getReactions(req);
		response.setReactionCount(reactionCount);
		response.setReactions(reactions);
		String reaction = postService.getUserReaction(req);
		response.setMyReaction(reaction);
		boolean flag = postService.IfMyComments(sapid, post_id);
		response.setFlag(flag);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPostDetailById", method = RequestMethod.POST)
	public ResponseEntity<Response> getPostDetailById(HttpServletRequest request, @RequestBody Post post) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		post = postService.getPostDetailById(post.getPost_id());
		Response response = new Response();
		response.setPost(post);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	
	@RequestMapping(value = "/m/getBatchNameBySapId", method = RequestMethod.POST)
	public ResponseEntity<HashMap<String,String>> getBatchNameBySapId(HttpServletRequest request, @RequestBody StudentLtidemoBean input) {
		HttpHeaders headers = new HttpHeaders();
		StringBuilder sb = new StringBuilder();
		String andSeparatedSpecialisationName = "";
		String specialisationType = "";		
		headers.add("Content-Type", "application/json");
		HashMap<String,String>  response = new HashMap<String,String>();
		
		String batchName = postService.getBatchNameBySapId(input.getSapid());
		
		//Added Term from DB for Term 3 & Term 4 Students
		Registration registration = postService.getSingleStudentsRegistrationData(input.getSapid());
		if(!StringUtils.isEmpty(batchName) && (registration.getSem().equals("3") || registration.getSem().equals("4"))) {
			batchName = batchName + " Term "+registration.getSem();
		}
		
		List<String> specialisationList = new ArrayList<String>();
		try {
		specialisationList = postService.getSpecialisationTypeBySapid(input.getSapid());		//specialisation list			
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(specialisationList.size() > 0) {
			for(String specialisationName : specialisationList) {
				//separation of specialisation names with ' & '
				sb.append(" ").append(specialisationName).append(" ").append("&");			 				
			}
			 andSeparatedSpecialisationName = sb.deleteCharAt(sb.length() - 1).toString();
			 
			 if(specialisationList.size() > 1) {
				 specialisationType = "Dual";			 
			 }else {
				 specialisationType = "Single";
			 }		 
		}
		if(StringUtils.isEmpty(batchName)) {

			response.put("batch", getBatchNameByProgramIfBatchBlank(registration.getProgram())); 

			response.put("specialisationName",andSeparatedSpecialisationName);
			response.put("specialisationType",specialisationType );

			return new ResponseEntity<HashMap<String,String>>(response, headers, HttpStatus.OK);
		}
		response.put("batch", batchName);
		response.put("specialisationName",andSeparatedSpecialisationName);
		response.put("specialisationType",specialisationType);


		return new ResponseEntity<HashMap<String,String>>(response, headers, HttpStatus.OK);
	}
	
	
	private String getBatchNameByProgramIfBatchBlank(String program) {
		if(MBA_WX_PROGRAM_NAME.equalsIgnoreCase(program)) {
			return MBA_WX_PROGRAM_NAME;
		}
		else if(MSC_AIML_PROGRAM_NAME.equalsIgnoreCase(program)) {
			return MSC_AIML_PROGRAM_NAME;
		}
		else
			return "";
	}

	// @RequestMapping(value = "/scheduler", method = {RequestMethod.GET,
	// RequestMethod.POST})
	@Scheduled(fixedDelay = 1000 * 60 * 1)
	public void scheduler() {  
		
		if (!"tomcat4".equalsIgnoreCase(SERVER) || !"PROD".equalsIgnoreCase(ENVIRONMENT)) {
			//System.out.println("Not running EMBA Post Activation since this is not tomcat4. This is " + SERVER);
			return;
		}
		
		List<Post> post = postService.getPostWithScheduleTime();
  
		Calendar now = Calendar.getInstance(); 
		try { 
			for (Post bean : post) {
				
				//commented by Riya as it not needed (scheduled date is being set while uploading content by the admin)
				//activate resource post after session start
 				/*if(bean.getType().equalsIgnoreCase("Resource")) {
 					SessionBean s = postService.getCorrespondingSession(Integer.parseInt(bean.getSession_plan_module_id()) );
 					if(s!=null) {
 						SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");   
 						Date sdate = dateformat.parse(s.getDate() +" "+ s.getStartTime());
						Date scheduledDate = DateUtils.addMinutes(sdate, -5);
						bean.setScheduledDate(scheduledDate);  
 					}  
 				}*/
 				
				if(bean.getScheduledDate()!=null) {
					Calendar date = Calendar.getInstance();
					date.setTime(bean.getScheduledDate());
	
					if (date.before(now)) {
						bean.setScheduleFlag("N");
						postService.updatePost(bean);
						insertToRedis(bean);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String insertToRedis(Post posts) {
		RestTemplate restTemplate = new RestTemplate();
		try {
			posts.setTimeboundId(posts.getSubject_config_id());
	  	    String url = SERVER_PATH+"timeline/api/post/refreshRedisDataByTimeboundIdForAllIntances";
	    	  //System.out.println("IN savePostInRedisToCache() got url : \n"+url);
			HttpHeaders headers = new HttpHeaders();
			  headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			  HttpEntity<Post> entity = new HttpEntity<Post>(posts,headers);
			  
			  String refereshPostData = restTemplate.exchange(
				 url,
			     HttpMethod.POST, entity, String.class).getBody();
		
			  		//Update test questions in redis start
					if("MCQ".equalsIgnoreCase(posts.getType())) {
			  		Long testId = Long.parseLong(posts.getReferenceId());
					String urlIATest = SERVER_PATH+"timeline/api/test/setTestQuestionsInRedisByTestId";
			    	//System.out.println("IN setTestQuestionsInRedisByTestId() got testId: "+testId+" url : \n"+urlIATest);
					TestLtidemoBean test = new TestLtidemoBean();
			    	test.setId(testId);
					HttpHeaders headersIATest = new HttpHeaders();
					headersIATest.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
					HttpEntity<TestLtidemoBean> entityIATest = new HttpEntity<TestLtidemoBean>(test,headersIATest);
					  
					  return refereshPostData + restTemplate.exchange(
							  urlIATest,
					     HttpMethod.POST, entityIATest, String.class).getBody();
						}
				  		//Update test questions in redis end
			  
					 return refereshPostData;
		} catch (RestClientException e) {
			e.printStackTrace();
			return "Error IN rest call got "+e.getMessage();
		}
	}
	@RequestMapping(value = "/getHashtags", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Response> getHashtags(@RequestBody Hashtag hashtag) {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		Response response = new Response();

		List<Hashtag> getHashtags = postService.getHashtags(hashtag.getProgram_sem_subject_id());
		response.setHashtags(getHashtags);

		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);

	}

	@RequestMapping(value = "/getSearchKeywords", method = RequestMethod.POST)
	public ResponseEntity<List<String>> getSearchKeywords(HttpServletRequest request, @RequestBody JSONObject inputJsonObj, HttpServletRequest req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String keyword;
		keyword = (String) inputJsonObj.get("keyword");
		List<String> keywordList = postService.getSearchKeywordList(keyword);
		return new ResponseEntity<>(keywordList, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/checkStudentType", method = RequestMethod.POST)
	public ResponseEntity<Response> checkStudentType(HttpServletRequest request, @RequestBody JSONObject inputJsonObj,
			HttpServletRequest req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String userId;
		userId = (String) inputJsonObj.get("userId");
		StudentLtidemoBean student = postService.getSingleStudentsData(userId);
		Response response = new Response();
		if (isTimeboundWiseByConsumerProgramStructureId(student.getConsumerProgramStructureId())) {
			response.setIsStudentWorkEx(true);
		} else {
			response.setIsStudentWorkEx(false);
		}
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}
	
		// returns true if master key of MBAWx or Msc Ai & Ml
		private boolean isTimeboundWiseByConsumerProgramStructureId(String consumerProgramStructureId) {
			if (TIMEBOUND_PORTAL_LIST.contains(consumerProgramStructureId)) {
				return true;
			}else {
				return false;
			}
		
		 }

	@RequestMapping(value = "/getPostExtraData", method = RequestMethod.POST)
	public ResponseEntity<Response> getPostExtraData(HttpServletRequest request, @RequestBody RequestBeanLtidemoBean req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		int post_id = req.getPost_id();
		String userId = req.getUserId();
		String facultyId = req.getFacultyId();

		int commentCount = postService.getCountofComments(post_id);
		long reactionCount = postService.getCountofReactions(req);

		long alreadyLiked = postService.getUserAlreadyLiked(post_id, userId);

		List<FacultyLtidemoBean> facultyDetails = new ArrayList<FacultyLtidemoBean>();
		facultyDetails.add(postService.getFacultyDetailsByUserId(facultyId));

		Response response = new Response();

		response.setCommentCount(commentCount);
		response.setReactionCount(reactionCount);
		response.setFaculties(facultyDetails);
		response.setAlreadyLiked(alreadyLiked);

		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/reportPost", method = RequestMethod.POST)
	public ResponseEntity<String> reportPost(HttpServletRequest request, @RequestBody JSONObject inputJsonObj,
			HttpServletRequest req) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		String userId = (String) inputJsonObj.get("userId");
		int postId = (int) inputJsonObj.get("postId");
		String action = (String) inputJsonObj.get("action");

		PostReportList postReportList = new PostReportList();
		postReportList.setUserId(userId);
		postReportList.setPostId(postId);
		postReportList.setAction(action);

		String msg = postService.reportPost(postReportList);

		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/checkNewPost", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<Response> checkNewPost(@RequestBody RequestBeanLtidemoBean request, HttpServletRequest req) {
		req.getSession().setAttribute("RequestBody", request);
		HttpHeaders headers = new HttpHeaders();
		Response response = new Response();
		int timeBoundId = request.getTimeBoundId();
		String userId = request.getUserId();
		Long groupid = request.getGroup_id();
		int pageId = request.getPageId();
		String facultyId = request.getFacultyId();
		String createdDate = request.getCreatedDate();

		String keyword = request.getKeyword();
		int sessionPlanModuleId = request.getSessionPlanModuleId();

		List listOfPosts = new ArrayList<>();
		int postCount = 0;

		try {
			String timeBoundIds = "";
			String facultyIds = "";
			String role;
			role = (String) req.getSession().getAttribute("role");
			if (role == null) {
				role = "student";
			}
			List<Integer> timeBoundIdBasedOnUserdId = new ArrayList<>();
			if (role.equalsIgnoreCase("Student")) {
				if (timeBoundId == 0) {
					timeBoundIdBasedOnUserdId = postService.getCurrentPreviousTimeBoundIdBasedOnUserId(userId,
							"Active");
				} else {
					timeBoundIdBasedOnUserdId.add(timeBoundId);
				}
			} else {
				facultyId = userId;
				timeBoundIdBasedOnUserdId = postService.getTimeBoundIdForFaculty(userId);
			}
			if ((timeBoundIdBasedOnUserdId.size() > 0)) {
				timeBoundIds = "'" + StringUtils.join(timeBoundIdBasedOnUserdId, "\',\'") + "'";
				postCount = postService.checkNewPost(createdDate, timeBoundIds);
				response.setStatus("Update");
				response.setPostCount(postCount);
			} else {
				response.setStatus("No Update");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/m/deleteCommentById", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> deleteCommentById(@RequestBody CommentsLtidemoBean bean) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String deletedRows = postService.deleteCommentById(bean.getId());
		HashMap<String, String> response = new HashMap<>();

		if (StringUtils.isNumeric(deletedRows)) {
			postService.hitRefreshCacheByPostId(deletedRows);
			response.put("success", "true");
			response.put("message", "Deleted successfully.");
		} else {
			response.put("success", "false");
			response.put("message", "Deleting error. "+deletedRows);
		}
		return new ResponseEntity<Map<String, String>>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCountDownTime", method = RequestMethod.POST)
	public ResponseEntity<StudentSubjectConfigResponseBean> getCountDownTime(HttpServletRequest request,
			@RequestBody JSONObject inputJsonObj) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		Integer timeBoundId = (Integer) inputJsonObj.get("id");

		StudentSubjectConfig countDownDetails = postService.getTimeDetailsByTimeBoundId(timeBoundId);
		StudentSubjectConfigResponseBean response = new StudentSubjectConfigResponseBean();
		response.setStudentSubjectConfig(countDownDetails);
		return new ResponseEntity<StudentSubjectConfigResponseBean>(response, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getReactedUserList", method = RequestMethod.POST)
	public ResponseEntity<List> getUsersReactionforPost(HttpServletRequest request, @RequestBody RequestBeanLtidemoBean input) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		int post_id = input.getPost_id();


		List data = postService.getReactedUserList(post_id);

//		StudentSubjectConfigResponseBean response = new StudentSubjectConfigResponseBean();
//		response.setStudentSubjectConfig(countDownDetails);

		return new ResponseEntity<List>(data, headers, HttpStatus.OK);
	}

	
	@RequestMapping(value = "/getFacultylistByTimeBoundId", method = RequestMethod.POST)
	public ResponseEntity<List<FacultyLtidemoBean>> getFacultylistByTimeBoundId(HttpServletRequest request,@RequestBody RequestBeanLtidemoBean input) { 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
	 	
		String timeboundId = String.valueOf(input.getTimeBoundId());
		
		List<FacultyLtidemoBean> data =postService.getFacultyids(timeboundId);
		
//		StudentSubjectConfigResponseBean response = new StudentSubjectConfigResponseBean();
//		response.setStudentSubjectConfig(countDownDetails);
		
		return new ResponseEntity<List<FacultyLtidemoBean>>(data, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getStudentProfileInfo", method = RequestMethod.POST)
	public ResponseEntity<Response> getStudentProfileInfo(HttpServletRequest request, @RequestBody RequestBeanLtidemoBean input) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");

		String sapid = input.getSapid();
		StudentLtidemoBean student = postService.getSingleStudentsData( sapid);
		List  groupsList = postService.getGroupsForStudent(sapid);
		
		Response response = new Response();
		response.setStudent(student);
		response.setGroupsForStudentBySubjectId(groupsList);
		return new ResponseEntity<Response>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/courseCoordinatorChat", method = RequestMethod.GET)
	public ModelAndView courseCoordinatorChat() {
		
		ModelAndView modelAndView = new ModelAndView("courseCoordinatorChat");
		ArrayList<ChatBean> courseCoordinators = chatDAO.getCourseCoordinators();
		ArrayList<ChatBean> coordinatorDetials = chatDAO.getCourseCoordinatorSubjectSem();

		modelAndView.addObject("courseCoordinators", courseCoordinators);
		modelAndView.addObject("coordinatorDetials", coordinatorDetials);
		return modelAndView;
		
	}
}
