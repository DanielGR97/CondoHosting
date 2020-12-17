
$(document).ready(function(){
	$('.menu li:has(ul)').click(function(e){
		e.preventdefault();


		if ($('this').hasClass('activado')){
			// $('this').removeClass('activado');	
		}else{
			$('.menu li ul').slideUp(); 
			$('.menu li').removeClass('activado');
			$('this').addClass('activado');
			$('this').children('ul').slideDown();

		}
	});
});