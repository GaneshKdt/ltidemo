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
.minheight{
    min-height: 120px;}
.no-bg{
background-color: #ECE9E7;
}   
.session-files-card{
box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
border: 0;
font-weight: 400;
    min-height: 190px; 
    max-height: 190px;
} 
.session-files-card-icon{
 box-shadow: 0 8px 17px 0 rgba(0,0,0,.2), 0 6px 20px 0 rgba(0,0,0,.19);
}
.session-files-card-icon-fas{   
font-size: 24px;
    color: #fff!important;
}
.session-link{
background-color: #4285f4!important;
padding: 5px;  
} 

.session-filename{
    font-size: 17px;
    max-height: 40px;
    overflow: hidden;}     
.fa-file-pdf{
    color: red;
    font-size: 15px;
    padding: 4px;}  
    .session-file-desc{   
        max-height: 20px;
    overflow: hidden;
}    
.sessionfile-card-footer{
	max-height: 60px;
	padding: 0px 11px 0px 0px;  
    background-color: #fff;
} 
.bg-white{
background-color:#fff;
}
.time-footer{
    background-color: #929fba!important;
    color:#fff;
    padding: 2px;}
    .round-arrow{
     background: black;
    color: #fff;
    border-radius: 15px;
    height: 30px;
    width: 30px;
    font-weight: 800;
    font-size: 11px;
    color: #ffff!important;   
    }
    .recording-card{ 
    box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
    border:none; 
    }
    
    
    
    //css for session plan
    
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
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

[aria-expanded="false"] > .expanded,
[aria-expanded="true"] > .collapsed {
  display: none;
}
.jumbotronSessionPlanHomePage {
    color: black;
    padding: 10px 0;
    position: relative;
    text-shadow: 0 1px 3px rgba(255, 255, 255, 0.4), 0 0 30px rgba(255, 255, 255, 0.075);
}
    .sessionPlanHomeCardTitle{
	/* background-color : #3f51b5; */
	/* background: linear-gradient(to top left, #dee2e6 0%, #007bff4f 100%); */
	
	color : #fff;
	padding: 15px 10px 15px 10px;
	margin : 0px 0px;
	min-height: 110px;
	font-family: "Promixa Nova", -apple-system, BlinkMacSystemFont, Roboto, Arial, sans-serif;
    background: linear-gradient(45deg,#4099ff,#73b4ff);
	border-radius: 5px;
    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
    border: none;
    -webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	min-height:137px;
}
.progressDiv{
	content : "";
	width : 75%;
	height: 5px;
	background-color: #e91e63;
}
.moduleCardIconLinks :hover{
	border-bottom : 2px solid #6c757d;
}
.moduleCardIconLinks a :hover{
	border-bottom : 0px solid #6c757d;
}
.notification-dot{
	content: "";
	width:5px;
	height:5px;
	border : 2px solid red;
	border-radius:50%;
	background-color: red;
	z-index : 99;
	position : absolute;
	top: 5px;
	right : 15px;
}
.cards-settings{
	z-index : 99;
	position : absolute;
	top: 5px;
	right : 5px;
}

.cards-settings i{
    font-size : 20px;
    color: white;
}

.card-link i{
    font-size : 20px;

}

.col-md-3{
	cursor:pointer; 
}
.fixedHeight{
	min-height: 75px;
}

a:hover{
    text-decoration: none !important;
} 
.breadCrumbIcon{
	font-size: 17px !important;
}
.sessionplan-icon{
	color: #6d93bb4f;
	font-size: 25px;
}
.font12{
	font-size: 14px;
}
.sessionplan-subhead{
	color: #32373878;
}   
.borderTop{
	border-top: 1px solid #ECE9E7;
}
.hoverblue :hover{
	color: #007bff!important;
	text-decoration: underline;
}
.sessionplan-resourcecard{ 
	border-radius: 14px!important;
	max-width: 350px;
    min-width:235px;
}
    // end css for session plan
    
</style>   
</head> 
  	
<body>
<%
	String role = (String)request.getSession().getAttribute("role");
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
		
		 
            <!-- Subject -->
				<div class="form-group col-md-3"> 
				
					<label for="subject">Subject</label>
					 
					<select class="form-control "
						id="subject_select">
						<option disabled selected value="">Select Subject</option>
						<c:forEach var="subject" items="${subjects}" varStatus="loop">
							<option value="${subject.id}"><c:out value="${subject.programSemSubject.subject}" /></option>  
						</c:forEach> 
					</select> 

				</div>
			

				<div class="mr-5 mb-3 sessionplan-block  row">


				</div>


          <div class="tab-content">
            <div class="tab-pane active" id="one">


  </div>
            <div class="tab-pane" id="two">
				
<div class="container-fluid">
	<div class="card mb-3 mt-3 no-bg"> 
		<div class="card-body">
			<div class="tab-content">
				<!-- Subject 1 -->
				<div class="tab-pane active" id="tab4default">
					

<!-- 					<h4>
						<i class="fa-solid fa-book"></i> Books
					</h4>

					<div class="card-deck mb-3">
						Books cards start
						<div class="card">

							<div class="card-body">
								<h6 class="card-title">
									<i class="fa-solid fa-book-open"></i> Organizational Behavior: Foundations, Theories, and Analysis
								</h6>
								<p class="card-text text-muted">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								
							</div>
							
		<div class = "col-12 m-0 p-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" title="View" class="btn btn-outline-light card-link btn-block  ">
					<i class="fas fa-eye fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" title="Download" class="btn btn-outline-light card-link btn-block">
					<i class="fas fa-download fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
						</div>
						Books card end
						Books cards start
						<div class="card">

							<div class="card-body">
								<h6 class="card-title">
									<i class="fa-solid fa-book-open"></i> Organizational Behaviour: Performance Management in Practice
								</h6>
								<p class="card-text text-muted">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								
							</div>
							
		<div class = "col-12 m-0 p-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" title="View" class="btn btn-outline-light card-link btn-block  ">
					<i class="fas fa-eye fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" title="Download" class="btn btn-outline-light card-link btn-block">
					<i class="fas fa-download fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
						</div>
						Books card end
						Books cards start
						<div class="card">

							<div class="card-body">
								<h6 class="card-title">
									<i class="fa-solid fa-book-open"></i> Understanding Behavior of Organizations to Improve Behavior in Organizations
								</h6>
								<p class="card-text text-muted">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								
							</div>
							
		<div class = "col-12 m-0 p-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" title="View" class="btn btn-outline-light card-link btn-block  ">
					<i class="fas fa-eye fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" title="Download" class="btn btn-outline-light card-link btn-block">
					<i class="fas fa-download fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
						</div>
						Books card end
						Books cards start
						<div class="card">

							<div class="card-body">
								<h6 class="card-title">
									<i class="fa-solid fa-book-open"></i> Organizational Behavior: Foundations, Theories, and Analysis
								</h6>
								<p class="card-text text-muted">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								
							</div>
							
		<div class = "col-12 m-0 p-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" title="View" class="btn btn-outline-light card-link btn-block  ">
					<i class="fas fa-eye fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" title="Download" class="btn btn-outline-light card-link btn-block">
					<i class="fas fa-download fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
						</div>
						Books card end
						
					</div> -->

					<!-- <h4 class ="mt-3">
						<i class="fas fa-file-archive"></i> Resources
					</h4> -->

					<%-- <div class="mr-5 mb-3 row">
						
						<c:forEach var="resources" items="${resources}" varStatus="loop">
						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-3">
							<div class="card session-files-card mb-4">   
	
								<div class="card-body">
									<h6 class="card-title session-filename">   
										<i class="far fa-file-pdf"></i>${resources.name}
									</h6>
									<p class="card-text text-muted session-file-desc">${resources.description}</p>
								</div>
								<div class="card-footer sessionfile-card-footer">
								<div class="row">
								<div class = "col-12 "> 
									<div class = " mt-3">
									
									<div class = "col-3  mb-2 p-0 moduleCardIconLinks session-files-card-icon float-right ">      
										<a href="${SERVER_PATH}acads/previewContent?previewPath=${resources.previewPath}" title="View" class="btn btn-outline-light card-link btn-block  session-link">
											<i class="fas fa-eye  session-files-card-icon-fas" ></i>
							            </a>   
											<span class="notification-dot"></span>   
									</div>      
									<div class = "col-3 mr-2 mb-2 p-0 moduleCardIconLinks session-files-card-icon float-right ">  
										<a href="${SERVER_PATH}acads/downloadFile?filePath=${resources.filePath}" title="Download" class="btn btn-outline-light card-link btn-block session-link">
											 <i class="fas fa-download   session-files-card-icon-fas" ></i>  
							            </a>   
									</div>     
									</div>
								</div>
								</div>   
								</div>
								
								
							</div>
						</div>
							
				        </c:forEach>
						<!-- resources card end -->
					</div><!-- deck closes --> --%>

						
					
				</div>

				<!-- Subject 2 -->
				<div class="tab-pane " id="tab5default">
					
					<h4>
						<i class="fa-regular fa-chart-bar"></i> Analysis
					</h4>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph5" data-percent="10"
										data-color="#ff0000"></div>
									<figcaption>
										<h5>Product Theory</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph6" data-percent="80"
										data-color="#a3cd10"></div>
									<figcaption>
										<h5>Public Seeking</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph7" data-percent="40"
										data-color="#c84404"></div>
									<figcaption>
										<h5>Demand Analysis</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph8" data-percent="100"
										data-color="#13ca53"></div>
									<figcaption>
										<h5>Market Structure</h5>
									</figcaption>
								</figure>
							</div>
						</div>
					</div>
					
					
					<h4>
						<i class="fa-solid fa-book"></i> Books
					</h4>

					<div class="card-deck mb-3">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Product Theory
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">25%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Public Seeking
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 15%;" aria-valuenow="15" aria-valuemin="0"
										aria-valuemax="100">15%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Demand Analysis
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 32%;" aria-valuenow="32" aria-valuemin="0"
										aria-valuemax="100">32%</div>
								</div>
							</div>
						</div>
					</div>

					<h4>
						<i class="fa-solid fa-file-lines"></i> Resources
					</h4>

					<div class="card-deck">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-pdf"></i> Case Studies
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-regular fa-file-word"></i> Supply Analysis
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-powerpoint"></i> Market Structure
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
            
            </div><!-- #two end -->
            <div class="tab-pane" id="three">
            <br>
				<div id="appendable"><div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height: 50px; width: 50px;" alt="image"><div class="media-body"><p><a href="#"><b>Announcement</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> <br><small class="text-muted ">undefined</small></p></div></div><div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="29" data-type="Announcement" data-title="Business Communication and Etiquette" data-content="<!--StartFragment-->Candidates should write their examination either in English or Hindi language as per theiroption of medium for writing the examination. Question papers of all subjects ofModule-II shall be made available in Hindi medium along with English version forthose candidates who have opted for writing their examination in Hindi medium.However, question papers of all subjects of Module - I shall be provided to all candidatesin English language only. Candidates who have opted Hindi medium should write theirexamination in Hindi language<!--EndFragment-->" data-fname="Academics Details" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/29"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div><div style="background-color:rgb(245,245,245);padding:15px 20px;border-radius:10px;color:#212121"><p><!--StartFragment-->Candidates should write their examination either in English or Hindi language as per theiroption of medium for writing the examination. Question papers of all subjects ofModule-II shall be made available in Hindi medium along with English version forthose candidates who have opted for writing their examination in Hindi medium.However, question papers of all subjects of Module - I shall be provided to all candidatesin English language only. Candidates who have opted Hindi medium should write theirexamination in Hindi language<!--EndFragment--> </p> <span style="font-size:14px;color:#3b5998">Category: Academics</span><center><button attachment1="Announcements/April_2019_Exam_Cycle_Computer_Based_Exam_Centre_List_with_Details.pdf_07032019.pdf" attachment2="Announcements/Exam_Registration_Process_-_Computer_Based_Examination_-_Screenshots_-_April_2019.pdf_07032019.pdf" attachment3="" categorydate="undefined by Exams" subject=" Exam Registration Window for April, 2019 Term End Examinations is Live!" description=" <!--StartFragment-->Candidates should write their examination either in English or Hindi language as per theiroption of medium for writing the examination. Question papers of all subjects ofModule-II shall be made available in Hindi medium along with English version forthose candidates who have opted for writing their examination in Hindi medium.However, question papers of all subjects of Module - I shall be provided to all candidatesin English language only. Candidates who have opted Hindi medium should write theirexamination in Hindi language<!--EndFragment-->" class="btn btn-primary show_announcement_model">View</button></center></div></div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>System   to Business Communication and Etiquette  </b></a></p><span style="float: left; "><small class="text-muted ">Faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> </div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="20" data-fname="Business Communication and Etiquette" data-type="Assignment" data-title="Business Communication and Etiquette" data-content="New Assignment Uploaded" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/20"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div><div class="card-body" style="background-color:#ECE9E7"><div class="d-flex "><b>New Assignment Uploaded</b></div> <div class="d-flex "><span class="text-secondary">Business Communication and Etiquette  </span> </div> </div><div class="card-footer"><div class="d-flex justify-content-center"><input type="hidden" value="Business Communication and Etiquette" name="fileName"><input type="hidden" value="null" name="filePath"><div class="card-text"><span><svg class="svg-inline--fa fa-eye fa-w-18" aria-hidden="true" data-prefix="fa" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M569.354 231.631C512.969 135.949 407.81 72 288 72 168.14 72 63.004 135.994 6.646 231.631a47.999 47.999 0 0 0 0 48.739C63.031 376.051 168.19 440 288 440c119.86 0 224.996-63.994 281.354-159.631a47.997 47.997 0 0 0 0-48.738zM288 392c-75.162 0-136-60.827-136-136 0-75.162 60.826-136 136-136 75.162 0 136 60.826 136 136 0 75.162-60.826 136-136 136zm104-136c0 57.438-46.562 104-104 104s-104-46.562-104-104c0-17.708 4.431-34.379 12.236-48.973l-.001.032c0 23.651 19.173 42.823 42.824 42.823s42.824-19.173 42.824-42.823c0-23.651-19.173-42.824-42.824-42.824l-.032.001C253.621 156.431 270.292 152 288 152c57.438 0 104 46.562 104 104z"></path></svg><!-- <i class="fa fa-eye "></i> --><a style=" font-size: 16px; color:#38ACEC; " href="/exam/viewSingleAssignment?year=2019&amp;month=Apr&amp;subject=Business%20Communication%20and%20Etiquette&amp;status=null&amp;startDate=2018-24-12 12:00:00&amp;endDate=2018-24-12 12:00:00">View</a></span></div></div> </div> </div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>System   to Business Communication and Etiquette  </b></a></p><span style="float: left; "><small class="text-muted ">Faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> </div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="21" data-fname="Business Communication and Etiquette" data-type="Assignment" data-title="Business Communication and Etiquette" data-content="New Assignment Uploaded" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/21"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div><div class="card-body" style="background-color:#ECE9E7"><div class="d-flex "><b>New Assignment Uploaded</b></div> <div class="d-flex "><span class="text-secondary">Business Communication and Etiquette  </span> </div> </div><div class="card-footer"><div class="d-flex justify-content-center"><input type="hidden" value="Business Communication and Etiquette" name="fileName"><input type="hidden" value="null" name="filePath"><div class="card-text"><span><svg class="svg-inline--fa fa-eye fa-w-18" aria-hidden="true" data-prefix="fa" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M569.354 231.631C512.969 135.949 407.81 72 288 72 168.14 72 63.004 135.994 6.646 231.631a47.999 47.999 0 0 0 0 48.739C63.031 376.051 168.19 440 288 440c119.86 0 224.996-63.994 281.354-159.631a47.997 47.997 0 0 0 0-48.738zM288 392c-75.162 0-136-60.827-136-136 0-75.162 60.826-136 136-136 75.162 0 136 60.826 136 136 0 75.162-60.826 136-136 136zm104-136c0 57.438-46.562 104-104 104s-104-46.562-104-104c0-17.708 4.431-34.379 12.236-48.973l-.001.032c0 23.651 19.173 42.823 42.824 42.823s42.824-19.173 42.824-42.823c0-23.651-19.173-42.824-42.824-42.824l-.032.001C253.621 156.431 270.292 152 288 152c57.438 0 104 46.562 104 104z"></path></svg><!-- <i class="fa fa-eye "></i> --><a style=" font-size: 16px; color:#38ACEC; " href="/exam/viewSingleAssignment?year=2019&amp;month=Apr&amp;subject=Business%20Communication%20and%20Etiquette&amp;status=null&amp;startDate=2018-24-12 12:00:00&amp;endDate=2018-24-12 12:00:00">View</a></span></div></div> </div> </div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>Harneet  Jayakar </b></a></p><span style="float: left; "><small class="text-muted ">faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="18" data-type="Image" data-title="Business Communication and Etiquette" data-content="The Basic Communication Model" data-fname="Elements-of-Professionalism_MMKaq1bXpu.jpg" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/18"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div></div> <div class="d-flex ">The Basic Communication Model</div> <div class="card-body"><img class="img-fluid img-thumbnail" src="D:/post//NGASCE0287/2019.04.09.17.12.21Elements-of-Professionalism_MMKaq1bXpu.jpg"></div></div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>Announcement </b></a></p><span style="float: left; "><small class="text-muted ">faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="16" data-type="Text" data-title="Business Communication and Etiquette" data-content="A vital element of audience-centered communication is etiquette, the expected
norms of behavior in any particular situation. In today's hectic, competitive world,
etiquette might seem a quaint and outdated notion. However, the way you conduct
yourself and interact with others can have a profound influence on your company's success and your career. When executives hire and promote you, they expect your behavior
to protect the company's reputation. The more you understand such expectations,
the better chance you have of avoiding career-damaging mistakes. The principles of
etiquette discussed in Chapter 2 will help you communicate with an audience-centered
approach in a variety of business settings." data-fname="" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/16"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div></div> <div class="card-body "><div class="d-flex "><form id="preview_form" class="form-vertical" method="post" action="."><input type="hidden" name="url" class="id_url" value="https://youtu.be/PHULePbksEU"><div class="selector-wrapper"></div></form></div> </div> </div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>Harneet  Jayakar to Business Communication and Etiquette </b></a></p><span style="float: left; "><small class="text-muted ">Faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="2" data-type="Session" data-title="Business Communication and Etiquette" data-content="This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value " data-fname="Session 2" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/2"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div></div> <div class="d-flex ">This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value </div> <div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://player.vimeo.com/video/259117714" allowfullscreen=""></iframe></div><div class="card-body"><hr class="mt-0 mb-0"><div class="row">    <div class="col" style="text-align:center;"><a class="FB_reactions" data-reactions-type="horizontal" data-unique-id="1" data-emoji-class="like" data-post-id="2" data-user-id="77218101888"><span>Like</span></a>  </div>   <div class="col" style="text-align:center;">      <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment3" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-message-lines fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="comment-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M448 0H64C28.7 0 0 28.7 0 64v288c0 35.3 28.7 64 64 64h96v84c0 9.8 11.2 15.5 19.1 9.7L304 416h144c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64z"></path></svg><!-- <i class="fa-solid fa-comment-alt"></i> --> Comments</button>    </div>   <div class="col" style="text-align:center;"> <button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-share fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="share" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M503.691 189.836L327.687 37.851C312.281 24.546 288 35.347 288 56.015v80.053C127.371 137.907 0 170.1 0 322.326c0 61.441 39.581 122.309 83.333 154.132 13.653 9.931 33.111-2.533 28.077-18.631C66.066 312.814 132.917 274.316 288 272.085V360c0 20.7 24.3 31.453 39.687 18.164l176.004-152c11.071-9.562 11.086-26.753 0-36.328z"></path></svg><!-- <i class="fas fa-share"></i> --> Share</button> </div></div><hr class="mt-0 mb-0"><br><div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Tarun Kumar</b>    Well Explain !!     <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small></div>  </div><br>  <div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002FwIbc/RYLo_Scanner_IMG_2017-08-12_04-31-04.tsv.jpg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Praveen Desai</b>   Well Explain !!    <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  <br><br>  <div class="media">  <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002BAtdk/0010o00002BAtdk_cXiR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <b class="mt-0">Vidhi Batta</b>   Well Explain !!  <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  </div> </div> <br> <div class="media"> <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002CuuJH/0010o00002CuuJH_VqUR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a>  <div class="media-body"> <h6 class="mt-0">Pratik Chaudhari</h6>   Very Good !!   <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small><p></p>  </div> </div> <div class="media pl-2">   <a class="pr-3" href="#">    <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div>  </div> </div></div></div><div class="media"><img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" class="rounded-circle mr-3" style="height:40px; width:40px;"><div class="media-body"> <div class="media-body"> <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div></div>  </div></div></div></div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>Harneet  Jayakar to Business Communication and Etiquette </b></a></p><span style="float: left; "><small class="text-muted ">Faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="3" data-type="Session" data-title="Business Communication and Etiquette" data-content="This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value " data-fname="Session 3" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/3"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div></div> <div class="d-flex ">This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value </div> <div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://player.vimeo.com/video/259117714" allowfullscreen=""></iframe></div><div class="card-body"><hr class="mt-0 mb-0"><div class="row">    <div class="col" style="text-align:center;"><a class="FB_reactions" data-reactions-type="horizontal" data-unique-id="1" data-emoji-class="love" data-post-id="3" data-user-id="77218101888"><span>love</span><div style="position: absolute; z-index: 1; display: none; left: 0px; right: auto; bottom: 45px;" class="_bar" data-status="hidden"><div class="_inner" style="width: 245px;"><img src="assets/css/emojis/like.svg" class="emoji_2" data-emoji-value="like" style=""><img src="assets/css/emojis/love.svg" class="emoji_2" data-emoji-value="love" style=""><img src="assets/css/emojis/haha.svg" class="emoji_2" data-emoji-value="haha" style=""><img src="assets/css/emojis/wow.svg" class="emoji_2" data-emoji-value="wow" style=""><img src="assets/css/emojis/sad.svg" class="emoji_2" data-emoji-value="sad" style=""><img src="assets/css/emojis/angry.svg" class="emoji_2" data-emoji-value="angry" style=""><br clear="all"></div></div><div style="position: absolute; z-index: 1; display: none; left: 0px; right: auto; bottom: 45px;" class="_bar" data-status="hidden"><div class="_inner" style="width: 245px;"><img src="assets/css/emojis/like.svg" class="emoji_3" data-emoji-value="like" style=""><img src="assets/css/emojis/love.svg" class="emoji_3" data-emoji-value="love" style=""><img src="assets/css/emojis/haha.svg" class="emoji_3" data-emoji-value="haha" style=""><img src="assets/css/emojis/wow.svg" class="emoji_3" data-emoji-value="wow" style=""><img src="assets/css/emojis/sad.svg" class="emoji_3" data-emoji-value="sad" style=""><img src="assets/css/emojis/angry.svg" class="emoji_3" data-emoji-value="angry" style=""><br clear="all"></div></div><div style="position: absolute; z-index: 1; display: none; left: 0px; right: auto; bottom: 45px;" class="_bar" data-status="hidden"><div class="_inner" style="width: 245px;"><img src="assets/css/emojis/like.svg" class="emoji_1" data-emoji-value="like" style=""><img src="assets/css/emojis/love.svg" class="emoji_1" data-emoji-value="love" style=""><img src="assets/css/emojis/haha.svg" class="emoji_1" data-emoji-value="haha" style=""><img src="assets/css/emojis/wow.svg" class="emoji_1" data-emoji-value="wow" style=""><img src="assets/css/emojis/sad.svg" class="emoji_1" data-emoji-value="sad" style=""><img src="assets/css/emojis/angry.svg" class="emoji_1" data-emoji-value="angry" style=""><br clear="all"></div></div></a>  </div>   <div class="col" style="text-align:center;">      <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment3" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-message-lines fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="comment-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M448 0H64C28.7 0 0 28.7 0 64v288c0 35.3 28.7 64 64 64h96v84c0 9.8 11.2 15.5 19.1 9.7L304 416h144c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64z"></path></svg><!-- <i class="fa-solid fa-comment-alt"></i> --> Comments</button>    </div>   <div class="col" style="text-align:center;"> <button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-share fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="share" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M503.691 189.836L327.687 37.851C312.281 24.546 288 35.347 288 56.015v80.053C127.371 137.907 0 170.1 0 322.326c0 61.441 39.581 122.309 83.333 154.132 13.653 9.931 33.111-2.533 28.077-18.631C66.066 312.814 132.917 274.316 288 272.085V360c0 20.7 24.3 31.453 39.687 18.164l176.004-152c11.071-9.562 11.086-26.753 0-36.328z"></path></svg><!-- <i class="fas fa-share"></i> --> Share</button> </div></div><hr class="mt-0 mb-0"><br><div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Tarun Kumar</b>    Well Explain !!     <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small></div>  </div><br>  <div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002FwIbc/RYLo_Scanner_IMG_2017-08-12_04-31-04.tsv.jpg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Praveen Desai</b>   Well Explain !!    <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  <br><br>  <div class="media">  <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002BAtdk/0010o00002BAtdk_cXiR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <b class="mt-0">Vidhi Batta</b>   Well Explain !!  <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  </div> </div> <br> <div class="media"> <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002CuuJH/0010o00002CuuJH_VqUR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a>  <div class="media-body"> <h6 class="mt-0">Pratik Chaudhari</h6>   Very Good !!   <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small><p></p>  </div> </div> <div class="media pl-2">   <a class="pr-3" href="#">    <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div>  </div> </div></div></div><div class="media"><img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" class="rounded-circle mr-3" style="height:40px; width:40px;"><div class="media-body"> <div class="media-body"> <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div></div>  </div></div></div></div></div> <div class="card mb-2 "><div class="card-body"><div class="media mb-2"><img class="mr-3" src="assets/images/people/110/admin.png" style="height:50px; width:50px;" alt="image"><div class="media-body"><p><a href="#"><b>Harneet  Jayakar to Business Communication and Etiquette </b></a></p><span style="float: left; "><small class="text-muted ">Faculty</small></span><span style="float: right; "><small class="text-muted ">undefined</small></span><span class="action_menu_btn" style="float: right; color: #d9d9d9;"><svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span></div> <div class="action_menu"><ul><li data-toggle="modal" data-target="#myModal" class="modal_show" data-post_id="1" data-type="Session" data-title="Business Communication and Etiquette" data-content="This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value " data-fname="Session 1" data-heading="Edit Post"><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square "></i> --> Edit</li><li><a class="text-light no-underline" href="deletePost/1"><svg class="svg-inline--fa fa-trash fa-w-14" aria-hidden="true" data-prefix="fas" data-icon="trash" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M0 84V56c0-13.3 10.7-24 24-24h112l9.4-18.7c4-8.2 12.3-13.3 21.4-13.3h114.3c9.1 0 17.4 5.1 21.5 13.3L312 32h112c13.3 0 24 10.7 24 24v28c0 6.6-5.4 12-12 12H12C5.4 96 0 90.6 0 84zm415.2 56.7L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32.8 140.7c-.4-6.9 5.1-12.7 12-12.7h358.5c6.8 0 12.3 5.8 11.9 12.7z"></path></svg><!-- <i class="fas fa-trash"></i> --> Delete</a></li><li><svg class="svg-inline--fa fa-ban fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ban" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.034 8 8 119.033 8 256s111.034 248 248 248 248-111.034 248-248S392.967 8 256 8zm130.108 117.892c65.448 65.448 70 165.481 20.677 235.637L150.47 105.216c70.204-49.356 170.226-44.735 235.638 20.676zM125.892 386.108c-65.448-65.448-70-165.481-20.677-235.637L361.53 406.784c-70.203 49.356-170.226 44.736-235.638-20.676z"></path></svg><!-- <i class="fas fa-ban"></i> --> Report...</li><li><svg class="svg-inline--fa fa-users fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"></path></svg><!-- <i class="fas fa-users"></i> --> Unfollow</li><li><i class="far fa-eye-slash"></i> Hide Post</li><li><svg class="svg-inline--fa-solid fa-share-from-square fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="share-square" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M568.482 177.448L424.479 313.433C409.3 327.768 384 317.14 384 295.985v-71.963c-144.575.97-205.566 35.113-164.775 171.353 4.483 14.973-12.846 26.567-25.006 17.33C155.252 383.105 120 326.488 120 269.339c0-143.937 117.599-172.5 264-173.312V24.012c0-21.174 25.317-31.768 40.479-17.448l144.003 135.988c10.02 9.463 10.028 25.425 0 34.896zM384 379.128V448H64V128h50.916a11.99 11.99 0 0 0 8.648-3.693c14.953-15.568 32.237-27.89 51.014-37.676C185.708 80.83 181.584 64 169.033 64H48C21.49 64 0 85.49 0 112v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48v-88.806c0-8.288-8.197-14.066-16.011-11.302a71.83 71.83 0 0 1-34.189 3.377c-7.27-1.046-13.8 4.514-13.8 11.859z"></path></svg><!-- <i class="fas fa-share-square"></i> --> Share</li></ul></div></div> <div class="d-flex ">This video throws light on the concept of Organisation Behaviour , its scope, feature and role on various fields . The various appraoches of OB , its opportunities and challenges are discussed. The Other half of the video starts with a case discussion on Manjunath and his behaviour. Thie video will focus on individual behaviour. It will discuss on factors affecting individual behaviour with the discussion on ability, value </div> <div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://player.vimeo.com/video/259117714" allowfullscreen=""></iframe></div><div class="card-body"><hr class="mt-0 mb-0"><div class="row">    <div class="col" style="text-align:center;"><a class="FB_reactions" data-reactions-type="horizontal" data-unique-id="1" data-emoji-class="like" data-post-id="1" data-user-id="77218101888"><span>Like</span></a>  </div>   <div class="col" style="text-align:center;">      <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment3" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-message-lines fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="comment-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M448 0H64C28.7 0 0 28.7 0 64v288c0 35.3 28.7 64 64 64h96v84c0 9.8 11.2 15.5 19.1 9.7L304 416h144c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64z"></path></svg><!-- <i class="fa-solid fa-comment-alt"></i> --> Comments</button>    </div>   <div class="col" style="text-align:center;"> <button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><svg class="svg-inline--fa-solid fa-share fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="share" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M503.691 189.836L327.687 37.851C312.281 24.546 288 35.347 288 56.015v80.053C127.371 137.907 0 170.1 0 322.326c0 61.441 39.581 122.309 83.333 154.132 13.653 9.931 33.111-2.533 28.077-18.631C66.066 312.814 132.917 274.316 288 272.085V360c0 20.7 24.3 31.453 39.687 18.164l176.004-152c11.071-9.562 11.086-26.753 0-36.328z"></path></svg><!-- <i class="fas fa-share"></i> --> Share</button> </div></div><hr class="mt-0 mb-0"><br><div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Tarun Kumar</b>    Well Explain !!     <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small></div>  </div><br>  <div class="media"> <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002FwIbc/RYLo_Scanner_IMG_2017-08-12_04-31-04.tsv.jpg" class="rounded-circle mr-3" style="height:40px; width:40px;"> <div class="media-body">  <b class="mt-0">Praveen Desai</b>   Well Explain !!    <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  <br><br>  <div class="media">  <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002BAtdk/0010o00002BAtdk_cXiR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <b class="mt-0">Vidhi Batta</b>   Well Explain !!  <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small>  </div> </div> <br> <div class="media"> <a class="pr-3" href="#">   <img src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002CuuJH/0010o00002CuuJH_VqUR_Picture.jpg" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a>  <div class="media-body"> <h6 class="mt-0">Pratik Chaudhari</h6>   Very Good !!   <br><small class="text-muted">Oct 20, 2016, 3:05 PM</small><p></p>  </div> </div> <div class="media pl-2">   <a class="pr-3" href="#">    <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" alt="Image" class="rounded-circle" style="height:40px; width:40px;">  </a> <div class="media-body">  <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div>  </div> </div></div></div><div class="media"><img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" class="rounded-circle mr-3" style="height:40px; width:40px;"><div class="media-body"> <div class="media-body"> <input type="text" class="form-control round-box" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"> <div class="input-group-append">  </div></div>  </div></div></div></div></div> </div>
 
			</div><!-- #three end -->
            <div class="tab-pane" id="four">
			<br>
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/0010o00002BAtdk/0010o00002BAtdk_cXiR_Picture.jpg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			<!-- qAndACard start -->			
			<div class="card mb-2 ">
			<div class="card-body">
			<div class="media mb-2">
			<img class="mr-3" src="http://admissions-ngasce.nmims.edu:4001/StudentDocuments/00Q0o00001ONkZL/00Q0o00001ONkZL_xCTb_Picture.jpeg" style="height: 50px; width: 50px;" alt="image">
			<div class="media-body">
			<p><a href="#"><b>What are the traits of President Kennedy that you consider as inherited?</b></a><span id="action_menu_btn" style="float: right; color: #d9d9d9;">
			<svg class="svg-inline--fa-solid fa-ellipsis fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h"></i> --></span> 
			<br><small class="text-muted ">5 hours ago</small>
			</p>
			</div>
			</div>
			
			<div class="container">
				
				The research on how much of human behavior is hereditary, and how much is acquired through socialization is far from conclusive. So we really cannot say what character traits 
				
			</div>
			<br><br>
			<a href="#" title="LIKE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-thumbs-up fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="SHARE" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-share-nodes fs-18 text-muted" ></i>
	        </a>
			<a href="#"  title="COMMENT" class="btn btn-outline-light card-link qAndALinkink">
				<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	        </a>
			</div> 
			</div>
			<!-- qAndACard end -->
			</div><!-- #four end -->
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
$(document).ready(function(){
    // Activate Carousel
    $("#demo1").carousel("pause");

});
var timeboundId = localStorage.getItem('timeboundId');
 getSessionPlan(timeboundId);
$(document).on('change','#subject_select',function(event) {
	localStorage.setItem('timeboundId', this.value);
	getSessionPlan(this.value);
});
 
function getSessionPlan(val){
	var data = {   
			timeboundId : val 
		}
	console.log(val);   
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/acads/api/getSessionPlanDetailsByTimeboundId",
		data : JSON.stringify(data),
		success : function(response) {
       console.log(response);
       $('.sessionplan-block').html("");
       $.each(response.modules,function(i, module) {
    	   $('.sessionplan-block').append([ module ].map(SessionModules).join(''));
    	   
       });
        
		},   

		error : function(e) {
			alert("Please Refresh The Page.")
			console.log("ERROR: ", e);
			display(e);
		}
	})
}



</script>
</body>
</html>