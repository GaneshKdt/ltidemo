<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE class="bootstrap-layout">
<html>
<jsp:include page="headTag.jsp">
	<jsp:param value="Progress" name="title" />
</jsp:include>

<body class="layout-container ls-top-navbar si-l3-md-up">
	 <jsp:include page="header.jsp"></jsp:include> 


	<!-- Content -->
	
		<div class="container-fluid container-body">
			<div class="row">
				<div class="col-md-2">
					<jsp:include page="sidedrawer.jsp"></jsp:include>
				</div>
				<div class="col-md-10">
					<div class="col-md-12 ">
					<div class="card">
						<div class="card-body">
							<div class="media">
								<div class="media-body">
									<p class="card-subtitle">Assignments</p>
									<h4 class="card-title">
										<a href="#">Business Strategies</a>
									</h4>

								</div>   
								
								<div class="d-flex flex-row bd-highlight" style="font-size: 13px; color: #99acbf;">
									<div class="p-2 bd-highlight">
										New <br>Quizzes
									</div>
									<div class="p-2 bd-highlight">
										New <br>Assignments
									</div>
								</div>

							</div>

						</div>

					</div>


				</div>
				<div class="col-md-12">
                    <br>  
					<h5>Tabs Default</h5>
<!-- 					<div class="card">
						<div class="card-body"> -->
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link todo-tab active" href="#one" data-toggle="tab">To Do</a></li>
								<li class="nav-item"><a class="nav-link todo-tab" href="#two" data-toggle="tab">Finished</a></li>
							</ul>
							<div class="tab-content p-a-1 m-b-1" >
								<div class="tab-pane active" id="one">
									<div class="py-3">
										<h6>Due this week</h6>
										<small class="text-muted">Through Mon, Dec 3</small>
									</div>
									<div class="card card-stats-primary">
										<div class="card-body">
											<div class="media">
												<div class="mr-3">
													<i class="material-icons text-muted">dashboard</i>
												</div>
												<div class="media-body media-left">
													<div>Project Submission</div>
													<small class="card-subtitle"><a
														href="view-course.html">Business Analytics</a></small>
												</div>
												<div class="media-body media-middle ">
													<div class="card-subtitle">Dew in 8 Days</div>
													<small class="card-subtitle"> 5.45 pm </small>
												</div>
												<div class="media-right">
													<span class="badge badge-primary">New</span>
												</div>
											</div>
										</div>
									</div>
									
															
									
									
									<!-- end -->
									<div class="py-3">
										<h6>Due next week</h6>
										<small class="text-muted">Through Sat, Dec 8</small>
									</div>
									<div class="card card-stats-primary">
										<div class="card-body">
											<div class="media">
												<div class="mr-3">
													<i class="material-icons text-muted">assignment_turned_in</i>
												</div>
												<div class="media-body media-left">
													<div>Assignment Submission</div>
													<small class="card-subtitle"><a
														href="view-course.html">Organizational leadership</a></small>
												</div>
												<div class="media-body media-middle ">
													<div class="card-subtitle">Dew in 2 Days</div>
													<small class="card-subtitle"> 9.35 am </small>
												</div>
												<div class="media-right">
													<span class="badge badge-primary">New</span>
												</div>
											</div>
										</div>
									</div>


									<div class="py-3">
										<h6>Due after next week</h6>
									</div>
									<div class="card card-stats-primary">
										<div class="card-body">
											<div class="media">
												<div class="mr-3">
													<i class="material-icons text-muted">notes</i>
												</div>
												<div class="media-body media-left">
													<div>Exam Registration</div>
													<small class="card-subtitle"><a
														href="view-course.html">Business Strategies</a></small>
												</div>
												<div class="media-body media-middle ">
													<div class="card-subtitle">Dew in 5 Days</div>
													<small class="card-subtitle"> 5.45 pm </small>
												</div>
												<div class="media-right">
													<span class="badge badge-primary">New</span>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								
								<div class="tab-pane" id="two" style="background-color: white;">
									<div class="table-responsive">
										<!-- Content from old contentList Start -->
										<table class="table table-hover">
											<thead>
												<tr>
													<th><small>Today is Nov 15, 2018</small></th>
													<th><small>Finished Date</small></th>
													<th><small>Grade</small></th>
													<th><small>Finished</small></th>
												</tr>
											</thead>

											<tbody>
												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Project Submission</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Dec 10,2017</div>
															<small class="text-muted"> 12.00 am </small>
														</div>
													</td>
													<td><strong>1</strong>/2</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Assignment Submission 1</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Nov 20,2018</div>
															<small class="text-muted"> 5.45 pm </small>
														</div>
													</td>
													<td><strong>2</strong>/3</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Assignment Submission 2</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Jan 13,2018</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												 <tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Exam Registration</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">April 10,2017</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Test</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Feb 06,2017</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>
												</tr>
												<!-- <tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Project Submission</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">June 10,2017</div>
															<small class="text-muted"> 12.00 am </small>
														</div>
													</td>
													<td><strong>1</strong>/2</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Assignment Submission</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Dec 10,2017</div>
															<small class="text-muted"> 5.45 pm </small>
														</div>
													</td>
													<td><strong>2</strong>/3</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Exam Registration</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Dec 10,2017</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Exam Registration</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td>
														<div class="media-body  ">
															<div class="text-muted">Dew in 5 Days</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr>

												<tr style="display: table-row;">
													<td class="px-4">
														<div class="media-left media-middle">
															<i class="material-icons text-muted">credit_card</i>
														</div>
														<div class="media-body media-left">
															<div>
																<dt>Exam Registration</dt>
															</div>
															<small class="card-subtitle"><a
																href="view-course.html">Business Strategies</a></small>
														</div>
													</td>
													<td class="px-4">
														<div class="media-body  ">
															<div class="text-muted">Dew in 5 Days</div>
															<small class="text-muted"> 7.00 pm </small>
														</div>
													</td>
													<td><strong>3</strong>/5</td>
													<td><i class="material-icons" style="color: #66BB6A">check_circle</i></td>

												</tr> -->


											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				</div>
<!-- 			</div>

		</div>
 -->
	<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>

</body>

<script type="text/javascript">
	
		

	var userId="${userId}";
	getSessions(userId);
				

 
		
function getSessions(userId){
	var userId="${userId}";
	var body = {
			'sapId' : userId
	};
	alert(body);
	var uniqueId = 0;
	$.ajax({
		type:'POST',
		data:JSON.stringify(body),
		contentType:'application/json',
		url:'/ltidemo/StudentTodo',
		success:function(response){
			 console.log(response.currentSemAssignmentFilesList);
			
		}
		
	});
}

</script>


</html>