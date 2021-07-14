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
	
	// recipe 수정 버튼
	// 레시피 저장 X -> 저장 O
	$(".saveBtn.off").on("click", function(){
		// alert("ok");
		$(".saveBtn.off").hide();
		$(".saveBtn.on").show();
	});
	// 레시피 저장 O -> 저장 x
	$(".saveBtn.on").on("click", function(){
		// alert("ok");
		$(".saveBtn.on").hide();
		$(".saveBtn.off").show();
	});
	
	$(".modifyBtn").on("click", function(){
		// alert("수정을 해봐요~~");
		$.ajax({
				type:"get",
				url:"recipeCountByCategory",
				dataType:"json",
				data:"category=" + $category,
				success:function(totalRecipeCount){
					let EditForm ="";
					
					$("#totalCount").html("총 <span>" + totalRecipeCount +"</span>개의 맛있는 레시피가 있습니다 !");
				},// success
				error:function(request,status,error){
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }// error			
		}); // ajax
	}) // on
});