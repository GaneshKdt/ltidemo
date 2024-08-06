<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>LTI CONSUMER FORM</title>
</head>
<body>

<h2>LTI CONSUMER FORM</h2>
<form:form method="post" name="order" action="/ltidemo/postToProvider" modelAttribute="contactForm">
	<table>
	<tr>
		<th>Key</th>
		<th>Value</th>
	</tr>
	<c:forEach items="${contactForm.contactMap}" var="contactMap" varStatus="status">
		<tr>
			<td>${contactMap.key}</td>
			<td><input name="contactMap['${contactMap.key}']" value="${contactMap.value}"/></td>
		</tr>
	</c:forEach>
</table>	
<br/>

<input type="submit" value="Submit" />
	
</form:form>
</body>
</html>