<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
</jsp:include>

</head>
<body>

<%
ArrayList<String> subjects = (ArrayList<String>)session.getAttribute("currentSemSubjects");
int noOfSubjects = subjects.size();

%>
<h4>Subject</h4>
<c:forEach var="sub" items="${currentSemSubjects }">
	<c:out value="${sub }"></c:out>
</c:forEach>

</body>
</html>