<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=request.getParameter("title") %></title>
		
  <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
  <meta name="robots" content="noindex">

  <!-- Material Design Icons  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  

<!-- octicon  -->   

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.5.0/octicons.min.css">
<!-- Text editor  -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> <!-- 4.0.0 -->
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
		
	  <!-- prettydate Moment -->  
 	<script src="assets/js/moment.min.js"></script>
 
    <!-- Emojis for reactions css and js-->
  <!--<link type="text/css" href="assets/css/emoji_stylesheet.css" rel="stylesheet">-->
  
  <script type="text/javascript" src="assets/js/jquery-ui_1.12.1_.min.js"></script>
  
  <!-- Font Awesome JS -->
<!--     <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>   -->
    
     <script src="<spring:eval expression="@propertyConfigurer.getProperty('BASE_URL_STUDENTPORTAL_STATIC_RESOURCES')" />assets/js/FontAwesome-6.2.1.js" crossorigin="anonymous"></script>

  <!-- medium editor -->
  <link type="text/css" href="assets/css/medium-editor.css" rel="stylesheet">
  <link type="text/css" href="assets/css/mediumEditor.css" rel="stylesheet">
  <!-- Roboto Web Font -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
  
  <!-- Sans Web Font  -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  
  <!-- Merriweather Web Font  -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:500" rel="stylesheet">
  
  <!-- Font Awesome -->
<!--   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
  
  <!-- Bootstrap date time picker CSS -->
  <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" /> 
	
  <!-- Timepicker -->
  <link rel="stylesheet" href="assets/examples/css/bootstrap-timepicker.min.css">

  <!-- App CSS --> 
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  
  <!-- Custom CSS -->
   <link type="text/css" href="assets/css/custom.css" rel="stylesheet">
   <link type="text/css" href="assets/css/customST.css" rel="stylesheet"> 
	
  <!-- Custom CSS for fabButton -->
  <link type="text/css" href="http://propeller.in/components/button/css/button.css" rel="stylesheet">
  <link type="text/css" href="assets/css/fabButton.css" rel="stylesheet">
  
   <!--  Scrollbar Custom CSS -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

  <!-- FullCalendar CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
  <!-- hashtag -->

  <link rel="stylesheet" href="assets/Hashtag/docsupport/prism.css">
  <link rel="stylesheet" href="assets/Hashtag/chosen.css"> 
   
  <!-- Link for Charts -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
    function prettyDate(t){ 
	   	 var now = moment();  
	   	 if (Math.abs(moment().diff(t)) < 1000) { // 1000 milliseconds
	        return 'just now';
	     }
	   	 else if(now.diff(t, 'days') <= 1) {    
	    	var a = moment(t).fromNow(); 
	    	return a;      
	     }else if(now.diff(t, 'days') >300 ){
	    	return moment(a).format("d MMM YYYY h:mm a ");
	     } else{                   
	    	return moment(t).format("DD MMM YYYY h:mm a ");               
	     }  
    }
	</script>
    </head>