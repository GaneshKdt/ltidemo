<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="bootstrap-layout">
   <jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
<body>

        <jsp:include page="header.jsp"></jsp:include> 

	<!-- Content -->
	
	<div class="container-fluid container-body" >
	 	<div class="row">
	 		
	 		<jsp:include page="sidedrawer.jsp"></jsp:include>

			 <div class="col-10 ml-sm-auto">
			 		<div class="card">
  					<div class="card-body">
  						<div class="row">
	  						<div class="col-2">
	  							<a href="#">
						            <img src="assets/images/people/110/guy-2.jpg" alt="" class="rounded-circle">
						          </a>
	  						</div>
	  						<div class="col-10">
	  							<h1 class=" h2 m-b-0">Nelson Soans</h1>
						        <p class="lead text-muted m-b-0">Mumbai, India</p>
						        <p><span class="label label-default">STUDENT</span></p>
	  						</div>
  						</div> 
			      </div>
			      </div>
			      <hr>
			      <div class="card-columns">
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			              <img src="assets/images/vuejs.png" alt="" class="mr-3" width="100">
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">VueJs</a></h4>
			                <span class="label label-primary">ADVANCED</span>
			              </div>
			            </div>
			          </div>
			          <ul class="list-group list-group-fit">
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Basics of Vue.js</a>
			            </li>
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Intermediate Vue.js</a>
			            </li>
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Realtime Apps with Vue.js</a>
			            </li>
			          </ul>
			        </div>
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			              <img src="assets/images/nodejs.png" alt="" class="mr-3" width="100">
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">NodeJs</a></h4>
			                <span class="label label-success">Beginner</span>
			              </div>
			            </div>
			          </div>
			          <ul class="list-group list-group-fit">
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Getting started with Node</a>
			            </li>
			          </ul>
			        </div>
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			                <img src="assets/images/github.png" alt="" class="mr-3" width="100">
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">GitHub</a></h4>
			                <span class="label label-warning">Intermediate</span>
			              </div>
			            </div>
			          </div>
			          <ul class="list-group list-group-fit">
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Github Step by Step</a>
			            </li>
			            <li class="list-group-item">
			              <a href="#"><span class="pull-xs-right"><i class="material-icons md-18">check</i></span>Working as a Team with GitHub</a>
			            </li>
			          </ul>
			        </div>
			      </div>
			      <hr>
			      <div class="row">
			        <div class="col-md-6 col-md-offset-3 center">
			          <h4 class="m-b-0">Rewards</h4>
			          <p class="text-muted ">Adrian's achievements</p>
			          <div class="btn btn-primary btn-circle"><i class="material-icons">thumb_up</i></div>
			          <div class="btn btn-danger btn-circle"><i class="material-icons">grade</i></div>
			          <div class="btn btn-success btn-circle"><i class="material-icons">bubble_chart</i></div>
			          <div class="btn btn-warning btn-circle"><i class="material-icons">keyboard_voice</i></div>
			          <div class="btn btn-info btn-circle"><i class="material-icons">event_available</i></div>
			          <br>
			          <br>
			        </div>
			      </div>
			 </div>
	 	</div>
	 	
 	
	</div>	
	
	
	
  
  
      <jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>
	
</body>
</html>