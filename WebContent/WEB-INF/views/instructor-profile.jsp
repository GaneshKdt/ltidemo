<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="headTag.jsp">
<jsp:param value="Resources" name="title"/>
</jsp:include>

<style type="text/css">
	.profileName-pic{
		margin-top: -235px;
		margin-left: 20px;
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
			<div class="card mb-2 ml-3">
		        <div class="card-header">
		        	<img src="assets/images/cover/Logo2.jpg" class="img-fluid" alt="cover">
		        </div>
		        <div class="card-body p-0">
		          <img class="profileName-pic rounded-circle img-fluid" src="assets/images/people/110/guy-3.jpg">
		          
		          <div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<ul class="nav nav-tabs" >
						  <li class="nav-item">
						    <a class="nav-link active" href="#timeline" data-toggle="tab">Timeline</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#about" data-toggle="tab">About</a>
						  </li>
						  
						  <li class="nav-item">
						    <a class="nav-link" href="#more" data-toggle="tab">More</a>
						  </li>
						</ul>
					</div>
				  </div>
		        </div>
		    </div>
		</div>

				<!-- <div class="col-md-4" style="font-size: 12px;">
					<div class="card mb-2" >
						<div class="card-header">
							<div class="media">
							  <i class="fas fa-chalkboard-teacher mr-2 align-self-center"></i>
							  <div class="media-body">About Instructor</div>
							</div>
						</div>
						<div class="card-body">
						Rating 
						<div style="color: #FFDF00; font-size: 15px;">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star-half-alt"></i>
							<i class="far fa-star"></i>
						</div>
							<div class="media" style="font-size: 14px;">
							  <i class="fa-solid fa-book-reader mr-2 align-self-center"></i>
							  <div class="media-body">Expert In </div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-book mr-2 align-self-center"></i>
							  <div class="media-body">Business Economics </div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-book mr-2 align-self-center"></i>
							  <div class="media-body">Brand Management</div>
							</div>
							<br>
							<div class="media">
							  <i class="fa-solid fa-book mr-2 align-self-center"></i>
							  <div class="media-body">Business Finance </div>
							</div>
							<br>
							<div class="media">
							  <i class="fas fa-map-marker-alt mr-2 align-self-center"></i>
							  <div class="media-body">From Mumbai, Maharashtra </div>
							</div>
						</div>
					</div>
					<br><br><br><br><br>
				</div> -->

				<div class="col-md-12 mb-2">
				<div class="card ml-3" style="font-size: 12px !impotant">
					<div class="card-body">
					<div class="tab-content">
			  <div class="tab-pane active" id="timeline">
			  <!-- 1st card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/guy-3.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Prof. Sean Carroll</a></b><span class="text-muted"> to </span><b><a href="">Fox Tales</a></b>
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
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share-nodes"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
				     
				     <!-- 2nd card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/guy-3.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Prof. Sean Carroll</a></b><span class="text-muted"> to </span><b><a href="">Business Economics</a></b>
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
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share-nodes"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
				     
				     <!-- 3rd card timeline -->
				     <div class="card mb-2">
				       <div class="card-body">
				         <div class="media">
				           <img class="mr-2" src="assets/images/people/110/guy-3.jpg" style="width: 50px; height: 50px;" alt="image">
				           <div class="media-body align-self-center"> 
				             <b><a href="">Prof. Sean Carroll</a></b><span class="text-muted"> to </span><b><a href="">Fox Tales</a></b>
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
						<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fa-solid fa-share-nodes"></i>&nbsp;&nbsp;&nbsp;Share</button>
					</div>  	
				       </div>
				     </div>
			  
			  </div>
			  <div role="tabpanel" class="tab-pane fade" id="about">
			  <h3>About Prof. Sean Carroll</h3><hr>
			  <h5>
			  	Rating 
						<span style="color: #FFDF00;">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star-half-stroke"></i>
							<i class="fa-regular fa-star"></i>
						</span>
			  </h5><br>
			  <h5><i class="fa-solid fa-book-open-readerr mr-2 align-self-center"></i> Expert In</h5><hr>
			  <i class="fa-solid fa-book mr-2 align-self-center"></i>Business Finance<br>
			  <i class="fa-solid fa-book mr-2 align-self-center"></i>Brand Management<br>
			  <i class="fa-solid fa-book mr-2 align-self-center"></i>Business Finance<br>
			  <br>
			  <h5>Summary</h5><hr>
			  <p>Professor Sean Carroll is a Senior Research Associate in Physics at the California Institute of Technology. He earned his undergraduate degree from Villanova University and his Ph.D. in Astrophysics from Harvard in 1993. Before arriving at Caltech, Professor Carroll taught in the Physics Department and the Enrico Fermi Institute at the University of Chicago, and did postdoctoral research at the Massachusetts Institute of Technology and at the Institute for Theoretical Physics at the University of California, Santa Barbara.</p>

			  <p>Professor Carroll is the author of Spacetime and Geometry: An Introduction to General Relativity, published in 2003. He has taught more than 200 scientific seminars and colloquia and given more than 50 educational and popular talks. In addition, he has written for numerous publications including Nature, New Scientist, The American Scientist, and Physics Today.</p>

			  <p>Professors conduct original research and commonly teach undergraduate, professional and postgraduate courses in their fields of expertise. In universities with graduate schools, professors may mentor and supervise graduate students conducting research for a thesis or dissertation. In many universities, 'full professors' take on senior managerial roles, leading departments, research teams and institutes, and filling roles such as president, principal or vice-chancellor.[5] The role of professor may be more public facing than that of more junior staff, and professors are expected to be national or international leaders in their field of expertise.</p>
			  </div>
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