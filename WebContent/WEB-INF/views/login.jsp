<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login/Signup</title>

<!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
<meta name="robots" content="noindex">

<!-- Material Design Icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Roboto Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">

<!-- App CSS -->
<link type="text/css" href="assets/css/style.min.css" rel="stylesheet">
<link type="text/css" href="assets/css/style.css" rel="stylesheet">
<link type="text/css" href="assets/css/custom.css" rel="stylesheet">

<style>
</style>
</head>

<body>
     
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-8 col-sm-push-1 col-md-4 col-md-push-4 col-lg-4 col-lg-push-4 white-div">
				<div class="logincard">
					<div class="center m-a-2 logobox">
						<div class="logo">
							<img class="logo-size" src="http://studentzone-ngasce.nmims.edu/studentportal/assets/images/logo.png" alt="">
						</div>
					</div>
					<div class="card bg-transparent loginborder">
						<div class="card-header bg-white center">
							<h4 class="card-title">Login</h4>
						</div>
						<div class="card-body">				
							<div class="p-a-2">
								<%-- <form name="f" action="<c:url value='j_spring_security_check'/>" method="POST"> --%>
								<form name="f" action="/ltidemo/LtiloginAs" method="POST"> 
									<div class="form-group input-group margin-bottom-sm">
										<span class="input-group-addon">
										<i class="material-icons">account_circle</i>
										</span> <!-- <input type="number" class="form-control" name ="j_username" placeholder="User ID" required> -->
										<input type="text" class="form-control" name ="userId" placeholder="User ID" required>
									</div>
									
									<div class="form-group input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="material-icons">vpn_key</i></span>
										<!-- <input type="password" class="form-control"
											placeholder="Password" name ="j_password" required> -->
											<input type="password" class="form-control"
											placeholder="Password" name ="password" required>
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
							</div>
						</div>
						<div class="card-footer center bg-white">
							Not yet a student? <a href="studentHome">Sign up</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- jQuery -->
	<script src="assets/vendor/jquery.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/vendor/tether.min.js"></script>
	<script src="assets/vendor/bootstrap.min.js"></script>

	<!-- AdminPlus -->
	<script src="assets/vendor/adminplus.js"></script>

	<!-- App JS -->
	<script src="assets/js/main.min.js"></script>

</body>

</html>
