<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
<style>
body{
background-color:white;

}
.home-p{
	background-image: url("assets/images/cover/wallpaper.jpg");
	background-repeat:no-repeat;
	padding: 23rem 20rem 6rem 8rem;

background-size: cover;
max-width: 100%;

background-position: center; 
}

@media screen and (min-width: 1900px) {

  .row{
  padding: 100px 0px 100px 0px;
  }
}


@media screen and (max-width: 1400px) {
  .home-p{
      padding: 337px 19px 150px 5px; 
  }
  .logincard{
  padding: 5px;
  }
  .row{
  padding: 50px 20px 50px 20px;
  }
}
@media screen and (max-width: 750px) {
  .logincard {
    element.style {
    width: 100%;
}
  }
}
.card.bg-transparent.loginborder {
    border: none!important;
    box-shadow: none;
}
.card-header.bg-white.center {
    border: none;
}


.logincard{
    box-shadow: 0px 6px 7px #e8dfdf;
}


p.card-subtitle.loginsub {
text-transform: lowercase!important;
}
.logbtn:hover{
    background-color: white ;
    color:black;
    border: 1px solid black;
    
}
.logbtn{
    background-color: #d2232a ;
    color:white;
    box-shadow: 0px 6px 7px #b77171;
}
.card .card-header .card-subtitle, .card .card-header .card-title {
    margin: 0!important;
    text-transform: uppercase;
} 




.logincard {
    border-radius: 10px;
    overflow: hidden;
    
}

.login100-form-logo {
	
    font-size: 60px;
    color: #333333;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
   
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background-color: #fff;
    margin: 0 auto;
}

</style>
</head>

<body class="p-0 bg-white">
     
<div class="container-fluid">
		
		
<div class="row">




<div class="col-md-9 home-p">

<h1><strong>Welcome to NMIMS Global Access - School for Continuing Education (NGASCE)!</strong></h1>

<p> You are about to log in to the world of Online Learning at NGASCE, a world made possible due to a combination of 30 years of legacy of best in class education and state of the art learning technology!

As you log in using the credentials given to you by the University, please take time to go through your profileName and update your contact information. The details mentioned there are your details as per the current University Student Database. In case there is any change or any error in these details, it will hamper the University to stay in touch with you.

With this Portal, we hope to provide you all the support you need during your enrolment with the Program offered by the University. It will be our endevour to keep improving your experience with this Portal as we go along.

Happy Learning!

Team NGASCE</p>

</div>

<div class="col-md-3">
				<div class="shadow-lg p-3 mb-5 bg-white rounded my-5">
			<div class="center m-a-2 logobox ">
				<div class="logo">
					<img class="logo-size"
						src="http://studentzone-ngasce.nmims.edu/studentportal/assets/images/logo.png"
						alt="">
				</div>
			</div>
			<div class="card bg-transparent loginborder">
				<div class="card-header bg-white center">
					<h4 class="card-title">Login</h4>
					<p class="card-subtitle loginsub">Student Login</p>
				</div>
<div class="card-body">				<div class="p-a-2">
					<form action="ltiProviderPostForm" method="get">


						<div class="form-group input-group margin-bottom-sm">
							<span class="input-group-addon">
							<i class="material-icons">account_circle</i>
							</span> <input type="number"
								class="form-control" placeholder="User ID" required>
						</div>
						
						<div class="form-group input-group margin-bottom-sm">
						<span class="input-group-addon"><i class="material-icons">vpn_key</i></span>
							<input type="password" class="form-control"
								placeholder="Password" required>
						</div>
						<div class="form-group ">
							<button type="submit" class="btn btn-block btn-rounded logbtn">
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
