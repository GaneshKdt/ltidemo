<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui_1.12.1_.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
	
	<script src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	
<!-- 	for new changes -->
	<script src="https://cdn.datatables.net/fixedheader/3.2.0/js/dataTables.fixedHeader.min.js"></script>
	
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>

</style>

</head>
<body style='margin: auto;' >
	<!-- THIS IS FOR APPLOZIC TOP MENU TOP-NEV-BAR  -->
<!-- 	<div class="row"> -->
<!-- 		<div class="sidebar col-sm-2"> -->
<!-- 			<div class="logo-details"> -->
<!-- 				<span class="logo_name">Applozic</span> -->
<!-- 			</div> -->
<!-- 			<ul class="nav-links"> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button class="links_name">Analytics</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button class="links_name">MESSAGES</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button onClick='javascript:showTable();' value='show' -->
<!-- 							class="links_name">USERS</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button class="links_name">GROUPS</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button class="links_name">DEVICES</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="#"> -->
<!-- 						<button class="links_name">INTEGRATIONS</button> -->
<!-- 				</a></li> -->
<!-- 				<li><a href="https://answers.applozic.com/"> -->
<!-- 						<button class="links_name">HELP</button> -->
<!-- 				</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 		<div class="userAdmin col-sm-10"></div> -->
<!-- 		<table id="TableDetails" class="table table-striped"></table> -->
<!-- 		<button type="submit" name="formBtn">Load more</button> -->
<!-- 	</div> -->

	<div id='nav-bar' style="float: left; background: #CCCCCC; width: 15%; height: 100%; position: fixed;">
		<ul class="nav flex-column">
			<li class='nav-item'>
				<a class="nav-link active h3" href="#" style="color: black; width: 100%"> Analytics </a>
			</li>
			<li class='nav-item'>
				<a class="nav-link h3" href="#" style="color: black; width: 100%"> Message </a>
			</li>
			<li class='nav-item'>
				<a class="nav-link h3" onclick='fetchUserData(moment().valueOf())' style="color: black; width: 100%"> Users </a>
			</li>
			<li class='nav-item'>
				<a class="nav-link h3" href="#" style="color: black; width: 100%"> Groups </a>
			</li>
			<li class='nav-item'>
				<a class="nav-link h3" href="#" style="color: black; width: 100%"> Devices </a>
			</li>
			<li class='nav-item'>
				<a class="nav-link h3"  href="/ltidemo/searchBatchUserForm" style="color: black; width: 100%"> MappedUserList </a>
			</li>
		</ul>
	</div>
	
	<div id='userContainer' hidden="" style="padding: 10px">
	
		<div id='userTable' class='table-responsive' style='float: right; width: 85%; margin-top:30px; height: 80%'>
			
			<table class='table table-striped table-hover' id='tableDetails'>
	 			<thead>
	 		    	<tr>
		  		    	<th title="UserId SapId" >SapId</th>
		  		        <th title="user name">User Name</th> 
		  		        <th title="role of user 3 means user, 1 means bot or admin">Role Type</th>
		  		       	<th title="last seen">LastSeenAtTime</th>
				        <th title="Login time of user or admin">LastLoggedInAtTime</th>
				        <th title="true/false">Deactivated</th>
				        <th title="account created  time">CreatedAtTime</th>
				        <th title="Connected last time">Unread Count</th>
				        <th title="currently user connected or not ">Connected</th>
				        <th title="yes / no ">Active</th>
		  		    </tr>
	  		    </thead>
	  		    <tbody></tbody>
  		    </table>
  		    
		</div>
		
		<div id='loadMore' style='float: right; width: 82%;'>
			<button class='btn btn-primary' onclick='loadMore( )' style="float: right;  margin-top: 10px;">Load More</button>
		</div>
	</div>

	<script type="text/javascript">
	var startTimeVr;
	function fetchUserData(startTime){
		
		console.debug('startTime: '+startTime)
		
		if( startTime == undefined || startTime == null ){
			var today = new Date();
			var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
			console.log(date);
			var myDate = new Date(date);
			var offset = myDate.getTimezoneOffset() * 60 * 1000;
			var withOffset = myDate.getTime();
			console.log(withOffset);
			startTimeVr= withOffset;	
		}else 
			startTimeVr=startTime;
			
		
	    fetch("https://apps.applozic.com/rest/ws/user/filter?" + new URLSearchParams({
		    	pageSize: 100,
		        startTime: startTimeVr,
		    }), { 
		// Defining method type as Get 
	  	method: 'Get',  
	  	// Fetch knows, what type of data are we dealing with 
	  	headers: { 
	    	'Content-Type': 'application/json',
	        'Application-Key': '3188af863b45ee48f80292c154e498a5f',
	        'Authorization': 'Basic RGVtb0FkbWluOm5nYXNjZUAxMjM=' ,
	   	},
		}).then(res => { 
	 	
				return res.json() 
				
		}).then(data => show(data));
	        
	}
	//document.write(data);
 	function show(data) {
 	 	
 		console.debug(data);
 		let users = data.users;
 			
 		let tab;

 		let table = $('#tableDetails').DataTable();
 		
		for (let r of users)  {

 	 		tab = '<tr>'
 	 		tab += '<td>'+r.userId + '</td>'
 	 		tab += '<td>'+r.userName + '</td>'
 	 		tab += '<td>'+r.roleType + '</td>'
 	 				
//  	 				for convert ms to time and date
 	 		var lastSeenAtTime = new Date(r.lastSeenAtTime);
 	 		var formattedDate = lastSeenAtTime.getDate() + "-" + (lastSeenAtTime.getMonth() + 1) + "-" + lastSeenAtTime.getFullYear();
 	 		var hours = (lastSeenAtTime.getHours() < 10) ? "0" + lastSeenAtTime.getHours() : lastSeenAtTime.getHours();
 	 		var minutes = (lastSeenAtTime.getMinutes() < 10) ? "0" + lastSeenAtTime.getMinutes() : lastSeenAtTime.getMinutes();
 	 		var formattedTime = hours + ":" + minutes;
			formattedDate = formattedDate + " " + formattedTime;
			tab += '<td>'+ formattedDate  + '</td>'
					
			var lastLoggedInAtTime = new Date(r.lastLoggedInAtTime);
 	 		var formattedDate = lastLoggedInAtTime.getDate() + "-" + (lastLoggedInAtTime.getMonth() + 1) + "-" + lastLoggedInAtTime.getFullYear();
 	 		var hours = (lastLoggedInAtTime.getHours() < 10) ? "0" + lastLoggedInAtTime.getHours() : lastLoggedInAtTime.getHours();
 	 		var minutes = (lastLoggedInAtTime.getMinutes() < 10) ? "0" + lastLoggedInAtTime.getMinutes() : lastLoggedInAtTime.getMinutes();
 	 		var formattedTime = hours + ":" + minutes;
			formattedDate = formattedDate + " " + formattedTime;
 	 		tab += '<td>' +formattedDate  + '</td>'

 	 		tab += '<td>'+r.deactivated + '</td>'

 	 		var createdAtTime = new Date(r.createdAtTime);
 	 		var formattedDate = createdAtTime.getDate() + "-" + (createdAtTime.getMonth() + 1) + "-" + createdAtTime.getFullYear();
 	 		var hours = (createdAtTime.getHours() < 10) ? "0" + createdAtTime.getHours() : createdAtTime.getHours();
 	 		var minutes = (createdAtTime.getMinutes() < 10) ? "0" + createdAtTime.getMinutes() : createdAtTime.getMinutes();
 	 		var formattedTime = hours + ":" + minutes;
			formattedDate = formattedDate + " " + formattedTime;
 	 				
 	 		tab += '<td>'+formattedDate + '</td>'

 	 		tab += '<td>'+r.unreadCount  + '</td>'
 	 				
 	 		tab += '<td>'+r.connected  + '</td>'
 	 		tab += '<td>'+r.active  + '</td>'
 	 				
 	 		//tab += '<td>'+ r. + '</td>'
 	 		tab += '</tr>'
 	 		
			table.row.add( $(tab) ).draw();
 	 		
   	    }

 		$('#userContainer').show()

  		startTimeVr = data.lastFetchTime;
 			
 	}
 	
	function loadMore( ){

		lastFetchTime = startTimeVr;
		
		if( lastFetchTime == null || lastFetchTime.typeOf == 'undefined' )
			alert(error)
	
	    fetch("https://apps.applozic.com/rest/ws/user/filter?" + new URLSearchParams({
		    	pageSize: 100,
		        startTime: lastFetchTime,
		    }), { 
		// Defining method type as Get 
	  	method: 'Get',  
	  	// Fetch knows, what type of data are we dealing with 
	  	headers: { 
	    	'Content-Type': 'application/json',
	        'Application-Key': '3188af863b45ee48f80292c154e498a5f',
	        'Authorization': 'Basic RGVtb0FkbWluOm5nYXNjZUAxMjM=' ,
	   	},
		}).then(res => { 
	 	
				return res.json() 
				
		}).then( data => show(data) );
	        
	}
	//For filtering the table on the basis of each Coloum.
	$(document).ready(function () {
	    // Setup - add a text input to each footer cell
 	    $('#tableDetails thead tr')
 	        .clone(true)
 	        .addClass('filters')
 	        .appendTo('#tableDetails thead');
	 
 	    var table = $('#tableDetails').DataTable({
 	        orderCellsTop: true,
 	        fixedHeader: true,
 	        initComplete: function () {
 	            var api = this.api();
	 
 	            // For each column
 	            api
 	                .columns()
 	                .eq(0)
 	                .each(function (colIdx) {
 	                    // Set the header cell to contain the input element
 	                    var cell = $('.filters th').eq(
 	                        $(api.column(colIdx).header()).index()
	                    );
 	                    var title = $(cell).text();
	                    $(cell).html('<input type="text" placeholder="' + title + '" />');
	 
 	                    // On every keypress in this input
 	                    $(
 	                        'input',
 	                        $('.filters th').eq($(api.column(colIdx).header()).index())
 	                    )
 	                        .off('keyup change')
 	                        .on('keyup change', function (e) {
 	                            e.stopPropagation();
	 
 	                            // Get the search value
 	                            $(this).attr('title', $(this).val());
 	                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
	 
 	                            var cursorPosition = this.selectionStart;
 	                            // Search the column for that value
 	                            api
 	                                .column(colIdx)
 	                                .search(
 	                                    this.value != ''
 	                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
 	                                        : '',
 	                                    this.value != '',
 	                                    this.value == ''
 	                                )
 	                                .draw();
	 
 	                            $(this)
 	                                .focus()[0]
 	                                .setSelectionRange(cursorPosition, cursorPosition);
 	                        });
 	                });
 	        },
 	    });
 	});
	</script>
</body>
</html>