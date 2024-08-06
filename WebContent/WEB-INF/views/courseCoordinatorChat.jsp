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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat Support</title>

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
    margin: 50px;
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
						
							<table class="table table-striped">
								<thead>
									<tr>
										<td>User</td>
										<td>Subject</td>
										<td>Semester</td>
										<td>Specialization Type</td>
										<td>Chat Group</td>
										<td>Switch chat</td>
									</tr>
								</thead>
								<tbody>
									<c:set var="count" value='${ 0 }'></c:set>
									<c:forEach var='details' items='${ courseCoordinators }'>
										<c:set var="count" value='${ count+1 }'></c:set>
										<tr style="border-bottom: 1px solid #E8E8E8; padding: 5px;" >
											<td style="text-transform: capitalize; vertical-align: middle;">${ details.userId }</td>
											
											<td>
												<c:forEach var='coordinatorDetials' items="${ coordinatorDetials }">
													<c:if test="${ coordinatorDetials.userId == details.userId }">
														<p>${ coordinatorDetials.subject }<br></p>
													</c:if>
												</c:forEach>
											</td>
											
											<td>
												<c:forEach var='coordinatorDetials' items="${ coordinatorDetials }">
													<c:if test="${ coordinatorDetials.userId == details.userId }">
														<p>${ coordinatorDetials.sem }<br></p>
													</c:if>
												</c:forEach>
											</td>
											
											<td>
												<c:forEach var='coordinatorDetials' items="${ coordinatorDetials }">
													<c:if test="${ coordinatorDetials.userId == details.userId }">
														<c:choose>
															<c:when test="${ empty coordinatorDetials.specializationType }">
																<p>-<br></p>
															</c:when>
															<c:otherwise>
																<p>${ coordinatorDetials.specializationType }<br></p>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</td>
											
											<td>
												<c:forEach var='coordinatorDetials' items="${ coordinatorDetials }">
													<c:if test="${ coordinatorDetials.userId == details.userId }">
														<p>${ coordinatorDetials.groupName }<br></p>
													</c:if>
												</c:forEach>
											</td>
											
											<td style="vertical-align: middle;">
											<button class='btn btn-primary' type="button" id="switchUser_${ count }"
												onClick=" verifyUserExists('${ details.userId }', 'switchUser_${ count }')">
												Switch <i class="fa-solid fa-rotate"></i>
											</button>
											</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
	
			</div>
			
			
			<div class="col-lg-2  pl-5 ml-auto"></div>
		</div>

	</div>

	<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>
	
	<script type="text/javascript">

//--------------- Applozic chat script ---------------------
	
	function verifyUserExists(userId, switchUser) {

		$('#chat').find(".btn").attr('class', 'btn btn-primary');
		$('#'+switchUser).attr('class', 'btn btn-success');
		
		$.ajax({
			type:"POST",
			url: "https://apps.applozic.com/rest/ws/user/v2/detail",
			data : JSON.stringify({
				'userIdList' : [userId]
			}), // our data object,
			contentType:'application/json',
			headers: {
		        'Authorization' : 'Basic ' + btoa('verification_bot:Newuser@123'),
		        'Application-Key' : '3188af863b45ee48f80292c154e498a5f',
		        'Content-Type' : 'application/json'
		    },
			success	:	function(data){
				console.log(data)
				if(data.status == "success") {
					if(data.response.length > 0) {
						signInToApplozic(userId)
					}
				}
			},
			error: function() {   
				
			}
		})
	}
	
	function signInToApplozic(userId) {

	   (
		function(d, m){
			var s, h;       
			s = document.createElement("script");
			s.type = "text/javascript";
			s.async=true;
			s.src="https://apps.applozic.com/sidebox.app";
			h=document.getElementsByTagName('head')[0];
			h.appendChild(s);
			window.applozic=m;
			m.init=function(t){m._globals=t;}}
	   )(
			document, window.applozic || {}
	   );
		   
		window.applozic.init({
			userId: userId, 
			accessToken: userId, 
			//userId: 'NMSCEMUADMIN01', 
			//accessToken: 'NMSCEMUADMIN01',
			appId: '3188af863b45ee48f80292c154e498a5f',
			desktopNotification: true,
			notificationIconLink: "https://www.applozic.com/resources/images/applozic_icon.png",
			locShare: true,
			googleApiKey: "AIzaSyDKfWHzu9X7Z2hByeW4RRFJrD9SizOzZt4",
			autoTypeSearchEnabled : false,	// set to false if you don't want to allow sending message to user who is not in the contact list
			loadOwnContacts : true, //set to true if you want to populate your own contact list (see Step 4 for reference)
			olStatus: true,		//set to true for displaying a green dot in chat screen for users who are online
			onInit : function(response,data) {
				
				if (response === "success") {
					// login successful, perform your actions if any, for example: load contacts, getting unread message count, etc
					// calling function load contacts
					$.ajax({
						type:"POST",
						url: "/ltidemo/getContactsForChat",
						data : JSON.stringify({
							'sapId' : userId
						}), // our data object,
						contentType:'application/json',
						success	: function(data){
							console.log("Loading contacts")
							console.log(data)
							var contactsList = []
							data.forEach((contact) => {
								let newContact = {
									userId: contact.sapId, 
									displayName: contact.firstName + " " + contact.lastName +" ( "+ contact.sapId+", "+
									contact.program+", "+contact.batch+", "+contact.subject+" )",
									imageLink: contact.imageUrl,
								}
						
								if(userId != newContact.userId){
									contactsList.push(newContact)
								}
							})
							
							$applozic.fn.applozic('loadContacts', {"contacts":contactsList});
						},
						error: function() {	
							
						}
					})
					
					
				} else {
					// error in user login/register (you can hide chat button or refresh page)
				}
			},	
			
		});
	}
</script>

</body>

</html>