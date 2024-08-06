<%@page import="com.nmims.bean.StudentLtidemoBean"%>
<%@page import="com.nmims.bean.PersonLtidemoBean"%>
<%@page import="com.nmims.bean.FacultyLtidemoBean"%>
<%@page import="org.springframework.beans.factory.annotation.Value"%> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
 .hover-light:hover {
	background-color: #F6F7F9;
}
</style>

<%
	String role = request.getParameter("role");
	String SERVER_PATH =(String)session.getAttribute("SERVER_PATH");
	FacultyLtidemoBean faculty = (FacultyLtidemoBean)session.getAttribute("facultyLtidemo");
	StudentLtidemoBean studentBean = (StudentLtidemoBean)session.getAttribute("studentLtidemo");
    
    String name = "";
    String firstName = ""; 
    String lastName = "";
    String profile_pic = "assets/images/cover/userImg.jpg";
    String userId = "";
    
    if(studentBean != null && studentBean.getImageUrl() != null){
    	if(studentBean.getImageUrl()!=null){
    		profile_pic = studentBean.getImageUrl().trim(); 
    	}
		name = studentBean.getFirstName() + " " + studentBean.getLastName();
		firstName= studentBean.getFirstName();
		lastName = studentBean.getLastName();
		userId = studentBean.getSapid();
		
    }if(faculty != null){
    	if(faculty.getImgUrl()!=null){
    		profile_pic = SERVER_PATH + faculty.getImgUrl(); 
    	}
    	name = "Prof."+ faculty.getFirstName() + " " + faculty.getLastName();
    	firstName=faculty.getFirstName() ;
    	lastName =faculty.getLastName();
    	userId = faculty.getFacultyId();
    }
%>
 
 <!-- Navbar -->
  
  <nav class="navbar navbar-expand-sm navbar-dark fixed-top navbar-header" > 
  	<div class="container-fluid">
  
  		<!-- Search and Logo Start -->
		<div class="row" style="width:55%;">
					
			<div class="col-4">
				<!-- Brand/logo -->
			  <!-- <a class="navbar-brand float-right mr-0" href="home">
			    <img src="https://www.lawctopus.com/wp-content/uploads/2016/07/nmims.gif" class="rounded" alt="Responsive image" width="40">
			  </a> --> 
			</div>
	  
			<div class="col-8 px-0">
		
			<form class="form-inline mb-0">
		    	<div class="input-group" style="width: 70%!important;"> 
		    		<div class="input-group-prepend pr-2">
		    			<img src="assets/images/Header Logo.png" alt="NMIMS Logo" width="35px" height="35px"> 
		    		</div>
		    
		      		<input type="text" class="form-control border-0 bg-color searchInput" placeholder="Search..." aria-label="Search" aria-describedby="basic-addon1">
		      		
		      		<div class="input-group-prepend">
		        		<span class="input-group-text rounded-right border-0 bg-color" id="basic-addon1" style="color: #C0C0C0;"><i class="fa-solid fa-magnifying-glass"></i></span>
		      		</div>
		    	</div>
	 	 	</form>
	 	 	
			</div>
	
		</div>
		<!-- Search and Logo End -->
  
  		<!-- Home and Chat Start-->
  
  		<div class="collapse navbar-collapse justify-content-left p-0" id="navbarText1">  
  		
  			<ul class="navbar-nav text-center">
				<li class="nav-item dropdown hover-light px-0">     
        			<a class="nav-link dark-text" id="notificationDropdown" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false"> 
        				<img src="<%=profile_pic%>" alt="Photo" class="rounded" width="30px" height="30px" >&nbsp;&nbsp;
          				<span class="dark-text"><%=name%></span>  
        			</a>
      			</li>
      			
      			<li class="nav-item  hover-light px-0">     
        			<a class="nav-link dark-text"  href="/ltidemo/FacultyTimeline" > 
          				<span class="dark-text">Home</span>  
        			</a>
      			</li>


<!--       <li class="nav-item dropdown hover-light px-2 " >  
        <a class="nav-link dark-text" id="notificationDropdown" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
          <span class="octicon octicon-bell  " ></span>
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

      </li> -->
<!-- 	  <li class="nav-item hover-light px-2" >
        <a class="nav-link dark-text" href="viewVideoGallery" >
            <i class="fas fa-chalkboard-teacher fs-25"></i>
        	<i class="fas fa-chalkboard-teacher  octicon"></i>          
        </a> 
      </li> 
      <li class="nav-item hover-light px-2" >
        <a class="nav-link dark-text" href="studentProgress"  > 
        	<span class="octicon octicon-repo  " ></span> 
        </a>
      </li>
      <li class="nav-item hover-light ml-2" > 
        <a class="nav-link dark-text" href="studentProgress"  >
        	<i class="fas fa-question-circle fs-28"></i> 
        </a>  
      </li> -->
         <li class="nav-item dropdown hover-light" >
        <a class="nav-link dark-text"  id="Preview" href="#" data-toggle="dropdown" role="button" aria-haspopup="false"> 
        	<i class="fa-solid fa-gear fs-27"></i>
        </a>
        <div class="dropdown-menu w-auto" aria-labelledby="Preview">
          <!-- <a class="dropdown-item" href="/acads/updateFacultyProfileForm"><i class="fas fa-edit"></i> <span class="icon-text">Edit Account</span></a>
          <a class="dropdown-item" href="profileNameUser"><i class="fas fa-user"></i> <span class="icon-text">Public ProfileName</span></a> -->
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/ltidemo/logout">Logout</a>
        </div>
      </li>
    </ul> 
  </div>
  
  


</div>
</nav>
  