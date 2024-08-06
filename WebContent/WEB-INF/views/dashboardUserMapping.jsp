<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.net.URLEncoder"%>

<jsp:useBean id="dateValue" class="java.util.Date" />

<%
	String roleCheck = (String)session.getAttribute("role");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/multiple-select.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui_1.12.1_.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
	
	<script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat Support</title>

<style type="text/css">
table {
  counter-reset: section;
}

.count:before {
  counter-increment: section;
  content: counter(section);
}  

.select_multiple input {
	height: unset !important;
	width: unset !important;
}
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
	margin: 10px;
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
.trigger {
	position: relative;
    position: relative;
    margin: 3px 5px 3px 0; 
    padding: 3px 20px 3px 5px;
    border: 1px solid #e8e0e0;
    font-size: 13px;
    max-width: 100%;
    border-radius: 3px;
    background-color: #f9f9f9;  
}  

.preloader {
    display: block;
    margin: 70px;
    width: 50px;
	height: 50px;   
    -webkit-animation: rotate 0.8s infinite linear !important;
    -moz-animation: rotate 0.8s infinite linear !important;
    animation: rotate 0.8s infinite linear !important;
    border:  5px solid #007bff;
    border-right-color: transparent;
    border-radius: 50%;
    position:relative;
}

@-webkit-keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}

@-moz-keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}
@keyframes rotate {
    0%    { transform: rotate(0deg); }
    100%  { transform: rotate(360deg); }
}

tr:hover {
	background-color: #EAEAEA;
}

btn{
	border-radius: 4px; 
	margin-top:5px;
}
</style>

<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>

<script type="text/javascript" src="assets/js/newReaction.js"></script>

</head>

<body>
	
	<%@ include file="header.jsp" %>
    <br><br><br>
	<div class="container-fluid container-body">

		<div class="row">

			<div class="col-lg-2 col-md-3 col-sm-4">
				<jsp:include page="sidedrawer.jsp">
					<jsp:param value="<%=role%>" name="role" />
				</jsp:include>
			</div>

			<div class="col-lg-8 col-md-5 col-sm-8 pl-5">

				<div class="card mb-2">
				
					<div class="card-body createPostFormDiv">
					
						<div id='chat' style="text-align: center;">
						
								<div style='margin-top:30px; height: 80%'>
								
<!-- 								for filter data           -->

									<section class="content-container login">
										<div class="container-fluid customTheme">
											<div class="row">
												<legend>Search Student Batch Mapping</legend>
											</div>
										
								
											<form:form modelAttribute="mappingBean" method="post"
												action="maappedUserList">
								
												<fieldset>
													<div class="panel-body">
														<div class="col-md-6 column">
															<div class="form-group">
																<label for="consumerType">Consumer Type</label>
																<form:select id="consumerType" path="consumerType"
																	name="consumerType" class="form-control" required="required">
																	<option disabled selected value="">Select Consumer
																		Type</option>
																	<c:forEach var="consumerType" items="${consumerType}">
																		<option value="<c:out value="${consumerType.name}"/>">
																			<c:out value="${consumerType.name}" />
																		</option>
																	</c:forEach>
																</form:select>
															</div>


							<div class="form-group">
								<label for="prgmStructApplicable">Program Structure</label>
								<form:select id="prgmStructApplicable"
									path="prgmStructApplicable" required="required"
									class="form-control"
									itemValue="${DashboardBean.prgmStructApplicable}">
									<option disabled selected value="">Select Program
										Structure</option>
								</form:select>
							</div>

							<div class="form-group">
								<label for="program">Program Name</label>
								<form:select id="program" path="program" type="text"
									required="required" class="form-control"
									itemValue="${DashboardBean.program}">
									<option disabled selected value="">Select Program Name</option>
								</form:select>
							</div>


							<div class="form-group">
								<label for="sem">Select Semester</label>
								<form:select id="sem" path="sem"
									class="form-control batchChange" required="required"
									itemValue="${DashboardBean.sem}">
									<form:option value="">Select Semester</form:option>
									<%-- <form:options items="${semesterList}" /> --%>
									<form:option value="1">1</form:option>
									<form:option value="2">2</form:option>
									<form:option value="3">3</form:option>
									<form:option value="4">4</form:option>
									<form:option value="4">MBA WX 3 and 4 Electives</form:option>
									<form:option value="5">5</form:option>
								</form:select>
							</div>

							<div class="form-group">
								<label for="acadYear">Select Acad Year</label>
								<form:select id="acadYear" path="acadYear"
									class="form-control batchChange" required="required"
									itemValue="${DashboardBean.acadYear}">
									<form:option value="">Select Academic Year</form:option>
									<form:options items="${yearList}" />
								</form:select>
							</div>

							<div class="form-group">
								<label for="acadMonth">Select Acad Month</label>
								<form:select id="acadMonth" path="acadMonth"
									class="form-control batchChange" required="required"
									itemValue="${DashboardBean.acadMonth}">
									<form:option value="">Select Academic Month</form:option>
									<form:options items="${monthList }" />
								</form:select>
							</div>

							<div class="form-group">
								<label for="batch">Select Batch</label> <select id="batchId"
									data-id="batchId" name="batchId" type="text" placeholder="Batch"
									class="form-control" required="required"
									itemValue="${DashboardBean.batchId}">
									<option value="">Select Batch</option>
									<%-- <c:forEach var="batch" items="${batchList }">
								<option value="${batch.id }">
									<c:out value="${batch.name }"></c:out>
								</option>
							</c:forEach> --%>
								</select>
							</div>
							
							<div class="form-group">
								<label for="subject">Select Subject</label> <select id="subject"
									data-id="subject" name="subject"
									class="form-control" required="required"
									itemValue="${DashboardBean.subject}">
									<option value="">Select Subject</option>									
								</select>
							</div>
							
							<div class="form-group">								
								<label class="control-label" for="isResit">Include Resit Students?</label>
								<input class="form-control" style="height:30px;width:30px;" type="checkbox" id="isResit" name="isResit" value="No" onchange="checkCheckbox()"/>
							</div>

							<!-- <div class="select_multiple">
											<label for="student">Select Students</label> <select
												id="selectStudent" multiple="multiple" name="userId"
												placeholder="Select Students">
											</select>
										</div> -->
							<div class="form-group">
								<label class="control-label" for="submit"></label>
								<button id="submit" name="submit"
									class="btn btn-large btn-primary"
									formaction="/ltidemo/mappedUserList">Search</button>
								<button id="reset" type="reset" class="btn btn-danger"
									type="reset">Reset</button>
								<button id="cancel" name="cancel" class="btn btn-danger"
									formaction="home" formnovalidate="formnovalidate">Cancel</button>
							</div>
						</div>
					</div>
				</fieldset>
			</form:form>
			<div class="clearfix"></div>
			<br>
			 					
<%-- 			<c:set var = "UserName" scope = "session" value = '${sessionScope["userId"]}'/> --%>
			<c:choose>
                 <c:when test="${rowCount > 0}">
					<div class="sz-content-wrapper examsPage">
						<div class="sz-content">
							<h2>
								&nbsp;Student Batch Mapping Records <font size="2px">
									(${rowCount} Records Found)&nbsp; 
								</font>
							</h2>
							   
							<div class="panel-body">
								
								<textarea id="message"  rows="4" cols="50"></textarea>
  								  <input type="submit" onclick="custom()"  value="SEND">	
								<div class="panel-content-wrapper">
									<div class="table-responsive">
									<p align="left"><button class="someButton">Confirm Selection</button></p>
										<table class="table table-striped table-hover"
											style="font-size: 12px" id="searchStudentBatchMapping">
											<thead>
												<tr> 
												 <th> <input type="checkbox" id="selectAll" /> All</th>
 												  <th>Sr. No.</th>
													<th>SAP ID</th>
													<th>Student Name</th>													
													<th>Batch Name</th>																																							
													<th>Subject Name</th>
													
													<th>Email-Id</th>
<!-- 													<th>Image Url</th> -->
													<th>Phone Number</th>
												</tr>
											</thead>
											<tbody>
													
												<c:forEach var="bean" items="${userList }"
													varStatus="status">
													
 													<tr class="myDiv"  id="${status.index}"> 
														
														<td><a><input type="checkbox"  name="checkbox" value="${bean.userId }"/></a></td>
<!-- 														<td class="count"></td> -->
														<td><label>${status.count}</label></td>
<%-- 													<td>><c:out value="${bean.count}" /></td>  --%>
														<td><a href="/ltidemo/fullViewChat?userId=${bean.userId }" target="_blank"><c:out value="${bean.userId }"></c:out></a></td>
														<td><c:out value="${bean.studentName }"></c:out>
														<td><c:out value="${bean.name }"></c:out>
														<td><c:out value="${bean.subject }"></c:out>
														
														<td><c:out value="${bean.emailId }"></c:out>
<%-- 														<td><a href='${bean.imageUrl }' target='_blank'><c:out value="${bean.imageUrl }"></c:out></a> --%>
														<td><c:out value="${bean.mobile }"></c:out>
														
													</tr>
													
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:when>

			</c:choose>

		</div>
	</section>
	</div>
						</div>
					</div>
				</div>
	
			</div>
			
			
			<div class="col-lg-2  pl-5 ml-auto"></div>
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
					<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui_1.12.1_.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/resources_2015/js/vendor/dataTables.bootstrap.js"></script> --%>
	<script src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>

	<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<script
		src="https://unpkg.com/multiple-select@1.3.1/dist/multiple-select.min.js"></script>

	<!-- Get student list by batchId Start -->
<!-- 	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
	<script type="text/javascript">

		
		
		var arrays=[]; 
		$(document).ready(function() {
		$('.someButton').click(function() {
  		//var arrays =[];
		var checkboxes = document.querySelectorAll('input[name=checkbox]:checked');
		for (var i = 0; i < checkboxes.length; i++) {
			arrays.push(checkboxes[i].value)  
		}
 		
 		//console.log("inside a function",arrays);
	
		    });
		});
		
///////////////////////////////////////////for custom messages
	function custom()
 	{ 
		var flag = false ;
 		var message = $('textarea#message').val();
		var listOfSapId = arrays;
		//console.log(listOfSapId);
		var n=Math.ceil(listOfSapId.length/50);
		//console.log(n);
		var start = 0;
		var end = 0;
		if(message !== "" && message.trim() !== "")
 			{
 				flag=true;
 				
 			}	
		
		if(flag===true)
		{
		for(var i=0;i<=n-1;i++)
		{ 
			if(i==0)
			 start=(i*50);
			else
				 start=end;
			 
			if(i==(n-1))
				 end=listOfSapId.length;
			else
				 end=start+50;
			 
			var limitSapId=listOfSapId.slice(start,end);
			brodcastMsg(limitSapId,message);
		}
	}
 		else if(flag===false)
 		{
 			alert("please write your message !!!");

 		}
	}

	
///////////////////////////////////////////	for brodcast messages
	function brodcastMsg(limitSapId,message)
		{
 			//var arrays1=limitSapId;
			//var userId=arrays;
			//console.log("for brodcast",userId);
			//console.log("Suraj",message);
			var d = {
 				'userNames' : limitSapId,
					'messageObject' :  {
						"message":message
					}
				}
			//console.log(JSON.stringify(d));
			
 			//console.log("${userId}");
 
			$.ajax({
				type:"POST",
 				url: "https://apps.applozic.com/rest/ws/message/sendall",
				data : JSON.stringify(d), 
 				contentType:'application/json',
				headers: {
			        'Authorization' : "Basic YWRtaW5ib3Q6YWRtaW5ib3Q=",
			        'Application-Key' : '3188af863b45ee48f80292c154e498a5f',
			        'Content-Type' : 'application/json',
			        'Of-User-Id' :'${userId}'
			    },
				success	:	function(data){
					//console.log("Suraj Sharma success");
					if(data.status == "success") {
						//console.log(JSON.stringify(data));
						alert("Successfully send messsage to Student")
					}
				},
				error: function(e) {   
					//console.log("Error",e);
					
					alert("Please Refresh The Page.");
				}
			})

		 } 	

// 			 for select all	

		$('#selectAll').click(function (e) {
		    $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
		});
		
		function checkCheckbox(){
			if($("#isResit").prop("checked")){
				$("#isResit").val("Yes");
			} else{
				$("#isResit").val("No");
			}			
		}

		$(document)
				.ready(
						function() {
							
							$("#isResit").val("No");
							var table = $('.table').DataTable( {
								"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
						        initComplete: function () {
						        	 this.api().columns().every( function () {
						               var column = this;
						                var headerText = $(column.header()).text();
						                //console.log("header :"+headerText);						         						              						            						             
						            } );
						        } 
						    });
							 
						    $('.table tbody').on( 'click', 'tr', function () {
						        if ( $(this).hasClass('selected') ) {
						            $(this).removeClass('selected');
						        }
						        else {
						            table.$('tr.selected').removeClass('selected');
						            $(this).addClass('selected');
						        }
						    } );
 							
							
					/////////////////////////////////////////////////////
					/// data loading based on selection
							
					$('#consumerType').on('change', function(){
						
						
						let id = $(this).attr('data-id');
						
						
						let options = "<option>Loading... </option>";
						$('#prgmStructApplicable').html(options);
						$('#program').html(options);
						
						
						 
						var data = {
								id:this.value
						}
						//console.log(this.value)
						
						//console.log("===================> data id : " + id);
						$.ajax({
							type : "POST",
							contentType : "application/json",
							url : "/exam/admin/getValueByConsumerType",   
							data : JSON.stringify(data),
							success : function(data) {
								//console.log("SUCCESS Program Structure: ", data.programStructureData);
								//console.log("SUCCESS Program: ", data.programData);
								
								var programData = data.programData;
								var programStructureData = data.programStructureData;
								
								
								options = "";
								
								
								//Data Insert For Program List
								//Start
								for(let i=0;i < programData.length;i++){
									
									options = options + "<option value='" + programData[i].name + "'> " + programData[i].name + " </option>";
								}
								
								
								//console.log("==========> options\n" + options);
								$('#program').html(
										" <option disabled selected value=''> Select Program Name</option> " + options
								);
								//End
								options = ""; 
								
								//Data Insert For Program Structure List
								//Start
								for(let i=0;i < programStructureData.length;i++){
									
									options = options + "<option value='" + programStructureData[i].name + "'> " + programStructureData[i].name + " </option>";
								}
								
								
								//console.log("==========> options\n" + options);
								$('#prgmStructApplicable').html(
										" <option disabled selected value=''> Select Program Structure </option> " + options
								);
								//End			
							},
							error : function(e) {
								
								alert("Please Refresh The Page.")
								
								//console.log("ERROR: ", e);
								
							}
						});
												
					});
						
					///////////////////////////////////////////////////////
						
						
					$('#prgmStructApplicable').on('change', function(){
						
						
						let id = $(this).attr('data-id');
						
						
						let options = "<option>Loading... </option>";
						$('#program').html(options);
						
						
						 
						var data = {
								programStructureId:this.value,
								consumerTypeId:$('#consumerType').val()
						}
						//console.log(this.value)
						
						//console.log("===================> data id : " + $('#consumerType').val());
						$.ajax({
							type : "POST",
							contentType : "application/json",
							url : "/exam/admin/getValueByProgramStructure",   
							data : JSON.stringify(data),
							success : function(data) {
								
								//console.log("SUCCESS: ", data.programData);
								var programData = data.programData;
								
								
								options = "";
								
								
								//Data Insert For Program List
								//Start
								for(let i=0;i < programData.length;i++){
								
									options = options + "<option value='" + programData[i].name + "'> " + programData[i].name + " </option>";
								}
								
								
								//console.log("==========> options\n" + options);
								$('#program').html(
										" <option disabled selected value=''> Select Program Structure </option> " + options
								);
								//End
											
							},
							error : function(e) {
								
								alert("Please Refresh The Page.")
								
								//console.log("ERROR: ", e);
								
							}
						});
												
					});
					 

					/////////////////////////////////////////////////////////////

							//Get Batches by Year/Month

							$('.batchChange')
									.on(
											'change',
											function() {

												let options = "<option>Loading... </option>";
												$('#batchId').html(options);
												$("#subject").html("<option disabled selected value=''> Select Subject </option>");
												var data = {
													consumerTypeId : $('#consumerType').val(),
													program_structure : $('#prgmStructApplicable').val(),
													programId : $('#program').val(),
													sem : $('#sem').val(),
													acadYear : $('#acadYear')
															.val(),
													acadMonth : $('#acadMonth')
															.val()
												}
											//	console.log('Request data in : ')
												//console.log(data)
												$
														.ajax({
															type : "POST",
															contentType : "application/json",
															url : "/exam/admin/getBatchesByMasterKey",
															data : JSON
																	.stringify(data),
															success : function(
																	data) {

																var batchData = data.batchData;

																options = "";
																if (batchData.length <= 0) {
																	$(
																			'#batchId')
																			.html(" <option disabled selected value=''> No Batch Available </option> ");
																} else {
																	for (let i = 0; i < batchData.length; i++) {
																		options = options
																				+ "<option value='" + batchData[i].id + "'> "
																				+ batchData[i].name
																				+ " </option>";
																	}
																	$(
																			'#batchId')
																			.html(
																					" <option disabled selected value=''> Select Batch </option> "
																							+ options);
																}
															},

															error : function(e) {
																alert("Please Refresh The Page.")
// 																console
// 																		.log(
// 																				"ERROR: ",
// 																				e);
// 																display(e);
															}
														});
											});
							
							$("#batchId").on("change",function(){
								let options = "<option>Loading... </option>";
								$('#subject').html(options);								

								$.ajax({
											type : "GET",											
											url : "/exam/admin/getSubjectListByBatchId?id="+$("#batchId").val(),											
											success : function(
													data) {
												
												
												var subjectData = data;
												//console.log(data);
												options = "";
												if (subjectData.length <= 0) {
													$(
															'#subject')
															.html(" <option disabled selected value=''> No Subject Available </option> ")
												} else {
													for (let i = 0; i < subjectData.length; i++) {
														options = options
																+ "<option value='" + subjectData[i].prgm_sem_subj_id + "'> "
																+ subjectData[i].subject
																+ " </option>";
													}
													$(
															'#subject')
															.html(
																	" <option disabled selected value=''> Select Subject </option> "
																			+ options);
												}
											},

											error : function(e) {
												alert("Please Refresh The Page.")
// 												console
// 														.log(
// 																"ERROR: ",
// 																e);
												
											}
										});
							});

							//Get Students For Batch Insert --> START	

							/* $('#batchId')
									.on(
											'change',
											function() {
												let id = $(this)
														.attr('data-id');

												let options = "<option>Loading... </option>";
												$('#selectStudent').html(
														options);

												var data = {
													batchId : this.value,
													sem : $('#sem').val(),
													acadYear : $('#acadYear')
															.val(),
													acadMonth : $('#acadMonth')
															.val()
												}

												$
														.ajax({
															type : "POST",
															contentType : "application/json",
															url : "getMBAStudentsList",
															data : JSON
																	.stringify(data),
															success : function(
																	data) {

																var studentsData = data.studentList;

																options = "";
																//Data Insert For Subjects List

																for (let i = 0; i < studentsData.length; i++) {

																	options = options
																			+ "<option value='" + studentsData[i].sapid + "'> "
																			+ studentsData[i].sapid
																			+ " </option>";
																}

																$(
																		'#selectStudent')
																		.html(
																				options);
																$(
																		'#selectStudent')
																		.multipleSelect(
																				'refresh');
															},
															error : function(e) {
																alert("Please Refresh The Page.")
																console
																		.log(
																				"ERROR: ",
																				e);
																
															}
														});
											}) */
											
							<!-- Get student list by batchId End -->
						});
	</script>

</body>

</html>