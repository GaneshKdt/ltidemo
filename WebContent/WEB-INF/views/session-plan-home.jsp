
<!DOCTYPE html >
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
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

<!-- for page.css start -->
<style>
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
	background-color : #3f51b5;
	
	color : white;
	padding: 35px 10px 15px 10px;
	margin : 0px 0px;
}
.progressDiv{
	content : "";
	width : 75%;
	height: 5px;
	background-color: #e91e63;
}
.moduleCardIconLinks:hover{
	border-bottom : 4px solid #6c757d;
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
	font-size : 5px;
}
</style>
<!-- for page.css end -->

<!-- from headTag.jsp start -->
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dashboard</title>
		
  <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
  <meta name="robots" content="noindex">

  <!-- Material Design Icons  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
   <!-- Text editor  -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> <!-- 4.0.0 -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

		<script src="assets/js/editor.js"></script>
		<script>
			$(document).ready(function() {
				$("#txtEditor").Editor();
			});
		</script>
	
		
		<link href="assets/css/editor.css" type="text/css" rel="stylesheet"/>
	
  <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
  
  <!-- Roboto Web Font -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
  
  <!-- Sans Web Font  -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  
  <!-- Merriweather Web Font  -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:500" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  
  <!-- Bootstrap date time picker CSS -->
  <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" /> 
	
  <!-- Timepicker -->
  <link rel="stylesheet" href="assets/examples/css/bootstrap-timepicker.min.css">

  <!-- App CSS --> 
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  
  <!-- Custom CSS -->
   <link type="text/css" href="assets/css/custom.css" rel="stylesheet">
   <link type="text/css" href="assets/css/customST.css" rel="stylesheet"> 
	
  <!-- Custom CSS for fabButton -->
  <link type="text/css" href="http://propeller.in/components/button/css/button.css" rel="stylesheet">
  <link type="text/css" href="assets/css/fabButton.css" rel="stylesheet">
  
   <!--  Scrollbar Custom CSS -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

  <!-- FullCalendar CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
    
  <!-- Link for Charts -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
<!-- from headTag.jsp end -->

</head>
<body>
	<!-- from header.jsp start -->
	 <!-- Navbar -->
  
  <nav class="navbar navbar-expand-sm navbar-dark fixed-top navbar-header" >
  				
  <div class="container-fluid">
  
  <!-- Search and Logo -->
	<div class="row" style="width:55%;">
				
	<div class="col-4">
		<!-- Brand/logo -->
	  <!-- <a class="navbar-brand float-right mr-0" href="home">
	    <img src="https://www.lawctopus.com/wp-content/uploads/2016/07/nmims.gif" class="rounded" alt="Responsive image" width="40">
	  </a> --> 
	</div>
  

	<div class="col-8 px-0">
	
		<form class="form-inline mb-0">
    <div class="input-group" style="width: 100%!important;">
      <input type="text" class="form-control border-0 bg-color searchInput" placeholder="Search..." aria-label="Search" aria-describedby="basic-addon1">
      <div class="input-group-prepend">
        <span class="input-group-text rounded-right border-0 bg-color" id="basic-addon1" style="color: #C0C0C0;"><i class="fa-solid fa-magnifying-glass"></i></span>
      </div>
    </div>
  </form>
	</div>
	

<!-- <div class="col-2 px-0">

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
  </div> -->
</div> 
  
  <!-- Home and Chat -->
  
  <div class="collapse navbar-collapse justify-content-center" id="navbarText1">
  	<ul class="navbar-nav text-center">

       
      <li class="nav-item dropdown" >
        <a class="nav-link text-color" id="notificationDropdown" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
          <i class="fa-solid fa-bell fs-25"></i>
          <span class="badge badge-danger" style="margin:-1em;">3</span>
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li class="head text-light bg-primary">
            <div class="row">
              <div class="col-lg-12 col-sm-12 col-12">
                <span style="padding-left: inherit;"> Notifications (3)</span>
                <a href="viewAllNotification" class="float-right text-light" style="padding-right: inherit;" >See all</a>
              </div>
            </div>
          </li>
          
          <li class="notification-box">
            <div class="row">
              <div class="col-lg-3 col-sm-3 col-3 text-center">
                <img src="assets/images/people/110/guy-3.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">Deepak Gupta</strong>
                <div>
                   posted new post for <b>Business Economics</b>
                </div>
                <small class="text-warning">18.11.2018, 09:00</small>
              </div>    
            </div>
          </li>
          <li class="notification-box bg-gray">
            <div class="row">
              <div class="col-lg-3 col-sm-3 col-3 text-center">
                <img src="assets/images/people/110/guy-2.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">David Lorem</strong>
                <div>
                  liked your post.
                </div>
                <small class="text-warning">17.11.2018, 15:00</small>
              </div>    
            </div>
          </li>
          <li class="notification-box">
            <div class="row">
              <div class="col-lg-3 col-sm-3 col-3 text-center">
                <img src="assets/images/people/110/guy-5.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">Johnson Jack</strong>
                <div>
                  commented on your post.
                </div>
                <small class="text-warning">17.11.2018, 13:00</small>
              </div>    
            </div>
          </li>
          
        </ul>

      </li>
	  <li class="nav-item" >
        <a class="nav-link text-color" href="viewVideoGallery" style="color: #C0C0C0 !important;">
        	<i class="fa-solid fa-chalkboard-user fs-25"></i>
        </a>
      </li>
      <li class="nav-item" >
        <a class="nav-link text-color" href="studentProgress" style="color: #C0C0C0 !important;">
        	<i class="fa-solid fa-user-graduate fs-25"></i>
        </a>
      </li>
    </ul>
  </div>
  
  
  <!-- Links -->
  <div class="collapse navbar-collapse justify-content-end" id="navbarText">
  	<ul class="navbar-nav text-center">
  	
  	<li class="nav-item">
        <a class="nav-link active p-a-0"  data-toggle="dropdown" href="#" >
          <span class="text-color">Nelson</span>
          <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" alt="Avatar" class="rounded-circle" width="30">
        </a>
        
        
      </li>

	  
      <li class="nav-item " >
        <a class="nav-link text-color" style="color: #C0C0C0 !important;" href="#">
        	<i class="fa-solid fa-circle-question fs-25"></i>
        </a>
      </li>
      
      <li class="nav-item dropdown" >
        <a class="nav-link text-color" style="color: #C0C0C0 !important;" id="Preview" href="#" data-toggle="dropdown" role="button" aria-haspopup="false">
        	<i class="fa-solid fa-gear fs-25"></i>
        </a>
        <div class="dropdown-menu w-auto" aria-labelledby="Preview">
          <a class="dropdown-item" href="accountEditUser"><i class="fas fa-edit"></i> <span class="icon-text">Edit Account</span></a>
          <a class="dropdown-item" href="profileNameUser"><i class="fas fa-user"></i> <span class="icon-text">Public ProfileName</span></a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/ltidemo/Ltilogout">Logout</a>
        </div>
      </li>

      
  </ul>
  </div>

</div>
</nav>
  
	<!-- from header.jsp end -->
	<div class="container-fluid container-body" >
		<div class="row">
	<div class="col-lg-2 col-md-3 col-sm-4"> 
		
		<!-- from sidedrawer.jsp start -->
		
<div class="bmd-layout-container bmd-drawer-f-l ">
  <header class="bmd-layout-header">
  <div class="navbar navbar-light bg-faded">
   <img src="http://studentzone-ngasce.nmims.edu/studentportal/assets/images/logo.png" class="img-thumbnail rounded border-0 bg-transparent" />
  <hr>
  </div>
    <div class="navbar navbar-light bg-faded">
    
		
                
                <div class="row">
                    <div class="col-3">
                        <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200" alt="Avatar" width="40">
                    </div>
                    <div class="col-9">
                        <small class="font-weight-bold">Nelson Soans</small><br/>
                        <small>NGASCE Exceutive MBA</small>
                    </div>
                </div>
    </div>

  </header>
  <div id="dw-s1" class="bmd-layout-drawer bg-faded">
    
  	  <div class="list-group" style="font-size: 80%;" >
               <div class="list-group">
                    <a href="/ltidemo/Timeline" class="list-group-item list-group-item-action list-group-sidebar active" style="border-left-color: #007bff !important;">
                    	<span>
	                        <i class="fa-solid fa-house fs-18" ></i>
	                        <span class="ml-2"">Home</span>
	                        <span class="badge float-right" style=color: grey;">5</span>
                        </span>
                    </a>
                    <a class="list-group-item list-group-item-action list-group-sidebar" href="#demo3" data-toggle="collapse" data-parent="#MainMenu">
                    	<span>
	                        <i class="fa-solid fa-users fs-18"></i>
	                        <span class="ml-1" margin-left:0.35rem!important">Groups</span>
	                        <i class="fas fa-ellipsis-h fs-18 float-right" style="color: #C0C0C0;"></i>
                        </span>
                    </a>
                    <div class="collapse" id="demo3">
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar nav">NGASCE</a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Foundations</a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Business Ideas</a>
				    </div>
				    
				    <a href="viewVideoGallery" class="list-group-item list-group-item-action list-group-sidebar " style="border-left-color: #007bff !important;">
                    	<span>
	                        <i class="fa-solid fa-book-open fs-18"></i>
	                        <span class="ml-2"">Resources</span>
	                        <span class="badge float-right" style=color: grey;">5</span>
                        </span>
                    </a>
                    
                    <a  class="list-group-item list-group-item-action list-group-sidebar" data-toggle="collapse" data-target="#courses-data" aria-expanded="true">
                    	<span>
	                        <i class="fa-solid fa-book fs-18"></i>
	                        <span class="ml-2" >Courses</span>
	                        <span class="badge float-right" style="color: grey;">5</span>
                    	</span>
                    </a>
                    <div class="collapse show" id="courses-data">
                   <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold" style="color:#90949C;">Current</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold" style="color:#90949C;">Archive</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                       <span class="font-weight-bold" style="color:#90949C;">Upcoming</span>
                    </a>
					<a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                       <span class="font-weight-bold" style="color:#90949C;">Pending </span>
                    </a>
					
				     <!--  <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Organisational Behaviour: Success Strategies </a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Managerial Economics</a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Information Systems for Managers</a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Marketing Management</a>
				      <a href="javascript:;" class="list-group-item list-group-item-action list-group-sidebar">Financial Accounting: Information for Decisions</a> -->
				    </div>
				    <a href="calendar" class="list-group-item list-group-item-action list-group-sidebar" >
                    	<span>
                    		<i class="fa-regular fa-calendar-days fs-18"></i>
	                        <span class="ml-2" >Events</span>
	                        <span class="badge float-right" style="font-size: 13px;color: grey;">1</span>
                        </span>
                    </a>
                    <a href="todo" class="list-group-item list-group-item-action list-group-sidebar" >
                    	<span>
                    		<i class="fa-solid fa-list fs-18"></i>
	                        <span class="ml-2">Todo</span>
                        </span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar" >
                    	<span>
                    		<i class="fa-solid fa-circle-plus fs-18"></i>
	                        <span class="ml-2" >Create Group</span>
                        </span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold" style="color:#90949C;">TEAMS & PROJECTS</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                        <i class="fa-solid fa-circle" style="width:.5em;color:#007bff;"></i>
                        <span class="font-weight-bold">Business Economics Team</span>
                        <span class="badge float-right" style="color: grey;">1</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                        <span>Business Finance Management!</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold" style="color:#90949C;">ANNOUNCEMENTS</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                        <span>Business Economics Webinar</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                        <span>Fundamental of Business</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                    	<i class="fa-solid fa-circle" style="width:.5em;color:#007bff;"></i>
                    	<span class="font-weight-bold">Communication in Workplace</span>
                        <span class="badge float-right" style="font-size: 13px;color: grey;">1</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar disabled pt-3">
                        <span class="font-weight-bold" style="color:#90949C;">OPEN DISCUSSIONS</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                        <span >IT Help Desk</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action list-group-sidebar no-hover">
                    	<i class="fa-solid fa-circle" style="width:.5em;color:#007bff;"></i>
                    	<span class="font-weight-bold">FeedBack</span>
                        <span class="badge float-right" style="color: grey;">20+</span>
                    </a>
             </div>
    </div>
  </div>
</div>

		<!-- from sidedrawer.jsp end -->
	</div>
	<div class="col-lg-10 col-md-9 col-sm-8 pl-10">
		
		<!-- for session plan home start -->
		<div class="container">
  <div class="row">
    
		
		<!-- for modules start -->
		<div class="col-xs-12">
			
			<div class="card mb-3">
			<div class="card-body">
				
			<div class="text-secondary" > Session Plan Dashboard For Organisational Behaviour </div>

			</div>
			</div>
			
			<div class="row">
				
		<!-- for topic card start -->
				<div class="col-xs-12 col-md-3  mt-3">
					
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle " style="background-color:#673ab7">
	Introduction to the Field of Organizational Behavior 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>
  </div>
  <div class = "col-12 m-0  text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
		
</div>
				</div>
				
		<!-- for topic card end -->
				
		<!-- for topic card start -->
				<div class="col-xs-12 col-md-3  mt-3">
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle "  style="background-color:#3f51b5">
	Individual Behavior, Personality, and Values 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>
	
	
  </div>
	<div class = "col-12 m-0  text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>	
</div>

				</div>
				
		<!-- for topic card end -->
				
		<!-- for topic card start -->
				<div class="col-md-3  mt-3">
					
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle "  style="background-color:#9c27b0">
	Perceiving Ourselves and Others in Organizations 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>
	

  </div>
  
  <div class = "col-12 m-0">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
		
</div>
				</div>
				
		<!-- for topic card end -->
				
		<!-- for topic card start -->
				<div class="col-xs-12 col-md-3 mt-3">
					
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle "  style="background-color:#039be5">
	Workplace Emotions, Attitudes, and Stress 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>
	
	
  </div>
  
  	<div class = "col-12 m-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
		
</div>
				</div>
				
		<!-- for topic card end -->
				
		<!-- for topic card start -->
				<div class="col-xs-12 col-md-3  mt-3">
					
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle "  style="background-color:#00acc1">
	Foundations of Employee Motivation 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>
	
	<div class = "">
			

	</div>
  </div>
				<div class = "col-12 m-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
</div>
				</div>
				
		<!-- for topic card end -->
				
		<!-- for topic card start -->
				<div class="col-xs-12 col-md-3 mt-3">
					
	  <div class="card">
	<h6 class="card-title sessionPlanHomeCardTitle "  style="background-color:#009688">
	Power and Influence in the Workplace 
	</h6>
    			<a href="#" class="cards-settings">
					<i class="fa-solid fa-gear text-light" ></i>
	            </a>
			
  <div class="card-body pt-0 pb-0 ">
    
	<div class = "  ">
	
	
	<div class = "  ">
	<div class = "row">
		
			
			<div class = "col-md-8">
				Attendence :
			</div>
			<div class = "col-md-4 text-right ">
				 1/1
			</div>
	</div>
	
	
	<div class = "row">
		
			
			<div class = "col-md-7">
				MCQ Due Date :
			</div>
			<div class = "col-md-5 text-right ">
				 13th Apr 2019
			</div>
	</div>
		
		<br><br><br>
		
		
	
	 </div>
	
	</div>

  </div>
		<div class = "col-12 m-0 text-center">
			<div class = "row mt-3">
			
			<div class = "col-3 m-0 p-0 moduleCardIconLinks border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block  ">
					<i class="fa-solid fa-circle-play fs-18 text-muted" ></i>
	            </a>
					<span class="notification-dot"></span>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-file-zipper fs-18 text-muted" ></i>
	            </a>
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-flask fs-18 text-muted" ></i>
				</a>
				
			</div>
			<div class = "col-3 m-0 p-0 moduleCardIconLinks  border border-muted">
				<a href="#" class="btn btn-outline-light card-link btn-block">
					<i class="fa-solid fa-comment fs-18 text-muted" ></i>
	            </a>
			</div>
			</div>
		</div>
</div>
				</div>
				
		<!-- for topic card end -->
			
			</div>
		</div>
		<!-- for modules end -->
		
		<!-- for details start -->
	<div class="col-xs-12">
      
	  <div class="card">
  <div class="card-body">
    <h4 class="card-title">Team Dynamics</h4>
		
		<div class="table-responsive">
   <table class="table table-bordered">
    <thead>
      <tr>
        <th colspan="3">Teaching Scheme</th>
        <th colspan="3">Evaluation Scheme</th>
      </tr>
    </thead>
    <tbody>
      <tr>
	  
        <td>Classroom Session
</td>
        <td>Practical/Group work
</td>
        <td>Tutorials</td>
        <td>Credit</td>
        <td>Continuous Evaluation
</td>
        <td>Term End Examination (TEE)
</td>
      </tr>
      <tr>
        <td>10</td>
        <td>0</td>
        <td>0</td>
        <td></td>
        <td>70%</td>
        <td>30%</td>
      </tr>
    </tbody>
  </table>
  </div>
  
		<div class="collapse card-text" id="block-id">
      <p class="card-text">
		Course Rationale :
	  </p>
      <p >
		The course aims in making OB knowledge meaningful as well as illuminate the relevance of this field. The anecdotes of real people and organisations translate academic theories into useful knowledge and real life applications. 
	  </p>
	  <p class="card-text">
		Course Objectives :
	  </p>
      <p>
		<ul>
<li>	  To make student informed about the theories in OB
</li><li>	To familiarize with the issues in interacting the employees in the organisation and ways to reflect and resolve them. 
</li><li>	To be better informed about the employees in terms of their attitudes, personatilies, perception and how this directly effects the organisation’s success 
		</li>
		</ul>
		
		</p>
		<p class="card-text">
		Learning Outcomes :
	  </p>
      <p >
		This course will help student to understand:<br>
Individual self and behaviour<br>
Personalities and perceptions<br>
Values and emotions<br>
Organisation’s Culture and its impact on productivity<br>

	</p>
	
		<p class="card-text">
		Pre-requisite(s) :
	  </p>
      <p >
	  NONE
	</p>
		<p class="card-text">
		Pedagogy: :
	  </p>
      <p >
	  Online Class, Discussion Forum, Open ended discussion, Case studies, Assessment & Evaluation of Student Learning.
	</p>
		
		</div>
	
      <!-- aria-expanded attribute is mandatory -->
      <!-- bootstrap changes it to true/false on toggle -->
      <a href="#block-id"
         class="btn btn-outline-secondary card-link "
         data-toggle="collapse"
         aria-expanded="false"
         aria-controls="block-id">
        
        <span class="collapsed">
          Show more
        </span>
        <span class="expanded">
          Show Less
        </span>
        
      </a>
  </div>
</div>
      
      
      
      
    </div> <!-- col -->
		<!-- for details end -->
		
  </div> <!-- row -->
</div> <!-- container -->
		<!-- for session plan home end -->
		
	</div>
 	
	
</div> 

		
	</div>
	
	
		<!-- from footer.jsp start -->
			<!-- Code For Voice call Scheduler Modal :start-->

 <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title h4" id="myLargeModalLabel">Schedule Audio Call</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body" >
      	<div class="container">
		    <div class="row">
		    	<div class='col-sm-6'>
		            <div class="form-group">
		            	<label for="volunteer" class="col-form-label">Faculty :</label>
		                <select class="form-control" id="volunteer">
		                	<option>Deepak Guptha</option>
		                	<option>Puja Basun</option>
		                	<option>Brindha Sampath</option>
		                	<option>Kalli Charan</option>
		                	<option>Purva Sha</option>
		                </select>
		            </div>
		        </div>
		   	</div>
		   	<div class="row">
		        <div class='col-sm-6'>
		            <div class="form-group">
		            	 <label for="datepicker" class="col-form-label">Date:</label>
		                <input type='text' id="datepicker" class="form-control" />
		            </div>
		        </div>
		        <div class='col-sm-6'>
		            <div class="form-group">
		            	 <label for="timepicker3" class="col-form-label">Time:</label>
		                 <input id="timepicker3" type="text" class="form-control">
		            </div>
		        </div>
		    </div>
		    <div class="row">
		    	<div class='col-sm-2 ml-auto'>
		    		<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-success rounded">Submit</button>
		    	</div>
		    </div>
		</div>	
      </div>
    </div>
  </div>
</div>


<!-- Code For Voice call Scheduler Modal :end -->


<!-- Code for Fab Button  :start-->

	<div class="menu pmd-floating-action" role="navigation"> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Post"> 
            <span class="pmd-floating-hidden">Post</span>
            <i class="material-icons">edit</i> 
        </a> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Chat"> 
            <span class="pmd-floating-hidden">Chat</span> 
            <i class="material-icons">chat</i> 
        </a> 
        <a href="javascript:void(0);" data-toggle="modal" data-target=".bd-example-modal-lg" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Audio Call"> 
            <span class="pmd-floating-hidden">Audio Call</span> 
            <i class="material-icons">call</i> 
        </a> 
        <a href="javascript:void(0);" data-toggle="modal" data-target=".bd-example-modal-lg" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Video Call"> 
            <span class="pmd-floating-hidden">Video Call</span> 
            <i class="material-icons">video_call</i> 
        </a> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-primary" data-title="Add"> 
            <span class="pmd-floating-hidden">Primary</span>
            <i class="material-icons pmd-sm">add</i> 
        </a> 
    </div>






<!-- Code for Fab Button  :end-->


  <!-- Bootstrap -->
  <script src="assets/vendor/tether.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <!-- jQuery Custom Scroller CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
  
  <!-- FullCalendar JS -->
  <script type="text/javascript" src="assets/vendor/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>

  <!-- AdminPlus -->
  <script src="assets/vendor/adminplus.js"></script>
  
  <!-- Bootstarp date timepicker JS -->

<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
  <script src="assets/vendor/bootstrap-timepicker.js"></script>

  <!-- Init -->
  <script src="assets/examples/js/date-time.js"></script>

  <!-- App JS -->
  <script src="assets/js/main.min.js"></script>
  

	<script>
	
/* JS for datepicker in the modal : Start */
	
	$('#datepicker').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd-mm-yyyy',
        value: moment().format("DD-MM-YYYY"),
        minDate: moment().format("DD-MM-YYYY")
    });
	
	/* JS for datepicker in the modal : End */
	
	
	/* JS for Books analysis : Start */
	
	
	jQuery(document).ready(function	(){

    var el;
    var options;
    var canvas;
    var spans;
    var ctx;
    var radius;

    var createCanvasVariable = function(id){  // get canvas
        el = document.getElementById(id);
    };

    var createAllVariables = function(){
        options = {
            percent:  el.getAttribute('data-percent') || 25,
            size: el.getAttribute('data-size') || 165,
            lineWidth: el.getAttribute('data-line') || 15,
            rotate: el.getAttribute('data-rotate') || 0,
            color: el.getAttribute('data-color')
        };

        canvas = document.createElement('canvas');
        spans = document.createElement('spans');
        spans.textContent = options.percent + '%';

        if (typeof(G_vmlCanvasManager) !== 'undefined') {
            G_vmlCanvasManager.initElement(canvas);
        }

        ctx = canvas.getContext('2d');
        canvas.width = canvas.height = options.size;

        el.appendChild(spans);
        el.appendChild(canvas);

        ctx.translate(options.size / 2, options.size / 2); 
        ctx.rotate((-1 / 2 + options.rotate / 180) * Math.PI); 

        radius = (options.size - options.lineWidth) / 2;
    };


    var drawCircle = function(color, lineWidth, percent) {
        percent = Math.min(Math.max(0, percent || 1), 1);
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, Math.PI * 2 * percent, false);
        ctx.strokeStyle = color;
        ctx.lineCap = 'square'; // butt, round or square
        ctx.lineWidth = lineWidth;
        ctx.stroke();
    };

    var drawNewGraph = function(id){
        el = document.getElementById(id);
        createAllVariables();
        drawCircle('#efefef', options.lineWidth, 100 / 100);
        drawCircle(options.color, options.lineWidth, options.percent / 100);


    };
    drawNewGraph('graph1');
    drawNewGraph('graph2');
    drawNewGraph('graph3');
    drawNewGraph('graph4');
    drawNewGraph('graph5');
    drawNewGraph('graph6');
    drawNewGraph('graph7');
    drawNewGraph('graph8');

});
/*JS for Books analysis :  End */
	
	</script>


		<!-- from footer.jsp end -->


</body>
</html>