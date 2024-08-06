<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
</jsp:include>
<style type="text/css">

.ViewMore{
	color: #ddd;
    font-size: 14px;;
    top: 12px;
    left: 10px;
    overflow-wrap: break-word;
    position: absolute;
    right: 10px;
    text-align: center;
    text-shadow: 0 0 0.5em #000;
    vertical-align: middle;
}

.profileNamepic{
	margin: -180px 0px 0px 10px;
    position: absolute;
    z-index: 0;
    height: 200px;
    width: 200px;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include> 
<div class="container-fluid">
<div class="row">

	<div class="col-md-2">
		<jsp:include page="sidedrawer.jsp"></jsp:include>
	</div>
	<div class="col-md-7">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-3">
				<img alt="" src="https://podcasts.shelbyed.k12.al.us/scs-news/fileNames/2015/09/cropped-SC03-28832-FacebookCover-031.jpg" style="height: 300px;">
					<div class="card-body p-2">
						<img alt="" class="rounded-circle img-thumbnail profileNamepic" src="assets/images/people/110/woman-4.jpg"> 
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-8">
								  <!-- <div class="d-flex flex-row" >
									  <a href=""><div class="p-2">Timeline</div></a>
									  <a href=""><div class="p-2">About</div></a>
									  <a href=""><div class="p-2">Followers</div></a>
									  <a href=""><div class="p-2">More</div></a>
								  </div> -->
								  
								    <ul class="nav nav-tabs" role="tablist">
									  <li class="nav-item">
									    <a class="nav-link active" href="#timeline" role="tab" data-toggle="tab">Timeline</a>
									  </li>
									  <li class="nav-item">
									    <a class="nav-link" href="#about" role="tab" data-toggle="tab">About</a>
									  </li>
									  <li class="nav-item">
									    <a class="nav-link" href="#followers" role="tab" data-toggle="tab">Followers</a>
									  </li>
									  <li class="nav-item">
									    <a class="nav-link" href="#more" role="tab" data-toggle="tab">More</a>
									  </li>
									</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-4" >
				<jsp:include page="peopleIntro.jsp"></jsp:include>
				<br><br><br><br><br>
			</div>
			
			<div class="col-md-8 mb-2">
				<div class="card" style="font-size: 12px !impotant">
					<div class="card-body">
						<div class="tab-content">
				 	 	<div role="tabpanel" class="tab-pane active" id="timeline">
					<!-- 1st card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/woman-4.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Shirley Hugventor</a></b><span class="text-muted"> to </span><b><a href="">Fox Tales</a></b>
				             <span id="action_menu_btn" class="text-muted" style="float: right;"><i class="fa-solid fa-ellipsis"></i></span><br>
				             <span class="text-muted">Yesterday at 10:14 PM	</span>
				           </div>
				         </div><br>
				         <div class="action_menu">
					<ul>
						<li><i class="fa-solid fa-ban"></i> Report...</li>
						<li><i class="fa-solid fa-users"></i> Unfollow</li>
						<li><i class="fa-solid fa-eye-slash"></i> Hide Post</li>
						<li><i class="fa-solid fa-share-from-square"></i> Share</li>
					</ul>
				</div>
				         <p>Today we say farewell to Gladys Fleetch as she begins a well-deserved retirement.</p>
				         <p>Gladys joined the original Fox Mills in 1977, working as an assistant pattern cutter. The world has changed a lot since those days, and with our manufacturing heading overseas our business focused on fabric design and technology. And Gladys has stayed with us all this time, serving for so many years in purchasing, marketing, and still keeping her hand in with pattern design. I don't think there's a job here she hasn't done! </p>
				       
					<div class="btn-group" role="group" aria-label="Basic button">
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray; "><i class="fa-solid fa-thumbs-up"></i>&nbsp;&nbsp;&nbsp;Like</button>
						<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment1" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-message-lines"></i>&nbsp;&nbsp;&nbsp;Comment</button>
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
				     
				     <!-- 2nd card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/woman-4.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Shirley Hugventor</a></b><span class="text-muted"> to </span><b><a href="">Business Economics</a></b>
				             <span id="action_menu_btn" class="text-muted" style="float: right;"><i class="fa-solid fa-ellipsis"></i></span><br>
				             <span class="text-muted">Yesterday at 10:14 PM	 </span>
				           </div>
				         </div><br>
				         <div class="action_menu">
					<ul>
						<li><i class="fa-solid fa-ban"></i> Report...</li>
						<li><i class="fa-solid fa-users"></i> Unfollow</li>
						<li><i class="fa-solid fa-eye-slash"></i> Hide Post</li>
						<li><i class="fa-solid fa-share-from-square"></i> Share</li>
					</ul>
				</div>
				         <p>Today we say farewell to Gladys Fleetch as she begins a well-deserved retirement.</p>
				         <p>Gladys joined the original Fox Mills in 1977, working as an assistant pattern cutter. The world has changed a lot since those days, and with our manufacturing heading overseas our business focused on fabric design and technology. And Gladys has stayed with us all this time, serving for so many years in purchasing, marketing, and still keeping her hand in with pattern design. I don't think there's a job here she hasn't done! </p>
				       
					<div class="btn-group" role="group" aria-label="Basic button">
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray; "><i class="fa-solid fa-thumbs-up"></i>&nbsp;&nbsp;&nbsp;Like</button>
						<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment1" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-message-lines"></i>&nbsp;&nbsp;&nbsp;Comment</button>
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
				     
				     <!-- 3rd card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/woman-4.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Shirley Hugventor</a></b><span class="text-muted"> to </span><b><a href="">Fox Tales</a></b>
				             <span id="action_menu_btn" class="text-muted" style="float: right;"><i class="fa-solid fa-ellipsis"></i></span><br>
				             <span class="text-muted">Yesterday at 10:14 PM	 </span>
				           </div>
				         </div><br>
				         <div class="action_menu">
					<ul>
						<li><i class="fa-solid fa-ban"></i> Report...</li>
						<li><i class="fa-solid fa-users"></i> Unfollow</li>
						<li><i class="fa-solid fa-eye-slash"></i> Hide Post</li>
						<li><i class="fa-solid fa-share-from-square"></i> Share</li>
					</ul>
				</div>
				         <p>Today we say farewell to Gladys Fleetch as she begins a well-deserved retirement.</p>
				         <p>Gladys joined the original Fox Mills in 1977, working as an assistant pattern cutter. The world has changed a lot since those days, and with our manufacturing heading overseas our business focused on fabric design and technology. And Gladys has stayed with us all this time, serving for so many years in purchasing, marketing, and still keeping her hand in with pattern design. I don't think there's a job here she hasn't done! </p>
				       
					<div class="btn-group" role="group" aria-label="Basic button">
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray; "><i class="fa-solid fa-thumbs-up"></i>&nbsp;&nbsp;&nbsp;Like</button>
						<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment1" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-message-lines"></i>&nbsp;&nbsp;&nbsp;Comment</button>
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
				</div>
				
				<div role="tabpanel" class="tab-pane fade" id="about">
				
					<div class="card mb-2">
						<div class="card-header"><i class="fa-solid fa-user"></i> About Shirley</div>
						<div class="card-body">
						<h5>Work</h5><hr>
							<div class="media">
							  <i class="fa-solid fa-briefcase mr-2 align-self-center"></i>
							  <div class="media-body">Works at Student and SAAR IT Resources Pvt. Ltd. </div>
							</div>
							<br>
						<h5>Education</h5><hr>
							<div class="media">
							  <i class="fa-solid fa-graduation-cap mr-2 align-self-center"></i>
							  <div class="media-body">YMT College Of Management </div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-graduation-cap mr-2 align-self-center"></i>
							  <div class="media-body">Studied B.M.M. (Bachelors in Management) at L.S.Raheja College Of Arts & Commerce </div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-graduation-cap mr-2 align-self-center"></i>
							  <div class="media-body">M.L.Dahanukar college of commerce</div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-house mr-2 align-self-center"></i>
							  <div class="media-body">Lives in Mumbai, Maharashtra </div>
							</div>
						</div>
					</div>
				
				</div>
			  	<div role="tabpanel" class="tab-pane fade" id="followers">Followers</div>
			  	<div role="tabpanel" class="tab-pane fade" id="more">More</div>
					</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="col-md-2">
		<jsp:include page="onlinePeople2.jsp"></jsp:include>
	</div>
	
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>