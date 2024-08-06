
<script type="text/javascript">

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
var groupId = getUrlVars()["id"];
$(document).ready (function(){
    $('.selectConsumerType').on('change', function(){
		let id = $(this).attr('data-id');
		
		let options = "<option>Loading... </option>";
		$('#programStructureId').html(options);
		$('#programId').html(options);
		$('.selectSubject').html(options);
    
    	var data = {
					id:this.value
					}
		console.log(this.value)
		console.log("===================> data id : " + id);
		
		$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/exam/getDataByConsumerTypeForEMBA",   
		data : JSON.stringify(data),
		success : function(data) {
			console.log("SUCCESS Program Structure: ", data.programStructureData);
			console.log("SUCCESS Program: ", data.programData);
			console.log("SUCCESS Subject: ", data.subjectsData);
			var programData = data.programData;
			var programStructureData = data.programStructureData;
			var subjectsData = data.subjectsData;
			
			options = "";
			let allOption = "";
			
			//Data Insert For Program List
			//Start
			
			for(let i=0;i < programData.length;i++){
				allOption = allOption + ""+ programData[i].id +",";
				options = options + "<option value='" + programData[i].id + "'> " + programData[i].name + " </option>";
			}
			allOption = allOption.substring(0,allOption.length-1);
			
			console.log("==========> options\n" + options);
			$('#programId').html(
					 "<option value='"+ allOption +"'>All</option>" + options
			);
			//End
			
			options = ""; 
			allOption = "";
			
			//Data Insert For Program Structure List
			//Start
			for(let i=0;i < programStructureData.length;i++){
				allOption = allOption + ""+ programStructureData[i].id +",";
				options = options + "<option value='" + programStructureData[i].id + "'> " + programStructureData[i].name + " </option>";
			}
			allOption = allOption.substring(0,allOption.length-1);
			
			console.log("==========> options\n" + options);
			$('#programStructureId').html(
					 "<option value='"+ allOption +"'>All</option>" + options
			);
			//End
			
			options = ""; 
			allOption = "";
			//Data Insert For Subjects List
			//Start
			for(let i=0;i < subjectsData.length;i++){
				
				options = options + "<option value='" + subjectsData[i].name + "'> " + subjectsData[i].name + " </option>";
			}
			
			
			console.log("==========> options\n" + options);
			$('.selectSubject').html(
					" <option disabled selected value=''> Select Subject </option> " + options
			);
			//End
			
		},
		error : function(e) {
			
			alert("Please Refresh The Page.")
			
			console.log("ERROR: ", e);
			display(e);
		}
	});
				
});
    /* ********************************************************************************************** */
    
		$('.selectProgramStructure').on('change', function(){
	
	
	let id = $(this).attr('data-id');
	
	
	let options = "<option>Loading... </option>";
	$('#programId').html(options);
	$('.selectSubject').html(options);
	
	 
	var data = {
			programStructureId:this.value,
			consumerTypeId:$('#consumerTypeId').val()
	}
	console.log(this.value)
	
	console.log("===================> data id : " + $('#consumerTypeId').val());
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/exam/getDataByProgramStructureForEMBA",   
		data : JSON.stringify(data),
		success : function(data) {
			
			console.log("SUCCESS: ", data.programData);
			var programData = data.programData;
			var subjectsData = data.subjectsData;
			
			options = "";
			let allOption = "";
			
			//Data Insert For Program List
			//Start
			for(let i=0;i < programData.length;i++){
				allOption = allOption + ""+ programData[i].id +",";
				options = options + "<option value='" + programData[i].id + "'> " + programData[i].name + " </option>";
			}
			allOption = allOption.substring(0,allOption.length-1);
			
			console.log("==========> options\n" + options);
			$('#programId').html(
					 "<option value='"+ allOption +"'>All</option>" + options
			);
			//End
			
			options = ""; 
			allOption = "";
			
			//Data Insert For Subjects List
			//Start
			for(let i=0;i < subjectsData.length;i++){
				
				options = options + "<option value='" + subjectsData[i].name + "'> " + subjectsData[i].name + " </option>";
			}
			
			console.log("==========> options\n" + options);
			$('.selectSubject').html(
					" <option disabled selected value=''> Select Subject </option> " + options
			);
			//End
			
		},
		error : function(e) {
			
			alert("Please Refresh The Page.")
			
			console.log("ERROR: ", e);
			display(e);
		}
	});
	
});

    
     /* ********************************************************************************************** */
    
    $('.selectProgram').on('change', function(){
 		
 	   let id = $(this).attr('data-id');
 		let options = "<option>Loading... </option>";
 		$('.selectSubject').html(options);
 		
 		var data = {
 				programId:this.value,
 				consumerTypeId:$('#consumerTypeId').val(),
 				programStructureId:$('#programStructureId').val()
 		}
 		console.log(this.value)
 		
 		$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/exam/getDataByProgramForEMBA",   
				data : JSON.stringify(data),
				success : function(data) {
			
			console.log("SUCCESS: ", data.subjectsData);
			
			var subjectsData = data.subjectsData;
			
			options = ""; 
			//Data Insert For Subjects List
			//Start
			
			if(subjectsData.length <= 0 ){
				
				$('.selectSubject').html(
				" <option disabled selected value=''> No Subjects Available </option> " );
			}else{
				for(let i=0;i < subjectsData.length;i++){
					
					options = options + "<option value='" + subjectsData[i].id + "'> " + subjectsData[i].subject + " </option>";
				}
				
				console.log("==========> options\n" + options);
				$('.selectSubject').html(
						" <option disabled selected value=''> Select Subject </option> " + options
				);
			}
			
			//End
			
		},
		error : function(e) {
			
			alert("Please Refresh The Page.")
			
			console.log("ERROR: ", e);
			display(e);
		}
	});
});     
    
    
 });
</script>
