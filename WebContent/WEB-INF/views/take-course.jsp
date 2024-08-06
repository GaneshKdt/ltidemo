<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<link href="assets/css/NewReaction.css" rel="stylesheet" /> 
<jsp:include page="headTag.jsp">
	<jsp:param value="Video Home" name="title" />
</jsp:include>

<script type="text/javascript" src="assets/js/newReaction.js"></script>	
<body>
<%@ include file="header.jsp" %>   		
	<div class="container-fluid ">
		<div class="row"> 
            <div class="col-lg-3 col-md-3 col-sm-4">
				<jsp:include page="sidedrawer.jsp"></jsp:include>
			</div>
			<div class="col-lg-6 col-md-5 col-sm-8 pl-5">
			<div class="card">
			<div class="card-body">
				<div class="embed-responsive embed-responsive-16by9">  
				  <iframe class="embed-responsive-item videoLink" src="" allowfullscreen></iframe>
				</div> 
<!-- 				<iframe width="100%" height="500px" src="https://player.vimeo.com/video/76979871?title=0&amp;byline=0&amp;portrait=0"  -->
<!-- 				frameborder="0" allow="autoplay; encrypted-media" allowfullscreen="" style="padding: -10px"></iframe> -->
                	<br/>
                	  
                	<!-- <div class=" "> 
                   		<h4 class=""><a href="#" class="video_subject"></a></h4>
                   		<div class=" ">  
                   		<span class="" style="color: gray;"><i class="fa fa-eye"></i> 547 views</span>
                   		</div> 
                       		<span><button type="button" class="btn btn-link" style="color: gray;"><i class="fas fa-thumbs-up"></i> 147 Likes</button></span>
                       		<span> <button type="button" class="btn btn-link" style="color: gray;"><i class="fas fa-share"></i> Share</button></span>
                       		<span> <button type="button" class="btn btn-link" style="color: gray; text-decoration: none;"><i class="fas fa-download"></i> Download</button></span >
                       
                  	</div> <hr>  --> 	
              	
	      	<div class="media mb-3">
				<img class="mr-3 rounded-circle" src="assets/images/cover/Business-Economics-logo.jpg" alt="image" style="width: 50px; height: 50px;">
				<div class="media-body">
					<p class="mt-0 "><span class="facultyName"></span><br>
					<span class="text-muted ">Published on <span class="createdDate"></span></span>
					</p> 
					<span>Description :</span>
					<p style="font-weight: 400;" class="description">
					</p>
					<!-- <span class="mb-0"><button type="button" class="btn btn-light">Finance <span class="badge badge-light">+ 6</span></button></span>
					 <span class="mb-0"><button type="button" class="btn btn-light">Management<span class="badge badge-light">+ 3</span></button></span>
					<span class="mb-0"> <button type="button" class="btn btn-light">Business<span class="badge badge-light">+ 7</span></button></span> -->
				</div>
			</div>
			
			
			
			<div class="card_footer" data-post_id=""></div>
			
			
		</div>
		</div>	
    	</div>
    	
<!--     	<div class="col-lg-3 col-md-4  pl-5">
    	
    	Video Topics Start
		<div class="card mb-2">
			<div class="card-body p-1">
				<div class="d-flex justify-content-center p-2">Topics</div>
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Factors contributing to Politics in Organisation</div>
					    <div class="p-2 mr-2 ml-auto">18:09</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Role of Politics in Determining Organisational Culture</div>
					    <div class="p-2 mr-2 ml-auto">8:30</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Personality and Politics</div>
					    <div class="p-2 mr-2 ml-auto">5.45</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Personal Values and Politics</div>
					    <div class="p-2 mr-2 ml-auto">3.20</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Factors contributing to Politics in Organisation</div>
					    <div class="p-2 mr-2 ml-auto">9.45</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Big 5 Video</div>
					    <div class="p-2 mr-2 ml-auto">6.12</div>
					</div>
					</a>
					
					<a href="">
					<div class="d-flex flex-row mb-2">
					    <div class="p-2 ml-2"><i class="far fa-play-circle" style="color:#26a9e0;"></i></div>
					    <div class="p-2">Case: Leadership (Indra Nooyi)</div>
					    <div class="p-2 mr-2 ml-auto">36.12</div>
					</div>
					</a>
				</div>
			</div>
		Video Topics End
		
		Subject PDF Start
		<div class="card mb-2" style="text-align: center">
			<div class="card-header">
			<img class="card-img-top" src="https://mhcampus-book-covers.s3.amazonaws.com/mhcover-w148-h179/1259899403.jpg" alt="Card image cap">
				<a href="#"	class="btn btn-primary btn-block btn-rounded">View Text Book</a>
				<a href="#" class="btn btn-primary btn-block btn-rounded">download PDF</a>
			</div>
		</div>
		Subject PDF End
		
		Subject Instructor details start
			<div class="card mb-2">
				<div class="card-header">
					<div class="media">
						<img class="mr-3 rounded-circle" src="https://www.thegreatcourses.com/media/professor/p/r/prof_sean_carroll_4.1395271388.jpg" alt="image" style="width: 50px; height: 50px;">
						<div class="media-body">
						<a href=""><h5>Professor Sean Carroll</h5> </a>
						<span class="text-muted">Instructor</span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<p style="font-weight: 400;">Professor Sean Carroll is a Senior Research Associate in Physics at the California Institute of Technology. 
					He earned his undergraduate degree from Villanova University and his Ph.D. in Astrophysics from Harvard in 1993. 
					Before arriving at Caltech, Professor Carroll taught in the Physics Department and the Enrico Fermi Institute at 
					the University of Chicago, and did postdoctoral research at the Massachusetts Institute of Technology and at 
					the Institute for Theoretical Physics at the University of California, Santa Barbara. </p>
					
				</div>
			</div>
			Subject Instructor details End
			
			
					
				</div> -->
			</div>
		</div>

<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>
</body>

</html>
<script src="assets/js/template.js"></script>
<script src="assets/js/comments.js"></script>
<script>
var profile_pic="https://studentzone-ngasce.nmims.edu/"+'<%=profile_pic%>'; 
function facId(){
	return userId;
}
function SERVER_PATH() {
	return '${SERVER_PATH}';
}  

$.ajax({
	type : "GET",
	contentType : "application/json",
	url : "/acads/m/watchVideos?id=${video_id}",
	
	success : function(response) { 
		console.log("video content");   
		var video = response.mainVideo[0];
   console.log(video);        
   $('.videoLink').attr("src",video.videoLink);
   $('.videosubject').html(video.subject);
   $('.facultyName').html(video.facultyName);
   $('.createdDate').html(video.createdDate);
   $('.description').html(video.description); 
   getPostById(video.id);
   
	},   

	error : function(e) {
		alert("Please Refresh The Page.")
		console.log("ERROR: ", e);
		display(e);
	}
});


function getPostById(id){
	var data={"id":  id}; 
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/acads/m/getPostIdByVideoId",
		data : JSON.stringify(data),
		success : function(response) {
			console.log("get post");  
	   $('.card_footer').attr("data-post_id",response.post_id);
	   loadFooter();
		}
	});
}

var userId = "${userId}";  
var firstName= '<%=firstName%>';
var lastName='<%=lastName%>';  
var facultyId = userId;
function loadFooter() {
	$(".card_footer").each(function() {
	var element = $(this);
	var post_id = $(this).attr("data-post_id");
	var profile_pic='<%=profile_pic%>';   
    $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "/ltidemo/getCommentAndReactions",
			data : JSON.stringify({
				"sapid":userId,
				"post_id" : post_id,
				"role" : "Faculty"
			}),
			dataType : 'json',
			success : function(post) {
				console.log(post);
				var reaction = "";
				var reactionCount = "";
				var myreaction = "";
				if (post.reactions.length > 0) {
					for (i = 0; i < post.reactions.length; i++) { //loop through the array
						reaction = reaction +'<div class="reactionButton '+post.reactions[i]+'"></div>'
					}
				}
				$(element).append([ {
					"myId" : userId,
					"reaction":reaction,
					"reactionCount":post.reactionCount,
					"commentCount":post.commentCount,
					"userId":userId,
					"post_id":post_id,
					"myReaction":post.myReaction
					}].map(Reaction).join(''));
				
				 var comment=[{"profile_pic":'<%=profile_pic%>',"post_id":post_id}].map(Reply).join('');
                
                
                
                
        		$.ajax({
        			type : 'POST',
        			url : '/ltidemo/viewMoreComments/',
        			contentType : "application/json",
        			data : JSON.stringify({
        				 "post_id" :post_id,
        		          "limit" : "" + 100,
        		          "offset" : 0
        			}),
        			dataType : 'json',
        			success : function(response) {
        				console.log("comments:::::");
        				console.log(response);
        				$.each(response.comments,function(i, comments) {
    						if(comments.master_comment_id==0){
    							var imageUrl=(comments.imageUrl==null)?"assets/images/cover/userImg.jpg":comments.imageUrl;
    							comment=comment + [{
    								"imageUrl":imageUrl,
    								"firstName":comments.firstName,
    								"lastName":comments.lastName,
    								"comment":comments.comment,
    								"createdDate":comments.createdDate,
    								"id":comments.id,
    								"profile_pic":'<%=profile_pic%>',   
    								"post_id":post_id,
    								"userId":comments.sapid
    								}].map(Comment).join('');   
    						}
    					});
    					
    					$(element).append('<br/><div class="p-3 commentsDiv">'+comment+'</div>');
        			},
        			error : function(XMLHttpRequest, textStatus, errorThrown) {
        			}
        		});  
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			}
			});
    $(this).removeClass('card_footer');$(this).addClass('card_reaction_footer');
		});
 }	

</script>
