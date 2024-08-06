$(document).on('click', '.cancel_embed', function() {
	var thisForm = $(this).closest("form");
	thisForm.find(".embeded_div").hide();
	thisForm.find('.embed_image').val();
	thisForm.find('.embed_title').val();
	thisForm.find('.embed_description').val();
	thisForm.find('.embed_url').val();
});
$(document).on('click','.attach_icon',function(event) {$("#id_url").val("");});
$('.attach_embeded')
		.bind(
			'click',
			function(e) {
				var thisForm = $(this).closest("form");
				$('#attach_link_modal').modal('hide');
				thisForm.find(".embeded_div").show();
				var target = thisForm.find('#id_url').val();
				$
						.ajax({
							url : "https://api.linkpreview.net/?key=5ccd799a0c25cfc395033ebd2b94ee073c8328fa18473&q="
									+ target,
							async : true,
							success : function(data) {
								console.log(data);
								var image=(data.image!="")?data.image:"assets/images/preview/noPreview.jpg";
								
								thisForm.find('.embed_image').attr("src",
										image);
								thisForm.find('.embed_image').val(
										data.image);
								thisForm.find('.embed_title').html(
										data.title);
								thisForm.find('.embed_title').val(
										data.title);
								thisForm.find('.embed_description').html(
										data.description);
								thisForm.find('.embed_description').val(
										data.description);
								thisForm.find('.embed_url').html(data.url);
								thisForm.find('.embed_url').val(data.url);
							},
							error : function(e) {
								alert("this link not found");
								$(".embeded_div").hide();
							}
						});
					return false;
				});