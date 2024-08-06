const Announcement = ({profilePicFilePath,firstName,lastName,createdDate,embedImage,post_id,type,fileName,filePath,embedTitle,embedDescription,embedUrl,content,scheduledDate,scheduledTime,hashtags,category,role }) => `

	<div class="card mb-2 ">
		<div class="card-body">
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small>
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}"  data-embedUrl="${embedUrl}"
						 data-filePath="${filePath}" "><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>   
			</div>  
			<br> 
			
			<div class=" card-body border "  > 
				<div>${content} </div>
				<br>
				<span> Category: ${category}</span>
			</div>
			
		</div>
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div>

`;

const MCQ = ({profilePicFilePath,firstName,lastName,createdDate,embedImage,post_id,type,fileName,filePath,embedTitle,embedDescription,embedUrl,content,scheduledDate,scheduledTime,hashtags,endDate,duration,role }) => `
	
	<div class="card mb-2 ">
		<div class="card-body">
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small>
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}"  data-embedUrl="${embedUrl}"
						 data-filePath="${filePath}" "><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>   
			</div>  
			<br> 
			<div class="card-body border ">
				<div class="media">
					<span class="mr-3" style="font-size: 25px;"><i class="fas fa-clipboard-list"></i></span>
					<div class="media-body"> ${content} 
					<br><br>
						<i class="far fa-clock"></i> Last Date : ${convertDate(endDate)} <br>
						<i class="fas fa-stopwatch"></i> Minutes : ${duration}Minutes <br>
						<div class="float-right">
							<button type="button" class="btn btn-primary btn-sm" disabled>
								<i class="fas fa-play-circle"></i> Take Test
							</button>
							<button type="button" class="btn btn-secondary btn-sm" disabled>
								<i class="fas fa-info-circle"></i> View Details
							</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div>
`;

const Link = ({profilePicFilePath,firstName,lastName,createdDate,embedImage,post_id,type,fileName,filePath,embedTitle,embedDescription,embedUrl,content,scheduledDate,scheduledTime,hashtags,role }) => `   
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small>
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}"  data-embedUrl="${embedUrl}"
						 data-filePath="${filePath}" "><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>   
			</div>  
			<br> 
			<div class="d-flex ">${content} </div>
			<div class=" p-1   media border " >      
				<img class="mr-3 align-self-center" id="" src="${EmbeddedImageExists(embedImage)}"  width="80px" height="60px"/>
				<div class="media-body  pl-3 text-muted" >      
					<p class="mt-0 my-1 ">    
					<strong class="text-dark " id="url_heading">${embedTitle}</strong> 
					<p class="my-1 "><small><b id="url_desc" >${embedDescription}</b></small></p> 
					<a href="${embedUrl}" target="_blank" id="url_href"><p class="my-1 "><small ><b id="url_url">${embedUrl}</b></small></p></a>          
				</div>        
			</div>  
			<div class="row p-3">${showTags(hashtags)}</div>   
		</div>
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div>
`;
		
	
const Image = ({profilePicFilePath,firstName,lastName,createdDate,embedImage,post_id,embedTitle,embedUrl,embedDescription,filePath,type,content,fileName,scheduledDate,scheduledTime,hashtags,role}) => `   
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small>
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}" data-embedUrl="${embedUrl}"
						data-filePath="${filePath}"><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>       
			</div>  
			${content}        
			<br>  
			<div class="card-body" ><img class="img-fluid img-thumbnail" src="${SERVER_PATH_FEED_FILES()}${filePath}" ></div>    
			<div class="row p-3">${showTags(hashtags)}</div>
		</div> 
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div>
`;	


const Text = ({profilePicFilePath,firstName,lastName,createdDate,embedImage,embedUrl,post_id,embedTitle,embedDescription,filePath,type,content,fileName,scheduledDate,scheduledTime,hashtags,role}) => `   
		
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small> 
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}"  data-embedUrl="${embedUrl}"
						data-filePath="${filePath}"><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>       
			</div>           
			<br>    
			${content} 
			<div class="row p-3">${showTags(hashtags)}</div>    
		</div> 
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div>
`;


const Session = ({profilePicFilePath,firstName,lastName,createdDate,post_id,content,filePath,fileName,type,scheduledDate,scheduledTime,embedUrl,hashtags,url,role}) => `   
		
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small> 
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}" data-embedUrl="${embedUrl}"
						data-filePath="${filePath}"><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>       
			</div>         
			<br>           
			${content}
			<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="${url}" allowfullscreen></iframe></div><br>
			<div class="row p-3">${showTags(hashtags)}</div>   
		</div>
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div> 
`;		
		
const Video = ({profilePicFilePath,firstName,lastName,createdDate,post_id,content,filePath,fileName,type,scheduledDate,scheduledTime,embedUrl,hashtags,role}) => `   
		
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small>
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}" data-embedUrl="${embedUrl}"
						data-filePath="${filePath}"><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>       
			</div>         
			<br>           
			${content}
			<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="${SERVER_PATH_FEED_FILES()}${filePath}" allowfullscreen></iframe></div><br>
		    <div class="row p-3">${showTags(hashtags)}</div>   
		</div> 
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div> 
`;			


const File = ({profilePicFilePath,firstName,lastName,createdDate,post_id,content,filePath,fileName,type,scheduledDate,scheduledTime,embedUrl,hashtags,role}) => `   
		
		<div class="card mb-2 ">            
		<div class="card-body">     
			<div class="media ">
				<img class="mr-3" src="${profilePicPath(profilePicFilePath)}" style="height:50px; width:50px;" alt="image">
			    <div class="media-body" >
					<a href="#"><b >${firstName} ${lastName}</b></a>      
					<br>
					<small class="text-muted"><b>${role}</b></small> 
					<br>
					<small class="text-muted" id="url_time">${prettyDate(createdDate)}</small>  
					<span class="action_menu_btn" style="float: right; color: #d9d9d9;"><i class="fas fa-ellipsis-h"></i></span>
				</div>  
				<div class="action_menu">
					<ul>
						<li data-toggle="modal" data-target="#EditPostModal" class="edit_modal_show" data-post_id="${post_id}"  data-type="${type}"
						 data-content="${content}"   data-fname="${fileName}" data-embedUrl="${embedUrl}"
						data-filePath="${filePath}"><i class="fas fa-share-square "></i> Edit</li> 
						<li><a class="text-light no-underline" href="deletePost/${post_id}"><i class="fas fa-trash"></i> Delete</a></li>
					</ul> 
				</div>       
			</div>          
			<br>           
			${content} 
		    <div class=" card-body media border col-10 "  > <img class="mr-3" src="${getImageByFileType(filePath)}"/>     
			<div class="media-body  pl-3" style="overflow: hidden;">
			<p class="mt-0 my-1 "><strong class="text-secondary">${fileName}</strong>
			<br>
			${getPostType(type,filePath,SERVER_PATH_FEED_FILES(),CONTENT_PREVIEW_PATH())} 			
			<i class="fa fa-download text-primary"></i></a> </div>
		</div> 
		 <div class="row p-3">${showTags(hashtags)}</div>      
		<div class="card_footer" data-post_id="${post_id}"></div>
	</div> 
`;


var ReactionAndCommentCountDiv = (reaction,reactionCount,commentCount) =>`  
<div class="text-muted d-flex px-2 ">
	<div class="float-left reacted_emojis d-flex ">${reaction} ${reactionCount}  people reacted</div>
	<div class="float-right d-flex" style=" margin-left: auto;">${showCommentsCount(commentCount)}</div>
</div >
<div class="reactedUserHover"></div>
`;		   
		
var Reaction = ({myId,reaction,reactionCount,commentCount,userId,post_id,myReaction}) =>`
<div class="reactCountDiv">${ReactionAndCommentCountDiv(reaction,reactionCount,commentCount)}</div> 
	<div class="btn-group reaction-btn-grp" role="group" aria-label="Basic button">
		<div class="col" style="text-align:center;">
		    
		<div class="btn like-btn" data-post-id="${post_id}"   > 
                <a class="" style={{color: 'gray'}}> 
                    <span class="currentReaction">
                   
                   ${currentReactionStatus(myReaction)}
                    
                    </span>
                    <div class="reaction-box">
                        
                        <div class= "reaction-icon like" onclick="setReaction(\'like\', '${myId}','${post_id}','${reactionCount}');">
                            <label>Like</label>
                        </div>
                        <div class= "reaction-icon celebrate" onclick="setReaction(\'celebrate\', '${myId}','${post_id}','${reactionCount}');">
                            <label>Celebrate</label>
                        </div>
                        <div class= "reaction-icon love" onclick="setReaction(\'love\', '${myId}','${post_id}','${reactionCount}');">
                            <label>Love</label>
                        </div>
                        <div class= "reaction-icon insightful" onclick="setReaction(\'insightful\', '${myId}','${post_id}','${reactionCount}');">
                            <label>Insightful</label>
                        </div>
                        <div class= "reaction-icon curious" onclick="setReaction(\'curious\', '${myId}','${post_id}','${reactionCount}');">
                            <label>Curious</label>
                        </div>
                        
                    </div>
                </a>
        </div>
		</div>  
		<div class="col" style="text-align:center;"> 
			<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#collapse-comment3" style="font-size: 14px; background-color: white; color:gray;"><i class="fas fa-comment-alt"></i> Comments  </button>                 
		</div>     
		<div class="col" style="text-align:center;">  
			<button type="button" class="btn btn-light" style="font-size: 14px; background-color: white; color:gray;"><i class="fas fa-share"></i> Share</button>                
	    </div> 
    </div>  
</div>
`;


var Reply = ({profile_pic,post_id}) =>` 
<div class="media">       
	<a class="pr-1" href="#">
	<img src="${profile_pic}" alt="Image" class="profile_pic" style="height:40px; width:40px;">
	</a>
	<div class="media-body">
		<input type="hidden" class="comment_id" value="0" />
		<input type="text" class="form-control round-box reply_field"   placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>
		<input type="hidden" class="post_id" value="${post_id}" /><br/>
		<div class="input-group-append"></div>
	</div>
</div>   
`;


var Comment = ({imageUrl,firstName,lastName,comment,createdDate,id,profile_pic,post_id,userId}) =>`
${showToolbar(userId,id,post_id,0)}
	<div class="media">
		<img src="${imageUrl}" class="profile_pic mr-3" style="height:40px; width:40px;" /> 
		<div class="media-body">
			<b class="mt-0">${firstName} ${lastName} </b> 
			<span class="facComment">${comment}</span><br>
			<small class="text-muted">${prettyDate(createdDate)}</small><br/>  
			<small><i class="fas fa-share"></i><a style="color: #3b5998;" class="reply">Reply</a></small>. 
			<small mt-1><input type="hidden" value="${id}" /><a class="view_reply" style="color: #3b5998;">View reply</a></small><br/><br/>
			<input type="hidden" class="cmt_count" value="1" />      
			
			<div class="media commentField" style="display: none;"> 
				<a class="pr-3" href="#">
					<img src="${profile_pic}" alt="Image" class="profile_pic" style="height:40px; width:40px;">
				</a>
				
				<div class="media-body" style="overflow: hidden;">  
					<input type="hidden" class="comment_id" value="${id}" />
					<input type="text" class="form-control round-box reply_field" placeholder="Post Comments..." aria-label="Comment" aria-describedby="button-addon2"/>
					<input type="hidden" class="post_id" value="${post_id}" />
					
					<div class="input-group-append"></div>
				</div>
			</div>									 
			<div class="commentsDiv"></div>
		</div>
	</div>   
`;

var SubComment = ({imageUrl,firstName,lastName,comment,createdDate,id,post_id,sapid,master_comment_id}) =>`
${showToolbar(sapid,id,post_id,master_comment_id)} 
	<div class="media py-2">
		<img src="${imageUrl}" class="profile_pic mr-3" style="height:40px; width:40px;" /> 
		<div class="media-body" style="overflow: hidden;">
			<b class="mt-0">${firstName} ${lastName} </b> 
			<span class="facComment">${comment}</span><br>
			<small class="text-muted">${prettyDate(createdDate)}</small>
		</div>
	</div>    
`;

var SessionModules = ({id,sessionModuleNo,outcomes,chapter,topic}) =>`
<div class="mt-3 col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
	<div class="sessionplan-resourcecard card">
		<a > 
			<div class="card-title sessionPlanHomeCardTitle ">
				<span class="" style="font-size: 14px;">Module : ${sessionModuleNo}</span><br>
				<p></p>
				<b>${topic} </b>
			</div>
		</a>
		<div class="text-dark pt-0 pb-0  card-body">
			<div class="pt-3 row">
				<div class="col-6">
					<a class="btn font12 hoverblue"
						href="/ltidemo/sessionPlanDetails?id=${id}&active=S"><i
						class="material-icons sessionplan-icon">play_circle_filled</i>
						<span>Session</span></a><a class="btn font12 hoverblue"
						href="/ltidemo/sessionPlanDetails?id=${id}&active=LR"><i   
						class="material-icons sessionplan-icon">library_books</i> <span>Resources</span></a>
				</div>
				<div class="text-left  col-6">
					<a class="btn font12 hoverblue"
						href="/ltidemo/sessionPlanDetails?id=${id}&active=QA"><i
						class="material-icons sessionplan-icon">help</i><span>
							Q&amp;A</span></a>
				</div>
			</div>
			<a ><div class="row"> 
					<div class="noUnderlineOnHover fixedHeight mt-3 col">${outcomes.replace(/<[^>]+>/g, '').substring(0,80)+"..."}</div>
				</div></a>
			<div class="borderTop pt-2 row">
				<div class="sessionplan-subhead col-6">Chapter :</div>
				<div class="text-right  col-6">${chapter}</div>
			</div>
			<div class="row">
				<div class="sessionplan-subhead col-8">Attendance :</div>
				<div class="text-right  col-4">NA</div>
			</div>
			<div class="mb-2 row"> 
				<div class="sessionplan-subhead col-6">Internal
					Assessment Due Date :</div>
				<div class="text-right  col-6">NA</div>
			</div>
		</div>
	</div>
</div>`	;

var SessionPlanVideos = ({id,sessionPlanModuleId,videoLink,subject,fileName,sessionDate}) =>`
<div class="col-sm-6 col-md-6 col-lg-6 col-xl-3">
	<div class="card mb-3 recording-card">  
		<iframe className="embed-responsive-item card-img-top" src="${videoLink}" allowFullScreen title='video'></iframe>
		<div class="card-footer minheight bg-white"> 
			<div class="d-flex word-break">
				<h5>${subject}</h5>    
				<a href="courseDetails?id=${id}&module=${sessionPlanModuleId}" class="btn-default btn Ripple-parent round-arrow ml-1">
					<i data-test="fa" class="fa fa-chevron-right"></i> 
				</a>
			</div>
			<hr/>
			
			<span style="color: gray;">${fileName} </span><br>
			<!-- <i class="material-icons">remove_red_eye</i><span style="color: gray;"> 123 Views</span><br> --> 
							
		</div>
		<span class="card-footer time-footer"><i class="material-icons">schedule</i> ${sessionDate}</span>   
	</div>
</div>  
`;


var LR = ({name,description,previewPath,filePath}) =>`
<div class="col-sm-6 col-md-6 col-lg-6 col-xl-3">
	<div class="card session-files-card mb-4">   

		<div class="card-body">
			<h6 class="card-title session-filename">   
				<i class="far fa-file-pdf"></i>${name}
			</h6>
			<p class="card-text text-muted session-file-desc">${description}</p>
		</div>
		<div class="card-footer sessionfile-card-footer">
		<div class="row">
		<div class = "col-12 "> 
			<div class = " mt-3">
			
			<div class = "col-3  mb-2 p-0 moduleCardIconLinks session-files-card-icon float-right ">      
				<a href="${filePath}" title="View" class="btn btn-outline-light card-link btn-block  session-link">
					<i class="fas fa-eye  session-files-card-icon-fas" ></i>
	            </a>   
					<span class="notification-dot"></span>   
			</div>      
			<div class = "col-3 mr-2 mb-2 p-0 moduleCardIconLinks session-files-card-icon float-right ">  
				<a href="${filePath}" title="Download" class="btn btn-outline-light card-link btn-block session-link">
					 <i class="fas fa-download session-files-card-icon-fas" ></i>  
	            </a>   
			</div>           
			</div>
		</div>
		</div>   
		</div>
		
		
	</div>
</div> 
`;


function showToolbar(userId,id,post_id,comment_id){
	if(userId==facId()){
		//return userId;
		return ''+
		'<div class="float-right">' + 
		'	<li class="nav-item dropdown">' +
		'		<a class="nav-link" href="#" data-toggle="dropdown"> ' +
		'			<i class="fas fa-ellipsis-h"></i> ' +
		'		</a>' +
		'		<div class="dropdown-menu" style="width:auto; right: 0px;">' +
	    '			<a class="dropdown-item editComment" id='+id+' data_post_id='+post_id+' data_comment_id='+comment_id+' >Edit</a>'+
		'			<a class="dropdown-item deleteComment" id='+id+' >Delete</a>' +
		'		</div>' +
		'	</li>' +
		'</div>';
	
	}else
		return "";
}

//For adding # before Hashtag
function showTags(hashtags){
	var tags="";
	if(hashtags!=null){
		hashtags.split(',').forEach(function(entry) {
			if(entry != ""){            
				tags+='<span class="trigger ml-3">#'+entry.trim()+'</span>' ;  
			}     
		}); 
	}
	return tags;
}

//For Comment Count Counts
function showCommentsCount(commentCount){
	var commentLine = "";
	if (commentCount > 1) {
		commentLine = '<span> '+commentCount+' comments (including replies)</span>';
	}else{
		commentLine = '<span> '+commentCount+' comment</span>';
	}
	return commentLine;
}

//For Profile Picture Checks
function profilePicPath(profilePicFilePath ){
	return (profilePicFilePath !== null) ? SERVER_PATH()+profilePicFilePath : "assets/images/cover/userImg.jpg";
}

//For Embedded link Image Checks 
function EmbeddedImageExists(image){
	return (image != "") ? image : "assets/images/preview/noPreview.jpg";
}

//For User's Reaction on post
function currentReactionStatus(myReaction){
	var reactionBox = ''+
		'<div class="d-flex ">'+ 
		'	<div class="reactionButton '+myReaction+'"></div>'+
		'	<div class="emojiName text-primary">'+myReaction+'</div>' +
		'</div>' ;
	
	return (myReaction.length > 0 ) ? reactionBox :'<span><i class="fa fa-thumbs-up "></i>  Like</span>'
}

//For showing DAte in MCQ card (Convert Time)
function convertDate(endDate){
	var d = new Date(0);
	d.setUTCMilliseconds(endDate);
	var formatted_date = d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear()	
	return formatted_date;
}

//Download Button for Files 
function getPostType(type,filePath,SERVER_PATH_FEED_FILES,CONTENT_PREVIEW_PATH){
	if (type == 'File') {
		return '<a class="my-1 btn btn-light text-primary" href="'+SERVER_PATH_FEED_FILES+filePath+'">Download'
	} else if(type == 'Resource'){
		return '<a class="my-1 btn btn-light text-primary" href="'+CONTENT_PREVIEW_PATH+filePath+'">Download'
	}
}

