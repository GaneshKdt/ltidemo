<div class="right-sidebar-todo">

<div class="card mb-3">
		<div class="card-header" style="background-color: white;">
			<i class="material-icons">assignment</i> To Do
		</div>
		<div class="card-body">
			<ul class="list-unstyled">
				<li class="media"><img class="mr-3 rounded-circle"
					src="assets/images/people/110/guy-9.jpg" alt="image"
					style="width: 40px; height: 40px">
					<div class="media-body">
						<a href="#">Organisational Behaviour</a><br> <small>by
							<a href="#">Deepak Gupta</a>
						</small> <br> <small class="text-muted">Due in 5 days</small>
					</div></li>
				<hr>
				<li class="media my-3"><img class="mr-3 rounded-circle"
					src="assets/images/people/110/woman-9.jpg" alt="image"
					style="width: 40px; height: 40px">
					<div class="media-body">
						<a href="#">Business Economics</a><br> <small>by <a
							href="#">Pooja Basu</a></small> <br> <small class="text-muted">Due
							in 15 days</small>
					</div></li>
				<hr>
				<li class="media"><img class="mr-3 rounded-circle"
					src="assets/images/people/110/woman-5.jpg" alt="image"
					style="width: 40px; height: 40px">
					<div class="media-body">
						<a href="#">Business Behaviour</a><br> <small>by <a
							href="#">Rohini Kelkar</a></small> <br> <small class="text-muted">Due
							in 23 days</small>
					</div></li>
			</ul>

		</div>
		<div class="card-footer">
			7 More... <a href="todo" style="float: right;text-decoration: none !important;"><i
				class="material-icons">chevron_right</i></a>
		</div>
	</div>

<div class="card">
		<div class="card-body" id="sessionCardBody">
			<i class="fa-regular fa-calendar-check"></i> 4 Sessions <hr style="margin-bottom: 5px">
			<span class="text-muted" style="font-weight: 500 !important;">Trending Posts</span><br>

			<div class="d-flex align-items-center">
				<div class="p-2"><i class="fa-solid fa-heart" style="color: red;"></i><br>9</div>
			  	<div class="p-2">
			  		<a href="">Congratulations to our June employee of 9 the month, Jenny...</a><br>	
					<a href="" style="font-weight: 400;">Dan O'Reilly <span class="text-muted">in</span> Employee of the Month</a>
			  	</div>
			</div>

			<div class="d-flex align-items-center">
			  <div class="p-2"><i class="fa-solid fa-heart" style="color: red;"></i><br>6</div>
			  <div class="p-2">
			  	<a href="">Excited to be with the team in 6 Singapore, where I'm proud to...</a>
			  	<a href="" style="font-weight: 400;">Paul Andrews <span class="text-muted">in</span> Spring Line Planning</a>
			  </div>
			  <div class="ml-auto p-2"><img src="assets/images/timeline/event.jpg" class="rounded" style="height: 40px; width: 40px"></div>
			</div>

			<div class="d-flex align-items-center">
				<div class="p-2"><i class="fa-regular fa-thumbs-up" style="color: #007bff"></i><br>9</div>
			  	<div class="p-2">
			  		<a href="">Hey team, what would you like me to 2 highlight in my weekly update to...</a><br>	
					<a href="" style="font-weight: 400;">Blaise De Persia <span class="text-muted">in</span> Spring Line Planning</a>
			  	</div>
			</div>

			<div class="d-flex align-items-center">
				<div class="p-2"><br>0</div>
			  	<div class="p-2">
			  		<a href="">New Hires Training</a><br>	
					<a href="" style="font-weight: 400;">Christina Tan</a>
			  	</div>
			</div>

			<div class="d-flex align-items-center">
			  <div class="p-2"><i class="fa-solid fa-message-lines"></i><br>3</div>
			  <div class="p-2">
			  	<a href="">Here are the slides from the all- hands in case you missed...</a><br>
			  	<a href="" style="font-weight: 400;">Cathy Yung <span class="text-muted">in</span> Design Team</a>
			  </div>
			  <div class="ml-auto p-2"><img src="assets/images/timeline/event2.jpg" class="rounded" style="height: 60px; width: 40px"></div>
			</div>

			<div class="d-flex align-items-center">
			  <div class="p-2"><i class="fa-solid fa-message-lines"></i><br>3</div>
			  <div class="p-2">
			  	<a href="">Welcome Jeff Li to Fox Fabrics Global!</a><br>
			  	<a href="" style="font-weight: 400;">Dan O'Reilly <span class="text-muted">in</span> New Joiners, Promotions & Leavers</a>
			  </div>
			</div>
			<hr>
			<div class="card">
			  <img class="card-img-top" src="assets/images/timeline/meeting.jpg" alt="Card image cap">
			  <div class="card-body">
			  	<div class="d-flex align-items-center">
			  	<div class="p-2"><a href="">Sales Team</a><br>
			  	<span class="text-muted">20 members</span></div>
  					<div class="ml-auto p-2">
  						<button type="button" class="btn btn-light btn-sm"><span class="m=text-muted">+ Join</span></button>
  					</div>
			    </div>
			  </div>
			</div>
			<hr>
			<span class="text-muted" style="font-weight: 500 !important;">Upcoming Sessions</span>
			<hr>
	</div>	
    </div>
<br><br><br><br><br><br><br><br>
</div>
<script>

$(document).on('click' , '.card', function(){
	var userId="${userId}";
	getSessions(userId);
});

function getSessions(userId){
	var body = {
			'sapid' : userId
	};
	
	var uniqueId = 0;
	$.ajax({
		type:'POST',
		data:JSON.stringify(body),
		contentType:'application/json',
		url:'/acads/m/studentTimeTableUpcomingHomeTodo',
		success:function(response){
			response.forEach(function(data) {
				var divId = "upcomingSession"+uniqueId;
				
				if(document.getElementById(divId) == "undefined" || document.getElementById(divId) == null){
					$('#sessionCardBody').append('<div id="'+divId+'">');
					$('#'+divId).append('<div class="d-flex align-items-center">');
					$('#'+divId).find('.d-flex').append('<div class="p-2">');
					$('#'+divId).find('.p-2').append('<h6>'+ data.subject+'</h6></br>');
					$('#'+divId).find('.p-2').append('<small class="text-muted"> Date: '+ data.date+'</small></br>');
					$('#'+divId).find('.p-2').append('<small class="text-muted"> Time: '+ data.startTime+'</small></br>');
					$('#'+divId).find('.p-2').append('</div>');
					$('#'+divId).find('.d-flex').append('</div>');
					$('#'+divId).append('</div>');
					uniqueId = uniqueId + 1;
				}
				
			});
			
			
			
		}
	});
}
</script>