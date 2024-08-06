<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
	
<style>
.home-p{
		background-image: url("assets/images/cover/wallpaper.jpg");
		background-repeat:no-repeat;
		background-size: cover;
		max-width: 100%;
	}
</style>
</head>
<body class="home-p">
	<div class="container-fluid" style="width:90%;">
		
		
<div class="row">




<div class="col-md-8 pt-5">

<h1><strong class="text-justify">Welcome to NMIMS Global Access - School for Continuing Education (NGASCE)!</strong></h1>

<p class="text-justify"> You are about to log in to the world of Online Learning at NGASCE, a world made possible due to a combination of 30 years of legacy of best in class education and state of the art learning technology!

As you log in using the credentials given to you by the University, please take time to go through your profileName and update your contact information. The details mentioned there are your details as per the current University Student Database. In case there is any change or any error in these details, it will hamper the University to stay in touch with you.

With this Portal, we hope to provide you all the support you need during your enrolment with the Program offered by the University. It will be our endevour to keep improving your experience with this Portal as we go along.

Happy Learning!

Team NGASCE</p>

</div>

<div class="col-md-4">
				<div class="shadow-lg p-3 bg-white rounded my-5">
			<div class="center m-2 ">
				<div class="logo">
					<img class="logo-size" src="http://studentzone-ngasce.nmims.edu/studentportal/assets/images/logo.png" alt="">
				</div>
			</div>
			<div class="card bg-transparent border-0">
				<div class="card-header bg-white">
					<h4 class="card-title">Login</h4>
					<p class="card-subtitle text-lowercase">Student Login</p>
				</div>
				<div class="card-body">				
					<div class="p-2">
					<form action="ltiProviderPostForm" method="get">

						
					      <label class="sr-only" for="inlineFormInputGroup">User Id</label>
					      <div class="input-group mb-2">
					        <div class="input-group-prepend">
					          <div class="input-group-text"><i class="material-icons">account_circle</i></div>
					        </div>
					      	 <input type="text" id="inlineFormInputGroup" class="form-control" placeholder="User ID" required="">
					      </div>
						
					      <label class="sr-only" for="password">Password</label>
					      <div class="input-group mb-4">
					        <div class="input-group-prepend">
					          <div class="input-group-text"><i class="material-icons">vpn_key</i></div>
					        </div>
					      	 <input type="password" id="password" class="form-control" placeholder="Password" required="">
					      </div>
					    
						
						
						<div class="form-group ">
							<button type="submit" class="btn btn-block shadow-lg p-3 rounded text-white bg-danger">
								Login</button>
								
						</div>
						<div class="center">
							<a href="#"> <small>Forgot Password?</small>
							</a>
						</div>
					</form>
				</div></div>
				<div class="card-footer center bg-white">
					Not yet a student? <a href="studentHome">Sign up</a>
				</div>
			</div>
		</div></div>
</div>
	
</div>

<!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Bootstrap -->
  <script src="assets/vendor/tether.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  

</body>
</html>