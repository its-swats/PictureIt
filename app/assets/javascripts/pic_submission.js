// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){
	var takePicture = $('#upload-file');
	takePicture.change(function(event) {
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