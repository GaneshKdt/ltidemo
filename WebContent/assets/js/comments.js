		//comments
		comment_i=0;
		$(document).on('keyup', '.reply_field', function(e) {
			var comment_id = $(this).parent().find('.comment_id').val();
			var post_id= $(this).next('input').val();
			var comment= $(this).val();
			var thisMedia =$(this).closest(".media");
			var thisElement = $(this);
			var id=$(this).parent().find('.editId').val();

		    if (e.keyCode == 13) {  
		    	$(this).val("");
				$.ajax({   
					type : 'POST',
					url : '/ltidemo/submitComment/',
					contentType : "application/json",
					data : JSON.stringify({
						"post_id" : post_id,
						"comment_id" :comment_id,
						"id":id,
						"comment" : comment,
						"sapid" : userId,
						"firstName":firstName,
						"lastName":lastName
					}),
					dataType : 'json', 
					success : function(response) {   
						element = $(".like-btn[data-post-id='" + post_id +"']") ; 
						///////update count div
						$(element).closest(".card_reaction_footer").find('.reactCountDiv').html("");   
						var reaction=""; 
						var reactionCount="";
						var myreaction="";
						if(response.reactions.length > 0){ 
							for (i = 0; i < response.reactions.length; i++) {  //loop through the array
								reaction = reaction +'<img src="assets/css/emojis/'+response.reactions[i]+'.jpg" class=" " style="height: 20px;width: 20px;opacity: 0.9;" />'
							}
						}    
						$(element).closest(".card_reaction_footer").find('.reactCountDiv').html(ReactionAndCommentCountDiv(reaction,response.reactionCount,response.commentCount));
						$(element).closest(".card_reaction_footer").find(".reactCountDiv").html(ReactionAndCommentCountDiv(reaction,response.reactionCount,response.commentCount));
						//////////////////////
						
						if(id){
							$(thisElement).closest(".facComment").html(comment);
						}else{
							let firstNameForFaculty = '';
							let covertedUserId = userId.toUpperCase();
							if (covertedUserId === 'CCMBAWX2019' || covertedUserId === 'NMSCEMUADMIN01' || covertedUserId === 'CCMBAWx2019' ||
									covertedUserId === 'BHUMIKA' || covertedUserId === 'CRISENDOLL' || covertedUserId === 'NOMITA' || covertedUserId === 'PRIYANKA') {
								firstNameForFaculty = 'Course Coordinator',
								profile_pic	= 'assets/images/logo.jpg'
							} else {
								firstNameForFaculty = 'Prof. '+firstName,
								profile_pic = profile_pic
							}
							if(comment_id==0){
								
								$(thisMedia).closest(".commentsDiv").append(
										[{
											imageUrl:profile_pic, 
											firstName:firstNameForFaculty,
											lastName:lastName,    
											comment:comment,   
											createdDate:response.createdDate,
											id:response.id,
											profile_pic:profile_pic,
											post_id:post_id,
											userId:userId
										}].map(Comment).join(''));
							
							}else{
								
								$(thisMedia).next(".commentsDiv").append( 
										[{ 
											imageUrl:profile_pic,
											firstName:firstNameForFaculty,
											lastName:lastName,
											comment:comment,
											createdDate:response.createdDate,
											post_id:post_id,
											id:response.id,
											sapid:userId,
											master_comment_id:comment_id     
										}].map(SubComment).join(''));
							}
						}
					} 
				});
		    }
		});
		$(document).on('click', '.view_reply', function(event) {
			var thisDiv =$(this).closest(".media-body");
			var id =$(this).parent().find("input").val(); 
			var count =parseInt($(this).parent().parent().children(".cmt_count").val());  
			$(thisDiv).find(".cmt_count").val(count+4);  
			$.ajax({
				type : 'POST', 
				url : '/ltidemo/subComments/',
				contentType : "application/json",
				data : JSON.stringify({
					"id" : id,
					"limit":100,
					"offset":count,     
				}), 
				dataType : 'json',
				success : function(response) { 
					console.log("reply-->"+id+count);      
					console.log(response);  
					$.each(response.comments,function(i, comment) { 
						if(comment.imageUrl == null)comment.imageUrl = "assets/images/cover/userImg.jpg";
						$(thisDiv).find(".commentsDiv").append([comment].map(SubComment).join(''));  
					});
				}
			});
		});	
		
		$(document).on('click', '.deleteComment', function(event) {
			var id = $(this).attr("id");
			var element =$(this);
		          console.log("IN deleteCommentButtonClick got commentId : ")
		          if(confirm("Are you sure you want to delete this?")){
		        	  console.log($(element).next(".media") );   
		  			$.ajax({
						type	:	'POST',  
						url		:	'/ltidemo/m/deleteCommentById', 
						data	:	JSON.stringify({"id" : id  }), 
						contentType:'application/json',
						success	:	function(data){
							$(element).parent().parent().parent().next(".media").html("");
				        	$(element).parent().parent().parent().html("");
						}, 
						error: function() {  
							console.log('<p>An error has occurred</p>');
						}
					});
		          }
		          else{
		              return false;
		          }
		});
		var previous_comment="";
		$(document).on('click', '.editComment', function(event) {
			var id = $(this).attr("id");
			var post_id = $(this).attr("data_post_id");
			var comment_id = $(this).attr("data_comment_id");
			previous_comment = $(this).parent().parent().parent().next(".media").find(".facComment").html();
			$(this).parent().parent().parent().next(".media").find(".facComment").html('<input type="hidden" class="editId" value="'+id+'" />'+
					'<input type="hidden" class="comment_id" value="'+comment_id+'" /><input type="text" class="form-control round-box reply_field editField" value="'+previous_comment+'"  '+
					'placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>'+
					'<input type="hidden" class="post_id" value="'+post_id+'" />'
			);
		}); 
		$(document).on('blur', '.editField', function(event) {
			$(this).parent().html(previous_comment);
			previous_comment="";   
		}); 
		
//		$(document).on('click', '.editComment', function(event) {
//			var id = $(this).attr("id");
//			var element =$(this);
//		          console.log("IN deleteCommentButtonClick got commentId : ")
//		          if(confirm("Are you sure you want to delete this?")){
//		        	  console.log($(element).next(".media") );   
//		  			$.ajax({
//						type	:	'POST',  
//						url		:	'/ltidemo/m/deleteCommentById', 
//						data	:	JSON.stringify({"id" : id  }), 
//						contentType:'application/json',
//						success	:	function(data){
//							$(element).parent().parent().parent().next(".media").html("");
//				        	$(element).parent().parent().parent().html("");
//						}, 
//						error: function() {  
//							console.log('<p>An error has occurred</p>');
//						}
//					});
//		          }
//		          else{
//		              return false;
//		          }
//		});
		
		$(document).on('click', '.reply', function(event) {
			$(this).parent().parent().children(".commentField").show(); 
		});
		
		
		//reaction
		$(document).on('mouseover', '.like-btn',  function(e) {
			$(this).facebookReactions(); 
		});
		function setReaction(value,userId, postId,reactionCount){
			console.log("inside ajax--");
			var type = value;  
			var body = {
					'sapid' : userId,
					'reactionType' : value,
					'post_id': postId
			};
							
			$.ajax({
				type	:	'POST', 
				url		:	'/ltidemo/getReactionCount', 
				data	:	JSON.stringify(body), 
				contentType:'application/json',
				success	:	function(data){
					var element;
					element = $(".like-btn[data-post-id='" + postId +"']")
					$(element).closest(".card_reaction_footer").find('.reactCountDiv').html("");   
					var reaction=""; 
					var reactionCount="";
					var myreaction="";
					if(data.reactions.length > 0){ 
						for (i = 0; i < data.reactions.length; i++) {  //loop through the array 
							reaction = reaction +'<div class="reactionButton '+data.reactions[i]+'"></div>'
						}
					} 
					$(element).closest(".card_reaction_footer").find('.reactCountDiv').html(ReactionAndCommentCountDiv(reaction,data.reactionCount,data.commentCount));
					$(element).attr("data-emoji-class",type);  
					$(element).closest(".card_reaction_footer").find('.currentReaction').html(currentReactionStatus(value));   
					
					
				}, 
				error: function() {  
					console.log('<p>An error has occurred</p>');
				}
			});
		}  		
		$(document).on('mouseover', '.reacted_emojis',  function(e) {
			var post_id = $(this).closest(".card_reaction_footer").attr("data-post_id");   
			var element = $(this);
  			$.ajax({
				type	:	'POST',  
				url		:	'/ltidemo/getReactedUserList', 
				data	:	JSON.stringify({"post_id": post_id }), 
				contentType:'application/json',
				success	:	function(response){
					console.log(response);
					
					var reactedUserList="";
					response.map(reaction => {
						reactedUserList=reactedUserList+
						'<div style="font-weight:500" class="d-flex px-2">'+
						 '<div class="reactionButton emoji '+reaction.reactionType+'" style="width:20px"></div>'+
                         '<div class="ml-1">'+reaction.fullName+'</div>'+
                          '</div>';
                    }) 
					var html =
					'<div class="usersHover">'+reactedUserList
                   '</div>';
                  $(element).closest(".card_reaction_footer").find(".reactedUserHover").html(html);
                
				}, 
				error: function() {  
					console.log('<p>An error has occurred</p>');
				}
			}); 
		});		
			
		$(document).on('mouseout', '.reacted_emojis',  function(e) {
			$(".reactedUserHover").html("");
		});	
		