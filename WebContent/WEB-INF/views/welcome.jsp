<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>E-Learn</title>
</head>
<body onLoad="document.order.submit()" >

<h2>Redirecting...</h2>
<form:form  method="post" name="order" action="${launch_url }" modelAttribute="contactForm" style="display:none;">
	<table>
	<tr>
		<th>Key</th>
		<th>Value</th>
	</tr>
	<c:forEach items="${contactForm}" var="contactMap" varStatus="status">
		<tr>
			<td>${contactMap.key}</td>
			<td><input name="${contactMap.key}" value="${contactMap.value}"/></td>
		</tr>
	</c:forEach>
</table>	
<br/>

<input type="submit" value="Submit"  />
	
</form:form>
</body>
</html>