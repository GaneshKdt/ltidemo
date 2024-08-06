<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.net.URLEncoder"%>
<jsp:useBean id="dateValue" class="java.util.Date"/>

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
.round-box{
    border-radius: 1rem !important;
}
.cmt{
	background-color: #eff1f3 !important; 
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
/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>


</head>
<body>


	<%@ include file="header.jsp" %> 
	<div class="container-fluid container-body" >
		<div class="row">
	<div class="col-lg-2 col-md-3 col-sm-4 ml0 sidedrawer" > 
		<jsp:include page="sidedrawer.jsp">
			<jsp:param value="<%=role %>" name="role" />
		</jsp:include>
	</div>
	<div class="col-lg-5 col-md-5 col-sm-8 pl-5 timeline"  >  
		
		 
		<div class="card">
			<div class="card-body">
			<a  href="profileInstructor"> <strong style="font-size: large;">Prof. Subhajit Chakrabarty</strong> </a>  
		    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal" style="float: right;" > Filter Feeds By </button>
				
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Filter Timeline</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <ul class="list-group">
						  <li class="list-group-item d-flex justify-content-between align-items-center">
						    All Posts
						    <!-- <span class="badge badge-primary badge-pill">100</span> -->
						  </li>
						  
						  <c:forEach var="fac" items="${faculties}">
				                <li class="list-group-item d-flex justify-content-between align-items-center ">
				                <a href="#" onclick="filter('${fac.facultyId}');"> ${fac.firstName } ${fac.lastName}</a>
						            
						             <!-- <span class="badge badge-primary badge-pill">18</span> -->
						        </li>
				            </c:forEach>
						  
						  
						</ul>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
		    </div>
      	</div>
      	
      	<div class="card mb-2">
      	<div class="card-body">
	      <b>MCQ Question - Test 1</b>
	         	<div class="card w-60" style="border: none;">
		  <div class="card-body">
		    <h6 class="card-title">Q. A study of human behaviour in organizational settings is?</h6>
		   		<div class="custom-control custom-radio custom-control-inline">
				  	<input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
				  	<label class="custom-control-label" for="customRadioInline1">Individual behaviour</label>
				</div><br>
				<div class="custom-control custom-radio custom-control-inline">
				  	<input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
				  	<label class="custom-control-label" for="customRadioInline2">Group behaviour</label>
				</div><br>
				<div class="custom-control custom-radio custom-control-inline">
				  	<input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
				  	<label class="custom-control-label" for="customRadioInline3">Organizational behaviour</label>
				</div>
				
				<br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" class="btn btn-primary">Submit</button>
		  </div> 
		  </div>
		  </div>	
		</div>
      	

	<jsp:include page="errorMessage.jsp"></jsp:include>
        <div id="status"></div>
		<div id="appendable"></div>
		<div class="d-flex justify-content-center loader" >
		
		</div>
		
		<!-- Modal for announcement -->
		<div class="modal fade" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 style="color:#3b5998" class="modal-title" id="exampleModalScrollableTitle">Announcement</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="background-color:rgb(245,245,245);border-radius:10px;">
		        <h5 style="font-weight:500" id="announcement_subject" ></h5>
		        <div>
		        	<span style="color:#26a9e0" id="announcement_category"></span>
		        </div><br/>
		        <div style="background-color:white;padding:15px 10px;" id="announcement_detail">
		        </div>
		        <div id="announcement_attachment" style="margin-top:20px;">
		        	
		        </div>
		      </div>
		    </div>
		  </div>
		</div>


		
	</div>  
	<div class="col-lg-3 col-md-4 pl-5" style="padding-left: 1rem!important;">
	<jsp:include page="right-sidebar.jsp"></jsp:include>
	</div>
 	<!-- 	<div class="col-md-1"></div> -->
	<div class="col-lg-1  pl-5 ml-auto">  
	<jsp:include page="onlinePeople.jsp"></jsp:include>
	</div>
</div> 

		
	</div>
<jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>
<script src="assets/js/template.js"></script>  
	<script type="text/javascript">
		var subjectId = "${subjectId}";
		var userId = "${userId}";
		$(window).load(function() {
			loadPosts("");
		});
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
			var sapid= <%=(String) request.getSession().getAttribute("userId")%>;
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
								'</div> </div>'+   
							  
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
		
		$(document).on('click', '.action_menu_btn', function(event) {   
			$(this).closest(".card-body").find(".action_menu").toggle();
		});

		$('.download').click(function() {
			$(".download").submit();
		});
		var pageId = 1;
		function filter(facId) {
			$("#appendable").html("");
			$("#exampleModal").modal('toggle');
			pageId = 1;
			loadPosts(facId); 
		}

		$(window).scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() >= $(
							document).height()) {
						loadPosts("");
					}
				});

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
							console.log(response)  
							if (response.status != null) {
								$("#status")
										.html(
												'<div class="alert alert-danger alert-dismissible">'
														+ '<button type="button" class="close" data-dismiss="alert"  aria-hidden="true">  &times;  </button>'
														+ response.status
														+ '</div>');
							}  
							if (response.listOfPosts.length > 0) {
								$
								.each(
										response.listOfPosts,
										function(i, post) {
											var subjectField = '';
											if (post.subject != '') {
												subjectField = ' <span class="text-muted">to </span><a href=""><b>'
														+ post.subject
														+ '</b></a>';
											}
											if (post.firstName == null) {
												var name = "Sanket Panaskar "
											} else {
												var name = post.firstName
														+ ' '
														+ post.lastName;
											}
											if (post.profilePicFilePath == null) {
												post.profilePicFilePath = "assets/images/people/110/admin.png";
											}
											var view_more="";
											var comment='<div class="media"> '+    
											  '<a class="pr-1" href="#">'+
											  '<img src="<%=profile_pic%>" alt="Image" class="rounded-circle" style="height:40px; width:40px;">'+
											  '</a>'+
										   '<div class="media-body">'+
										   '<input type="hidden" class="comment_id" value="0" />'+
											'<input type="text" class="form-control round-box reply_field"   placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>'+
											'<input type="hidden" class="post_id" value="'+post.post_id+'" /><br/>'+
												'<div class="input-group-append">'+
												 ' </div>'+
											'</div>'+
										 '</div>  ';
											
											
											var image = '';
											if (post.type == 'Image') {
												image = '<div class="media mb-2">' 
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height:50px; width:50px;" alt="image">'
														+ '<div class="media-body" >'
														+ '<a href="#"><b>'
														+ name
														+ ' </b></a>'
														+ '<br>'
														+ '<small class="text-muted"><b>'+post.role+'</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>'
														+ '<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fa-solid fa-ellipsis"></i></span>'
														+ '</div> '
														+ '<div class="action_menu">'
														+ '<ul>'
														+ '<li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="'+post.post_id+'"  data-type="'+post.type+'"'+
										'data-title="'+post.subject+'" data-content="'+post.content+'"   data-fname="'+post.fileName+ '"  '+ 
										'data-heading="Edit Post"><i class="fa-solid fa-share-from-square "></i> Edit</li>'
														+ '<li><a class="text-light no-underline" href="deletePost/'+post.post_id+'"><i class="fa-solid fa-trash"></i> Delete</a></li>'
													    + '</ul>'
														+ '</div>'
														+ '</div>	'
														+ '<div class="d-flex ">'
														+ post.content
														+ '</div> '
														+ '<div class="card-body" ><img class="img-fluid img-thumbnail" src="${SERVER_PATH_FEED_FILES}'+post.filePath+'" ></div>';

											} 
											if (post.type == 'File' ) {
												image = '<div class="media mb-2">' 
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height:50px; width:50px;" alt="image">'
														+ '<div class="media-body" >'
														+ '<a href="#"><b>'
														+ name
														+ ' </b></a>'
														+ '<br>'
														+ '<small class="text-muted"><b>'+post.role+'</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>'
														+ '<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fa-solid fa-ellipsis"></i></span>'
														+ '</div> '
														+ '<div class="action_menu">'
														+ '<ul>'
														+ '<li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="'+post.post_id+'"  data-type="'+post.type+'"'+
										'data-title="'+post.subject+'" data-content="'+post.content+'"   data-fname="'+post.fileName+ '"  '+ 
										'data-heading="Edit Post"><i class="fa-solid fa-share-from-square "></i> Edit</li>'
														+ '<li><a class="text-light no-underline" href="deletePost/'+post.post_id+'"><i class="fa-solid fa-trash"></i> Delete</a></li>'
														+ '</ul>'
														+ '</div>'
														+ '</div>	'
														+ '<div class="d-flex ">'
														+ post.content    
														+ '</div> ' 
														+ '<div class=" card-body media border col-6 "  > <img class="mr-3" src="'+getImageByFileType(post.filePath.split('.')[1])+'"/>'  
														+ '<div class="media-body  pl-3" style="overflow: hidden;"><p class="mt-0 my-1 "><strong class="text-secondary">'+post.fileName+'</strong><p class="my-1 "><small class="text-muted"><b>'+post.type+'</b></small></p><a class="my-1 btn btn-light text-primary" href="/acads/downloadFile?filePath=${POST_FILES_PATH}'+post.filePath+'">Download <i class="fa-solid fa-download text-primary"></i></a> </div>'
       
														+'</div>';             

											}	
											var link = '';
											if (post.type == 'Link' || post.type == "Text") {
												if(post.type == 'Link'){
													var content =  '<div class=" p-1   media border " >'     
													+ '<img class="mr-3 align-self-center" src="'+post.embedImage+'"  width="80px" height="60px"/>'
													+ '	<div class="media-body  pl-3 text-muted" >   '  
													+ '		<p class="mt-0 my-1 ">   '  
													+ '		<strong class="text-dark "> '+post.embedTitle+'</strong>'
													+ '		<p class="my-1 "><small class=" "><b class="" >'+post.embedDescription+'</b></small></p>'
													+ '		<a href="'+post.url+'"><p class="my-1 "><small class=""><b class=" ">'+post.url+'</b></small></p></a>  '  
													+ '</div> '      
													+ '</div>  ' ;
												}else{ var content = post.content; }
												link = '<div class="media ">'
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height:50px; width:50px;" alt="image">'
														+ '<div class="media-body" >'
														+ '<a href="#"><b>'+post.firstName +" "+ post.lastName+'</b></a>'  
														+ '<br>'
														+ '<small class="text-muted"><b>Faculty</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>' 
														+ '<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fa-solid fa-ellipsis"></i></span>'
														+ '</div> '
														+ '<div class="action_menu">'
														+ '<ul>'
														+ '<li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="'+post.post_id+'"  data-type="'+post.type+'"'
														+ 'data-title="'+post.subject+'" data-content="'+post.content+'"  data-fname="'+post.fileName+ '"  ' 
														+ 'data-heading="Edit Post"><i class="fa-solid fa-share-from-square "></i> Edit</li>'
														+ '<li><a class="text-light no-underline" href="deletePost/'+post.post_id+'"><i class="fa-solid fa-trash"></i> Delete</a></li>' 
														+ '</ul>'
														+ '</div>'
														+ '</div>'
														+ '<div class="card-body ">'    
														+ content
														+ '</div> ';
											}
											var announcement = '';
											if (post.type == 'Announcement') {

												announcement = '<div class="media mb-2">'
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height: 50px; width: 50px;" alt="image">'
														+ '<div class="media-body">'
														
														+ '<a href="#"><b>Announcement </b></a>'  
														+ '<br>'
														+ '<small class="text-muted"><b>'+post.role+'</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>' 
													
														+'<br><br><div class=" grey-card">'
														+ '<p>'
														+ post.content
														+ ' </p> '
														+ '<span style="font-size:14px;color:#3b5998">Category: '
														+ post.userId
														+ '</span>'
														+ '<center><Button attachment1="'
														+ post.announcementAttachment1
														+ '" attachment2="'
														+ post.announcementAttachment2
														+ '" attachment3="'
														+ post.announcementAttachment3
														+ '" categoryDate="'
														+ prettyDate(post.announcementStartDate)
														+ ' by '
														+ post.announcementCategory
														+ '" subject=" '
														+ post.announcementSubject
														+ '" description=" '
														+ post.content
														+ '" class="btn btn-primary btn-sm show_announcement_model">View  <span style ="font-size: 18px !important;" class="octicon octicon-eye " ></span> </Button></center>'
														+ '</div>';
											}

											var session = '';
											var sessionVideosrc = '';
											
												if (post.type == 'Session' ){
													sessionVideosrc = '<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="'+post.filePath+'" allowfullscreen></iframe></div><br>';
												}else{
													sessionVideosrc = '<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="${SERVER_PATH_FEED_FILES}'+post.filePath+'" allowfullscreen></iframe></div><br>';
												} 

											if (post.type == 'Session' || post.type == 'Video') {

												session = '<div class="media mb-2">'
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height:50px; width:50px;" alt="image">'
														+ '<div class="media-body" >'
														+ '<a href="#"><b>'
														+ name
														+ ' to '
														+ post.subject
														+ ' </b></a>'
														+ '<br>'
														+ '<small class="text-muted"><b>'+post.role+'</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>'
													
														+ ''
														+ '<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fa-solid fa-ellipsis"></i></span>'
														+ '</div> '
														+ '<div class="action_menu">'
														+ '<ul>'
														+ '<li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="'+post.post_id+'" data-fname="'+post.fileName+ '" data-type="'+post.type+'"'+
														  'data-title="'+post.subject+'" data-content="'+post.content+'"  '+ 
														  'data-heading="Edit Post"><i class="fa-solid fa-share-from-square "></i> Edit</li>'
														+ '<li><a class="text-light no-underline" href="deletePost/'+post.post_id+'"><i class="fa-solid fa-trash"></i> Delete</a></li>' 
														+ '</ul>'
														+ '</div>'
														+ '</div>              '
														+ '<div class="d-flex ">'
														+ post.content
														+ '</div> '
														+ sessionVideosrc
											}
											var assignment = '';
											var resource = '';
											var subject = encodeURI(post.subject);
											if (post.type == 'Resource'
													|| post.type == 'Assignment') {
												if (post.type == 'Resource') {
													var res = post.filePath
															.split("/")
															.reverse();
													var previewPath = res[1]
															+ '/'
															+ res[0];
													var url = "/acads/previewContent?previewPath="
															+ previewPath
															+ '&name='
															+ post.fileName;
												} else {
													var url = '/exam/viewSingleAssignment?year='
															+ post.examYear
															+ '&month='
															+ post.examMonth
															+ '&subject='
															+ subject
															+ '&status='
															+ post.assignmentSubmissionStatus
															+ '&startDate='
															+ parseJsonDate(post.assignmentStartDate)
															+ '&endDate='
															+ parseJsonDate(post.assignmentStartDate);
												}
												resource = '<div class="media mb-2">'
														+ '<img class="mr-3" src="'+post.profilePicFilePath+'" style="height:50px; width:50px;" alt="image">'
														+ '<div class="media-body" >'
														+ '<a href="#"><b>'
														+ name
														+ ' to '
														+ post.subject
														+ '  </b></a>'
														+ '<br>'
														+ '<small class="text-muted"><b>'+post.role+'</b></small>'
														+ '<br>'
														+ '<small class="text-muted">'+prettyDate(post.createdDate)+'</small>'
														+ '<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fa-solid fa-ellipsis"></i></span>'
														+ '</div> '
														+ '</div>	'
														+ '<div class="action_menu">'
														+ '<ul>'
														+ '<li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="'+post.post_id+'" data-fname="'+post.fileName+ '" data-type="'+post.type+'"'+
										'data-title="'+post.subject+'" data-content="'+post.content+'"  '+ 
										'data-heading="Edit Post"><i class="fa-solid fa-share-from-square "></i> Edit</li>'
														+ '<li><a class="text-light no-underline" href="deletePost/'+post.post_id+'"><i class="fa-solid fa-trash"></i> Delete</a></li>'
														+ '</ul>'
														+ '</div>'
														+ '<div class="card ml-5">'  
														+ '<div class="card-body grey-card  bg-light "  >'
														+ '<div class="d-flex pb-4 pt-4"><b>'
														+ post.content
														+ '</b></div> '
														+ '<div class="d-flex ">'
														+ '<span class="text-secondary">'
														+ post.fileName
														+ '  </span> '
														+ '</div> '
														+ '</div>'
														+ '<div class="card-footer bg-light">'
														+ '<div class="d-flex justify-content-center">'
														+ '<input type="hidden" value="'+post.fileName+'" name="fileName"/>'
														+ '<input type="hidden" value="'+post.filePath+'" name="filePath"/>'
														+ '<div class="card-text"  >'
														+ '<a href="'+url+'">  <button class="btn btn-primary btn-sm" >View  <span style ="font-size: 18px !important;" class="octicon octicon-eye " ></span></button></a>'
														+ '</div>'
														+ '</div> '
														+ '</div>'
														+ '</div>	';
											}
											
											var tags='<div class="row">';         
											post.hashtags.split(',').forEach(function(entry) {
												if(entry!=""){            
													tags+='<span class="trigger ml-3">#'+entry.trim()+'</span>'  ;  
												}       
											});
											tags+='</div>';   
											$("#appendable")    
											.append(  
													'<div class="card mb-2 ">'  
															+ '<div class="card-body">'
															+ image
															+ session
															+ announcement
															+ resource         
															+ link    
															+ tags            
															+'<div >' 
															+'<div class="card_footer" data-post_id="'+post.post_id+'"></div>'
											                + '</div>'
															+ '</div>' 
															+ '</div>	');
										});

							} else {
								$(".loader").html("");
							}
							if(response.listOfPosts.length>0){loadFooter(); }
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
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
						"role" : "Student" 
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
		function test(){
			  $('.id_url').preview({key: 'c31f5208f04511e0b79e4040d3dc5c07', // Sign up for a key: http://embed.ly/pricing
		          bind: false,
		          query : {
		            autoplay : 1,
		            maxwidth: 600
		          }})
		$('.id_url').trigger('preview'); 
		}
		//announcement 
		$(document)
				.on(
						'click',
						'.show_announcement_model',
						function(event) {
							$('#announcement_subject').html(
									$(this).attr('subject'));
							$('#announcement_detail').html(
									$(this).attr('description'));
							$('#announcement_category').html(
									$(this).attr('categoryDate'));

							let extension = "";
							let html = "";
							if ($(this).attr('attachment1') != null
									|| $(this).attr('attachment1').trim() != ""
									|| $(this).attr('attachment1') != undefined) {
								console.log("========> attachment1 : "
										+ $(this).attr('attachment1'));
								extension = $(this).attr('attachment1').split(
										'.').pop();
								if (extension == "png" || extension == "doc"
										|| extension == "jpg"
										|| extension == "pdf"
										|| extension == "ppt"
										|| extension == "xls") {
									html = '<div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> <img style="height:25px; !important" src="assets/images/icons/'
											+ extension
											+ '.png" /> Attachment1 </div>';
								} else {
									html = '<div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> Attachment1 </div>';
								}
							}
							if ($(this).attr('attachment2') != null
									|| $(this).attr('attachment2').trim() != ""
									|| $(this).attr('attachment2') != undefined) {
								extension = $(this).attr('attachment2').split(
										'.').pop();
								if (extension == "png" || extension == "doc"
										|| extension == "jpg"
										|| extension == "pdf"
										|| extension == "ppt"
										|| extension == "xls") {
									html = html
											+ ' <div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> <img style="height:25px; !important" src="assets/images/icons/'
											+ extension
											+ '.png" /> Attachment2 </div>';
								} else {
									html = html
											+ ' <div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> Attachment2 </div>';
								}
							}
							if ($(this).attr('attachment3') != null
									|| $(this).attr('attachment3').trim() != ""
									|| $(this).attr('attachment3') != undefined) {
								extension = $(this).attr('attachment3').split(
										'.').pop();
								if (extension == "png" || extension == "doc"
										|| extension == "jpg"
										|| extension == "pdf"
										|| extension == "ppt"
										|| extension == "xls") {
									html = html
											+ ' <div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> <img style="height:25px; !important" src="assets/images/icons/'
											+ extension
											+ '.png" /> Attachment3 </div>';
								} else {
									html = html
											+ ' <div style="margin-top:10px;cursor:pointer" href="javascript:void(0)" class="c_label"> Attachment3 </div>';
								}
							}
							$('#announcement_attachment').html(html);

							/* <a style="margin-top:20px;" href="javascript:void(0)" class="c_label">
								<img style="height:25px; !important" src="assets/images/icons/pdf.png" /> Attachment1 
							</a> */
							$('#announcementModal').modal('show')
						});
		
		
		//reaction
		$(document).on('mouseover', '.FB_reactions',  function(e) {
			//console.log('inside ready--');
			//getReactionCount(this);
			
			//console.log("------" + $(".FB_reactions").attr("data-unique-id"));
			$(this).facebookReactions();
			
		});
		
		//GSK for reaction
		
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

		function parseJsonDate(date) {
			time = moment(date).format("YYYY-DD-MM h:mm:ss");
			return time;
		}

     
	</script>

</body>
</html>