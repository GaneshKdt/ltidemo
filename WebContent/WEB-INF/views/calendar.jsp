<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html class="bootstrap-layout">
 <jsp:include page="headTag.jsp">
	<jsp:param value="Upcoming" name="title"/>
	</jsp:include>
    <style>
	
	.sidenav {
	    height: 100%;
	    width: 0;
	    position: fixed;
	    z-index: 1;
	    top: 0;
	    right: 0;
	    overflow-x: hidden;
	    transition: 0.5s;
	    padding-top: 60px;
	}
	
	.sidenav .closebtn {
	    position: absolute;
	    top: 0;
	    right: 25px;
	    font-size: 36px;
	    margin-left: 50px;
	}
	
    </style>
<body>
  <jsp:include page="header.jsp"></jsp:include> 

  

  <!-- Content -->

    <div class="container-fluid">
    	<div class="row">
    		<div class="col-2">
    			<jsp:include page="sidedrawer.jsp"></jsp:include>
    		</div>
    		<div class="col-8">
    			<!-- Calendar -->
      			<div id="calendar" class="p-4 bg-white rounded"></div>
    		</div>
    	</div>
    </div>
    
  
  <!-- Event Details Sidebar-->
  <div class="sidenav sidebar-light bg-white" id="sidebar-calendar" data-position="right" data-visible="none" style="transition:0.2s">
    <div class="d-flex flex-row-reverse bd-highlight">
      <a href="#" class="text-muted" data-toggle="sidebar" data-target="#sidebar-calendar" onclick="closeNav()"><i class="material-icons pull-xs-right">close</i></a>
    </div>
    <div class="content p-1"></div>
  </div>
  
  
  

  <!-- // Event Details Sidebar-->

 
  <jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>

    <script src="assets/examples/js/fullcalendar.js"></script> 
    <script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("sidebar-calendar").style.width = "0";
}
</script>
</body>


</html>