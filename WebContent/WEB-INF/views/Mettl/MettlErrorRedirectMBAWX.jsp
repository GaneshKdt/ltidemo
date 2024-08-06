<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<body>
		<div class="outer">
			<div class="inner">
				<div class="loader"></div>
				<h2>Error</h2>
				<p>There was an error redirecting you to the test page.</p>
				<br><br><br>
				<c:if test="${ showError == 'true' }">
					Error : ${ error }
				</c:if>
			</div>
		</div>
	</body>
</html>