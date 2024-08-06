<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="headTag.jsp">
<jsp:param value="Dashborad" name="title"/>
</jsp:include>
	
<body>
<div class="container-fluid" >
	<jsp:include page="header.jsp"></jsp:include> 
	
	<div class="row">
		
		<div class="col-md-2">
			<jsp:include page="sidedrawer.jsp"></jsp:include>
		</div>
		<div class="col-md-8">
			<div class="card" style="background-color: transparent;border: none;">
			<h3 class="pl-4">Progress Report</h3>
				<div class="card-body">
				
				<div class="card mb-3">
					<div class="card-header" data-toggle="collapse" data-target="#passFail">
						<h5>View All PassFail Records</h5>
					</div>
					
					<div class="card-body collapse show" id="passFail">
						
						<table class="table table-hover borderless">
						    <thead>
						      <tr>
						        <th>Sr.No</th>
						        <th>Subject</th>
						        <th>Assignment</th>
						        <th>Tee</th>
						        <th>Total</th>
						        <th>PassYear</th>
						        <th>Status</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td>1</td>
						        <td>Business Economics</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						      <tr>
						        <td>1</td>
						        <td>Brand Management</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						      <tr>
						        <td>1</td>
						        <td>Business Statistics</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						      <tr>
						        <td>1</td>
						        <td>Essentials of HRM</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						      <tr>
						        <td>1</td>
						        <td>Business Management</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						      <tr>
						        <td>1</td>
						        <td>Brand Management</td>
						        <td>18</td>
						        <td>48</td>
						        <td>60</td>
						        <td>Jan-2018</td>
						        <td>Pass</td>
						      </tr>
						    </tbody>
						  </table>
						
					</div>
				</div>
				
				<div class="card mb-3">
					<div class="row py-2">
				        <div class="col-md-3 py-1">
				            <div class="card">
				                <div class="card-body">
				                    <canvas id="chDonut1"></canvas>
				                    <p class="text-center">Business Economics</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3 py-1">
				            <div class="card">
				                <div class="card-body">
				                    <canvas id="chDonut2"></canvas>
				                    <p class="text-center">Project Management</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3 py-1">
				            <div class="card">
				                <div class="card-body">
				                    <canvas id="chDonut3"></canvas>
				                    <p class="text-center">Business Finance</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3 py-1">
				            <div class="card">
				                <div class="card-body">
				                    <canvas id="chDonut4"></canvas>
				                    <p class="text-center">Brand Management</p>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="card mb-3"> 
				<div class="card-header" data-toggle="collapse" data-target="#viewAllSub">
					<h5>View Subjectwise</h5>
				</div>
				<div class="card-body collapse show" id="viewAllSub">
				
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub1">
						    Business Economics
						</div><br>
						<div class="card-deck collapse show" style="margin: 5px" id="sub1" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>72/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>15/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>33/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>120/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					<br>
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub2">
						    Brand Management
						</div><br>
						<div class="card-deck collapse show" style="margin: 5px" id="sub2" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>62/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>18/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>35/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>115/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					<br>
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub3">
						    Business Statistics
						</div><br>
						<div class="card-deck collapse" style="margin: 5px" id="sub3" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>62/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>18/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>35/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>115/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					<br>
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub4">
						    e- Commerce and Cyber Laws
						</div><br>
						<div class="card-deck collapse" style="margin: 5px" id="sub4" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>62/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>18/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>35/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>115/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					<br>
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub5">
						    Human Resource Planning
						</div><br>
						<div class="card-deck collapse" style="margin: 5px" id="sub5" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>62/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>18/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>35/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>115/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					<br>
					<div class="card">
						<div class="card-header" data-toggle="collapse" data-target="#sub6">
						    Essentials of HRM
						</div><br>
						<div class="card-deck collapse" style="margin: 5px" id="sub6" >
						
							<div class="card">
						      <div class="card-body text-center">
						      <center><h2>62/80</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>18/20</h2> </center>
						        <center><p class="card-text">Assignment</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>35/50</h2> </center>
						        <center><p class="card-text">Test</p></center>
						        <center><p class="card-text" style="color: gray;">Jan-2018</p></center>
						      </div>
						    </div>
						    
						    <div class="card">
						      <div class="card-body text-center">
						      <center><h2>115/150</h2> </center>
						        <center><p class="card-text">Tee</p></center>
						        
						      </div>
						    </div>
						    
						</div>
					</div>
					
					</div>
				</div>
					
					<br><br><br><br>
				</div>
			</div>
		</div>
		<div class="col-md-2">
			<jsp:include page="onlinePeople2.jsp"></jsp:include>
		</div>
	</div>
	
</div>
<jsp:include page="footer.jsp">
<jsp:param value=" " name="title"/>
</jsp:include>

<script type="text/javascript">
//chart colors
var colors = ['#007bff','#28a745','#333333','#c3e6cb','#dc3545','#6c757d'];

/* 3 donut charts */
var donutOptions = {
  cutoutPercentage: 75, 
  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
};

// donut 1
var chDonutData1 = {
    labels: ['TEE', 'Asign', 'Test'],
    datasets: [
      {
        backgroundColor: colors.slice(0,3),
        borderWidth: 0,
        data: [74, 11, 40]
      }
    ]
};

var chDonut1 = document.getElementById("chDonut1");
if (chDonut1) {
  new Chart(chDonut1, {
      type: 'pie',
      data: chDonutData1,
      options: donutOptions
  });
}

// donut 2
var chDonutData2 = {
    labels: ['TEE', 'Asign', 'Test'],
    datasets: [
      {
        backgroundColor: colors.slice(0,3),
        borderWidth: 0,
        data: [50, 15, 35]
      }
    ]
};
var chDonut2 = document.getElementById("chDonut2");
if (chDonut2) {
  new Chart(chDonut2, {
      type: 'pie',
      data: chDonutData2,
      options: donutOptions
  });
}

// donut 3
var chDonutData3 = {
    labels: ['TEE', 'Asign', 'Test'],
    datasets: [
      {
        backgroundColor: colors.slice(0,3),
        borderWidth: 0,
        data: [65, 13, 33]
      }
    ]
};
var chDonut3 = document.getElementById("chDonut3");
if (chDonut3) {
  new Chart(chDonut3, {
      type: 'pie',
      data: chDonutData3,
      options: donutOptions
  });
}

//donut 4
var chDonutData4 = {
    labels: ['TEE', 'Asign', 'Test'],
    datasets: [
      {
        backgroundColor: colors.slice(0,3),
        borderWidth: 0,
        data: [54, 11, 40]
      }
    ]
};

var chDonut4 = document.getElementById("chDonut4");
if (chDonut4) {
  new Chart(chDonut4, {
      type: 'pie',
      data: chDonutData4,
      options: donutOptions
  });
}

</script>
</body>
</html>