<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Member</title>

<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href= "css/bootstrap.css">
<link rel="stylesheet" href= "https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js" ></script>

</head>
<body>
<%
	String role = (String)request.getSession().getAttribute("role");
%>

<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid container-body" >
	<div class="row">
		<div class="col-lg-2 col-md-3 col-sm-4" > 
			<jsp:include page="sidedrawer.jsp">
				<jsp:param value="<%=role %>" name="role" />
			</jsp:include>
		</div>
		
		<div class="col-lg-8 col-md-9 col-sm-10">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		  	<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#add-member" role="tab" aria-selected="true">Add Member</a>
    		<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#remove-member" role="tab" aria-selected="false">Remove Member</a>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="add-member" role="tabpanel" aria-labelledby="nav-home-tab">
			<br>
			<%@ include file="batchGroupMemberAddErrorMessage.jsp" %>
			<%@ include file="errorMessage.jsp"%>
				
				<div class="form-group">
					<label for="groupName">Group Name</label>
					<input class="form-control" type="text" placeholder="${groupName }" readonly>
			  	</div>
				<br>
				
				<div class="card">
				  	<div class="card-body">
						<form:form modelAttribute="fileBean" method="post" 	enctype="multipart/form-data" action="addStudentsInGropsByExcel">
							<form:hidden path="id" value="${groupId }"/>
							<form:hidden path="timeBoundId" value="${timeBoundId }"/>
							<div class="row">
							<div class="col-8">
								<div class="form-group">
									<form:label for="fileData" path="fileData"> Select file</form:label>
									<form:input path="fileData" type="file" />
								</div>
							</div>
							<div class="col-2">
								<button id="submit" name="submit" class="btn btn-primary" formaction="addStudentsInGropsByExcel">Upload</button>
							</div>
							</div>
						</form:form>
				  	</div>
				</div>
				
				<br>
						
				<table class="table table-striped table-bordered" style="width:100%" id="tableAddMember">
					<thead>
			            <tr>
			                <th>Sr.No</th>
			                <th>SapId</th>
			                <th>Name</th>
			                <th>Action</th>
			                
			            </tr>
			        </thead>
			        <tbody>		        	
			        	<c:forEach var="bean" items="${newGroupMember}" varStatus="status">
			        		<tr>
			        			<td><c:out value="${status.count}" /></td>
								<td><c:out value="${bean.sapid}" /></td>
								<td><c:out value="${bean.firstName } ${bean.lastName }"></c:out> </td>
								<td><a href="addInGroup?sapId=${bean.sapid}&groupId=${bean.groupid}"><i class='fa-solid fa-user-plus'></i> Add</a></td>
			        		</tr>
			        	</c:forEach>
			        </tbody>		        
				</table>		
		  </div>
		
		  <div class="tab-pane fade" id="remove-member" role="tabpanel" aria-labelledby="nav-profile-tab">
		  	<br>
		  	<%@ include file="errorMessage.jsp"%>
		  			<div class="form-group">
						<label for="groupName">Group Name</label>
						<input class="form-control" type="text" placeholder="${groupName }" readonly>
				  	</div>
				  	<br><br>
				  	
		  		<table id="dataTable" class="table table-striped table-bordered" style="width:100%">
					<thead>
			            <tr>
			                <th>Sr.No</th>
			                <th>SapId</th>
			                <th>Name</th>
			                <th>Action</th>
			            </tr>
			        </thead>
			        <tbody>		        	
			        	<c:forEach var="bean" items="${groupMember}" varStatus="status">
			        	<tr>
							<td><c:out value="${status.count}" /></td>
							<td><c:out value="${bean.sapid}" /></td>
							<td><c:out value=""></c:out>
							<td><a href="removeFromGroup?sapId=${bean.sapid}&groupId=${bean.groupid}"><i class="fa-solid fa-user-minus"></i> Remove</a></td>
						</tr>
						</c:forEach>
			        </tbody>		        
				</table>
		  </div>
		</div>
			
		</div>
		
	</div>
	</div>
<jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
</jsp:include>
<jsp:include page="ProgramSemSubjectDropdownsFile.jsp"></jsp:include>

<script type="text/javascript">
    var dataTable = $('#dataTable').DataTable();
    var tableAddMember = $('#tableAddMember').DataTable();
</script>

<script type="text/javascript">
$(document).ready (function(){
   
    /////************* Api For get Subject list from Consumer, Program, Program Structure ************////////
    
$('.selectSubject').on('change', function(){
    	
    	let id = $(this).attr('data-id');
 		var index = 0;
 		var data = {
 				programId:$('#programId').val(),
				consumerTypeId:$('#consumerTypeId').val(),
				programStructureId:$('#programStructureId').val(),
				subject:$('#subject').val(),
				groupid:groupId
		}
		console.log(data);
 		
		 $.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/exam/getStudentListBySubjectIdForEMBA",   
				data : JSON.stringify(data),
				success : function(response) {
					console.log("SUCCESS: ", response.studentsData);
					
					var studentsData = response.studentsData;
					
					studentsData.forEach(function(item){
						if(item != "" || item != "undefined"){
						      index = index +1;
						      var name = item.firstName +' '+ item.lastName;
						     
						    var columns = [];
						    columns.push(index);
						    columns.push(item.sapid);
						    columns.push(name);
						    columns.push(`<a href="addInGroup?sapId=` +item.sapid+ `&groupId=` +groupId +`"><i class='fas fa-user-plus'></i> Add</a>`);
			      			tableAddMember.row.add(columns);
			      			
						}
					});
					
						tableAddMember.draw();
					},
					
					error : function(e) {
					alert("Please Refresh The Page.")
					console.log("ERROR: ", e);
					display(e);
				}
 		
    	});

});
    
 });
</script>

</body>
</html>