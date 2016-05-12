// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){

	var takePicture = $('#upload_file');
	
	takePicture.change(function(event) {
		$('#post_button').removeClass('disabled');
		$('#caption_box').attr('placeholder', 'Caption It!');
		$('#caption_box').removeClass('no_display');
		$('#caption_box').addClass('yes_display');
	});
});
