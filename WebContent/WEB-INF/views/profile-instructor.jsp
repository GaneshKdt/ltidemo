<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
 <jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
<body>
        <jsp:include page="header.jsp"></jsp:include> 


<!-- Content -->
	
	<div class="container-fluid">
	 	<div class="row">
	 	
	 		<jsp:include page="sidedrawer.jsp"></jsp:include>

			<div class="col-10 ml-sm-auto">

			
			      <!-- <div class="center">
			        <a href="#" class="m-b-1">
			          <img src="assets/images/people/110/guy-8.jpg" alt="" class="img-circle">
			        </a>
			        <h1 class=" h2 m-b-0">Prof. Subhajit Chakrabarty</h1>
			        <p class="lead text-muted m-b-0">Mumbai, India</p>
			        <div class="label label-primary">INSTRUCTOR</div>
			        <hr>
			        <h5 class="text-muted">Instructor Rating</h5>
			        <p>
			          <i class="material-icons text-success md-18">star</i>
			          <i class="material-icons text-success md-18">star</i>
			          <i class="material-icons text-success md-18">star</i>
			          <i class="material-icons text-muted-light md-18">star_border</i>
			          <i class="material-icons text-muted-light md-18">star_border</i>
			        </p>
			      </div> -->
			      
			      <div class="card">
  					<div class="card-body">
  						<div class="row">
	  						<div class="col-2">
	  							<a href="#">
						            <img src="assets/images/people/110/guy-8.jpg" alt="" class="rounded-circle">
						          </a>
	  						</div>
	  						<div class="col-10">
	  							<h1 class=" h2 m-b-0">Prof. Subhajit Chakrabarty</h1>
						        <p class="lead text-muted m-b-0">Mumbai, India</p>
						        <p><span class="label label-default">INSTRUCTOR</span></p>
	  						</div>
  						</div> 
  						<hr/>
  						<h5 class="text-muted">Instructor Rating</h5>
				        <p>
				          <i class="material-icons text-success md-18">star</i>
				          <i class="material-icons text-success md-18">star</i>
				          <i class="material-icons text-success md-18">star</i>
				          <i class="material-icons text-muted-light md-18">star_border</i>
				          <i class="material-icons text-muted-light md-18">star_border</i>
				        </p>
			      	</div>
			      </div>
		        
			      
			      <hr/>
			      <h5 class="page-heading center text-muted">Courses by Adrian</h5>
			      <div class="card-columns">
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			                <a href="take-course.html">
			                  <img src="assets/images/vuejs.png" alt="Card image cap" width="100" class="mr-3">
			                </a>
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">Organisational Behaviour: Success Strategies</a></h4>
			                <div>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i> 
			                  <i class="material-icons text-warning md-18">star_border</i>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			                <a href="take-course.html">
			                  <img src="assets/images/nodejs.png" alt="Card image cap" width="100" class="mr-3">
			                </a>
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">Managerial Economics</a></h4>
			                <div>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star_border</i>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			                <a href="take-course.html">
			                  <img src="assets/images/github.png" alt="Card image cap" width="100" class="mr-3">
			                </a>
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">Information Systems for Managers</a></h4>
			                <div>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star_border</i>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class="card">
			          <div class="card-header bg-white">
			            <div class="media">
			                <a href="take-course.html">
			                  <img src="assets/images/gulp.png" alt="Card image cap" width="100" class="mr-3">
			                </a>
			              <div class="media-body media-middle">
			                <h4 class="card-title"><a href="take-course.html">Marketing Management</a></h4>
			                <div>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star</i>
			                  <i class="material-icons text-warning md-18">star_border</i>
			                </div>
			              </div>
			            </div>
			          </div>
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