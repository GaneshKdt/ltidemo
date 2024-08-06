<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.nmims.bean.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var = "param"  value = "<%= request.getParameter(\"pageid\") %>"/>  

<%
        String userId = (String)session.getAttribute("userId");
		String facultyImgUrl = (String)session.getAttribute("facultyImgUrl");
		PersonLtidemoBean user = (PersonLtidemoBean)session.getAttribute("userLtidemo");
		StudentLtidemoBean studentBean = (StudentLtidemoBean)session.getAttribute("studentLtidemo");
   		FacultyLtidemoBean faculty = (FacultyLtidemoBean)session.getAttribute("facultyLtidemo");
   		String name = "";
   		String roles = "";
   		String program = "";
   		String PhotoUrl = "";
   		String userEmail = "";
   		String userMobile = "";
   		String pStructure = "";

   		if(faculty != null){
   			name = faculty.getFirstName() + " " + faculty.getLastName();
   			userEmail = faculty.getEmail();
   			PhotoUrl = faculty.getImgUrl();
   			roles = "Faculty";
   		}else if(user != null){
   			roles = user.getRoles();
   			if(user.getFirstName() != null){
   				name = user.getFirstName() + " " + user.getLastName();
   			}
   			name = "MBA-WX Admin";
   			program = user.getProgram();
   			userEmail = user.getEmail();
   			userMobile = user.getContactNo();
   		}
   		if(studentBean != null && studentBean.getImageUrl() != null){
   			PhotoUrl = studentBean.getImageUrl().trim();
   			name = studentBean.getFirstName() + " " + studentBean.getLastName();
   			pStructure = studentBean.getPrgmStructApplicable();
   			userEmail = studentBean.getEmailId();
   			program = studentBean.getProgram();
   		}
   		
   		
   		UserAuthorizationLtidemoBean userAuthorization = (UserAuthorizationLtidemoBean)session.getAttribute("userAuthorization");
   		if(userAuthorization != null){
   			roles = (userAuthorization.getRoles() != null && !"".equals(userAuthorization.getRoles())) ? userAuthorization.getRoles() : roles;
   		}
%>

<div class="bmd-layout-container bmd-drawer-f-l ">    
  <header class="bmd-layout-header">
	  <div class="navbar navbar-light bg-faded">
	    <img src="assets/images/icons/logo03.png" class="img-thumbnail rounded border-0 bg-transparent" />
	  <hr>
	  </div>
    
	  <div class="navbar navbar-light bg-faded">         
	       <div class="row">
	           <div class="col-3">
	           
	           		<% if(userId != null) { %>
		            	<% if(userId.startsWith("77") || userId.startsWith("79")){   %>
		            		<img src="<%=PhotoUrl%>" alt="Student Photo" width="40px" height="40px" />
		            	<% }else{  %>
                    		
                    		 <%if(roles.indexOf("Faculty") != -1 ){ %>
		                   	 	<% if(PhotoUrl != null){   %>
		                   	 		<img src="https://studentzone-ngasce.nmims.edu/<%=PhotoUrl%>" alt="Profile Photo" width="40px" height="40px" />
				            	<% }else{  %>
		                    		<img src="assets/images/cover/userImg.jpg" alt="Profile Photo" width="40px" height="40px"/>
		                   		 <% } %>
		                   	 <% }else{ %>
		                   	 		<img src="assets/images/cover/userImg.jpg" alt="Profile Photo" width="40px" height="40px"/>
		                   	 <% } %>
                    		
                   		 <% } %>
                   	<% } %> 
                   
	           </div>
	           
	           <div class="col-9">
	               
	               <%if(!StringUtils.isBlank(name)){ %>
	               		<small class="font-weight-bold"><%=name%></small><br/>
	               <%} %>
	               <small><%= StringUtils.upperCase(userId) %></small><br>
	               <%if(userId.startsWith("77") || userId.startsWith("79")){ %>
	               		<small><%=program%></small>
	               <% } else { %>
	               <small>NGASCE MBA-WX</small>
	               <% } %>
	               
	           </div>
	           
	       </div>
	   </div>
  </header>
  
  <div id="dw-s1" class="bmd-layout-drawer bg-faded">
    
 	<div class="list-group" style="font-size: 80%;" >
 		<div class="list-group">
        	
        	<%if(userId.startsWith("77") || userId.startsWith("79")){ %>
        	<a href="/ltidemo/Timeline" class="list-group-item list-group-item-action list-group-sidebar active" style="border-left-color: #007bff !important;">
	        	<span>
	            	<i class="fa-solid fa-house fs-18" ></i>
	           		<span class="ml-2"><b>Home</b></span>
	            	<span class="badge float-right" style=color: grey;">${listOfPosts.size() }</span>
	            </span>
          	</a>
        	<% } %>
        	
        	<%if(roles.indexOf("Faculty") != -1 ){ %>
        		<a href="/ltidemo/FacultyTimeline" class="list-group-item list-group-item-action list-group-sidebar active" style="border-left-color: #007bff !important;">
		        	<span>
		            	<i class="fa-solid fa-house fs-18" ></i>
		           		<span class="ml-2"><b>Home</b></span>
		            	<span class="badge float-right" style=color: grey;">${listOfPosts.size() }</span>
		            </span>
          		</a>
        	
			<% } %>

            <a class="list-group-item list-group-item-action list-group-sidebar" href="#groups" data-toggle="collapse" aria-controls="groups" > 
            	<span>
                 <i class="fa-solid fa-users fs-18"></i>
                 <span class="ml-1" margin-left:0.35rem!important">Groups</span>
                 <i class="fa-solid fa-ellipsis fs-18 float-right" style="color: #C0C0C0;"></i>
                </span>
            </a>
            
           	<%if(userId.startsWith("77") || userId.startsWith("79")){ %>
           		<div class="collapse ml-4" id="groups">
	           		<c:forEach var="group" items="${groupsForStudent }">
	           			<a href="#" class="list-group-item list-group-item-action list-group-sidebar">${group.groupName }</a>
	           		</c:forEach>
           		</div>
           	<% } %> 
           	
           	<%if(roles.indexOf("Faculty") != -1 ){ %>
           		<div class="collapse ml-4" id="groups">
	           		<c:forEach var="group" items="${groupForFaculty }">
	           			<a href="FacultyTimeline?grp_id=${group.id }&pageid=1" class="list-group-item list-group-item-action list-group-sidebar">${group.groupName }</a>
	           		</c:forEach> 
           		</div>
           	<% } %>
            <%if(faculty != null){ %>
       	   	<a href="viewVideoGallery" class="list-group-item list-group-item-action list-group-sidebar " style="border-left-color: #007bff !important;">
           		<span>
                	<i class="fa-solid fa-book-open fs-18"></i>
                   	<span class="ml-2"">Resources</span>
                   	<span class="badge float-right" style=color: grey;">${listOfPosts.size() }</span>
              	</span>
            </a>
            <% }    %>
             <%if(userId.startsWith("77") || userId.startsWith("79")){ %>      
             <a  class="list-group-item list-group-item-action list-group-sidebar "  data-toggle="collapse" data-target="#courses-data" aria-expanded="false">
             	<span>
                  <i class="fa-solid fa-book fs-18"></i>
                  <span class="ml-2" >Courses</span> 
                  <span class="badge float-right" style="color: grey;">${currentSemSubjects.size() }</span>
                  <span class="badge float-right" style="color: grey;"> <i class="fa fa-angle-down fa-w-10 fa-2x"></i></span>
             	</span>
             </a>
             
			<div class="collapse ml-4 show" id="courses-data">  
               
                   
                   <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class=" font-weight-bold text-dark" >Current </span> 
                    </a> 
                    <c:set var = "active"  value = ""/>
                    <c:forEach var="sub" items="${currentSubjects }">
                     <c:if test = "${sub.id == param.id}">
				      <c:set var = "active"  value = "highlight"/> 
				    </c:if>   
                    <div class="${active}">  
                    <a href="Timeline?id=${sub.id }&pageid=1" class="list-group-item list-group-item-action list-group-sidebar ">${sub.subject } </a>
						<%-- <c:out value="${sub }" /><br> --%>   
                    </div>
                    	
					</c:forEach>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold text-dark" style="color:#90949C;">Archive</span>
                    </a>
                   
                    <c:forEach var="sub" items="${archiveSubjects }">
                     <c:set var = "active"  value = ""/>
                    <c:if test = "${sub.id == param.id}">
				      <c:set var = "active"  value = "highlight"/> 
				    </c:if>
                    <div class="${active}">  
                    <a href="Timeline?id=${sub.id }&pageid=1" class="list-group-item list-group-item-action list-group-sidebar">${sub.subject } </a>
						<%-- <c:out value="${sub }" /><br> --%>   
                    </div>
					</c:forEach>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                       <span class="font-weight-bold text-dark" style="color:#90949C;">Upcoming</span>
                    </a>
                   <c:forEach var="sub" items="${upcomingSubjects }">
                    <c:set var = "active"  value = ""/>
                    <c:if test = "${sub.id == param.id}">
				      <c:set var = "active"  value = "highlight"/> 
				    </c:if>
				    <div class="${active}">  
                   <a href="Timeline?id=${sub.id }&pageid=1" class="list-group-item list-group-item-action list-group-sidebar">${sub.subject } </a>
						<%-- <c:out value="${sub }" /><br> --%>   
                    </div>
						
					</c:forEach>
					<a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                       <span class="font-weight-bold text-dark" style="color:#90949C;">Pending </span>
                    </a>
                   <c:forEach var="sub" items="${pendingSubjects}">
                    	 <c:set var = "active"  value = ""/>
                    <c:if test = "${sub.id == param.id}">
				      <c:set var = "active"  value = "highlight"/> 
				    </c:if>
				    <div class="${active}">  
                   <a href="Timeline?id=${sub.id }&pageid=1" class="list-group-item list-group-item-action list-group-sidebar">${sub.subject } </a>
						<%-- <c:out value="${sub }" /><br> --%>   
                    </div>
					</c:forEach> 
					
		</div>	
		
					<a href="todo" class="list-group-item list-group-item-action list-group-sidebar" >
                    	<span>
                    		<i class="fas fa-list-ul fs-18"></i>
	                        <span class="ml-2">Todo</span>
                        </span>
                    </a>	
		<% } %>
				    
				    <a href="/acads/viewFacultyTimeTable" class="list-group-item list-group-item-action list-group-sidebar" >
                    	<span>
                    		<i class="far fa-calendar-alt fs-18"></i>
	                        <span class="ml-2" >Academic Calendar</span>
	                        <span class="badge float-right" style="font-size: 13px;color: grey;"></span>
                        </span>
                    </a>
                    
                    
                   
                    <%if(roles.indexOf("Faculty") != -1 ){ %>
                    	<a href="addGroupsNameForm" class="list-group-item list-group-item-action list-group-sidebar" >
	                    	<span>
	                    		<i class="fas fa-plus-circle fs-18"></i>
		                        <span class="ml-2" style="font-size: 12px;">Create Group</span>
	                        </span>
                    	</a>
                    	
                    	<a class="list-group-item list-group-item-action list-group-sidebar" data-toggle="collapse" href="#Evaluation" role="button" aria-expanded="false" aria-controls="Evaluation">
					    	<span>
	                    		<i class="fas fa-clipboard-list fs-18"></i>
		                        <span class="ml-2" style="font-size: 12px;">Evaluations</span>
	                        </span> 	 
					  	</a>
					  	<div class="collapse" id="Evaluation">
							<a href="/exam/searchAssignmentToEvaluateForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Evaluate Assignments</span> 
                    		</a> 
                    		<a href="/exam/searchProjectToEvaluateForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Evaluate Projects</span> 
                    		</a>
						</div>
						
						<a class="list-group-item list-group-item-action list-group-sidebar" data-toggle="collapse" href="#Queries" role="button" aria-expanded="false" aria-controls="Queries">
					    	<span>
					    		<i class="far fa-question-circle fs-18"></i>
		                        <span class="ml-2" style="font-size: 12px;">Queries for Me</span>
	                        </span> 	 
					  	</a>
					  	<div class="collapse" id="Queries">
							<a href="/acads/assignedCourseQueries" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Course Queries</span> 
                    		</a>
						</div>
						
						<a href="/acads/updateFacultyProfileForm" class="list-group-item list-group-item-action list-group-sidebar" >
	                    	<span>
	                    		<i class="fa fa fa-user fs-18"></i>
		                        <span class="ml-2" style="font-size: 12px;">My Profile</span>
	                        </span>
                    	</a>
                    	
                    	<a href="/acads/viewFacultyTimeTable" class="list-group-item list-group-item-action list-group-sidebar" >
	                    	<span>
	                    		<i class="far fa-calendar-alt fs-18"></i>
		                        <span class="ml-2" style="font-size: 12px;">Faculty Calendar</span>
	                        </span>
                    	</a>
                    	
                    	<a class="list-group-item list-group-item-action list-group-sidebar" data-toggle="collapse" href="#Session" role="button" aria-expanded="false" aria-controls="Session">
					    	<span>
					    		<i class="far fa-play-circle fs-18"></i>
					    		<span class="ml-2" style="font-size: 12px;">Session Videos</span>
	                        </span> 	 
					  	</a>
					  	<div class="collapse" id="Session">
							<a href="/acads/uploadVideoContentForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Upload Session Videos</span> 
                    		</a> 
                    		<a href="/acads/videosHomeAdmin?pageNo=1&academicCycle=All" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Watch All Videos</span> 
                    		</a>
						</div>
						
						<a class="list-group-item list-group-item-action list-group-sidebar" data-toggle="collapse" href="#Content" role="button" aria-expanded="false" aria-controls="Content">
					    	<span>
					    		<i class="fa-solid fa-book fs-18"></i>
					    		<span class="ml-2" style="font-size: 12px;">Academic Content</span>
	                        </span> 	 
					  	</a>
					  	<div class="collapse" id="Content">
							<a href="/acads/viewApplicableSubjectsForFacultyForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Learning Resources</span> 
                    		</a> 
                    		<a href="/acads/viewReviewForFacultyForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Review Faculty For Session</span> 
                    		</a>
                    		<a href="/acads/createForumThreadForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Create Forum</span> 
                    		</a> 
                    		<a href="/acads/searchForumThreadForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Search Forum</span> 
                    		</a>
                    		<a href="/studentportal/uploadLearningResourcesExcelForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Manage Learning Resources</span> 
                    		</a> 
                    		<a href="/studentportal/gotoEZProxy" target="_blank" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Digital Library</span> 
                    		</a>
                    		<a href="/acads/uploadContentForm" class="list-group-item list-group-item-action list-group-sidebar">
                        		<span class="ml-4">Upload Content</span> 
                    		</a>
						</div>
			
                     <%} %>  
                                
					<a href="courseCoordinatorChat" class="list-group-item list-group-item-action list-group-sidebar" >
		            	<span>
		                	<i class="fas far fa-comments fs-18"></i>
			            	<span class="ml-2" style="font-size: 12px;">Course Coordinator Chat</span>
		                </span>
					</a>
					
				     <%-- added by Suraj Sharma for show fullView option in side bar --%>
				     
				     <a href="/ltidemo/fullViewChat" class="list-group-item list-group-item-action list-group-sidebar" >
		            	<span>
		                	<i class="fas far fa-comments fs-18"></i>
			            	<span class="ml-2" style="font-size: 12px;">FullView Chat</span>
		                </span>
					</a>
				     <a href="/ltidemo/searchBatchUserForm" class="list-group-item list-group-item-action list-group-sidebar" >
		            	<span>
		                	<i class="fas far fa-comments fs-18"></i>
			            	<span class="ml-2" style="font-size: 12px;">Broadcast Messages</span>
		                </span>
					</a>
					
					
             </div>
    </div>
  </div>
</div>
<script>

</script>
