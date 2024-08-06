<html>
	<head>
		<style>
		.loader {
				border: 16px solid #f3f3f3;
				border-radius: 50%;
				border-top: 16px solid #3498db;
				width: 120px;
				height: 120px;
				-webkit-animation: spin 2s linear infinite; /* Safari */
				animation: spin 2s linear infinite;
				margin-left: auto;
				margin-right: auto;
			}

			/* Safari */
			@-webkit-keyframes spin {
				0% { -webkit-transform: rotate(0deg); }
				100% { -webkit-transform: rotate(360deg); }
			}

			@keyframes spin {
				0% { transform: rotate(0deg); }
				100% { transform: rotate(360deg); }
			}

			.outer {
				display: flex;
				align-items: center;
				width : 100%;
				height : 100%;
			}

			.inner {
				margin-left: auto;
				margin-right: auto;
			}
		</style>
	</head>

	<body onLoad = "redirect()">
		<div class="outer">
			<div class="inner">
				<div class="loader"></div>
				<h2>Please wait...</h2>
			</div>
		</div>
		<script language=javascript>
			function redirect(){
			  window.location = "${redirectURL}";
			}
		</script>
	</body>
</html>