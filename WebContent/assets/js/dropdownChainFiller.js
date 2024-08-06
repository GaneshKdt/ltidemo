
		/// Populate Consumer type on page load start
			var myObject = new Object();
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/ltidemo/getConsumerTypes",
				success : function(response) {
				myObject = response; 
					
					var consumerType = []; 
					var consumerId = [];
					var map = new Object();
					$.each(myObject, function(i, dropdown) {
//						consumerType.push(dropdown.consumerType);
//						consumerTypeId.push(dropdown.consumerId);
						map[dropdown.consumerId]=dropdown.consumerType
					});
					console.log('12345')
					console.log(map)
//					consumerType = jQuery.unique(consumerType);
					$.each(map, function(index, value) {
						$(".selectConsumerType").append(
								'<option value="'+ index +'">' + value + '</option>');
					});
	
				},
				error : function(e) {
	
					console.log("ERROR: ", e);
					display(e);
				}
			});
	
		/// Populate Consumer type on page load End
			
		/////// On change Consumer type Program Structure will be change
			
			$(document)
			.on(
					'change',
					'.selectConsumerType',
					function(event) {
						var program_structure = [];
						var ps_id = [];
						var val = this.value;
						var map = new Object();
						var options = '<option disabled selected value="">Select Program Structure</option>';
						
						$.each(myObject, function(i, dropdown) {
							if (dropdown.consumerId == val) {
//								program_structure.push(dropdown.program_structure);
//								ps_id.push(dropdown.ps_id);
								map[dropdown.ps_id]=dropdown.program_structure
							}
						});

//						var uniqueItems = Array.from(new Set(program_structure))
//						program_structure = jQuery.unique(program_structure);
						
						$.each(map, function(index,value) {
							options = options
									+ "<option value='" + index + "'> " + value + " </option>";
						});
						$(this).closest("form").find(".programStructure").html(options);
					});
			
			/////// On change Program Structure, Program will be change

			$(document)
			.on(
					'change',
					'.programStructure',
					function(event) {
						var program = [];
						var p_id =[];
						var val = this.value;
						var options = '<option disabled selected value="">Select Program</option>';
						var map = new Object();
						
						$.each(myObject, function(i, dropdown) {
							if (dropdown.ps_id == val) {
//								program.push(dropdown.program);
//								p_id.push(dropdown.p_id);
								map[dropdown.p_id]=dropdown.program
							}
						});
						
						$.each(map, function(index,value){
							options = options
							+ "<option value='" + index + "'> " + value + " </option>";
						})
						
						$(this).closest("form").find(".program").html(options);
					});

			/////// On change Program Subject will be change

			$(document)
					.on(
						'change',
						'.program',
						function(event) {
							var subject = [];
							var pss_id = [];
							var config_id = [];
							var batchName=[];
							
							var val = this.value;
							var options = '<option disabled selected value="">Select Subject</option>';
							$.each(myObject, function(i, dropdown) {
								if (dropdown.p_id == val) {
									subject.push(dropdown.subject);
									config_id.push(dropdown.config_id);
									batchName.push(dropdown.batchName);
								}
							});    
							var total = "";
							//subject = jQuery.unique(subject);
							for (i = 0; i < subject.length; i++) {
								options = options
											+ "<option value='" + config_id[i] + "' data-subject='"+subject[i]+"'> "
											+ subject[i] +" ( "+ batchName[i] + " ) </option>";
								total = total + "," + config_id[i];
							}
							total = total.replace(/(^,)|(,$)/g, "");
//								options = options
//										+ "<option value='" + total + "'> All </option>";
							$(this).closest("form").find(".selectSubject").html(options);
						});



		/// Groups for Faculty Dropdown Api Start
		
		$('.selectSubject') .on( 'change', function() {
			var thisForm = $(this).closest("form");
			let id = $(this).attr('data-id');
			let options = "<option>Loading... </option>";
			thisForm.find('.group_id').html(options);
			var pss_id="";
			var val = this.value; 
			
			var data = {
					timeBoundId : val,  
			}
			console.log('new Data for Groups : ' + val);    
			$("#hidden_subject_field").val($(this ).children(':selected').attr('data-subject'));
					$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ltidemo/getGroupsNameForFaculty",
					data : JSON.stringify(data),
					success : function(data) {

						console.log("SUCCESS: ", data.groups);
						var groups = data.groups;

						options = "";
						//Data Insert For Subjects List
						//Start
						
						if(groups.length <= 0){
							thisForm.find('.group_id').html(" <option disabled selected value=''> No Groups Available </option> ");
							
						}else{
							for (let i = 0; i < groups.length; i++) {

								options = options
										+ "<option value='" + groups[i].id + "'> "
										+ groups[i].groupName
										+ " </option>";
							}

							console.log("==========> options\n" + options);
							thisForm.find('.group_id').html(
									" <option disabled selected value=''> Select Groups </option> " + options);
						}
						
						//End
					},

					error : function(e) {
						alert("Please Refresh The Page.")
						console.log("ERROR: ", e);
						display(e);
					}
				})
		})
		/// Groups for Faculty Dropdown Api End

		
		//////////**********Session Plan Dropdown Api Start*************///////

		$('.selectSubject').on( 'change', function() {
			    var thisForm = $(this).closest("form");
				let id = $(this).attr('data-id');
				let options = "<option>Loading... </option>";
				thisForm.find('.session_plan_module_id').html(options);
				var  pss_id="";  
				var val = this.value; 
				$.each(myObject, function(i, dropdown) {
					
				});   
				var data = {   
						timeboundId : val
					}
						$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "/acads/api/getSessionPlanDetailsByTimeboundId",
						data : JSON.stringify(data),
						success : function(data) {
                       
							console.log("SUCCESS got session plan: ", data.modules);   
							var modules = data.modules;

							options = "";
							//Data Insert For Subjects List
							//Start
							
							if (modules.length <= 0){
								
								thisForm.find('.session_plan_module_id').html(
										" <option disabled selected value=''> No Modules Available </option> " );
							}else{
								
								for (let i = 0; i < modules.length; i++) {

									options = options
											+ "<option value='" + modules[i].id + "'> "
											+ modules[i].topic
											+ " </option>";
								}

								console.log("==========> options\n" + options);
								thisForm.find('.session_plan_module_id').html(
										" <option disabled selected value=''> Select ModuleName </option> " + options);
							}
							//End
						},

						error : function(e) {
							alert("Please Refresh The Page.")
							console.log("ERROR: ", e);
							display(e);
						}
					})
				})

		//////////**********Session Plan Dropdown Api End*************///////


	    //////////**********Hashtag Dropdown Api Start*************/////// 
				
		$('.session_plan_module_id') .on( 'change', function() {
			var thisForm = $(this).closest("form");
			var default_option =  '<option selected value="'+$(this).children("option:selected").text()+'">'+$(this).children("option:selected").text()+' </option>'; 
			thisForm.find('.hashtag_id').append(default_option);            
			thisForm.find(".hashtag_id").trigger("chosen:updated");
		});
		$('.selectSubject') .on( 'change', function() {
			var thisForm = $(this).closest("form");
			let id = $(this).attr('data-id'); 
			var default_option =  '<option selected value="'+$(this).children("option:selected").text()+'">'+$(this).children("option:selected").text()+' </option>';    
			thisForm.find('.hashtag_id').html(default_option);                
			thisForm.find(".hashtag_id").trigger("chosen:updated");       
			var data = {       
				program_sem_subject_id : $(this).val(),
			}
			console.log('new Data for Hashtag : ' + $(this).val());
			var thisForm = $(this).closest("form");
						$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "/ltidemo/getHashtags",
						data : JSON.stringify(data),
						success : function(data) {

							console.log("SUCCESS: ", data.hashtags);
							var hashtags = data.hashtags;

							options = "";
							//Data Insert For Subjects List
							//Start
							for (let i = 0; i < hashtags.length; i++) {

								options = options
										+ "<option value='" + hashtags[i].hashtag + "'>"
										+ hashtags[i].hashtag
										+ " </option>"; 
							}

							console.log("==========> options\n"
									+ options);
							thisForm.find('.hashtag_id').append(options);    
							thisForm.find(".hashtag_id").trigger("chosen:updated");    
							//End
						},

						error : function(e) {
							alert("Please Refresh The Page.")
							console.log("ERROR: ", e);
							display(e);
						}
					})
		});
		//////////**********Hashtag Dropdown Api End*************///////
		
		
		
				
				