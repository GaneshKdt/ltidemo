<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<body>
		<div class="outer">
			<div class="inner">
				<div class="loader"></div>
				<h2>Error</h2>
				<p>There was an error redirecting you to the test page. Please click the button to try again.</p>
				<button onClick="redirect()">Try again.</button>
				<br><br><br>
				<c:if test="${ showError == 'true' }">
					Error : ${ error }
				</c:if>
			</div>
		</div>
		<script language=javascript>
			function redirect(){
			  window.location = "http://studentzone-ngasce-nmims.edu/ltidemo/mettl_sso_student?showError=true&joinKey=${ joinKey }";
			}
		</script>
	</body>
</html>