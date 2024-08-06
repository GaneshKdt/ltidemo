<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Groups</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title" />
</jsp:include>

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
		<div class="col-lg-2 col-md-3 col-sm-4 ml0 " > 
			<jsp:include page="sidedrawer.jsp">
				<jsp:param value="<%=role %>" name="role" />
			</jsp:include>
		</div>
		
		<div class="col-lg-8 col-md-9 col-sm-10">
		<%@ include file="errorMessage.jsp"%>
			<form:form action="addGroupsName" method="post" modelAttribute="groups">
			
				<div class="row">
						<div class="form-group col-md-3">
							<label for="consumerType">Consumer Type</label>
							<select data-id="consumerTypeDataId" id="consumerTypeId" name="consumerTypeId"  class="selectConsumerType form-control" required="required">
								<option disabled selected value="">Select Consumer Type</option>
								<c:forEach var="consumerType" items="${consumerType}">
					               <option value="<c:out value="${consumerType.id}"/>">
					                 <c:out value="${consumerType.name}"/>
					               </option>
					           </c:forEach>
							</select>
						</div>
						
						<div class="form-group col-md-3">
							<label for="programStructure">Program Structure</label>
							<select data-id="programStructureDataId" id="programStructureId" name="programStructureId" class="selectProgramStructure form-control" required="required">
								<option disabled selected value="">Select Program Structure</option>
				
							</select>
						</div> 
							
						<div class="form-group col-md-3">
							<label for="Program">Program</label>
							<select data-id="programDataId" id="programId" name="programId" class="selectProgram form-control" required="required">
								<option disabled selected value="">Select Program</option>
				
							</select>
						</div>
						
						<div class="form-group col-md-3">
							<label for="subject">Subject</label>
								<select  data-id="subjectId" id="program_sem_subject_id" name="program_sem_subject_id" class="selectSubject form-control" required="required">
									<option disabled selected value="">Select Subject</option>
								</select>
						</div>
					</div>
			
			
				<div class="form-group">
					<label for="groupName">Group Name</label>
					<form:input type="text" class="form-control" path="groupName" name="groupName" placeholder="Enter Group Name..." required="required"/>
			  	</div>
			   	<div class="form-group">
			    	<label for="groupDescription">Group Description</label>
			    	<form:textarea class="form-control" name="groupDescription" path="groupDescription" rows="3" placeholder="Enter Group Description..." required="required"/>
			   	</div>
			    <button type="submit" class="btn btn-primary">Add Group</button>		  
			</form:form>
			<br><br>
			<table id="dataTable" class="table table-striped table-bordered" style="width:100%">
				<thead>
		            <tr>
		                <th>id</th>
		                <th>Group Name</th>
		                <th>Group Member</th>
		                <th>Action</th>
		                <td>Delete</td>
		                
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="bean" items="${groupList}" varStatus="status">
		        	<tr>
						<td><c:out value="${status.count}" /></td>
						<td><c:out value="${bean.groupName}" /></td>
						<td><c:out value="${bean.groupDescription }" /></td>
						<td><a href="addRemoveMember?id=${bean.id}&timeBound=${bean.timeBoundId}">
							<i class="fa-solid fa-user-plus"></i> Add / <i class="fa-solid fa-user-minus"></i> Remove</a>
						</td>
						<td><a href="deleteGroup?id=${bean.id}"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
					</tr>
					</c:forEach>
		        </tbody>
		        
			</table>
		</div>
		
	</div>
	</div>
	
<jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
</jsp:include>

<jsp:include page="ProgramSemSubjectDropdownsFile.jsp"></jsp:include>
<script>
	$(document).ready(function() {
	    $('#dataTable').DataTable();
	} );
</script>

</body>
</html>