
// 게시물 상세 페이지 이동
$(function() {
	$(".card").click(function() {
		location.href = "/views/auction/auctionDetailPage.jsp";
	});
});

// 게시물 상세 페이지 사진 변경
$(function() {
	var mainSrc = $("#main-img>img").attr("src");

	$(".sub-img>img").click(function() {
		var mSrc = $("#main-img>img").attr("src");
		var subSrc = $(this).attr("src");
		if (mSrc == subSrc) {
			$("#main-img>img").attr("src", mainSrc);
			$(this).css("box-shadow", "");
		} else {
			$("#main-img>img").attr("src", subSrc);
			$(".sub-img>img").css("box-shadow", "");
			$(this).css("box-shadow", "0px 0px 10px #A4A4A4");
		}
	});

});

// 관심 상품 등록
$(function() {
	var result;
	$("#InterestedBtn").click(function() {
		if (result == null) {
			result = confirm('관심상품으로 등록 하시겠습니까?');
			if (result == true) {
				$(this).attr("class", "btn btn-warning float-right");
			} else {
				result = null;
			}
			
		}else{
			if(result == true)
				{
					result = confirm('관심상품등록을 취소 하시겠습니까?');
					if(result == true)
						{
						$(this).attr("class", "btn btn-secondary float-right");
						result = null;
						}
				} else {
					result = true;
				}
		}
	});
});