<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="bootstrap-layout">


    <jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
    

<body class="layout-container ls-top-navbar si-l3-md-up">
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #3F51B5; padding:0px 16px;">
  <div class="container">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">
       <img src="http://studentzone-ngasce.nmims.edu/studentportal/resources_2015/images/logo.jpg"
        style="width:95px; height:40px;"
        alt="Logo">
  </a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <!-- Links -->
  <div class="collapse navbar-collapse" id="navbarText">
   
    <!-- Search -->
      <form class="form-inline" >
    <div class="input-group">
      
      <input type="text" class="form-control" placeholder="Search">
      <div class="input-group-prepend">
        <span class="input-group-text">
        
            <i class="material-icons">search</i>
        </span>
      </div>
    </div> 
  </form>
    <!-- // END Search -->

  <ul class="navbar-nav ml-auto">
    
      <li class="nav-item active nav-item-padding">
        <a href="ltiProviderPostForm" class="nav-link">
                           <span class= "row">
              <i  class="material-icons marginAuto navBarLinkLogo">home</i>
          </span>
          <div class= "navBarLinkText">
          <span>Home</span>
          </div>
        </a>
      </li>
              
              
      <li class="nav-item nav-item-padding">
        <a class="nav-link " href="studentProgress">
         <span class= "row">
            <i  class="material-icons marginAuto navBarLinkLogo">bar_chart</i>
          </span>
          <div class= "navBarLinkText" >
          <span>Grade</span>
          </div>
        </a>
      </li>
         <li class="nav-item nav-item-padding">
        <a class="nav-link" href="viewVideoGallery">
          <span class= "row">
            <i  class="material-icons marginAuto navBarLinkLogo">class</i>
          </span>
         <div class= "navBarLinkText" > 
          <span>Resources</span>
          </div>
        </a>
      </li>
         <li class="nav-item nav-item-padding">
        <a class="nav-link" href="todo">
          <span class= "row">
            <i  class="material-icons marginAuto navBarLinkLogo">assignment</i>
          </span>
          <div class= "navBarLinkText">
          <span>Assignment</span>
          </div>
        </a>
      </li>
         <li class="nav-item nav-item-padding">
        <a class="nav-link " href="calendar">
          <span class= "row  ">
            <i  class="material-icons marginAuto navBarLinkLogo">today</i>
          </span>
           <div class= "navBarLinkText">
          <span>Upcoming</span>
          </div>
        </a>
      </li>
    

      <li class="nav-item dropdown nav-item-padding" >
        <a class="nav-link " data-toggle="dropdown" href="#" role="button" aria-haspopup="false">
              <span class= "row  ">
           <i class="material-icons  marginAuto navBarLinkLogo">notifications_active</i>
          </span>
          <div class= "navBarLinkText">
          <span>Notification</span>
          </div>
        </a>
        <ul class="dropdown-menu">
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
                <img src="assets/images/people/110/guy-6.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">Deepak Gupta</strong>
                <div>
                  Posted new post for <b>Business Statistics</b>.
                </div>
                <small class="text-warning">27.11.2015, 15:00</small>
              </div>    
            </div>
          </li>
          <li class="notification-box bg-gray">
            <div class="row">
              <div class="col-lg-3 col-sm-3 col-3 text-center">
                <img src="assets/images/people/110/guy-2.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">David John</strong>
                <div>
                  Commented on your post.
                </div>
                <small class="text-warning">27.11.2015, 15:00</small>
              </div>    
            </div>
          </li>
          <li class="notification-box">
            <div class="row">
              <div class="col-lg-3 col-sm-3 col-3 text-center">
                <img src="assets/images/people/110/guy-1.jpg" class="w-50 rounded-circle">
              </div>    
              <div class="col-lg-8 col-sm-8 col-8">
                <strong class="text-info">Johnson</strong>
                <div>
                  Shared your post.<br>
                </div>
                <small class="text-warning">27.11.2015, 15:00</small>
              </div>    
            </div>
          </li>
          
        </ul>

      </li>

      <li class="nav-item dropdown">
        <a class="nav-link active dropdown-toggle p-a-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false">
          <img src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200"
           alt="Avatar" 
           class="rounded" width="40">
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-list" aria-labelledby="Preview">
          <a class="dropdown-item" href="accountEditUser"><i class="material-icons md-18">lock</i> <span class="icon-text">Edit Account</span></a>
          <a class="dropdown-item" href="profileNameUser"><i class="material-icons md-18">person</i> <span class="icon-text">Public ProfileName</span></a>
          <a class="dropdown-item" href="login.html">Logout</a>
        </div>
      </li>
  </ul>

</div>
</div>
</nav>
<!-- Sidebar -->
  <div class="sidebar sidebar-left sidebar-light sidebar-visible-md-up si-si-3 ls-top-navbar-xs-up sidebar-transparent-md" id="sidebarLeft" data-scrollable style="padding-left:20px">
    <ul class="sidebar-menu" >
      <li class="sidebar-menu-item" id="profileNameDiv">
            <div class="card card-profileName text-center">
		  <img class="card-img-top" src="https://unsplash.it/340/160?image=354"/>
		  <div class="card-block">
		    <img class="card-img-profileName" src="https://i0.wp.com/www.picmonkey.com/blog/wp-content/uploads/2015/04/LinkedIn_4.jpg?resize=200%2C200"/>
		    <h4 class="card-title">
		      Nelson Soans
		      <small>Student</small>
		    </h4>
		    <div class="card-links">
		      <small>NGASCE Exceutive MBA</small>
		    </div>
		  </div>
		</div>
      </li>
      <li class="list-group-item">
    
              <div class="media m-b-0">
                            <div class="sidebar-heading" style="padding:0px">My Courses</div>

            
            </li>
            
             <li class="list-group-item">
                <div class="media m-b-0">
        
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Organisational Behaviour: Success Strategies</a>
                      <br>
                    </p>
                  </div>
                </div>
              </li>
              
                       <li class="list-group-item">
                <div class="media m-b-0">
               
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Managerial Economics</a>
                      <br>
                    </p>
                  
                  </div>
                </div>
              </li>
              
                       <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Information Systems for Managers</a>
                      <br>
                    </p>
                  
                  </div>
                </div>
              </li>
                          <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Marketing Management</a>
                      <br>
                    </p>
                 
                  </div>
                </div>
              </li>
                         <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Financial Accounting: Information for Decisions</a>
                      <br>
                    </p>
                   
                  </div>
                </div>
              </li>
    </ul>    
    
    
             
            
                     
    <!-- Groups menu -->
    <div class="sidebar-heading">Groups</div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="#">
          <i class="sidebar-menu-icon material-icons">tune</i> My Groups
        </a>
        <ul class="sidebar-submenu sm-condensed">
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-buttons.html">NGASCE</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-cards.html">Foundations</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-tabs.html">Business Ideas</a>
          </li>
        </ul>
      </li>
    </ul>
    <!-- // END Components Menu -->
  </div>
  <!-- // END Sidebar -->

  <!-- Content -->   
  <div class="layout-content" data-scrollable style="padding-top: 0px;">
    <div class="container-fluid">
   
      <div class="row" id="mainPageControllerDiv">
          

      
        <div class="col-md-8" id="timeline">
         <div class="card card-stats-primary">
        <div class="card-block">
          <div class="media">
            <div class="media-left media-middle">
              <i class="material-icons text-muted-light">filter</i>
            </div>
            <div class="media-body media-middle">
              Business Statistics
              
    <a  href="profileNameInstructor">
              
              <strong>Prof. Subhajit Chakrabarty</strong>
              </a>          
                </div>
            <div class="media-right">
              <a class="btn btn-success btn-rounded" href="pay.html">Filter Feeds</a>
            </div>
          </div>
        </div>
      </div>
        <jsp:include page="homeTimeline.jsp"></jsp:include> 
        </div>
        
        
        
            <div class="col-md-3" id="toDoDiv">
    <div class="card">
            <div class="card-header bg-white">
              <div class="media">
                <div class="media-body media-middle">
                  <h4 class="card-title">To Do</h4>
                </div>
              </div>
            </div>
            <ul class="list-group list-group-fit">
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-9.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Business Law Sem 2</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Adrian D.</a></small>
                    </p>
                    <small class="text-muted-light">Due in 3 days</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Business Statistics Sem 2</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Andrew B.</a></small>
                    </p>
                    <small class="text-muted-light">Due in 9 days</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/woman-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Essentials of HRM Sem 2</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Michelle S.</a></small>
                    </p>
                    <small class="text-muted-light">Due in 12 days</small>
                  </div>
                </div>
              </li>
            </ul>
                <div class="card-footer bg-white">
              <div class="media">
                <div class="media-body media-middle">
                  <p class="card-subtitle">8 more...</p>
                </div>
                <div class="media-right media-middle">
                  <a class="btn btn-white" href="forum.html"> <i class="material-icons">keyboard_arrow_right</i></a>
                </div>
              </div>
            </div>
          </div>
              <div class="card">
            <div class="card-header bg-white">
              <div class="media">
                <div class="media-body media-middle">
                  <h4 class="card-title">Coming Up</h4>
                </div>
              </div>
            </div>
            <ul class="list-group list-group-fit">
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-9.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Business Law Session 3</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Prof. Mario Sequeira</a></small>
                    </p>
                    <small class="text-muted-light">Starts in 5 hrs</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Business Statistics Session 3</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Prof. Subhajit  Chakrabarty</a></small>
                    </p>
                    <small class="text-muted-light">Starts in 7 hrs</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/woman-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Strategic Management Session 3</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Prof. Shrinivas  Shikaripurkar</a></small>
                    </p>
                    <small class="text-muted-light">Starts in 2 Days</small>
                  </div>
                </div>
              </li>
            </ul>
                    <div class="card-footer bg-white">
              <div class="media">
                <div class="media-body media-middle">
                  <p class="card-subtitle">10 more...</p>
                </div>
                <div class="media-right media-middle">
                  <a class="btn btn-white" href="forum.html"> <i class="material-icons">keyboard_arrow_right</i></a>
                </div>
              </div>
            </div>
          </div>
         </div>
              <div class="col-md-1">
        </div>
      	
      </div>

    </div>
  </div>

	
    <jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>

</body>



</html>
