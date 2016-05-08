// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){
	var takePicture = $('#upload_file');

	takePicture.change(function(event) {
		console.log('hit')
		$('#post_button').removeClass('disabled');
		$('#caption_box').toggle();
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