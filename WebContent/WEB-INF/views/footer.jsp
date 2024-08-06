<!-- Code For Voice call Scheduler Modal :start-->

 <!-- <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title h4" id="myLargeModalLabel">Schedule Audio Call</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
      </div>
      <div class="modal-body" >
      	<div class="container">
		    <div class="row">
		    	<div class='col-sm-6'>
		            <div class="form-group">
		            	<label for="volunteer" class="col-form-label">Faculty :</label>
		                <select class="form-control" id="volunteer">
		                	<option>Deepak Guptha</option>
		                	<option>Puja Basun</option>
		                	<option>Brindha Sampath</option>
		                	<option>Kalli Charan</option>
		                	<option>Purva Sha</option>
		                </select>
		            </div>
		        </div>
		   	</div>
		   	<div class="row">
		        <div class='col-sm-6'>
		            <div class="form-group">
		            	 <label for="datepicker" class="col-form-label">Date:</label>
		                <input type='text' id="datepicker" class="form-control" />
		            </div>
		        </div>
		        <div class='col-sm-6'>
		            <div class="form-group">
		            	 <label for="timepicker3" class="col-form-label">Time:</label>
		                 <input id="timepicker3" type="text" class="form-control">
		            </div>
		        </div>
		    </div>
		    <div class="row">
		    	<div class='col-sm-2 ml-auto'>
		    		<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-success rounded">Submit</button>
		    	</div>
		    </div>
		</div>	
      </div>
    </div>
  </div>
</div> -->


<!-- Code For Voice call Scheduler Modal :end -->


<!-- Code for Fab Button  :start-->

	<!-- <div class="menu pmd-floating-action" role="navigation"> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Post"> 
            <span class="pmd-floating-hidden">Post</span>
            <i class="material-icons">edit</i> 
        </a> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Chat"> 
            <span class="pmd-floating-hidden">Chat</span> 
            <i class="material-icons">chat</i> 
        </a> 
        <a href="javascript:void(0);" data-toggle="modal" data-target=".bd-example-modal-lg" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Audio Call"> 
            <span class="pmd-floating-hidden">Audio Call</span> 
            <i class="material-icons">call</i> 
        </a> 
        <a href="javascript:void(0);" data-toggle="modal" data-target=".bd-example-modal-lg" class="pmd-floating-action-btn btn btn-sm pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-default" data-title="Video Call"> 
            <span class="pmd-floating-hidden">Video Call</span> 
            <i class="material-icons">video_call</i> 
        </a> 
        <a href="javascript:void(0);" class="pmd-floating-action-btn btn pmd-btn-fab pmd-btn-raised pmd-ripple-effect btn-primary" data-title="Add"> 
            <span class="pmd-floating-hidden">Primary</span>
            <i class="material-icons pmd-sm">add</i> 
        </a> 
    </div> -->






<!-- Code for Fab Button  :end-->


  <!-- Bootstrap -->
  <%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.nmims.bean.UserAuthorizationLtidemoBean"%>
<script src="assets/vendor/tether.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <!-- jQuery Custom Scroller CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
  
  <!-- FullCalendar JS -->
  <script type="text/javascript" src="assets/vendor/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>

  <!-- AdminPlus -->
  <script src="assets/vendor/adminplus.js"></script>
  
  <!-- Bootstarp date timepicker JS -->

<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
  <script src="assets/vendor/bootstrap-timepicker.js"></script>

  <!-- Init -->
  <script src="assets/examples/js/date-time.js"></script>

  <!-- App JS -->
  <script src="assets/js/main.min.js"></script>
  

	<script>
	
/* JS for datepicker in the modal : Start */
	
	$('#datepicker').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd-mm-yyyy',
        value: moment().format("DD-MM-YYYY"),
        minDate: moment().format("DD-MM-YYYY")
    });
	
	$('#datepicker4').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd-mm-yyyy',
        value: moment().format("DD-MM-YYYY"),
        minDate: moment().format("DD-MM-YYYY")
        
    });
	$('#timepicker4').plusTimePicker({
		minuteStep: 5,
		showInputs: false,
		disableFocus: true
		
	});

	/* JS for datepicker in the modal : End */
	
	
	/* JS for Books analysis : Start */
	
	
	jQuery(document).ready(function	(){

    var el;
    var options;
    var canvas;
    var spans;
    var ctx;
    var radius;

    var createCanvasVariable = function(id){  // get canvas
        el = document.getElementById(id);
    };

    var createAllVariables = function(){
        options = {
            percent:  el.getAttribute('data-percent') || 25,
            size: el.getAttribute('data-size') || 165,
            lineWidth: el.getAttribute('data-line') || 15,
            rotate: el.getAttribute('data-rotate') || 0,
            color: el.getAttribute('data-color')
        };

        canvas = document.createElement('canvas');
        spans = document.createElement('spans');
        spans.textContent = options.percent + '%';

        if (typeof(G_vmlCanvasManager) !== 'undefined') {
            G_vmlCanvasManager.initElement(canvas);
        }

        ctx = canvas.getContext('2d');
        canvas.width = canvas.height = options.size;

        el.appendChild(spans);
        el.appendChild(canvas);

        ctx.translate(options.size / 2, options.size / 2); 
        ctx.rotate((-1 / 2 + options.rotate / 180) * Math.PI); 

        radius = (options.size - options.lineWidth) / 2;
    };


    var drawCircle = function(color, lineWidth, percent) {
        percent = Math.min(Math.max(0, percent || 1), 1);
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, Math.PI * 2 * percent, false);
        ctx.strokeStyle = color;
        ctx.lineCap = 'square'; // butt, round or square
        ctx.lineWidth = lineWidth;
        ctx.stroke();
    };

    var drawNewGraph = function(id){
        el = document.getElementById(id);
        createAllVariables();
        drawCircle('#efefef', options.lineWidth, 100 / 100);
        drawCircle(options.color, options.lineWidth, options.percent / 100);


    };
    drawNewGraph('graph1');
    drawNewGraph('graph2');
    drawNewGraph('graph3');
    drawNewGraph('graph4');
    drawNewGraph('graph5');
    drawNewGraph('graph6');
    drawNewGraph('graph7');
    drawNewGraph('graph8');

});
/*JS for Books analysis :  End */
	
	</script>

<script type="text/javascript">

//--------------- Applozic chat script ---------------------
	<% String userId = (String) request.getSession().getAttribute("userId"); %>

	verifyUserExists('<%= userId %>')
	
	function verifyUserExists(userId) {
		$.ajax({
			type:"POST",
			url: "https://apps.applozic.com/rest/ws/user/v2/detail",
			data : JSON.stringify({
				'userIdList' : [userId]
			}), // our data object,
			contentType:'application/json',
			headers: {
		        'Authorization' : 'Basic ' + btoa('verification_bot:Newuser@123'),
		        'Application-Key' : '3188af863b45ee48f80292c154e498a5f',
		        'Content-Type' : 'application/json'
		    },
			success	:	function(data){
				console.log(data)
				if(data.status == "success") {
					if(data.response.length > 0) {
						signInToApplozic(userId)
					}
				}
			},
			error: function() {   
				
			}
		})
	}
	
	function signInToApplozic(userId) {

	   (
		function(d, m){
			var s, h;       
			s = document.createElement("script");
			s.type = "text/javascript";
			s.async=true;
			s.src="https://apps.applozic.com/sidebox.app";
			h=document.getElementsByTagName('head')[0];
			h.appendChild(s);
			window.applozic=m;
			m.init=function(t){m._globals=t;}}
	   )(
			document, window.applozic || {}
	   );
		   
		window.applozic.init({
			userId: userId, 
			accessToken: userId, 
			//userId: 'NMSCEMUADMIN01', 
			//accessToken: 'NMSCEMUADMIN01',
			appId: '3188af863b45ee48f80292c154e498a5f',
			desktopNotification: true,
			notificationIconLink: "https://www.applozic.com/resources/images/applozic_icon.png",
			locShare: true,
			googleApiKey: "AIzaSyDKfWHzu9X7Z2hByeW4RRFJrD9SizOzZt4",
			autoTypeSearchEnabled : false,	// set to false if you don't want to allow sending message to user who is not in the contact list
			loadOwnContacts : true, //set to true if you want to populate your own contact list (see Step 4 for reference)
			olStatus: true,		//set to true for displaying a green dot in chat screen for users who are online
			onInit : function(response,data) {
				if (response === "success") {
					// login successful, perform your actions if any, for example: load contacts, getting unread message count, etc
					// calling function load contacts
					$.ajax({
						type:"POST",
						url: "/ltidemo/getContactsForChat",
						data : JSON.stringify({
							'sapId' : userId
						}), // our data object,
						contentType:'application/json',
						success	: function(data){
							console.log("Loading contacts")
							console.log(data)
							var contactsList = []
							data.forEach((contact) => {
								let newContact = {
									userId: contact.sapId, 
									displayName: contact.firstName + " " + contact.lastName +" ( "+  contact.sapId +", "+
											contact.program+", "+contact.batch+", "+contact.subject+" )",
									imageLink: contact.imageUrl,
								}
						
								if(userId != newContact.userId){
									contactsList.push(newContact)
								}
							})
							$applozic.fn.applozic('loadContacts', {"contacts":contactsList});
						},
						error: function() {	
							
						}
					})
					
					
				} else {
					// error in user login/register (you can hide chat button or refresh page)
				}
			},	
			
		});
	}
</script>
