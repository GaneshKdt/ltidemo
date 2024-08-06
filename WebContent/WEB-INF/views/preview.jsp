<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>medium editor | demo</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
	<script src="assets/js/moment.min.js"></script>
      <script> 
      jQuery(document).ready(function($){

    	    var now = moment();

    	             
    	    if(now.diff('2019-05-05 17:11:43', 'days') <= 1) {    
    	    	var a = moment('2019-05-09 17:11:43').fromNow(); 
    	    	alert(a);     
    	    } else{
    	    	alert(moment(a).format("d MMM YYYY h:mm a "));               
    	    } 
              
    	}); 
      </script> 

</head>
<body>
   <div id="container">
       <time class="pubdate" datetime="2019-05-08 17:11:43" pubdate>
    2019-05-08 17:11:43 
</time>
    </div> 

</body>
</html>