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


// function submitPhotoHandler(){
// 	$('#photoSubmission').submit(function(event){
// 		event.preventDefault();
// 		caption = $("input[name='caption'").val();
// 		photo = $('#upload-file')[0].files[0];
// 		var response = $.ajax({
// 			method: 'POST',
// 			url: '/',
// 			data: {'caption': caption, 'photo': photo}
// 		});
// 	})
// };