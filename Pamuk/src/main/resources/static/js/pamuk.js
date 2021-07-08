/**
 * 개인이 작성한 JS 는 이렇게 따로 작성 부탁드립니다. 
*/
$(document).ready( function(){
	// alert("pamuk");
	// css 의 기존 banner top 받아온다.  'px' 를 제외하고 받기위해 parseInt 처리해준다.
	let bannerPosition = parseInt( $("#scrollBanner").css("top") );
	
	// window의 scroll event 발생시 처리 
	$(window).scroll( function(){
		let curPosition = $(window).scrollTop();
		let newPosition = curPosition + bannerPosition + "px";
	// event 실행되는거 stop 하고 animate 처리
	$("#scrollBanner").stop().animate({
		"top": newPosition
		}, 500);	
	}).scroll();
});