<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link href="https://swisnl.github.io/jQuery-contextMenu/dist/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://swisnl.github.io/jQuery-contextMenu/dist/jquery.contextMenu.js" type="text/javascript"></script>

    <script src="https://swisnl.github.io/jQuery-contextMenu/dist/jquery.ui.position.min.js" type="text/javascript"></script>
<!-- Custom CSS -->
<link href="https://web.applozic.com/plugin/css/app/fullview/applozic.combined.min.css"
	rel="stylesheet">
<!-- AutoSuggest Plugin CSS -->
<link href="https://web.applozic.com/plugin/autosuggest/css/jquery.atwho.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://web.applozic.com/plugin/css/app/fullview/applozic.fullview.css" rel="stylesheet">
<link href="https://web.applozic.com/plugin/css/app/fullview/style.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
 <script 
  src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
  integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
  crossorigin="anonymous"></script>
  
<!-- Your jquery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>-->
<link rel="stylesheet" href="https://web.applozic.com/plugin/css/app/fullview/applozic.plugin.css">
<style type="text/css">
	/* Tooltip container */
	.tooltip {
	  position: relative;
	  display: inline-block;
	  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
/* 	  overflow: hidden; */
	}
	/* Tooltip text */
	.tooltip .tooltiptext {
		
		visibility: hidden;
	    width: calc(80% - 50px);
	    background-color: #555;
	    color: #fff;
	    text-align: center;
/* 	    padding: 5px 0; */
	    border-radius: 6px;
	    position: absolute;
	    z-index: 9999;
	    top: 2%;
	    left: 55%;
	    margin-left: -50px;
	    opacity: 0;
	    transition: opacity 0.3s;
	
/* 	  visibility: hidden; */
/* 	  width: 120px; */
/* 	  background-color: #555; */
/* 	  color: #fff; */
/* 	  text-align: center; */
/* 	  padding: 5px 0; */
/* 	  border-radius: 6px; */
	
/* 	  /* Position the tooltip text */ */
/* 	  position: absolute; */
/* 	  z-index: 9999; */
/* 	  bottom: 40%; */
/* 	  left: 95%; */
/* 	  margin-left: -60px; */
	
/* 	  /* Fade in tooltip */ */
/* 	  opacity: 0; */
/* 	  transition: opacity 0.3s; */
	}
	
	/* Tooltip arrow */
		.table-responsive::-webkit-scrollbar {
		width: 4px;
	}
	
	/* Track */
	.table-responsive::-webkit-scrollbar-track {
	  background: #f1f1f1; 
	  border-radius: 10px;
	}
	 
	/* Handle */
	.table-responsive::-webkit-scrollbar-thumb {
	  background: #888; 
	  border-radius: 10px;
	}
	
	/* Handle on hover */
	.table-responsive::-webkit-scrollbar-thumb:hover {
	  background: #555; 
	}
	
	.tooltip .tooltiptext::after {
	  content: "";
	  position: absolute;
	  top: 50%;
	  left: -5px;
	  margin-left: -10px;
	  border-width: 10px;
	  border-style: solid;
	  border-color: transparent #555  transparent transparent;
	}
	
	/* Show the tooltip text when you mouse over the tooltip container */
	.tooltip:hover .tooltiptext {
	  visibility: visible;
	  opacity: 1;
	  position: absolute;
	  z-index: 1;
	}	
/* 	body {
  padding: 25px;
  background-color: white;
  color: black;
  font-size: 25px;
   } */

	.dark-mode {
	  background-color: black;
	  color: white;
	}	

	.star-message-pannel{
		
		background: #d9dcde; 
		width: 40%; 
		position: relative;
		float: right; 
		z-index: 1;
		display: none;
	    overflow-y: scroll;
/* 	    oveflow-x:hidden; */
	    
	    height: 650px;
		
	}
	
	.star-message-pannel-close{
		float: right;
	    font-size: 2em;
	    padding: 10px;
	    cursor: pointer;
    }
    
    .message-body{
    
    	background: white;
	    margin: 15px;
	    font-size: 1.1em;
	    text-align: initial;
	    padding: 10px;
	    border-radius: 3px;
    }
    
	.custom-context-menu {
		margin-top:231px;
	  	width: 10%;
	  	box-shadow: 0 4px 8px -2px rgba(0, 0, 0, 0.3);
	  	position: fixed;
	  	top:5px;
	  	opacity: 0;
	  	pointer-events: none;
	  	transition: opacity 500ms ease;
	}

	.custom-context-menu.active {
	  	opacity: 1;
	  	pointer-events: auto;
	}

	.custom-context-menu ul li a {
		  text-decoration: none;
		  font-family: "Roboto", sans-serif;
		  padding: 5%;
		  display: inline-block;
		  font-size: 1em;
		  color: #222;
		  background: #fff;
		  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		  width: 100%;
		  box-sizing: border-box;
		  border-left: 4px solid transparent;
		  transition: all 400ms ease;
		  border-radius: 4px;
	}

	.custom-context-menu ul li a:hover {
		  background: #f1faee;
		  border-left: 4px solid red;
	}

	.custom-context-menu ul {
		  list-style: none;
		  margin: 0;
		  padding: 0;
	}
</style>

<script type="text/javascript">
	var $original;
	if (typeof jQuery !== 'undefined') {
		$original = jQuery.noConflict(true);
		$ = $original;
		jQuery = $original;
	}

</script>
<script src="https://web.applozic.com/plugin/js/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Admin Chat Support</title>
</head>

<body id="page-top" style="margin-bottom: 0px; padding-bottom: 0px;">

<button  onclick=" homeRedirect()" style = "position:relative; left:-700px; margin-top:10px;">HOME</button>
          
		<section class = "full-view n-vis" id="full-view">
		<div class="mck-container">
		<div class="left mck-message-inner-left">
			<div class="panel-content">
				<div class="mck-box-top mck-row mck-wt-user-icon">
					<div class="blk-lg-3">
						<div id="mck-user-icon" class="mck-user-icon"></div>
					</div>
					<div class="blk-lg-7">
						<h4 id="mck-box-title" class="mck-box-title mck-truncate">Conversations</h4>
					</div>
					<div class="blk-lg-2 move-right mck-menu-item mck-text-right">
						<div class="mck-dropdown-toggle" data-toggle="mckdropdown"
							aria-expanded="true">
							<img src="https://web.applozic.com/plugin/images/icon-menu.png" class="mck-menu-icon"
								alt="Menu">
						</div>
						<ul id="mck-start-new-menu-box"
							class="mck-dropdown-menu mck-tab-menu-box menu-right" role="menu">
							<li><a href="#" target="_self" id="mck-msg-new" class="mck-contact-search menu-item"
								title="New Chat">New Chat</a></li>
							<li><a href="#" target="_self" class="mck-contact-search menu-item"
								title="Contacts">Contacts</a></li>
							<li><a href="#" target="_self" class="mck-group-search menu-item"
								title="Groups">Groups</a></li>
							<li><a href="#" target="_self" id="mck-new-group" class="menu-item"
								title="Create Group">Create Group</a></li>
						</ul>
					</div>
				</div>
				<div class="top">
					<span class="mck-search-icon"> <a href="#" target="_self" role="link"
						class="mck-tab-search"> <span class="mck-icon-search"></span>
					</a>
					</span> <input type="text" id="mck-search" data-provide="typeahead"
						placeholder="Search..."/>
				</div>
				<table id="table"  align="left  class="table" border="1"> </table>
				<div class="mck-panel-body">
					<div id="mck-contact-cell" class="mck-panel-cell">
						<div class="mck-panel-inner mck-contacts-inner">
							<ul id="mck-contact-list" 
								class="people mck-contact-list mck-nav mck-nav-tabs mck-nav-stacked">
						</div>
						<div id="mck-contact-loading" class="mck-loading">
							<img src="https://web.applozic.com/plugin/images/ring.gif">
						</div>
						<div id="mck-no-contact-text"
							class="mck-no-data-text mck-text-muted n-vis">No
							conversations yet!</div>
						<div id="mck-show-more-icon" class="mck-show-more-icon n-vis">
							<h3>No more conversations!</h3>
						</div>
					</div>
				</div>
				</ul>
			</div>
		</div>
		
		<div class="right fvc-toggle">
			<div class="panel-content">
				<div id="mck-tab-header" class="mck-box-top n-vis">
					<div id="mck-tab-individual" class="mck-tab-individual mck-row">
						<div class="blk-lg-8 mck-box-title">
							<div id="mck-group-tab-title" class="n-vis">
								<a id="mck-tab-info" href="#" target="_self" class="mck-tab-info">
							  <div class="mck-tab-title mck-truncate name"></div>
									<div class="mck-tab-status mck-truncate n-vis"></div>
									  <div class="mck-typing-box mck-truncate n-vis">
										<span class="name-text">typing...</span>
									</div>
								</a>
							</div>
							<div id="mck-individual-tab-title"
								class="mck-individual-tab-title">
								<div class="mck-tab-title mck-truncate name"></div>
								<div class="mck-tab-status mck-truncate n-vis"></div>
								 <div class="mck-typing-box mck-truncate n-vis">
									<span class="name-text">typing...</span>
								</div>
							</div>
						</div>
						<div id="mck-btn-video-call" class="mck-videocall-btn  blk-lg-2 n-vis"></div>
						<div class="blk-lg-2 move-right">
							<div id="mck-tab-menu" class="mck-menu-item mck-text-right">
								<div class="mck-dropdown-toggle" data-toggle="mckdropdown"
									aria-expanded="true">
									<img src="https://web.applozic.com/plugin/images/icon-menu.png" class="mck-menu-icon"
										alt="Tab Menu">
								</div>
								<ul id="mck-tab-menu-list"
									class="mck-dropdown-menu mck-tab-menu-box menu-right"
									role="menu">
									<li class="mck-tab-message-option vis"><a href="#" target="_self"
										id="mck-delete-button" class="mck-delete-button menu-item vis"
										title="Clear Messages"> Clear Messages </a></li>
									<li id="li-mck-block-user" class="vis"><a href="#" target="_self"
										id="mck-block-button" class="menu-item" title="Block User">Block
											User</a></li>
									<li id="li-mck-group-info" class="mck-group-menu-options n-vis"><a
										href="#" target="_self" id="mck-group-info-btn"
										class="menu-item mck-group-info-btn" title="Group Info">
											Group Info </a></li>
									<li id="li-mck-leave-group"
										class="mck-group-menu-options n-vis"><a href="#" target="_self"
										id="mck-leave-group-btn" class="menu-item" title="Exit Group">
											Exit Group </a></li>
								</ul>
							</div>

						</div>
					</div>
					
					<div id="mck-video-call-indicator" class="applozic-launchar n-vis row">
						        <div id="mck-video-call-icon" class="col-lg-3 mck-alpha-contact-image">
						            <span class="mck-contact-icon"></span>
						        </div>
						        <div id="mck-vid-btn" class="mck-vid-flex-box">
						           <div id="mck-video-call-indicator-txt" class="mck-video-call-indicator-txt"></div>
											 <div id="mck-call-btn-div" class= "col-lg-8">
			 						            <button id="mck-vid-receive-btn" class="mck-btn">Accept</button>
			 						            <button id="mck-vid-reject-btn" class="mck-btn">Reject</button>
			 						     </div>
										 </div>

						</div>
				</div>



				<div id="mck-product-group"
					class="mck-tab-panel mck-btn-group mck-product-group">
					<div id="mck-product-box"
						class="mck-product-box n-vis mck-dropdown-toggle"
						data-toggle="mckdropdown" aria-expanded="true">
						<div class="mck-row">
							<div class="blk-lg-10">
								<div class="mck-row">
									<div class="blk-lg-3 mck-product-icon"></div>
									<div class="blk-lg-9">
										<div class="mck-row">
											<div class="blk-lg-8 mck-product-title mck-truncate"></div>
											<div
												class="blk-lg-4 move-right mck-product-rt-up mck-truncate">
												<strong class="mck-product-key"></strong>:<span
													class="mck-product-value"></span>
											</div>
										</div>
										<div class="mck-row">
											<div class="blk-lg-8 mck-truncate mck-product-subtitle"></div>
											<div
												class="blk-lg-4 move-right mck-product-rt-down mck-truncate">
												<strong class="mck-product-key"></strong>:<span
													class="mck-product-value"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="blk-lg-2 mck-text-center">
								<span class="mck-caret n-vis"></span>
							</div>
						</div>
					</div>
					<ul id="mck-conversation-list"
						class="mck-dropdown-menu menu-right mck-conversation-list n-vis"
						role="menu"></ul>
				</div>
				<div class="mck-panel-body">
					<div id="mck-message-cell" style='height: 90%' class="mck-message-cell mck-panel-cell">
						<div id="conversation-section" class="conversation-section">
							<div class="chat mck-message-inner mck-panel-inner"
								data-mck-id="${contIdExpr}"></div>
							<div id="mck-msg-loading" class="mck-loading n-vis">
								<img src="https://web.applozic.com/plugin/images/ring.gif">
							</div>
							<div id="mck-no-more-messages"
								class="mck-no-more-messages mck-show-more-icon n-vis">
								<h3>No more messages!</h3>
							</div>
							
							
							<div id='star-message-body' class='star-message-pannel' >
							       
								<div ><i id='close-start-pannel' onclick="closeStarPannel()"
								class="fa-solid fa-xmark star-message-pannel-close"></i></div>
								<div id='start-messages'  style="padding-top: 3.5em;"></div>
								
								<div class="custom-context-menu">
								</div>
							</div>
						</div>
				</div>
				<div class="write">
					<!-- Create message send form -->
					<div id="mck-sidebox-ft" class="mck-box-ft mck-panel-ft mck-reply-body">
						<div class="mck-box-form mck-row n-vis">
							<div class="blk-lg-12">
								<p id="mck-msg-error" class="mck-sidebox-error n-vis"></p>
							</div>
							<div class="blk-lg-12">
								<p id="mck-msg-response" class="mck-box-response n-vis"></p>
							</div>
                             <div  id="mck-reply-to-div" class="n-vis">
									<button type="button" id="close"
							class="mck-box-close mck-close-panel move-right">
							<span aria-hidden="true">&times;</span>
						</button>
											<div id="mck-reply-to" class=" mck-msgto "></div>
                                            <div id="mck-reply-msg"> </div>
                                        </div>
							<div id="mck-write-box" class="blk-lg-12 mck-write-box">
								<form id="mck-msg-form" class="vertical mck-msg-form">
									<div class="mck-form-group n-vis">
										<label class="sr-only placeholder-text control-label"
											for="mck-msg-to">To:</label> <input class="mck-form-cntrl"
											id="mck-msg-to" name="mck-msg-to" placeholder="To" required>
									</div>

									<input id="mck-file-input" class="mck-file-input n-vis"
										type="file" name="files[]">
									<div id="mck-btn-attach" class="mck-btn-attach">
										<div class="mck-dropdown-toggle" data-toggle="mckdropdown"
											aria-expanded="true">
											<a href="#" target="_self" type="button" id="mck-btn-attach"
												class="write-link attach mck-btn-text-panel"
												aria-expanded="true" title="Attach File"> </a>
										</div>
										<ul id="mck-upload-menu-list"
											class="mck-dropup-menu mck-upload-menu-list" role="menu">
											<li><a id="mck-file-up" href="#" target="_self"
												class="mck-file-upload menu-item" title="File &amp; Photos">

													<img src="https://web.applozic.com/plugin/images/mck-icon-photo.png"
													class="menu-icon" alt="File &amp; Photos"> <span>Files
														&amp; Photos</span>
											</a></li>
											<li><a id="mck-btn-loc" href="#" target="_self" class="menu-item"
												title="Location"> <img
													src="https://web.applozic.com/plugin/images/mck-icon-marker.png" class="menu-icon"
													alt="Location"> <span>Location</span>
											</a></li>

										</ul>
									</div>
									<a href="#" target="_self" id="mck-file-up2" type="button"
										class="write-link attach n-vis mck-file-upload mck-btn-text-panel"
										title="Attach File"> </a>
										<a href="#" target="_self" id="mck-mike-btn" type="button"
										class="mck-mic-btn mck-mike-btn vis"
										title="Mic"></a>
									<a href="#" target="_self" id="stop-recording" class="mck-stop-btn n-vis "></a>
									<div id="audiodiv" class="mck-mic-timer n-vis">
							       <label id="mck-minutes">00</label>:<label id="mck-seconds">00</label>
                                    </div>
										 <span id="mck-text-box"
										contenteditable="true" class="mck-text-box mck-text required"></span>
										<a href="#" target="_self" type="submit"
										id="mck-msg-sbmt" class="write-link send mck-btn-text-panel"
										title="Send Message"></a>
									<a href="#" target="_self" type="button" id="mck-btn-smiley"
										class="write-link smiley mck-btn-smiley mck-btn-text-panel"
										title="Smiley"></a>
								</form>
							</div>
							<div class="blk-lg-12">
								<div id="mck-file-box" class="n-vis"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="mck-group-create-tab"
			class="mck-group-create-tab mck-panel-sm mck-panel n-vis">
			<div class="panel-content">
				<div class="mck-box-top">
					<div class="blk-lg-10">
						<div class="mck-box-title mck-truncate" title="Create Group">Create
							Group</div>
					</div>
					<div class="blk-lg-2">
						<button type="button" id="mck-group-create-close"
							class="mck-box-close mck-close-panel move-right">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div class="mck-box-body">
					<div class="mck-tab-cell">
						<div id="mck-group-create-panel"
							class="mck-tab-panel mck-message-inner mck-group-create-inner">
							<div class="mck-group-sub-sec">
								<div id="mck-group-create-icon-box"
									class="mck-group-create-icon-box mck-group-icon-box mck-hover-on">
									<div class="mck-group-icon"></div>
									<span class="mck-overlay-box">
										<div class="mck-overlay">
											<span class="mck-camera-icon"></span> <span
												class="mck-overlay-label">Add Group Icon</span>
										</div>
										<div id="mck-group-create-icon-loading"
											class="mck-loading n-vis">
											<img src="https://web.applozic.com/plugin/images/mck-loading.gif" />
										</div> <input id="mck-group-icon-upload"
										class="mck-group-icon-upload n-vis" type="file" name="files[]">
									</span>
								</div>
							</div>
							<div id="mck-group-create-name-sec" class="mck-group-sub-sec">
								<div id="mck-group-create-name-box"
									class="mck-row mck-group-name-box">
									<div class="blk-lg-12">
										<div class="mck-label">Group Title</div>
									</div>
									<div class="blk-lg-12">
										<div id="mck-group-create-title"
											class="mck-group-create-title mck-group-title"
											contenteditable="true">Group title</div>
									</div>
								</div>
							</div>
							<div id="mck-group-create-type-sec" class="mck-group-sub-sec">
								<div id="mck-group-create-type-box"
									class="mck-row mck-group-type-box">
									<div class="blk-lg-12">
										<div class="mck-label">Group Type</div>
									</div>
									<div class="blk-lg-12">
										<select id="mck-group-create-type" class="mck-select">
											<option value="2" selected>Public</option>
											<option value="1">Private</option>
											<option value="6">Open</option>
										</select>
									</div>
								</div>
							</div>
							<div id="mck-group-create-btn-sec" class="mck-group-sub-sec">
								<button type="button" id="mck-btn-group-create"
									class="mck-btn mck-btn-green mck-btn-group-create"
									title="Create Group">Create Group</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="mck-group-info-tab"
			class="mck-group-info-tab mck-panel-sm mck-panel n-vis">
			<div class="panel-content">
				<div class="mck-box-top">
					<div class="blk-lg-10">
						<div class="mck-box-title mck-truncate" title="Group Info">Group
							Info</div>
					</div>
					<div class="blk-lg-2">
						<button type="button" id="mck-group-info-close"
							class="mck-box-close mck-close-panel move-right">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div id="mck-group-detail-panel" class="mck-group-detail-box">
					<div class="mck-group-icon-sec">
						<div id="mck-group-info-icon-box"
							class="mck-group-icon-box mck-group-info-icon-box mck-hover-on">
							<div class="mck-group-icon"></div>
							<span class="mck-overlay-box n-vis">
								<div class="mck-overlay">
									<span class="mck-camera-icon"></span> <span
										class="mck-overlay-label">Change Group Icon</span>
								</div>
								<div id="mck-group-info-icon-loading" class="mck-loading n-vis">
									<img src="https://web.applozic.com/plugin/images/mck-loading.gif" />
								</div> <input id="mck-group-icon-change"
								class="mck-group-icon-change n-vis" type="file" name="file[]" />
							</span>
						</div>
						<div class="mck-text-center">
							<a id="mck-btn-group-icon-save" href="#" target="_self" role="link"
								class="mck-btn-group-icon-save n-vis" title="Click to save">
								<img src="https://web.applozic.com/plugin/images/mck-icon-save.png" alt="Save">
							</a>
						</div>
					</div>
					<div id="mck-group-name-sec" class="mck-group-name-sec">
						<div id="mck-group-name-box" class="mck-row mck-group-name-box">
							<div class="blk-lg-9">
								<div id="mck-group-title" class="mck-group-title"
									contenteditable="false">Group title</div>
							</div>
							<div class="blk-lg-3 mck-group-name-edit-icon">
								<a id="mck-group-name-edit" href="#" target="_self" role="link"
									class="mck-group-name-edit vis" title="Edit"> <img
									src="https://web.applozic.com/plugin/images/mck-icon-write.png" alt="Edit"></a> <a
									id="mck-group-name-save" href="#" target="_self" role="link"
									class="mck-group-name-save n-vis" title="Click to save"> <img
									src="https://web.applozic.com/plugin/images/mck-icon-save.png" alt="Save"></a>
							</div>
						</div>
					</div>
					<div id="mck-group-member-panel"
						class="mck-tab-panel mck-group-member-panel vis">
						<div class="mck-group-md-sec">
							<div class="mck-row mck-group-member-text">Members</div>
							<div id="mck-group-add-member-box"
								class="mck-row mck-group-admin-options mck-group-add-member-box n-vis">
								<a id="mck-group-add-member" class="mck-group-add-member"
									href="#" target="_self">
									<div class="blk-lg-3">
										<img src="https://web.applozic.com/plugin/images/mck-icon-add-member.png"
											alt="Add Member">
									</div>
									<div class="blk-lg-9">Add member</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="mck-box-body">
					<div class="mck-tab-cell">
						<div class="mck-group-member-inner">
							<ul id="mck-group-member-list"
								class="mck-group-member-list mck-contact-list mck-nav mck-nav-tabs mck-nav-stacked">
							</ul>
						</div>
					</div>
				</div>
				<div id="mck-group-update-panel"
						class="mck-tab-panel mck-group-update-panel n-vis">
						<div class="mck-group-bottom-sec">
							<div class="mck-row mck-group-update-sec">
								<button type="button" id="mck-btn-group-update"
									class="mck-btn mck-btn-green mck-btn-group-update"
									title="Update">Update</button>
							</div>
						</div>
					</div>
				<div id="mck-group-info-ft" class="mck-group-info-ft">
					<button type="button" id="mck-btn-group-exit"
						class="mck-btn mck-btn-blue mck-btn-group-exit" title="Exit Group">Exit
						Group</button>
				</div>
			</div>
		</div>
	</div>
	<div id="mck-loc-box" class="mck-box mck-loc-box mck-fade"
		aria-hidden="false">
		<div class="mck-box-dialog mck-box-md">
			<div class="mck-box-content">
				<div class="mck-box-top mck-row">
					<div class="blk-lg-10">
						<h4 class="mck-box-title">Location Sharing</h4>
					</div>
					<div class="blk-lg-2">
						<button type="button" class="mck-box-close" data-dismiss="mckbox"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div class="mck-box-body">
					<div class="mck-form-group">
						<div class="blk-lg-12">
							<input id="mck-loc-address" type="text" class="mck-form-control"
								placeholder="Enter a location" autocomplete="off">
						</div>
					</div>
					<div id="mck-map-content" class="mck-loc-content"></div>
					<div class="n-vis">
						<label class="blk-sm-2 mck-control-label">Lat.:</label>
						<div class="blk-sm-3">
							<input type="text" id="mck-loc-lat" class="mck-form-control">
						</div>
						<label class="blk-sm-2 mck-control-label">Long.:</label>
						<div class="blk-sm-3">
							<input type="text" id="mck-loc-lon" class="mck-form-control">
						</div>
					</div>
				</div>
				<div class="mck-box-footer">
					<button id="mck-my-loc" type="button"
						class="mck-my-loc mck-btn mck-btn-green">My Location</button>
					<button id="mck-loc-submit" type="button"
						class="mck-btn mck-btn-blue mck-loc-submit move-right">Send</button>
					<button type="button" class="mck-btn mck-btn-default move-right"
						data-dismiss="mckbox">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="mck-contact-search-box"
		class="mck-box mck-contact-search-box mck-sm-modal-box mck-fade"
		aria-hidden="false">
		<div class="mck-box-dialog mck-box-sm">
			<div class="mck-box-content">
				<div class="mck-box-top mck-row">
					<div class="blk-lg-10">
						<h4 class="mck-box-title" title="New Chat">New Chat</h4>
					</div>
					<div class="blk-lg-2">
						<button type="button" class="mck-box-close" data-dismiss="mckbox"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div id="mck-search-tab-box" class="mck-search-tab-box mck-row">
					<div class="blk-lg-12">
						<ul class="mck-nav mck-nav-panel">
							<li class="mck-nav-item mck-nav-divider"><a
								id="mck-contact-search-tab"
								class="mck-nav-link mck-contact-search active" href="#" target="_self"><strong>Contacts</strong></a></li>
							<li class="mck-nav-item"><a id="mck-group-search-tab"
								class="mck-nav-link mck-group-search" href="#" target="_self"><strong>Groups</strong></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="mck-box-body">
					<div class="mck-form-group">
						<div id="mck-contact-search-input-box"
							class="mck-input-group blk-lg-12">
							<input id="mck-contact-search-input" type="text"
								data-provide="typeahead" placeholder="Search..."/> <span
								class="mck-search-icon"><a href="#" target="_self" role="link"
								class="mck-contact-search-link"><span
									class="mck-icon-search"></span></a></span>
						</div>
						<div id="mck-group-search-input-box"
							class="mck-input-group blk-lg-12 n-vis">
							<input id="mck-group-search-input" type="text"
								data-provide="typeahead" placeholder="Search..."/> <span
								class="mck-search-icon"><a href="#" target="_self" role="link"
								class="mck-group-search-link"><span class="mck-icon-search"></span></a></span>
						</div>
					</div>
					<div class="mck-tab-cell">
						<div class="mck-message-inner">
							<ul id="mck-contact-search-list"
								class="mck-contact-list mck-contact-search-list mck-nav mck-nav-tabs mck-nav-stacked"></ul>
							<ul id="mck-group-search-list"
								class="mck-contact-list mck-group-search-list mck-nav mck-nav-tabs mck-nav-stacked n-vis"></ul>
							<div id="mck-no-search-contacts" class="mck-show-more-icon n-vis">
								<h3>No contacts yet!</h3>
							</div>
							<div id="mck-no-search-groups" class="mck-show-more-icon n-vis">
								<h3>No groups yet!</h3>
							</div>
							<div id="mck-search-loading" class="mck-loading n-vis">
								<img src="https://web.applozic.com/plugin/images/ring.gif">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
 
	<div id="mck-goup-search-box"
		class="mck-box mck-group-search-box mck-sm-modal-box mck-fade"
		aria-hidden="false">
		<div class="mck-box-dialog mck-box-sm">
			<div class="mck-box-content">
				<div class="mck-box-top mck-row">
					<div class="blk-lg-3">
						<img src="https://web.applozic.com/plugin/images/mck-icon-add-member.png" alt="Add Member">
					</div>
					<div class="blk-lg-7">
						<h4 class="mck-box-title">Add Member</h4>
					</div>
					<div class="blk-lg-2">
						<button type="button" class="mck-box-close" data-dismiss="mckbox"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div class="mck-box-body">
					<div class="mck-form-group">
						<div class="mck-input-group blk-lg-12">
							<input id="mck-group-member-search" type="text"
								data-provide="typeahead" placeholder="Search..."/> <span
								class="mck-search-icon"><a href="#" target="_self" role="link"
								class="mck-group-member-search-link"><span
									class="mck-icon-search"></span></a></span>
						</div>
					</div>
					<div class="mck-tab-cell">
						<div class="mck-message-inner">
							<ul id="mck-group-member-search-list"
								class=" mck-contact-list mck-group-search-list mck-nav mck-nav-tabs mck-nav-stacked"></ul>
							<div id="mck-no-gsm-text"
								class="mck-no-data-text mck-text-muted n-vis">No Users!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="mck-video-box">
	    <div class="container applozic-vid-container n-vis">
	        <div class="row">
	            <div id="mck-vid-media" class="col-lg-12">
	                <div id="mck-audio-call-icon center-block"></div>
	            </div>
	        </div>
	    </div>
	    <div id="mck-vid-div-overlay" class="container applozic-vid-container n-vis">
	        <div class="row mck-vid-overlay-header">
	            <div id="mck-vid-icon" class="centered n-vis"><span></span></div>
	        </div>
	        <div class="row mck-vid-overlay-footer mck-flex-footer">
	            <div class="mck-vid-scr-controls">
	                <div class="footer-controls pull-right">
	                    <button id="mck-microfone-mute-btn" class="btn-controls">
	                        <svg id="mck-unmute-icon" class="mck-unmute-icon" focusable="false" height="24px" viewBox="0 0 24 24" width="24px" xmlns="http://www.w3.org/2000/svg">
	                            <path d="M12 14c1.66 0 2.99-1.34 2.99-3L15 5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3zm5.3-3c0 3-2.54 5.1-5.3 5.1S6.7 14 6.7 11H5c0 3.41 2.72 6.23 6 6.72V21h2v-3.28c3.28-.48 6-3.3 6-6.72h-1.7z" />
	                        </svg>
	                        <svg id="mck-mute-icon" class="mck-mute-icon" focusable="false" height="24px" viewBox="0 0 24 24" width="24px" xmlns="http://www.w3.org/2000/svg">
	                            <path d="M19 11h-1.7c0 .74-.16 1.43-.43 2.05l1.23 1.23c.56-.98.9-2.09.9-3.28zm-4.02.17c0-.06.02-.11.02-.17V5c0-1.66-1.34-3-3-3S9 3.34 9 5v.18l5.98 5.99zM4.27 3L3 4.27l6.01 6.01V11c0 1.66 1.33 3 2.99 3 .22 0 .44-.03.65-.08l1.66 1.66c-.71.33-1.5.52-2.31.52-2.76 0-5.3-2.1-5.3-5.1H5c0 3.41 2.72 6.23 6 6.72V21h2v-3.28c.91-.13 1.77-.45 2.54-.9L19.73 21 21 19.73 4.27 3z" />
	                        </svg>						
	                    </button>
	                    <button id="mck-vid-disconnect" class="btn-controls">
	                        <svg class="mck-disconnect-icon" xmlns="http://www.w3.org/2000/svg" focusable="false" width="24px" height="24px" viewBox="0 0 24 24" class=" A1NRff">
	                            <path d="M12 9c-1.6 0-3.15.25-4.6.72v3.1c0 .39-.23.74-.56.9-.98.49-1.87 1.12-2.66 1.85-.18.18-.43.28-.7.28-.28 0-.53-.11-.71-.29L.29 13.08c-.18-.17-.29-.42-.29-.7 0-.28.11-.53.29-.71C3.34 8.78 7.46 7 12 7s8.66 1.78 11.71 4.67c.18.18.29.43.29.71 0 .28-.11.53-.29.71l-2.48 2.48c-.18.18-.43.29-.71.29-.27 0-.52-.11-.7-.28-.79-.74-1.69-1.36-2.67-1.85-.33-.16-.56-.5-.56-.9v-3.1C15.15 9.25 13.6 9 12 9z"></path>
	                        </svg>
	                    </button>
	                </div>
	            </div>
	            
                                                    
								<div id="local-media" class="n-vis"></div>

	        </div>
	    </div>
	</div>
	
	<!-- Dummy div as js is dependent on mck-sidebox -->
	<div id="mck-sidebox"></div>
</section>
<!-- Video Call dependencies -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.0.2/howler.min.js"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/app/call/mck-ringtone-service.js"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/twilio-video.js"></script>

<!-- Video Call dependencies -->
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/viewer.js"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/applozic.plugins.min.js"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/applozic.widget.min.js"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/applozic.emojis.min.js"></script>

	<!-- JS for location sharing plugin, remove it if location sharing not required -->
	<script type="text/javascript"
		src="https://maps.google.com/maps/api/js?key=AIzaSyDKfWHzu9X7Z2hByeW4RRFJrD9SizOzZt4&libraries=places"></script>
	<script type="text/javascript" src="https://web.applozic.com/plugin/js/locationpicker.jquery.min.js"></script>

	<!--JS for auto suggest plugin, use it if auto suggestions required -->
	<!-- 	<script type="text/javascript" src="autosuggest/js/jquery.caret.min.js"></script>
	    <script type="text/javascript" src="autosuggest/js/jquery.atwho.min.js"></script> -->

	<script type="text/javascript" src="https://web.applozic.com/plugin/js/app/modules/applozic.jquery.js"></script>
	<!-- remomve comment from below file to usey applozic.chat.min.js file from repository and comment out cdn file -->
	<!-- <script type="text/javascript" src="https://web.applozic.com/plugin/https://web.applozic.com/plugin/applozic.chat.min.js"></script> -->
	<script type="text/javascript" src="https://cdn.applozic.com/applozic/applozic.chat-6.1.min.js"></script>
	<script type="text/javascript" src="assets/js/applozic.fullview.js"></script>

	<script type="text/javascript">
		var oModal = "";
		if (typeof $original !== 'undefined') {
			$ = $original;
			jQuery = $original;
			if (typeof $.fn.modal === 'function') {
				oModal = $.fn.modal.noConflict();
			}
		} else {
			$ = $applozic;
			jQuery = $applozic;
			if (typeof $applozic.fn.modal === 'function') {
				oModal = $applozic.fn.modal.noConflict();
			}
		}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://web.applozic.com/plugin/js/Media/recorder.js"></script>
	<script src="https://web.applozic.com/plugin/js/Media/Fr.voice.js"></script>
	<script src="https://web.applozic.com/plugin/js/Media/app.js"></script>

	<script type="text/javascript">
	function displayMessageCall(e){
		var sapid = e.parentElement.parentElement.parentElement.parentElement.getAttribute("data-mck-id");
		displayStarMessage( sapid );	
		};
	function starMessage(e){
		
		var text = e.parentElement.parentElement.previousElementSibling.firstElementChild.lastElementChild.lastElementChild.lastElementChild.innerHTML; 
		var msg_id = e.parentElement.parentElement.parentElement.getAttribute("data-msgkey");
// 		console.log("1",text);
		var sapid = e.parentElement.parentElement.parentElement.parentElement.getAttribute("data-mck-id");
		
		console.log("1",sapid);
		var isGrp = e.parentElement.parentElement.parentElement.parentElement.getAttribute("data-isgroup");
		var time = e.parentElement.parentElement.parentElement.getAttribute("data-msgtime");
		var myDate = new Date(time*1);
		var d = myDate.toLocaleString(); // 01/10/2020, 10:35:02
		var name =  e.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.getAttribute("title");
		var cc ='${userId}';
		console.log("ss",name);
		var msgStar ={
				messageId : msg_id,
				sapId : sapid,
				message : text,
				userId : cc,
				isGroup :isGrp,
				date: d,
 				name: name
				}
		console.log("2",msgStar);
		$.ajax({
	        type : "POST",
	        contentType : "application/json",   
	        url : "/ltidemo/starMessage",
	        data : JSON.stringify(msgStar),    
 	      	
	        success : function(data) {
	            console.log("SUCCESS: ",data);
	            alert(data);
		        displayStarMessage( sapid ); 
	        },
	        error : function(e) {
	            console.log("ERROR: ", e);  
	        },
	        done : function(e) {
	            console.log("DONE");
	        }
	    });
	}

	function displayStarMessage( sapid ){
// 		console.log("ss", sapid );
		var d = {sapId : sapid};

		$.ajax({
	        type : "POST",
	        contentType : "application/json",   
	        url : "/ltidemo/displayMessage",
	        data : JSON.stringify(d),    
	        
	        success : function(data) {
// 		        console.log(sapid)
	        	showMessage(data, sapid);   
	        },
	        error : function(e) {
	            console.log("ERROR: ", e);  
	        }
	    });	
 		
	}
	
 	function showMessage( data, sapid ) {
 		
 		$('#start-messages').empty()
 		
 		if( typeof data !== 'undefined' && data.length !== 0 ){
 			
	 	 	for( i = 0; i < data.length; i++) {
	 	 		
	 	 		//console.debug('message: '+JSON.stringify(data[i]))
	 	 		
	 	 		let messageInstance = data[i].message
	 	 		let datetime = data[i].date
	 	 		var myDate = new Date(datetime);
	 	 		var ms = myDate.getTime();
	 	 		let messageId = data[i].messageId;
	 	 		//console.log(messageId);

	 	 		let messageWithTime = '<div id=card-'+messageId+ ' class=stared-message data-messageId='+messageId+' data-sapid='+sapid+ '>'+
	 	 				'<div class=message-body >'+messageInstance+ '<br><div style="float:left;padding-top: 15px;">'+
	 	 				datetime+'</div></div></div> <br><br>';

	
	 	 		$('#start-messages').append(messageWithTime);
	 	 		
	 			const noContext = document.getElementById('card-'+messageId);
	 			
	 			noContext.addEventListener('contextmenu', e => {
		 				e.preventDefault();
		 				 
		 				$('.custom-context-menu').empty()
		 		 		
		 				const card = document.querySelector('#card' + messageId);
		 		 		
		 				const customContextMenu = document.querySelector(".custom-context-menu");
		 				
		 				let menu = '<div class=mck-m-b data-msgkey='+messageId+'>'+
		 					'<ul id=ul-menu> <li> <a class=mck-message-reply >Reply</a> </li>'+
		 						'<li><a  onclick=unstarMessage("'+messageId+'","'+sapid+'")>Unstar</a></li> </ul> </div>';
		 				
		 				$('.custom-context-menu').append(menu);
		 				 
	 		  			let topPosition = e.clientY;
	 		 			let leftPosition = e.clientX;
	 		 	 		customContextMenu.classList.add("active");
	 		 	 		
		 				window.addEventListener("click", () => {
		 				  customContextMenu.classList.remove("active");
		 				});
		 				
	 				});
	 			
	 	 	}
	 	 	
	 	}else{
	 	
	 		let messageWithTime = '<div style="font-size:1.5em; padding-top: 60%;"> No star message! </div> <br><br>'
	 		
 	 		$('#start-messages').append(messageWithTime);
	 		
	 	}
 		
		$('#star-message-body').slideDown();
		
 	}	
	
 	function closeStarPannel(){

		$('#star-message-body').slideUp();
		
 	}
	function unstarMessage( messageId, sapid ) {
	
		var data = { messageId : messageId }

		$.ajax({
			type : "POST",
			contentType : "application/json",
		    url : "/ltidemo/unstarMessage",
		    data : JSON.stringify(data),  
		    success : function(data) {
		    	
		        displayStarMessage( sapid ); 
		        	
		    },
			error : function(e) {
				
				console.log("ERROR: ", e);
				alert("Please Refresh The Page.")
				
			}
		});	
	}
	
	function homeRedirect() {
		  location.replace("/ltidemo/FacultyTimeline");
		}
	
	try{
	intializeChat('${userId}');
	}
	catch(err) {
		alert("Something went wrong please try again");
		}
	/**
	 *this method logs in a user.
	 */
	function intializeChat( userId ) {
		
		//console.debug('in intializeChat: '+userId)

		window.Applozic.AlCustomService.logout(); 

		$applozic.fn.applozic({
	    	baseUrl : 'https://apps.applozic.com',
	        appId: '3188af863b45ee48f80292c154e498a5f', //Get your application key from https://www.applozic.com
	        userId: userId, //Logged in user's id, a unique identifier for user
	        userName: '', //User's display name
	        imageLink: '', //User's profile picture url
	        email: '', //optional
	        contactNumber: '', //optional, pass with internationl code eg: +13109097458
	        desktopNotification: true,
	        source: '1', // optional, WEB(1),DESKTOP_BROWSER(5), MOBILE_BROWSER(6)
			customFileUrl:'https://googleupload.applozic.com', //optional,  google cloud file upload url
			//genereateCloudFileUrl: "https://googleupload.applozic.com/files/url?key={key}", //optional,  generate viewable link for a file incase of file upload on google cloud
	        notificationIconLink: 'https://www.applozic.com/favicon.ico', //Icon to show in desktop notification, replace with your icon
	        authenticationTypeId: 0, //1 for password verification from Applozic server and 0 for access Token verification from your server
			notificationSoundLink : "https://web.applozic.com/plugin/audio/notification_tone.mp3",
			accessToken: 'Newuser@123', //optional, leave it blank for testing purpose, read this if you want to add additional security by verifying password from your server https://www.applozic.com/docs/configuration.html#access-token-url
	        locShare: true,
	        googleApiKey: "AIzaSyDKfWHzu9X7Z2hByeW4RRFJrD9SizOzZt4", // your project google api key
	        googleMapScriptLoaded: false, // true if your app already loaded google maps script
	        //   mapStaticAPIkey: "AIzaSyCWRScTDtbt8tlXDr6hiceCsU83aS2UuZw",
			// video: true,
			//   emojilibrary: true, // true if you want to load emoticons in chat
			fileupload : "googleServer", // awsS3Server  or googleCloud or googleServer or customStorage,
	        autoTypeSearchEnabled: false, // set to false if you don't want to allow sending message to user who is not in the contact list
	        loadOwnContacts: true, //set to true if you want to populate your own contact list (see Step 4 for reference)
	        olStatus: true, //set to true for displaying a green dot in chat screen for users who are online
	        onInit: function(response) {

	        	if (response.status === "success") {
	            
	        		document.getElementById("full-view").classList.remove('n-vis');
	                document.getElementById("full-view").classList.add('vis');
					document.getElementsByTagName("body")[0].style.background= 'url("https://web.applozic.com/plugin/images/image.jpg")';

					if( "${loadPrivateChat}" == "true" )
						$applozic.fn.applozic('loadTab', '${loadPrivateChatWith}');
					else
	                    $applozic.fn.applozic('loadTab', '');
	                            
// 					calling function load contacts

					$.ajax({
						type:"POST",
						url: "/ltidemo/getContactsForChat",//get contacts for chat
						data : JSON.stringify({
								'sapId' : userId
						}), // our data object,
						contentType:'application/json',
						success	: function(data){
							//console.log("Loading contacts")
							var contactsList = []
								data.forEach((contact) => {
								let newContact = {
									userId: contact.sapId, 
									displayName: contact.firstName + " " + contact.lastName +" ( "+ contact.sapId + ", " +
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

			contactDisplayName: function(otherUserId) {
	             //return the display name of the user from your application code based on userId.
	             return "";
	        },
	        contactDisplayImage: function(otherUserId) {
	              //return the display image url of the user from your application code based on userId.
	              return "";
	        },
	        onTabClicked: function(response) {
	              // write your logic to execute task on tab load
	              //   object response =  {
	              //    tabId : userId or groupId,
	              //    isGroup : 'tab is group or not'
	              //  }
	        }
	        
		});
		
	}

	  function readMessage() {
	    //console.log(userId);
	  }
	  //Callback Function to return display name by userId
	  /*  function displayName(userId) {
	        //Todo: replace this with users display name
	        var contact = contacts[userId];   // contacts sample given above
	        if (typeof contact !== 'undefined') {
	            return contact.displayName;
	        }
	    }*/
	  //Callback Function to return contact image url by userId
	  /*  function contactImageSrc(userId) {
	        var contact = contacts[userId]; // contacts sample given above
	        if (typeof contact !== 'undefined') {
	            return contact.imageLink;
	        }
	    }*/
	  //callback function execute after plugin initialize.
	  function onInitialize(response,data) {
	    if (response.status === 'success') {

	      // $applozic.fn.applozic('loadContacts', {'contacts':contactsJSON});
	      // $applozic.fn.applozic('loadTab', 'shanki.connect');
	      //write your logic exectute after plugin initialize.
	    } else {
	      alert(response.errorMessage);
	    }
	  }
	  // Examples shows how to define variable for auto suggest
	  var autoSuggest = {
	    queries : [ {
	      name : "How to integrate?",
	      content : "How to integrate Applozic SDK?"
	    }, {
	      name : "Android",
	      content : "https://www.applozic.com/docs/android-chat-sdk.html"
	    }, {
	      name : "iOS",
	      content : "https://www.applozic.com/docs/ios-chat-sdk.html"
	    }, {
	      name : "Web Plugin",
	      content : "https://www.applozic.com/docs/web-chat-plugin.html"
	    } ],
	    templates : [ {
	      name : "I am busy. I will call you later",
	      content : "I am busy. I will call you later"
	    }, {
	      name : "I'm in a meeting.",
	      content : "I'm in a meeting."
	    }, {
	      name : "Where are You?",
	      content : "Where are You?"
	    }, {
	      name : "Please reply ASAP. It's Urgent.",
	      content : "Please reply ASAP. It's Urgent."
	    }, {
	      name : "I'm on my way home",
	      content : "I'm on my way home"
	    }, {
	      name : "I'm coming",
	      content : "I'm coming"
	    } ]
	  };

	</script>
</body>
</html>