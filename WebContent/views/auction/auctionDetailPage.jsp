<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="hotsix.goodseller.user.post.model.vo.Post" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/auctionDetail.css" />	
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</head>
<body>
<script>
//게시물 상세 페이지 사진 변경
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
</script>

<%
	Post p = (Post)request.getAttribute("post");
%>

<div id="wrap">
		<%@ include file="/views/common/header&footer/header.jsp"%>
		<!-- contents  -->
		<div id="contents">
			<div class="container">
				<div id="contents-deail-1" class="row">
					<h3>게시물 상세 페이지</h3>
				</div>
				<hr>
				<div id="contents-deail-2" class="row">
					<div class="col-12">
						<div class="alert alert-light" role="alert" style="border: 1px solid black; text-align: left;"><%=p.getSubject() %></div>
					</div>
					<div>
					</div>
				</div>

				<div id="contents-deail-3" class="row">
					<div id="main-img" class="col-6">
							<img alt="상품 메인이미지" src="/resources/file/<%=p.getMainImgName()%>">
					</div>
					<div id="sub-img" class="col-6">
						<div class="row">
						<div class="sub-img col-6">
							<img alt="상품 서브이미지 1" src="/resources/file/<%=p.getSubImgName_1()%>">
						</div>
						<div class="sub-img col-6">
							<img alt="상품 서브이미지 2" src="/resources/file/<%=p.getSubImgName_2()%>">
						</div>
						</div>
						<div class="row">
						<div class="sub-img col-6">
							<img alt="상품 서브이미지 3" src="<%=p.getSubImgName_3()%>">
						</div>
						<div class="sub-img col-6">
							<img alt="상품 서브이미지 4" src="<%=p.getSubImgName_4()%>">
						</div>
						</div>
					</div>
				</div>
				<div id="contents-deail-4" class="row">
					<div class="col-6">
						<div id="bid">
							<div id="progress-height" class="col-12">
								<div class="progress" style="height: 100%; margin: 1px;">
 									 <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><%=p.getEndDate() %></div>
								</div>
							</div>
							<br>
							<div class="col-12">
								<div class="row">
									<div class="col-9" style="font-size: x-large; margin-top: 5px; text-align: left;">
										즉시 구매가 : <%=p.getBuyPrice() %>
									</div>
									<div class="col-3  p-1">
										<button type="button" class="btn btn-danger float-right" style="width: 140px">즉시 구매</button>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="row">
									<div class="col-9" style="font-size: x-large; margin-top: 5px; text-align: left;">
										현재 입찰가 : <strong style="color:red"><%=p.getAuctionPrice() %></strong>
									</div>
									<div class="col-3  p-1">
										<button id="InterestedBtn" type="button" class="btn btn-secondary float-right" style="width: 140px">관심상품등록</button>
									</div>
								</div>
							</div>	
							<div class="col-12 p-1"><button type="button" class="btn btn-primary btn-lg btn-block" id="auctionBtn">입찰 하기</button>

								<form  id="auctionForm" method="post" action="/views/auction/auctionFunction.jsp" target="childwin">
									<input type="hidden" name="startPrice" value="<%=p.getStartPrice()%>"/>
									<input type="hidden" name="auctionPrice" value="<%=p.getAuctionPrice()%>"/>
									<input type="hidden" name="sell_YN" value="<%=p.getSell_yn()%>"/>
									<input type="hidden" name="postNo" value="<%=p.getPostNo()%>"/>
									<input type="hidden" name="offerPrice" id="offerPrice"/>
								</form>
								
								<script>
									$(function(){
										$('#auctionBtn').click(function(){
											var settings = "width=500px, height=170px";
											auctionPage = window.open("/views/auction/auctionFunction.jsp", "childwin", settings);
											$('#auctionForm').submit();
										});
										
									});
									
									
								</script>
								
							</div>
						</div>
					</div>
					<div class="col-6">
					<br>
						<div class="selleInformation">
						<div class="row">
							<div class="col-4" style="margin-top: 30px">
  								<img src="/resources/images/image.png" class="mr-3" alt="..." style="width: 100px; height: 100px; border-radius: 50%; ">
  							</div>
  							<div class="col-8">
  							<div class="media-body">
   							 	<h4 class="mt-0" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=p.getWriter() %></h4>
   							 	<br>
   							 		<p style="margin: 0;text-align: left;"> 주소 : </p>
    								<p style="margin: 0; text-align: left;"> 상품 : 5</p>
    								<p style="margin: 0; text-align: left;"> 신뢰도 : 우수</p>
    								
  							</div>
  							</div>
  							</div>
						</div>
					</div>
				</div>
				<br>
				<div id="contents-deail-5" class="row">
					<div class="col-12">
						<textarea name="textarea" id="textarea" readonly="readonly" disabled> <%=p.getContent() %></textarea>
					</div>
				</div>
					
			
				
		</div>
	</div>
		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>

</body>
</html>