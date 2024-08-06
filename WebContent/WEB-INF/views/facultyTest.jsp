<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@page import="java.util.Calendar"%>
<%@page import="java.net.URLEncoder"%>
<jsp:useBean id="dateValue" class="java.util.Date" />

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
    margin: 3px 5px 3px 0;
    padding: 3px 20px 3px 5px;
    border: 1px solid #aaa;    
    font-size: 13px;
    max-width: 100%;
    border-radius: 3px;
    background-color: #eeeeee;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(20%, #f4f4f4), color-stop(50%, #f0f0f0), color-stop(52%, #e8e8e8), to(#eee));
    background-image: linear-gradient(#f4f4f4 20%, #f0f0f0 50%, #e8e8e8 52%, #eee 100%);
    background-size: 100% 19px;
    background-repeat: repeat-x;
    background-clip: padding-box;
    -webkit-box-shadow: 0 0 2px #fff inset, 0 1px 0 rgba(0, 0, 0, 0.05);
    box-shadow: 0 0 2px #fff inset, 0 1px 0 rgba(0, 0, 0, 0.05);
    color: #333;
    line-height: 13px;
    cursor: default; 
}  
</style> 

<style>
.preloader {
	border: 5px solid #DCDCDC;
	border-radius: 50%;
	border-top: 5px solid #007bff;
	width: 50px;
	height: 50px;
	-webkit-animation: spin 2s linear infinite; /* Safari */
	animation: spin 2s linear infinite;
}

/* Safari */
@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform:rotate

(360 deg);
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100%
{
transform:rotate
(360deg);
}
}
.close-choice { 
position: absolute;
    top: 4px;
    right: 3px;
    display: block;
    width: 12px;
    height: 12px;
    background: url(assets/Hashtag/chosen-sprite.png) -42px 1px no-repeat;   
    font-size: 1px; 
}
</style>

<!--  -->





<!-- file upload preview -->
<link href="assets/css/jquery.uploadPreviewer.css" rel="stylesheet" />


<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>

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
					<div class="card-body">

						<form:form action="addPosts" method="post" modelAttribute="post"
							id="myform" enctype="multipart/form-data">
							<form:hidden path="post_id" id="post_id" />
							<form:hidden path="type" id="type" />
							<form:hidden path="fileName" id="fileName" />
							
							<form:hidden path="scheduledDate" class="sc_date" />
							<form:hidden path="scheduledTime" class="sc_time" />
							<form:hidden  name="selected_tag" path="hashtags" class="selected_tag" />       
                            <div class="border  "> 
								<form:textarea class=" p-4 editable "   path="content" placeholder="Write something here..." id="textarea" rows="2" />
								<form:errors path="content" class="alert alert-danger m-0 p-0"></form:errors>
							</div>               
<!-- 							<button class="btn btn-light btn-block" type="button" data-toggle="collapse" data-target="#share" aria-expanded="false" aria-controls="share"> -->
<!-- 								<span class="float-left">Share with...</span>  -->
<!-- 								<span class="float-right"><i class="fas fa-chevron-down"></i></span> -->
<!-- 							</button>   --> 


<!-- 							<div class="collapse show" id="share"> -->

								<div class="row pt-2"> 
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="consumerType">Consumer Type</label> <select
												data-id="consumerTypeDataId" id="consumerTypeId"
												path="consumerType" name="consumerTypeId"
												class="form-control selectConsumerType" required="required">
												<option disabled selected value="">Select Consumer
													Type</option>
											</select>
										</div>
									</div>

									<div class="col-md-4 column">
										<div class="form-group">
											<label for="programStructure">Program Structure</label> <select
												data-id="consumerTypeDataId" id="programStructure"
												path="programStructure" name="consumerTypeId"
												class="form-control programStructure" required="required">
												<option disabled selected value="">Select Program
													Structure</option>
											</select>
										</div>
									</div>

									<div class="col-md-4 column">
										<div class="form-group">
											<label for="Program">Program</label> <select data-id="program"
												id="program" path="program" name="consumerTypeId"
												class="form-control program" required="required">
												<option disabled selected value="">Select Program</option>
											</select>
										</div>
									</div>
			
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="subject">Subject</label>
											<form:select id="selectSubject" path="program_sem_subject_id"
												type="text" placeholder="Subject"
												class="form-control selectSubject" required="required">
												<option disabled selected value="">Select Subject</option>
											</form:select>
										</div>
									</div>
			
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="session_plan_module_id">Session Plan</label>
											<form:select id="session_plan_module_id"
												path="session_plan_module_id" type="text"
												placeholder="Select Session Plan"
												class="form-control session_plan_module_id" required="required">
												<option disabled selected value="">Select Session Plan</option>
											</form:select>
										</div>
									</div>
									
									<div class="col-md-4 column">
										<div class="form-group">
											<label for="group_id">Groups</label>
											<form:select id="group_id"
												path="group_id" type="text"
												placeholder="Select Session Plan"
												class="form-control group_id" required="required">
												<option disabled selected value="">Select Groups</option>
											</form:select>
										</div>
									</div>
									<div class="col-md-8 column"> 
										<div class="form-group">
											<label for="hashtag_id">Hashtag</label>
											<select id="hashtag_id"
												name="hashtag_id" type="text"
												data-placeholder="Select Hashtag"
												class="form-control hashtag_id chosen-select" required="required" multiple tabindex="4">   
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

								<div class="btn-toolbar" role="toolbar"
									aria-label="Toolbar with button groups">

									<div class="btn-group mr-2 text-muted" role="group">
										<div id="file-uploader ">
											<input type="file" name="multipartFile" id="file" class="form-control" />  
											<button type="button" class="btn btn-light text-muted" data-toggle="modal" data-target="#attach_link_modal">
												<i class="fa-solid fa-link fs-18" title="Add Link"></i>
											</button> 
											<button type="button" class="btn btn-light text-muted">
												<i class="fa-solid fa-book fs-18" title="Add From Library"></i>
											</button>
										</div>
									</div>
								</div>
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
											<button id="attach_embeded" class="btn btn-primary">Attach</button>
										</div>
									</div>
								</div>
							</div>

							<div class="float-right ">
								<button type="button" class="btn btn-primary form_btn">Post</button>   
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
	</div>

			<div class="col-lg-3 col-md-4 pl-5">
				<jsp:include page="right-sidebar.jsp"></jsp:include>
			</div>

			<!--         <div class="col-md-1"></div> -->
			<div class="col-lg-2  pl-5 ml-auto"></div>
		</div>

	</div>


 


	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.5.4/js/jquery.atwho.min.js"></script>
	
	<!--  file upload preview -->
	<script src="assets/js/jquery.uploadPreviewer.js"></script>

	<script type="text/javascript"> 
	 
	 
		$(document).ready(function() {
			myUploadInput = $("input[type=file]").uploadPreviewer();

		});
	</script>
	
 <script src="assets/js/medium-editor.js"></script>  
    <script>
        var editor = new MediumEditor('.editable'),
            editor2 = new MediumEditor('.secondEditable', {
                toolbar: {
                    buttons: ['bold', 'italic', 'quote', 'pre']
                }
            });
    </script>

	<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>

<script src="assets/js/template.js"></script>     

	<script type="text/javascript">
	

		$(document).on(
				'click',
				'.cacheSchedule',
				function(event) {

					$('.sc_date').val($('#datepicker4').val());
					$('.sc_time').val($('#timepicker4').val());
					$('.schedule_label').text(
							"Post scheduled for " + $('#datepicker4').val()
									+ " ," + $('#timepicker4').val());
				});

		$(document).on(
				'click',
				'.cancel_embed',
				function() {
					$(".embeded_div").hide();    
				    $('.embed_image').val();  
				    $('.embed_title').val();  
				    $('.embed_description').val();
				    $('.embed_url').val();  
				});
				
		$('#attach_embeded').bind('click', function(e) {
			$('#attach_link_modal').modal('hide');
			$(".embeded_div").show();    
			var target = $('#id_url').val();
			$.ajax({
				  url: "http://api.linkpreview.net/?key=5ccd799a0c25cfc395033ebd2b94ee073c8328fa18473&q="+target,  
				  async: true, 
				  success: function(data) {
				    console.log(data);  
				    $('.embed_image').attr("src",data.image); 
				    $('.embed_image').val(data.image);  
				    $('.embed_title').html(data.title);
				    $('.embed_title').val(data.title);  
				    $('.embed_description').html(data.description);
				    $('.embed_description').val(data.description);
				    $('.embed_url').html(data.url);  
				    $('.embed_url').val(data.url);  
				  },  
				  error: function(e) {alert(e);}   
				});
return false; 
		});

		$(document).on('click', '.action_menu_btn', function(event) {
			$(this).parent().closest(".action_menu").toggle(); 
		});

		//////////**********Session Plan Dropdown Api Start*************///////

		$('#selectSubject').on( 'change', function() {
				let id = $(this).attr('data-id');
				let options = "<option>Loading... </option>";
				$('.session_plan_module_id').html(options);
				var data = {
					programSemSubjectId : $(this).val(),
				}
				console.log('new Data for SessionPlan : '+ $(this).val());

						$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "/acads/api/getSessionPlanDetailsByProgramSemSubjectId",
						data : JSON.stringify(data),
						success : function(data) {

							console.log("SUCCESS: ", data.modules);
							var modules = data.modules;

							options = "";
							//Data Insert For Subjects List
							//Start
							
							if (modules.length <= 0){
								
								$('.session_plan_module_id').html(
										" <option disabled selected value=''> No Modules Available </option> " );
							}else{
								
								for (let i = 0; i < modules.length; i++) {

									options = options
											+ "<option value='" + modules[i].id + "'> "
											+ modules[i].topic
											+ " </option>";
								}

								console.log("==========> options\n" + options);
								$('.session_plan_module_id').html(
										" <option disabled selected value=''> Select ModuleName </option> " + options);
							}
							//End
						},

						error : function(e) {
							alert("Please Refresh The Page.")
							console.log("ERROR: ", e);
							display(e);
						}
					})
				})

		//////////**********Session Plan Dropdown Api End*************///////

		//////////**********Groups for Faculty Dropdown Api Start*************///////
		
		$('#selectSubject') .on( 'change', function() {
			let id = $(this).attr('data-id');
			let options = "<option>Loading... </option>";
			$('.group_id').html(options);
			var data = {
				program_sem_subject_id : $(this).val(),
			}
			console.log('new Data for Groups : ' + $(this).val());

					$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ltidemo/getGroupsNameForFaculty",
					data : JSON.stringify(data),
					success : function(data) {

						console.log("SUCCESS: ", data.groups);
						var groups = data.groups;

						options = "";
						//Data Insert For Subjects List
						//Start
						
						if(groups.length <= 0){
							$('.group_id').html(" <option disabled selected value=''> No Groups Available </option> ");
							
						}else{
							for (let i = 0; i < groups.length; i++) {

								options = options
										+ "<option value='" + groups[i].id + "'> "
										+ groups[i].groupName
										+ " </option>";
							}

							console.log("==========> options\n" + options);
							$('.group_id').html(
									" <option disabled selected value=''> Select Groups </option> " + options);
						}
						
						//End
					},

					error : function(e) {
						alert("Please Refresh The Page.")
						console.log("ERROR: ", e);
						display(e);
					}
				})
		})
		
		//////////**********Groups for Faculty Dropdown Api End*************///////

		
		var myObject = new Object();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "/ltidemo/getConsumerTypes",
			success : function(response) {
				console.log(response);
				myObject = response;
				var consumerType = []; 
				$.each(response, function(i, dropdown) {
					consumerType.push(dropdown.consumerType);

				});
				consumerType = jQuery.unique(consumerType);
				$.each(consumerType, function(i, ct) {
					$("#consumerTypeId").append(
							'<option value="'+ct+'">' + ct + '</option>');
				});

			},
			error : function(e) {

				console.log("ERROR: ", e);
				display(e);
			}
		});

		$(document).on('click', '.attachFile', function(event) {

			file.click();

		});


		var subjectId = "";

		var userId = "${userId}";

		var facultyId = userId;

		var pageId = 1;

		$(window).load(function() {

			loadPosts(facultyId);

		});

		$(document).on('click', '.modal_show', function(event) {

			var heading = $(this).data('heading');

			var post_id = $(this).data('post_id');

			var content = $(this).data('content');

			var type = $(this).data('type');

			var fname = $(this).data('fname');

			$(".modal-title").text(heading);

			$("#post_id").val(post_id);

			$('#txtEditor').Editor("setText", content);

			$("#fileName").val(fname);

			$("#txtEditorContent").text(content);

			$("#type").val(type);

		});

		$(document).on('click', '.action_menu_btn', function(event) {

			$(this).closest(".card-body").find(".action_menu").toggle();

		});

		

		///////////////////////////////////////////////////////////////////
		$(document)
				.on(
						'change',
						'.program',
						function(event) {
							var subject = [];
							var pss_id = [];
							var val = this.value;
							var options = '<option disabled selected value="">Select Subject</option>';
							$.each(myObject, function(i, dropdown) {
								if (dropdown.program == val) {
									subject.push(dropdown.subject);
									pss_id.push(dropdown.pss_id);
								}
							});
							var total = "";
							subject = jQuery.unique(subject);
							for (i = 0; i < subject.length; i++) {
								options = options
										+ "<option value='" + pss_id[i] + "'> "
										+ subject[i] + " </option>";
								total = total + "," + pss_id[i];
							}
							total = total.replace(/(^,)|(,$)/g, "");
							options = options
									+ "<option value='" + total + "'> All </option>";
							$("#selectSubject").html(options);
						});

		$(document)
				.on(
						'change',
						'.programStructure',
						function(event) {
							var program = [];
							var val = this.value;
							var options = '<option disabled selected value="">Select Program</option>';
							$.each(myObject, function(i, dropdown) {
								if (dropdown.program_structure == val) {
									program.push(dropdown.program);
								}
							});

							program = jQuery.unique(program);
							$.each(program, function(i, ct) {
								options = options
										+ "<option value='" + ct + "'> " + ct
										+ " </option>";
							});
							$("#program").html(options);
						});

		$(document)
				.on(
						'change',
						'.selectConsumerType',
						function(event) {
							var program_structure = [];
							var val = this.value;
							var options = '<option disabled selected value="">Select Program Structure</option>';
							$.each(myObject, function(i, dropdown) {
								if (dropdown.consumerType == val) {
									program_structure
											.push(dropdown.program_structure);
								}
							});

							program_structure = jQuery
									.unique(program_structure);
							$.each(program_structure, function(i, ct) {
								options = options
										+ "<option value='" + ct + "'> " + ct
										+ " </option>";
							});
							$("#programStructure").html(options);
						});


		$(document).on('click', '.download', function(e) {   
			$(".download").submit();

		});

		function filter(facId) {

			$("#appendable").html("");

			$("#exampleModal").modal('toggle');

			pageId = 1;

			loadPosts("'" + facId + "'");

		}

		$(window).scroll(
				function() {

					if ($(window).scrollTop() + $(window).height() >= $(
							document).height()) {

						loadPosts(facultyId);

					}

				});
		function POST_FILES_PATH(){
			return '${POST_FILES_PATH}';
		}
		function SERVER_PATH_FEED_FILES(){
			return '${SERVER_PATH_FEED_FILES}';
		}
		function loadPosts(facultyId) {
			$(".loader").html('<div class="preloader" ></div>');

			$
					.ajax({
						type : 'POST',
						url : '/ltidemo/listPost/',
						contentType : "application/json",
						data : JSON.stringify({
							"userId" : userId,
							"subjectId" : subjectId,
							"pageId" : pageId,
							"facultyId" : facultyId
						}),
						dataType : 'json',
						success : function(response) { 
							console.log(response.listOfPosts); 
							$.each(response.listOfPosts,function(i, post) {
							if(post.type=='Link')$('#appendable').append([post].map(Link).join(''));
							else if(post.type=='Image')$('#appendable').append([post].map(Image).join(''));  
							else if(post.type=='Session')$('#appendable').append([post].map(Session).join('')); 
							else if(post.type=='Video')$('#appendable').append([post].map(Video).join(''));
							else if (post.type == 'Doc' ||  post.type == 'PDF' ||  post.type == 'PPT' ||  post.type == 'Exel' ) {
								$('#appendable').append([post].map(File).join(''));	
							}
							});
							loadFooter(); 
						}
					});
			pageId = pageId + 1;
			
		}       
		function loadFooter(){
			$(".card_footer").each(function() {
				var element =$(this);
				var post_id = $(this).attr("data-post_id");
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ltidemo/getCommentAndReactions",
					data : JSON.stringify({
						"post_id" : post_id,
						"role" : "Faculty"
					}),
					dataType : 'json',
					success : function(post) { 
						console.log(post);
						var reaction=""; 
						var reactionCount="";
						var myreaction="";
						if(post.reactions.length > 0){ 
							for (i = 0; i < post.reactions.length; i++) {  //loop through the array
								reaction = reaction +'<img src="assets/css/emojis/'+post.reactions[i]+'.svg" class=" " style="height: 20px;width: 20px;opacity: 0.9;" />'
							}
						}  
                        $(element).append( [{"myId":'<%=userId%>',"reaction":reaction,"reactionCount":post.reactionCount,"commentCount":post.commentCount,"userId":userId,"post_id":post_id}].map(Reaction).join(''));
                        var comment=[{"profile_pic":'<%=profile_pic%>',"post_id":post_id}].map(Reply).join('');
						$.each(post.comments,function(i, comments) {
									if(comments.master_comment_id==0){
										comment=comment + [{"imageUrl":comments.imageUrl,"firstName":comments.firstName,"lastName":comments.lastName,"comment":comments.comment,
											"createdDate":comments.createdDate,"id":comments.id,"profile_pic":'<%=profile_pic%>',"post_id":post_id}].map(Comment).join('');   
									}
								});
						$(element).append('<br/><div class="p-3">'+comment+'</div>');
					},
					error : function(e) {
						console.log("ERROR: ", e);
						display(e);
					}
				});
				
				
			});
		}	




		//reaction
		$(document).on('mouseover', '.FB_reactions',  function(e) {
			//console.log('inside ready--');
			//getReactionCount(this);
			
			//console.log("------" + $(".FB_reactions").attr("data-unique-id"));
			$(this).facebookReactions(); 
			
		});
		function setReaction(value,userId, postId,reactionCount){
			console.log("inside ajax--");
			//var value = $(this).attr("data-emoji-value");
			// here we have control id and value. We need to save them into db. You can change it according to yours requirements. 
//			var formData = "control_id="+control_id+"&value="+value;
			var type = value;
			console.log("inside click of emoji--userId---"+userId+"---postId--"+postId+"--value--"+value+"--reactionCount--"+reactionCount);
			var body = {
					'userId' : userId,
					'reactionType' : value,
					'postId': postId
					
			};
							
			$.ajax({
				type	:	'POST', // define the type of HTTP verb we want to use (POST for our form)
				url		:	'/ltidemo/getReactionCount', // the url where we want to POST
				data	:	JSON.stringify(body), // our data object
				contentType:'application/json',
				success	:	function(data){
					console.log(data); 
					var element;
					//nothing requires here but you can add something here. 
//					
					//console.log("inside succ---"+ response.status);
					//console.log("data--"+JSON.stringify(data));
					if($('.FB_reactions').attr("data-post-id") == postId){
						element = $(this); 
					}
					$(element).attr("data-emoji-class",type); 
					         
				},
				error: function() { 
					 
					console.log('<p>An error has occurred</p>');
				}
			});
		}   
		
		//comments
		comment_i=0;
		$(document).on('click', '.viewMoreComments', function(e) {
			var limit = parseInt($(this).prev("input").val());
			$(this).prev("input").val(limit+3);
			var post_id = $(this).parent().parent().parent().find(".post_id").val();
			thisElement= $(this);
			$
			.ajax({
				type : 'POST',
				url : '/ltidemo/viewMoreComments/', 
				contentType : "application/json",
				data : JSON.stringify({
					"post_id" : post_id,
					"limit" :limit
				}),
				dataType : 'json',
				success : function(response) {
					$.each(
							response.comments,
							function(i, comment) {
								$(thisElement).parent().parent().parent().find(".more_comments").append('<div class="media">'+
										'<img src="'+comment.imageUrl+'" class="rounded-circle mr-3" style="height:40px; width:40px;" /> '+
										'<div class="media-body"><b class="mt-0">'+comment.firstName+' '+comment.lastName+'  </b>'+comment.comment+'<br><small><a style="color: #3b5998;" >Reply</a></small> . <small class="text-muted">Oct 20, 2016, 3:05 PM</small><br/><br/> </div> </div>'+
									
										 '');  
							});
					
				}
			});
		});
		$(document).on('keyup', '.reply_field', function(e) {
			var comment_id = $(this).prev('input').val();
			var post_id= $(this).next('input').val();
			var comment= $(this).val();
			var thisElement =$(this);
			var sapid= '<%=userId%>'; 
			//alert(comment_id+'--'+post_id+'--'+comment); 
		    if (e.keyCode == 13) {       
		    	$(this).val("");
				$
				.ajax({   
					type : 'POST',
					url : '/ltidemo/submitComment/',
					contentType : "application/json",
					data : JSON.stringify({
						"post_id" : post_id,
						"comment_id" :comment_id,
						"comment" : comment,
						"sapid" : sapid
					}),
					dataType : 'json',
					success : function(response) { 
						var enable_reply="";
						if(comment_id==0){
							enable_reply= '<small><a style="color: #3b5998;" class="reply">Reply</a></small> . <small mt-1><input type="hidden" value="'+response.id+'" /><a class="view_reply" style="color: #3b5998;">View reply</a></small> <br/>';
						}
						$(thisElement).parent().parent().parent().append('<div class="media">'+
								'<img src="<%=profile_pic%>" class="rounded-circle mr-3" style="height:40px; width:40px;" /> '+
								'<div class="media-body"><b class="mt-0"> <%=name%> </b>'+comment+'<br><small class="text-muted">Oct 20, 2016, 3:05 PM</small><br/>'+enable_reply+ 
								' <input type="hidden" class="cmt_count" value="1" />'+  
								'<div class="media commentField" style="display: none;"> '+     
								  '<a class="pr-3" href="#">'+
									'<img src="<%=profile_pic%>" alt="Image" class="rounded-circle" style="height:40px; width:40px;">'+
								  '</a>'+  
								  '<div class="media-body">'+ 
								    '<input type="hidden" class="comment_id" value="'+response.id+'" />'+
									'<input type="text" class="form-control round-box reply_field"  placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>'+
									'<input type="hidden" class="post_id" value="'+post_id+'" /><br/>'+  
									'<div class="input-group-append">'+
									'</div>'+
								  '</div>'+
								 '</div>'+
								'</div> </div><br/>'+    
							  
								 '');
						
					} 
				});
		    }
		});
		$(document).on('click', '.view_reply', function(event) {
			$(this).parent().parent().find(".comment_appender").html("");
			var id =$(this).parent().find("input").val(); 
			var count =parseInt($(this).parent().parent().children(".cmt_count").val());  
			
			$(this).parent().parent().find(".cmt_count").val(count+4);             
			var thisElement = $(this);
			$
			.ajax({
				type : 'POST',
				url : '/ltidemo/subComments/',
				contentType : "application/json",
				data : JSON.stringify({
					"id" : id,
					"count":count
				}),
				dataType : 'json',
				success : function(response) { 
					$.each(
							response.comments,
							function(i, comment) { 
     
								$(thisElement).parent().parent().append('<div class="media">'+
										'<img src="'+comment.imageUrl+'" class="rounded-circle mr-3" style="height:40px; width:40px;" /> '+
										'<div class="media-body"><b class="mt-0"> '+comment.firstName+' '+comment.lastName+' </b>'+comment.comment+'<br><small class="text-muted">Oct 20, 2016, 3:05 PM</small><br/><br/>'+ 
										'<input type="hidden" class="cmt_count" value="1" />'+   
										'<div class="media commentField" style="display: none;"> '+        
										  '<a class="pr-3" href="#">'+
											'<img src="<%=profile_pic%>" alt="Image" class="rounded-circle" style="height:40px; width:40px;">'+
										  '</a>'+  
										  '<div class="media-body">'+ 
										    '<input type="hidden" class="comment_id" value="'+comment.id+'" />'+
											'<input type="text" class="form-control round-box reply_field"  placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>'+
											'<input type="hidden" class="post_id" value="'+comment.post_id+'" /><br/>'+ 
											'<div class="input-group-append">'+
											'</div>'+
										  '</div>'+
										 '</div>'+
										'</div> </div>'+
									
										 '');  
							});
 					 
				}
			});
 			
		});	
		
		  var getImageByFileType = function(filetype) {
			    var fileTypeCssClass;
			    fileTypeCssClass = (function() {
			      switch (true) {
				case /video/.test(filetype):
				  return 'assets/images/preview/video.png';
				case /audio/.test(filetype):
				  return 'assets/images/preview/audio.png';
				case /pdf/.test(filetype):
				  return 'assets/images/preview/pdf.png';
				case /csv|excel/.test(filetype):
				  return 'assets/images/preview/spreadsheet.png';
				case /xls|xlsx/.test(filetype):  
					  return 'assets/images/preview/xls.png';       
				case /powerpoint/.test(filetype):
				  return 'assets/images/preview/powerpoint.png';
				case /msword|text/.test(filetype):
				  return 'assets/images/preview/document.png';
				case /zip/.test(filetype):
				  return 'assets/images/preview/zip.png';
				case /rar/.test(filetype):
				  return 'assets/images/preview/rar.png';
				default:
				  return 'default-filetype';
			      }
			    })();
			    return fileTypeCssClass;
			  };
		$(document).on('click', '.reply', function(event) {
			$(this).parent().parent().children(".commentField").show(); 
		}); 
		

		function parseJsonDate(date) {

			time = moment(date).format("YYYY-DD-MM h:mm:ss");

			return time;

		}
		$(document).on(
				'click',
				'.form_btn',
				function(event) {  
					var hashtags =  $(".hashtag_id").chosen().val();    
					$('.selected_tag').val(hashtags);
					this.form.submit();          
				}); 
		//////////**********Hashtag Dropdown Api Start*************/////// 
		$('#session_plan_module_id') .on( 'change', function() {
			var default_option =  '<option selected value="'+$(this).children("option:selected").text()+'">'+$(this).children("option:selected").text()+' </option>'; 
			$('.hashtag_id').append(default_option);            
			$("#hashtag_id").trigger("chosen:updated");
		});
		$('#selectSubject') .on( 'change', function() {
			let id = $(this).attr('data-id'); 
			var default_option =  '<option selected value="'+$(this).children("option:selected").text()+'">'+$(this).children("option:selected").text()+' </option>';    
			$('.hashtag_id').html(default_option);                
			$("#hashtag_id").trigger("chosen:updated");       
			var data = {       
				program_sem_subject_id : $(this).val(),
			}
			console.log('new Data for Hashtag : ' + $(this).val());
 
						$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "/ltidemo/getHashtags",
						data : JSON.stringify(data),
						success : function(data) {

							console.log("SUCCESS: ", data.hashtags);
							var hashtags = data.hashtags;

							options = "";
							//Data Insert For Subjects List
							//Start
							for (let i = 0; i < hashtags.length; i++) {

								options = options
										+ "<option value='" + hashtags[i].hashtag + "'>"
										+ hashtags[i].hashtag
										+ " </option>"; 
							}

							console.log("==========> options\n"
									+ options);
							$('.hashtag_id').append(options);    
							$("#hashtag_id").trigger("chosen:updated");    
							//End
						},

						error : function(e) {
							alert("Please Refresh The Page.")
							console.log("ERROR: ", e);
							display(e);
						}
					})
		});
		//////////**********Hashtag Dropdown Api End*************///////
	</script>
	<!--   hashtag -->  
  
  <script src="assets/Hashtag/chosen.jquery.js"  type="text/javascript"></script>
  <script src="assets/Hashtag/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
  <script src="assets/Hashtag/docsupport/init.js" type="text/javascript" charset="utf-8"></script>	
</body>

</html>