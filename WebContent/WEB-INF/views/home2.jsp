<!DOCTYPE html>
<html lang="en">
<head>
  <title>DashBoard Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="headTag.jsp"></jsp:include>
  
</head>
<body>
<%
	String role = (String)request.getSession().getAttribute("role");
%>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">
  <div class="row">
  	
    <div class="col-2">
    	<jsp:include page="sidedrawer.jsp">
    		<jsp:param value="<%=role %>" name="role" />
    	</jsp:include>
    </div>
    <div class="col-5">
    	<jsp:include page="homeTimeline.jsp"></jsp:include>
    </div>
    
    <div class="col-3">  
    	<jsp:include page="right-sidebar2.jsp"></jsp:include>
	</div>
    
    <div class="col-2">
    	<jsp:include page="onlinePeople2.jsp"></jsp:include>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp">
		<jsp:param value=" " name="title" />
	</jsp:include>
</body>
</html>