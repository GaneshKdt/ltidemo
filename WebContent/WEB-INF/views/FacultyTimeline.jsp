<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.net.URLEncoder"%>

<jsp:useBean id="dateValue" class="java.util.Date" />

<%
	String roleCheck = (String)session.getAttribute("role");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<style type="text/css">
/* For material-icon align with text */
.material-icons {
	display: inline-flex;
	vertical-align: top;
}

.action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.action_menu {
	z-index: 1;
	position: absolute;
	padding: 15px 0;
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border-radius: 15px;
	top: 30px;
	right: 15px;
	display: none;
}

.action_menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.action_menu ul li {
	width: 100%;
	padding: 10px 15px;
	margin-bottom: 5px;
}

.action_menu ul li i {
	padding-right: 10px;
}

.action_menu ul li:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.2);
}
.trigger {
	position: relative;
    position: relative;
    margin: 3px 5px 3px 0;
    padding: 3px 20px 3px 5px;
    border: 1px solid #e8e0e0;
    font-size: 13px;
    max-width: 100%;
    border-radius: 3px;
    background-color: #f9f9f9;  
}  

.preloader {
    display: block;
    margin: 50px;
    width: 50px;
	height: 50px;   
    -webkit-animation: rotate 0.8s infinite linear !important;
    -moz-animation: rotate 0.8s infinite linear !important;
    animation: rotate 0.8s infinite linear !important;
    border:  5px solid #007bff;
    border-right-color: transparent;
    border-radius: 50%;
    position:relative;
}

@-webkit-keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}

@-moz-keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}
@keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}


</style>


<!-- file upload preview -->
<link href="assets/css/jquery.uploadPreviewer.css" rel="stylesheet" />
<link href="assets/css/NewReaction.css" rel="stylesheet" /> 
<link href="assets/css/facultyTimeline.css" rel="stylesheet" /> 
  
<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>

<script type="text/javascript" src="assets/js/newReaction.js"></script>

</head>

<body>
	
	<%@ include file="header.jsp" %>

	<div class="container-fluid container-body">

		<div class="row">

			<div class="col-lg-2 col-md-3 col-sm-4">
				<jsp:include page="sidedrawer.jsp">
					<jsp:param value="<%=role%>" name="role" />
				</jsp:include>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-8 pl-5">

				<!-- 1st card for User Post Area -->

				<div class="card mb-2">
					<div class="card-body createPostFormDiv">

						<form:form action="addPosts" method="post" modelAttribute="post"
							id="myform" enctype="multipart/form-data">
							<form:hidden path="post_id" id="post_id" />
							<form:hidden path="type" id="type" />
							<form:hidden path="fileName" id="fileName" />
							
							<form:hidden path="calendarDate" class="sc_date" />
							<form:hidden path="calendarTime" class="sc_time" />
							<form:hidden path="subject" id="hidden_subject_field"/> 
							<form:hidden name="selected_tag" path="hashtags" class="selected_tag" />       
                            <div class="border"> 
								<form:textarea class=" p-4 editable " path="content" placeholder="Write something here..." id="textarea" rows="2" />
								<form:errors path="content" class="alert alert-danger m-0 p-0"></form:errors>
							</div>               
<!-- 							<button class="btn btn-light btn-block" type="button" data-toggle="collapse" data-target="#share" aria-expanded="false" aria-controls="share"> -->
<!-- 								<span class="float-left">Share with...</span>  -->
<!-- 								<span class="float-right"><i class="fas fa-chevron-down"></i></span> -->
<!-- 							</button>   --> 


<!-- 							<div class="collapse show" id="share"> -->

								<div class="row pt-2">
									<c:if test="${not empty role && role == 'Faculty'}">
									
											<div class="col-md-6 column">
												<div class="form-group">
													<label for="subject">Subject</label>
													<form:select path="subject_config_id" type="text" placeholder="Subject" class="form-control selectSubject" >
														<option disabled selected value="">Select Subject</option>
														<c:forEach var="subject" items="${consumerTypes}">
															<form:option data-subject="${subject.subject}" value="${subject.timebound_subject_config_id }" >
										                		<c:out value="${subject.subject} - ${subject.batchName }"/>
										                	 </form:option>
									                	 </c:forEach>
													</form:select>
												</div>
											</div>
										
											<div class="col-md-6 column">
												<div class="form-group">
													<label for="session_plan_module_id">Session Plan Modules</label>
													<form:select path="session_plan_module_id" type="text" placeholder="Select Session Plan" 
																 class="form-control session_plan_module_id" >
														<option disabled selected value="">Select Session Plan</option>
													</form:select>
												</div>
											</div>
										
									</c:if>
								
<!-- 							Added Check to hide 4 Dropdowns from Faculty Start				-->

								<%if(roleCheck.indexOf("Acads Admin") != -1 || roleCheck.indexOf("MBA-WX Admin") != -1){ 	%>
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="consumerType">Consumer Type</label> 
											<select data-id="consumerTypeDataId"  path="consumerType" name="consumerType"
												class="form-control selectConsumerType" required="required">
												<option disabled selected value="">Select Consumer Type</option>
											</select>
										</div>
									</div>

									<div class="col-md-4 column">
										<div class="form-group">
											<label for="programStructure">Program Structure</label> 
											<select data-id="consumerTypeDataId" path="programStructure" name="programStructure" 
															class="form-control programStructure" required="required">
												<option disabled selected value="">Select Program Structure</option>
											</select>
										</div>
									</div>

									<div class="col-md-4 column">
										<div class="form-group">
											<label for="Program">Program</label> 
											<select data-id="program" path="program" name="program" class="form-control program" required="required">
												<option disabled selected value="">Select Program</option>
											</select>
										</div>
									</div>
			
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="subject">Subject</label>
											<form:select  path="subject_config_id" type="text" placeholder="Subject" class="form-control selectSubject" >
												<option disabled selected value="">Select Subject</option>
											</form:select>
										</div>
									</div>
			
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="session_plan_module_id">Session Plan Modules</label>
											<form:select path="session_plan_module_id" type="text" placeholder="Select Session Plan" 
														 class="form-control session_plan_module_id" >
												<option disabled selected value="">Select Session Plan</option>
											</form:select>
										</div>
									</div>
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="group_id">Groups</label>
											<form:select path="group_id" type="text" placeholder="Select Session Plan" class="form-control group_id" >
												<option disabled selected value="">Select Groups</option>
											</form:select>
										</div>
									</div>
								<%} %>
								
					<!-- 			Added Check to hide 4 Dropdowns from Faculty End				-->
						
					<!-- 			Added Sem Wise Post Start 		-->
					
							<%if(roleCheck.indexOf("Acads Admin") != -1 || roleCheck.indexOf("MBA-WX Admin") != -1){ 	%>
<%-- 							<c:if test="${not empty role && role == 'Acads Admin'}"> --%>
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="acadYear">Acad Year</label>
											<form:select path="acadYear" type="text" placeholder="Select Acad Year" class="form-control" required="required">
												<form:option value="">Select Acad Year</form:option>
												<form:options items="${ACAD_YEAR_LIST}" />
											</form:select>
										</div>
									</div>
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="acadMonth">Acad Month</label>
											<form:select path="acadMonth" type="text" placeholder="Select Acad Month" class="form-control" required="required">
												<form:option value="">Select Acad Month</form:option>
												<form:options items="${ACAD_MONTH_LIST}" />
											</form:select>
										</div>
									</div>
								
								
									 <%-- <div class="col-md-4 column">
										<div class="form-group">
											<label for="acadMonthYear">Acad Month-Year</label>
											<form:select path="acadMonthYear" type="text" placeholder="Select Acad Month-Year" class="form-control" required="required">
												<form:option value="">Select Month-Year</form:option>
												<c:forEach items="${acadYearMonth}" var="map">
													<form:option value="${map.key}">${map.value}</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>  --%>
									
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="sem">Term</label>
											<form:select path="sem" type="text" placeholder="Select Term" class="form-control" required="required">
												<form:option value="">Select Term</form:option>
													<form:option value="1">1</form:option>
													<form:option value="2">2</form:option>
													<form:option value="3">3</form:option>
													<form:option value="4">4</form:option>
													<form:option value="5">5</form:option>
											</form:select>
										</div>
									</div>
									
<%-- 								</c:if> --%>
									<%} %>
								
						<!-- 		Added Sem Wise Post End		 	-->

									
									<div class="col-md-8 column"> 
										<div class="form-group">
											<label for="hashtag_id">Hashtag</label>
											<select id="hashtag_id" name="hashtag_id" type="text" data-placeholder="Select Hashtag"
												class="form-control hashtag_id chosen-select" multiple tabindex="4">   
												<option value=""></option>   
												 
											</select>
										</div>
									</div>  
							</div>
        
							<img id="preview" src="#" alt="" />
							<div class=" p-1   media border embeded_div "  style="display: none;" >     
								<img class="mr-3 embed_image align-self-center" src=""  width="80px" height="60px"/>
								<form:hidden path="embedImage" class="embed_image" />
								<div class="media-body  pl-3 text-muted" >      
									<p class="mt-0 my-1 ">     
									<strong class="text-dark embed_title"> </strong><span class="btn cancel_embed float-right pr-2 ">x</span>
									<form:hidden path="embedTitle" class="embed_title" />
									<p class="my-1 "><small class=" "><b class="embed_description" ></b></small></p>
									<form:hidden path="embedDescription" class="embed_description" />
									<p class="my-1 "><small class=""><b class="embed_url "></b></small></p>  
									<form:hidden path="embedUrl" class="embed_url" />
									<form:hidden path="fileSize" class="uploadedFileSize" />
							    </div>
							</div>
							 
							<div class="  ">
								<div class="d-flex flex-row pt-3"> 
									<div class="w-50 "></div>
									<div class=" "></div>
								</div>
								<div class="selector-wrapper"></div>
							</div>
 
							<a href="#" data-toggle="modal" data-target="#schedulerModal" style="font-size: 12px">Schedule Your Post</a><br>
							<span class="schedule_label"></span>
							<br><br>

							<div class="">

								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

									<div class="btn-group mr-2 text-muted" role="group">
										<div id="file-uploader ">
											<input type="file" name="multipartFile" id="file1" class="form-control" />  
											<button type="button" class="btn btn-light text-muted attach_icon" data-toggle="modal" data-target="#attach_link_modal">
												<i class="fa-solid fa-link fs-18" title="Add Link"></i>
											</button> 
<!-- 										Commented for now -->
											<!-- <button type="button" class="btn btn-light text-muted">
												<i class="fas fa-book fs-18" title="Add From Library"></i>
											</button> -->
										</div>
									</div>
								</div>
								<span style="color: red;">**The Maximum upload size is 200 MB.</span>
							</div>




							<!-- Modal For Link -->

							<div class="modal" id="attach_link_modal" tabindex="-1" role="dialog" aria-labelledby="linkLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="linkLabel">Attach Link</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body">
											<div class="form-group">
												<form:input type="text" name="url" path="url" id="id_url" class="form-control p-8" placeholder="Enter Url here..." value="" />
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
											<button  class="btn btn-primary attach_embeded">Attach</button>
										</div>
									</div>
								</div>
							</div>

							<div class="float-right ">
								<button type="submit" class="btn btn-primary form_btn">Post</button>   
							</div>
						</form:form>
					</div>
				</div>



				<jsp:include page="errorMessage.jsp"></jsp:include>
				<div id="status"></div>
				<div id="appendable"></div>
				<div class="d-flex justify-content-center loader"></div>

				<!-- Modal for announcement -->

				<div class="modal fade" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle"aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="color: #3b5998" class="modal-title" id="exampleModalScrollableTitle">Announcement</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body" style="background-color: rgb(245, 245, 245); border-radius: 10px;">
								<h5 style="font-weight: 500" id="announcement_subject"></h5>
								<div>
									<span style="color: #26a9e0" id="announcement_category"></span>
								</div>
								<br>

								<div style="background-color: white; padding: 15px 10px;" id="announcement_detail"></div>
								<div id="announcement_attachment" style="margin-top: 20px;"></div>

							</div>

						</div>
					</div>
				</div>

			
				<!-- Modal for schedulerModal -->
				<div class="modal " id="schedulerModal">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="color: #3b5998" class="modal-title">Schedule Your Post</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							 <div class="modal-body" style="background-color:rgb(245,245,245);border-radius:10px;">
						         <h5 style="font-weight:500" id="announcement_subject" ></h5>
					               <div class="row">
							         <div class='col-sm-6'>
							             <div class="form-group">
							               <label for="datepicker4" class="col-form-label">Date:</label>
							                 <input type='text' id="datepicker4" class="form-control" />
							             </div>
							         </div>
							         <div class='col-sm-6'>
							             <div class="form-group">
							               <label for="timepicker4" class="col-form-label">Time:</label>
							                  <input id="timepicker4" type="text" class="form-control">
							             </div>
							         </div>
					     		  </div>
						     </div>

							<div class="modal-footer">
								<button class="btn btn-primary float-right cacheSchedule" data-dismiss="modal" type="submit" id="button-addon2">Save</button>
							</div>
						</div>
					</div>
				</div>
				
								<!-- Modal for Edit-->
				<div class="modal " id="EditPostModal">
					<div class="modal-dialog modal-dialog-scrollable modal-lg" role="document"> 
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="color: #3b5998" class="modal-title">Edit Post</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form:form action="addPosts" method="post" modelAttribute="post"
							id="editform" enctype="multipart/form-data">
							 <div class="modal-body" style="background-color:rgb(245,245,245);border-radius:10px;">
						         						
							<form:hidden path="post_id" id="edit_post_id" />
							<%-- <form:input path="type" id="edit_type" />
							<form:input path="fileName" id="edit_fileName" />
							
							<form:input path="scheduledDate" class="edit_sc_date" />
							<form:input path="scheduledTime" class="edit_sc_time" /> --%>
							<form:hidden  name="selected_tag" path="hashtags" class="edit_selected_tag" />       
                            <div class="border  "> 
								<form:textarea class=" p-4 editable2 "   path="content" placeholder="Write something here..." id="textarea" rows="2" />
								<form:errors path="content" class="alert alert-danger m-0 p-0"></form:errors>
							</div>               


        
							<img id="preview" src="#" alt="" />
							<div class=" p-1   media border embeded_div "  style="display: none;" >     
								<img class="mr-3 embed_image align-self-center" src=""  width="80px" height="60px"/>
								<form:hidden path="embedImage" class="embed_image" />
								<div class="media-body  pl-3 text-muted" >      
									<p class="mt-0 my-1 ">     
									<strong class="text-dark embed_title"> </strong><span class="btn cancel_embed float-right pr-2 ">x</span>
									<form:hidden path="embedTitle" class="embed_title" />
									<p class="my-1 "><small class=" "><b class="embed_description" ></b></small></p>
									<form:hidden path="embedDescription" class="embed_description" />
									<p class="my-1 "><small class=""><b class="embed_url "></b></small></p>  
									<form:hidden path="embedUrl" class="embed_url" />
							    </div>      
							</div> 
							 
							<div class="  ">
								<div class="d-flex flex-row pt-3"> 
									<div class="w-50 "></div>
									<div class=" "></div>
								</div>
								<div class="selector-wrapper"></div>
							</div>
							
							<span class="schedule_label"></span>
							<br><br>
							<label for="consumerType">Attach Link</label>
							<div class="modal-body">
								<div class="form-group">
									<form:input type="text" name="url" path="url"  id="id_url"
										class="form-control p-8 edit_embedUrl" placeholder="Enter Url here..."
										 />
								</div>
								<button type="button" class="btn btn-primary attach_embeded float-right" >Attach</button> 
							</div>
							<label for="file">Attach File</label><br/> <span class="editable_fileName text-muted"></span> 
							<div class="">
								<div class="btn-toolbar" role="toolbar"
									aria-label="Toolbar with button groups">
									<div class="btn-group mr-2 text-muted" role="group">
										<div id="file-uploader ">
											<input type="file" name="multipartFile" id="file2" class="form-control" /> 
<!-- 										Commented for now -->
											<!-- <button type="button" class="btn btn-light text-muted">
												<i class="fas fa-book fs-18" title="Add From Library"></i>
											</button> -->
										</div>
									</div>
								</div>
								<span style="color: red;">**The Maximum upload size is 200 MB.</span>
							</div>




							<!-- Modal For Link -->

							<div class="modal fade" id="attach_link_modal" tabindex="-1" role="dialog" aria-labelledby="linkLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="linkLabel">Attach Link</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body">
											<div class="form-group">
												<form:input type="text" name="url" path="url" id="id_url" class="form-control p-8" placeholder="Enter Url here..." value="" />
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
											<button class="btn btn-primary attach_embeded">Attach</button>
										</div>
									</div>
								</div>
							</div>

						     </div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary ">Post</button>   
							</div>
							</form:form>
						</div>
					</div>
				</div>
	</div>

			<%-- <div class="col-lg-3 col-md-4 pl-5">
				<jsp:include page="right-sidebar.jsp"></jsp:include>
			</div> --%>

			<!--         <div class="col-md-1"></div> -->
			
			<div class="col-lg-2  pl-5 ml-auto"></div>
		</div>

	</div>



	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.5.4/js/jquery.atwho.min.js"></script>
	
	<!--  file upload preview -->
	<script src="assets/js/jquery.uploadPreviewer.js"></script>

	<script type="text/javascript"> 
	 
		$(document).ready(function() {
			myUploadInput = $("#file1").uploadPreviewer();
			myUploadInput = $("#file2").uploadPreviewer();
		});
	</script>
	
 <script src="assets/js/medium-editor.js"></script>  
    <script>
        var editor = new MediumEditor('.editable'),
            editor2 = new MediumEditor('.editable2', {
                toolbar: {
                    buttons: ['bold', 'italic', 'quote', 'pre']
                }
            });
    </script> 

	<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>

<script src="assets/js/template.js"></script>  
<script src="assets/js/embedLink.js"></script> 
<script src="assets/js/dropdownChainFiller.js"></script>
<script src="assets/js/comments.js"></script>
<script type="text/javascript">

	$(document).on('click','.cacheSchedule',function(event) {
		$('.sc_date').val($('#datepicker4').val());
		$('.sc_time').val($('#timepicker4').val());
		$('.schedule_label').text("Post scheduled for "+ $('#datepicker4').val() + " ,"+ $('#timepicker4').val());
	});

<%-- 	Commented By Somesh  --%>
<%-- 	var profile_pic="https://studentzone-ngasce.nmims.edu/"+'<%=profile_pic%>'; --%>
	var profile_pic = '<%=profile_pic%>';
	var userId = "${userId}";
	var subjectId = "";
	var firstName = '<%=firstName%>';
	var lastName = '<%=lastName%>';  
	var facultyId = userId;
	var pageId = 1;
	$(window).load(function() { 
		loadPosts(facultyId);
	});

	$(document).on('click', '.edit_modal_show', function(event) {
		var post_id = $(this).data('post_id');
		var content = $(this).data('content');
		var type = $(this).data('type');
		var fname = $(this).data('fname');
		var embedUrl = $(this).data('embedurl');
		$("#edit_post_id").val(post_id);
		editor2.setContent(content);
		$(".edit_embedUrl").val(embedUrl);
		$(".editable_fileName").text($(this).data('fname'));
		$("edit_type").val(type);
	});

	$(document).on('click', '.action_menu_btn', function(event) {
		$(this).closest(".card-body").find(".action_menu").toggle();
	});

	$(window).scroll(
		function() {
			if (Math.round($(window).scrollTop()) + $(window).height() > $(document).height()-50) {
				loadPosts(facultyId);
			}
	});

	function POST_FILES_PATH() {
		return '${POST_FILES_PATH}';
	}
	
	function SERVER_PATH_FEED_FILES() {
		return '${SERVER_PATH_FEED_FILES}';
	}
	
	function CONTENT_PREVIEW_PATH() {
		return '${CONTENT_PREVIEW_PATH}';
	}

	function facId(){
		return userId;
	}

	function SERVER_PATH() {
		return '${SERVER_PATH}';
	}
	
	function loadPosts(facultyId) {
		$(".loader").html('<div class="preloader" ></div>');

		var grp_id= "${param.grp_id}"; 
		$.ajax({ 
			type : 'POST',
			url : '/ltidemo/listPost/',
			contentType : "application/json",
			data : JSON.stringify({
				"userId" : userId,
				"subjectId" : subjectId,
				"pageId" : pageId,
				"facultyId" : facultyId,
				"group_id":grp_id   
			}),
			dataType : 'json',
			success : function(response) {
				
				var result = response.listOfPosts;
				if( Object.keys(result).length > 0){
					$.each(result,
							function(i, post) {
						
								if (post.type == 'Link'){
									if(PlayerNeeded(post.url)){
										post.url=GeneratePlayerUrl(post.url); 	
										$('#appendable').append([ post ].map(Session).join(''))
									}else{
										$('#appendable').append([ post ].map(Link).join(''));
									}
								}
								else if (post.type == 'Image')
									$('#appendable').append([ post ].map(Image).join(''));
								else if (post.type == 'SessionVideo')
									$('#appendable').append([ post ].map(Session).join(''));
								else if (post.type == 'Video')
									$('#appendable').append([ post ].map(Video).join(''));
								else if (post.type == 'Text')
									$('#appendable').append([ post ].map(Text).join(''));
								else if (post.type == 'File'|| post.type == 'Resource' ){
									$('#appendable').append([ post ].map(File).join(''));
								}else if (post.type == 'Announcement'){
									$('#appendable').append([ post ].map(Announcement).join(''));
								}else if (post.type == 'MCQ'){
									$('#appendable').append([ post ].map(MCQ).join(''));
								}else if (post.type == 'MCQResult'){
									$('#appendable').append([ post ].map(MCQResult).join(''));
								}
								
							});
					
				}else{
					$(".loader").html('<div class="alert alert-primary ">No feeds to show</div>');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		}).done(function(){
			loadFooter();
	      });
		pageId = pageId + 1;
	}
	function loadFooter() {
		$(".card_footer").each(function() {
		var element = $(this);
		var post_id = $(this).attr("data-post_id");
	    $.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/ltidemo/getCommentAndReactions",
				data : JSON.stringify({
					"sapid":userId,
					"post_id" : post_id,
					"role" : "Faculty"
				}),
				dataType : 'json',
				success : function(post) {
					console.log(post);
					var reaction = "";
					var reactionCount = "";
					var myreaction = "";
					if (post.reactions.length > 0) {
						for (i = 0; i < post.reactions.length; i++) { //loop through the array
							reaction = reaction +'<div class="reactionButton '+post.reactions[i]+'"></div>'
						}
					}
					$(element).append([ {
						"myId" : '<%=userId%>',
						"reaction":reaction,
						"reactionCount":post.reactionCount,
						"commentCount":post.commentCount,
						"userId":userId,
						"post_id":post_id,
						"myReaction":post.myReaction
						}].map(Reaction).join(''));
					
                    var comment=[{"profile_pic":'<%=profile_pic%>',"post_id":post_id}].map(Reply).join('');
                    
                    
                    
                    
            		$.ajax({
            			type : 'POST',
            			url : '/ltidemo/viewMoreComments/',
            			contentType : "application/json",
            			data : JSON.stringify({
            				 "post_id" :post_id,
            		          "limit" : "" + 100,
            		          "offset" : 0
            			}),
            			dataType : 'json',
            			success : function(response) {
            				console.log("comments:::::");
            				console.log(response);
            				$.each(response.comments,function(i, comments) {
        						if(comments.master_comment_id==0){
        							var imageUrl=(comments.imageUrl==null)?"assets/images/cover/userImg.jpg":comments.imageUrl;
        							comment=comment + [{
        								"imageUrl":imageUrl,
        								"firstName":comments.firstName,
        								"lastName":comments.lastName,
        								"comment":comments.comment,
        								"createdDate":comments.createdDate,
        								"id":comments.id,
        								"profile_pic":'<%=profile_pic%>',
        								"post_id":post_id,
        								"userId":comments.sapid
        								}].map(Comment).join('');   
        						}
        					});
        					
        					$(element).append('<br/><div class="p-3 commentsDiv">'+comment+'</div>');
            			},
            			error : function(XMLHttpRequest, textStatus, errorThrown) {
            			}
            		});  
				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				}
				});
	    $(this).removeClass('card_footer');$(this).addClass('card_reaction_footer');
			});
	 }	

		function parseJsonDate(date) {
			time = moment(date).format("YYYY-DD-MM h:mm:ss");
			return time;
		}
		
		//Comment Required field i.e. SessionPlan, HashTag, Subject
		/* $(document).on('click','.form_btn',function(event) { //submit form
			var thisForm = $(this).closest("form");
			var hashtags =  thisForm.find(".hashtag_id").chosen().val();   
			var s_plan =  thisForm.find(".session_plan_module_id").val();
			var grp = thisForm.find(".group_id").val(); 
			thisForm.find('.selected_tag').val(hashtags);
			$('.uploadedFileSize').val($('.file-preview-row .filesize').text());
			if(hashtags!=null && s_plan!=null && grp!=null ){
				this.form.submit();
			}else{
				return false; 
			}       
		});  */
		function PlayerNeeded(url){
			return  (url.startsWith("https://youtu.be") || url.startsWith("https://www.youtube.com/")|| 
					url.startsWith("https://player.vimeo.com/") || url.startsWith("https://vimeo.com/"))?true:false	;
		}
		function GeneratePlayerUrl(url){
			var videoId = getYoutubeId(url);
			return (videoId==null)?"//player.vimeo.com/video/"+ url.split('/').slice(-1)[0].split('?')[0]:
			 "//www.youtube.com/embed/"+ videoId;
		}
		function getYoutubeId(url) {
		    var match = url.match(/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/);
		    return (match && match[2].length == 11)?match[2]:null
		}
		
	</script> 
	
	<!--   hashtag -->
  <script src="assets/Hashtag/chosen.jquery.js"  type="text/javascript"></script>
  <script src="assets/Hashtag/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
  <script src="assets/Hashtag/docsupport/init.js" type="text/javascript" charset="utf-8"></script>	
</body>

</html>