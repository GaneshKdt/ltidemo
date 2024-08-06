(function($) {
  defaults = { 
    formDataKey: "files",
    buttonText: '<i class="far fa-file-alt fs-18 text-muted" title="Attach File"></i>',
    buttonClass: "file-preview-button",
    shadowClass: "file-preview-shadow",
    tableCss: "file-preview-table",
    tableRowClass: "file-preview-row",
    placeholderClass: "file-preview-placeholder",
    loadingCss: "file-preview-loading",
    tableTemplate: function() {
      return "<table class='table table-light table-hover table-responsive w-100 d-block d-md-table file-preview-table' id='file-preview-table'>" +
	       "<tbody></tbody>" +
	     "</table>";   
    },   
    rowTemplate: function(options) {
      return "<tr class='" + config.tableRowClass + "' >" + 
	       "<td>" + "<img src='" + options.src + "' class='" + options.placeholderCssClass + "' />" + "</td>" +
	       "<td class='filename'>" + options.name + "</td>" +
	       "<td class='filesize'>" + options.size + "</td>" +
	       "<td class='remove-file'><button class='btn btn-light btn-sm'><i class='fa fa-trash ' style='color:red' aria-hidden='true'></i></button></td>" +
	     "</tr>";
    },
    nonImageTemplate: function(options) {
        return "<tr class='" + config.tableRowClass + "' >" + 
  	       "<td>" + "<div  class='" + options.placeholderCssClass + "'><div/>" + "</td>" +
  	       "<td class='filename'>" + options.name + "</td>" +
  	       "<td class='filesize'>" + options.size + "</td>" +
  	       "<td class='remove-file'><button class='btn btn-light btn-sm'><i class='fa fa-trash ' style='color:red' aria-hidden='true'></i></button></td>" +
  	     "</tr>";
      },
    loadingTemplate: function() {
      return "<div id='file-preview-loading-container'>" +
	       "<div id='"+config.loadingCss+"' class='loader-inner ball-clip-rotate-pulse no-show'>" +
		 "<div></div>" +
		 "<div></div>" +
	       "</div>" +
	     "</div>";
    }
  }

  //NOTE: Depends on Humanize-plus (humanize.js)
  if(typeof Humanize == 'undefined' || typeof Humanize.filesize != 'function'){
    $.getScript("https://cdnjs.cloudflare.com/ajax/libs/humanize-plus/1.5.0/humanize.min.js")
  }

  var getFileSize = function(filesize) {
    return Humanize.fileSize(filesize);
  };

  // NOTE: Ensure a required filetype is matching a MIME type
  // (partial match is fine) and not matching against file extensions.
  //
  // Quick ref:  http://www.sitepoint.com/web-foundations/mime-types-complete-list/
  //
  // NOTE: For extended support of mime types, we should use https://github.com/broofa/node-mime
  var getFileTypeCssClass = function(filetype) {
    var fileTypeCssClass;
    fileTypeCssClass = (function() {
      switch (true) {
	case /video/.test(filetype):
	  return 'video';
	case /audio/.test(filetype):
	  return 'audio';
	case /pdf/.test(filetype):
	  return 'pdf';
	case /csv|excel|xls|xlsx/.test(filetype):
	  return 'spreadsheet';
	case /powerpoint|ppt|pptx|presentation/.test(filetype):
	  return 'powerpoint';
	case /msword|docx|doc|text/.test(filetype):
	  return 'document';
	case /zip/.test(filetype):
	  return 'zip';
	case /rar/.test(filetype):
	  return 'rar';
	default:
	  return 'default-filetype';
      }
    })();
    return defaults.placeholderClass + " " + fileTypeCssClass;
  };

  $.fn.uploadPreviewer = function(options, callback) {
    var that = this;    
    if (!options) { 
      options = {};
    }
    config = $.extend({}, defaults, options);
    var buttonText,
	previewRowTemplate,
	previewNonImageTemplate,
	previewTable,
	previewTableBody,
	previewTableIdentifier,
	currentFileList = [];

    if (window.File && window.FileReader && window.FileList && window.Blob) {

      this.wrap("<span class='btn btn-light " + config.shadowClass + "'></span>");
      buttonText = this.parent("." + config.shadowClass);
      buttonText.prepend("<span>" + config.buttonText + "</span>");
      buttonText.wrap("<span class='" + config.buttonClass + "'></span>");

      previewTableIdentifier = options.preview_table;
      if (!previewTableIdentifier) {
	$("span." + config.buttonClass).before(config.tableTemplate());
	previewTableIdentifier = "table." + config.tableCss;
      }

      previewTable =  $(that).closest('div').find(".file-preview-table");               
      previewTableBody = previewTable.find("tbody");      
      previewTable.addClass(config.tableCss);
      previewTableBody = previewTable.find("tbody");

      previewRowTemplate = options.preview_row_template || config.rowTemplate;
      previewNonImageTemplate= options.preview_row_template || config.nonImageTemplate;

      previewTable.after(config.loadingTemplate());

      previewTable.on("click", ".remove-file", function() {
	var parentRow = $(this).parent("tr");
	var filename = parentRow.find(".filename").text();
	for (var i = 0; i < currentFileList.length; i++) {
	  if (currentFileList[i].name == filename) {
	    currentFileList.splice(i, 1);
	    break;
	  }
	}
	parentRow.remove();
	$("#file").val("");    
	$.event.trigger({ type: 'file-preview:changed', files: currentFileList });
      });

      this.on('change', function(e) {
	var loadingSpinner = $("#" + config.loadingCss);
	loadingSpinner.show();

	var reader;
	var filesCount = e.currentTarget.files.length;
	$.each(e.currentTarget.files, function(index, file) {
	  currentFileList.push(file);
	  reader = new FileReader();
	  reader.onload = function(fileReaderEvent) {
	    var filesize, filetype, imagePreviewRow, placeholderCssClass, source;
    	
	    console.log('File Size in KB :'+file.size)
    
    	if (file.size >= 209715200) {
			alert('The selected file size is too large. Please select a file less than 200 MB.');
			$('#file').val('');
			return false;
		}
		
	    if (previewTableBody) {
	      filetype = file.type;
	      if (/image/.test(filetype)) {
		source = fileReaderEvent.target.result;
		placeholderCssClass = config.placeholderClass + " image";
		
		 filesize = getFileSize(file.size);
	      imagePreviewRow = previewRowTemplate({
		src: source,
		name: file.name,
		placeholderCssClass: placeholderCssClass,
		size: filesize
	      });
	      
	      } else {
		placeholderCssClass = getFileTypeCssClass(filetype);
		
		 filesize = getFileSize(file.size);
	      imagePreviewRow = previewNonImageTemplate({
		name: file.name,
		placeholderCssClass: placeholderCssClass,
		size: filesize
	      });
	      }
	     

	      previewTableBody.html(imagePreviewRow);

	      if (index == filesCount - 1) {
		loadingSpinner.hide();
	      }
	    }
	    if (callback) {
	      callback(fileReaderEvent);
	    }
	  };
	  reader.readAsDataURL(file);
	});

	$.event.trigger({ type: 'file-preview:changed', files: currentFileList });
      });

      this.fileList = function() {
	return currentFileList;
      }

      this.clearFileList = function() {
	$('.remove-file').click();
      }

      this.url = function(url) {
	if (url != undefined) {
	  config.url = url;
	} else {
	  return config.url;
	}
      }

      this._onComplete = function(eventData) {
	eventData['type'] = 'file-preview:submit:complete'
	$.event.trigger(eventData);
      }

      this.submit = function(successCallback, errorCallback) {
	if (config.url == undefined) throw('Please set the URL to which I shall post the files');

	if (currentFileList.length > 0) {
	  var filesFormData = new FormData();
	  currentFileList.forEach(function(file) {
	    filesFormData.append(options.formDataKey + "[]", file);
	  });

	  $.ajax({
	    type: "POST",
	    url: config.url,
	    data: filesFormData,
	    contentType: false,
	    processData: false,
	    xhr: function() {
	      var xhr = new window.XMLHttpRequest();
	      xhr.upload.addEventListener("progress", function(evt) {
		if (evt.lengthComputable &&
		    options != null &&
		    options.uploadProgress != null
		    && typeof options.uploadProgress == "function") {
		  options.uploadProgress(evt.loaded / evt.total);
		}
	      }, false);
	      return xhr;
	    },
	    success: function(data, status, jqXHR) {
	      if (typeof successCallback == "function") {
		successCallback(data, status, jqXHR);
	      }
	      that._onComplete({ data: data, status: status, jqXHR: jqXHR });
	    },
	    error: function(jqXHR, status, error) {
	      if (typeof errorCallback == "function") {
		errorCallback(jqXHR, status, error);
	      }
	      that._onComplete({ error: error, status: status, jqXHR: jqXHR });
	    }
	  });
	} else {
	  console.log("There are no selected files, please select at least one file before submitting.");
	  that._onComplete({ status: 'no-files' });
	}
      }

      return this;

    } else {
      throw "The File APIs are not fully supported in this browser.";
    }
  };
})(jQuery);

var getImageByFileType = function(filetype) {
    var fileTypeCssClass;
    fileTypeCssClass = (function() {
      switch (true) {
	case /video/.test(filetype):
	  return 'assets/images/preview/video.png';
	case /audio/.test(filetype):
	  return 'assets/images/preview/audio.png';
	case /pdf/.test(filetype):
	  return 'assets/images/preview/pdf.png';
	case /csv|excel/.test(filetype):
	  return 'assets/images/preview/spreadsheet.png';
	case /xls|xlsx/.test(filetype):  
		  return 'assets/images/preview/xls.png';       
	case /powerpoint|pptx|ppt/.test(filetype):
	  return 'assets/images/preview/powerpoint.png';
	case /msword|text|docx|doc/.test(filetype):
	  return 'assets/images/preview/document.png';
	case /zip/.test(filetype):
	  return 'assets/images/preview/zip.png';
	case /rar/.test(filetype):
	  return 'assets/images/preview/rar.png';
	default:
	  return 'default-filetype';
      }
    })();
    return fileTypeCssClass;
  };
