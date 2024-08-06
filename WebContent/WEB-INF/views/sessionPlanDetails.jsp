<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE class="bootstrap-layout">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
</jsp:include>
<head>
<style type="text/css">
.controlsBlock {
	position: relative;
	top: 0px;
	z-index: 1;
	text-align: center;
	/*    	bottom: 0; */
	/*    	left: 0; */
	/*    	display: block; */
	/*    	width: 177px; */
	/*    	margin: 0 auto; */
	/*    	height: 24px; */
}

.controls {
	position: relative;
	display: block;
}

.minheight {
	min-height: 120px;
}

.no-bg {
	background-color: #ECE9E7;
}

.session-files-card {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
	border: 0;
	font-weight: 400;
	min-height: 190px;
	max-height: 190px;
}

.session-files-card-icon {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, .2), 0 6px 20px 0
		rgba(0, 0, 0, .19);
}

.session-files-card-icon-fas {
	font-size: 24px;
	color: #fff !important;
}

.session-link {
	background-color: #4285f4 !important;
	padding: 5px;
}

.session-filename {
	font-size: 17px;
	max-height: 40px;
	overflow: hidden;
}

.fa-file-pdf {
	color: red;
	font-size: 15px;
	padding: 4px;
}

.session-file-desc {
	max-height: 20px;
	overflow: hidden;
}

.sessionfile-card-footer {
	max-height: 60px;
	padding: 0px 11px 0px 0px;
	background-color: #fff;
}

.bg-white {
	background-color: #fff;
}
.word-break {
	word-break: break-word;   
}    
.time-footer {
	background-color: #929fba !important;
	color: #fff;
	padding: 2px;
}

.round-arrow {
	background: black;
	color: #fff;
	border-radius: 15px;
	height: 30px;
	width: 30px;
	font-weight: 800;
	font-size: 11px;
	color: #ffff !important;
}

.recording-card {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
	border: none;
}

//
css for session plan /* For material-icon align with text */ 
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
-webkit-transform
:
 
rotate
(360deg);
 
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform
:
 
rotate
(360deg);
 
}
}
[aria-expanded="false"]>.expanded, [aria-expanded="true"]>.collapsed {
	display: none;
}

.jumbotronSessionPlanHomePage {
	color: black;
	padding: 10px 0;
	position: relative;
	text-shadow: 0 1px 3px rgba(255, 255, 255, 0.4), 0 0 30px
		rgba(255, 255, 255, 0.075);
}

.sessionPlanHomeCardTitle {
	/* background-color : #3f51b5; */
	/* background: linear-gradient(to top left, #dee2e6 0%, #007bff4f 100%); */
	color: #fff;
	padding: 15px 10px 15px 10px;
	margin: 0px 0px;
	min-height: 110px;
	font-family: "Promixa Nova", -apple-system, BlinkMacSystemFont, Roboto,
		Arial, sans-serif;
	background: linear-gradient(45deg, #4099ff, #73b4ff);
	border-radius: 5px;
	box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	border: none;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	min-height: 137px;
}

.progressDiv {
	content: "";
	width: 75%;
	height: 5px;
	background-color: #e91e63;
}

.moduleCardIconLinks :hover {
	border-bottom: 2px solid #6c757d;
}

.moduleCardIconLinks a :hover {
	border-bottom: 0px solid #6c757d;
}

.notification-dot {
	content: "";
	width: 5px;
	height: 5px;
	border: 2px solid red;
	border-radius: 50%;
	background-color: red;
	z-index: 99;
	position: absolute;
	top: 5px;
	right: 15px;
}

.cards-settings {
	z-index: 99;
	position: absolute;
	top: 5px;
	right: 5px;
}

.cards-settings i {
	font-size: 20px;
	color: white;
}

.card-link i {
	font-size: 20px;
}

.col-md-3 {
	cursor: pointer;
}

.fixedHeight {
	min-height: 75px;
}

a:hover {
	text-decoration: none !important;
}

.breadCrumbIcon {
	font-size: 17px !important;
}

.sessionplan-icon {
	color: #6d93bb4f;
	font-size: 25px;
}

.font12 {
	font-size: 14px;
}

.sessionplan-subhead {
	color: #32373878;
}

.borderTop {
	border-top: 1px solid #ECE9E7;
}

.hoverblue :hover {
	color: #007bff !important;
	text-decoration: underline;
}

.sessionplan-resourcecard {
	border-radius: 14px !important;
	max-width: 350px;
	min-width: 235px;
}

//
end css for session plan

</style>   
</head> 
  	
<body>
<%
	String role = (String) request.getSession().getAttribute("role");
%>
<div class="container-fluid">
 
 <jsp:include page="header.jsp"></jsp:include> 
 
 	<div class="row">
		
		<div class="col-md-2">
			<jsp:include page="sidedrawer.jsp">
				<jsp:param value="<%=role %>" name="role" />
			</jsp:include>
		</div>
		
		<div>
		
		</div>

			<div class="col-md-10 pl-5">
				<div class="row">

					<div class="col">
					<a href="viewVideoGallery"> <i class="material-icons ">keyboard_arrow_left</i> Session Plan </a>	
					</div>
					<div class="col">
						<ul class="nav nav-pills justify-content-center">
							<li class="nav-item"><a class="nav-link ${activeTab[0]}"
								href="#one" data-toggle="tab">Video Gallery</a></li>
							<li class="nav-item"><a class="nav-link ${activeTab[1]}"
								href="#two" data-toggle="tab">Session Files</a></li>

							<!-- <li class="nav-item">
              <a class="nav-link " href="#three" data-toggle="tab">Feeds</a>
            </li> -->


							<li class="nav-item"><a class="nav-link ${activeTab[2]}"
								href="#four" data-toggle="tab">Q&A</a></li>
						</ul>
					</div>


				</div>





				<div class="tab-content">
					<div class="tab-pane ${activeTab[0]}" id="one">






						<div class="container-fluid">
							<div class="card mb-3 mt-3 no-bg">

								<div class="card-body">
									<h5 class="card-title">Session Recordings</h5>

									<div class="mr-5 mb-3 row sessionplan-videos"></div>
								</div>
							</div>
						</div>






					</div>
					<div class="tab-pane ${activeTab[1]}" id="two">

						<div class="container-fluid">
							<div class="card mb-3 mt-3 no-bg">
								<div class="card-body">
									<div class="tab-content">
										<!-- Subject 1 -->
										<div class="tab-pane active" id="tab4default">



											<h4 class="mt-3">
												<i class="fa-solid fa-file-zipper"></i> Resources
											</h4>

											<div class="mr-5 mb-3 row sessionplan_LR"></div>


										</div>

										<!-- Subject 2 -->
										<div class="tab-pane " id="tab5default"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- #two end -->
					<div class="tab-pane " id="three">
						<br>

					</div>
					<!-- #three end -->
					<div class="tab-pane ${activeTab[2]}" id="four">
						<br>
						<h6 class="text-muted">
							<i class="material-icons">error_outline</i> No Q&amp;A Available
						</h6>

					</div>
					<!-- #four end -->
				</div>

				<!-- for session plan details end -->

			</div>


		</div>
</div>
<jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>
<script src="assets/js/template.js"></script>  
<script>
function SERVER_PATH() {
	return '${SERVER_PATH}';
}
var data = {id : '${module_id}'};

$.ajax({
	type : "POST", 
	contentType : "application/json",
	url : "/acads/api/getVideosBySessionPlanModuleId",
	data : JSON.stringify(data),
	success : function(response) {
		console.log("calling getVideosBySessionPlanModuleId---");
   console.log(response.sessionVideos);
   $.each(response.sessionVideos,function(i, videos) {
	   $('.sessionplan-videos').append([ videos ].map(SessionPlanVideos).join(''));
	   
   }); 
   
	},   

	error : function(e) {
		alert("Please Refresh The Page.")
		console.log("ERROR: ", e);
		display(e);
	}
});

$.ajax({
	type : "POST", 
	contentType : "application/json",
	url : "/acads/api/getLRBySessionPlanModuleId",
	data : JSON.stringify(data),
	success : function(response) {
		console.log("calling getVideosBySessionPlanModuleId---");
   console.log(response);
   $.each(response.learningResources,function(i, lr) {
	   $('.sessionplan_LR').append([ lr ].map(LR).join(''));
	      
   });  
   
	},   

	error : function(e) {
		alert("Please Refresh The Page.")
		console.log("ERROR: ", e);
		display(e);
	}
});
$(document).ready(function(){
    // Activate Carousel ${param["id"]}
         
    data = {id : 1}
  
    

});


</script>
</body>
</html>