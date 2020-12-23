<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="hotsix.goodseller.user.post.model.vo.Post" %>
    <%@ page import="java.text.DecimalFormat"%>
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
	
	
<style>
@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#postTitle{
	border:1px solid #cccccc;
	color:#3c3c3c;
}
.postImg{
	width: 100%;
	padding: 10px;
	border-radius: 5%;
}
#main-img{
	height:500px;
	overflow:hidden;
}

.priceBox{
	float: left;
	width:55%;
	font-size:12px;
	margin-left: 30px;
	margin-top:5px;
}
.priceBtnBox{
	width:30%;
	float:left;
}

.startPrice{
	font-family:RIDIBatang;
	font-weight: bold;
	color: #ED4C00;
	font-size: 21px;
}
.buyPrice{
	font-family:RIDIBatang;
	color: black;
	font-weight: normal;
	font-size: 17px;
}
.moneyFont{
	color: #808080;
	font-size:12px;
}

.priceBtnBox>button{
	width:78px;
	height: 47px;
	font-size:12px;
	border-radius: 0;
	border-top: 1px solid white;
	font-weight: 700;
}
#price-navi-1{
	width:80%;
	float:left;
}
#price-navi-2{
	width:20%;
	float:left;
}
#auctionBtn{
	width:100%;
	height: 100%;
	font-size: 16px;
	float:left;
	border-radius: 0;
	font-weight: 700;
	border-top: 1px solid white;
}
#auctionBox{
	width:100px;
	height: 94px;
	margin-left: -18px;
}
</style>
	
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
	DecimalFormat formatter = new DecimalFormat("###,###");
%>

<div id="wrap">
		<%@ include file="/views/common/header&footer/header.jsp"%>
		<!-- contents  -->
		<div id="contents">
			<div class="container">
				<div id="contents-deail-1" class="row">
					<span id="mainCate">게시물 상세 페이지</span>
				</div>
				<hr>
				<div id="contents-deail-2" class="row">
					<div class="col-12">
						<div id="postTitle"class="alert alert-light" role="alert"><%=p.getSubject() %></div>
					</div>
					<div>
					</div>
				</div>

				<div id="contents-deail-3" class="row">
					<div id="main-img" class="col-12 col-md-6">
							<img class="postImg" alt="상품 메인이미지" src="/resources/file/<%=p.getMainImgName()%>">
					</div>
					<div id="sub-img" class="col-12 col-md-6">
						<div class="row">
						<div class="sub-img col-6">
							<%
							String sub_1 = "images/imgX.png";
							String sub_2 = "images/imgX.png";
							String sub_3 = "images/imgX.png";
							String sub_4 = "images/imgX.png";
							if(p.getSubImgName_1()!=null){ 
								sub_1 = "file/"+p.getSubImgName_1();
							} 
							if(p.getSubImgName_2()!=null){ 
								sub_2 = "file/"+p.getSubImgName_2();
							} 
							if(p.getSubImgName_3()!=null){ 
								sub_3 = "file/"+p.getSubImgName_3();
							}
							if(p.getSubImgName_4()!=null){ 
								sub_4 = "file/"+p.getSubImgName_4();
							}
							%>
							<img class="postImg" alt="상품 서브이미지 1" src="/resources/<%=sub_1%>">
						</div>
						<div class="sub-img col-6">
							<img class="postImg" alt="상품 서브이미지 2" src="/resources/<%=sub_2%>">
						</div>
						</div>
						<div class="row">
						<div class="sub-img col-6">
							<img class="postImg" alt="상품 서브이미지 3" src="/resources/<%=sub_3%>">
						</div>
						<div class="sub-img col-6">
							<img class="postImg" alt="상품 서브이미지 4" src="/resources/<%=sub_4%>">
						</div>
						</div>
					</div>
				</div>
				<hr>
				<div id="contents-deail-4" class="row">
					<div class="col-12 col-md-6">
						<div id="bid">
							<div id="progress-height" class="col-12">
								<div class="progress" style="height: 100%; margin: 1px;">
	 								 <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><%=p.getEndDate() %></div>
								</div>
							</div>
								<br>
								<div id="price-navi-1">
								<div class="col-12">
									<div>
										<div class="priceBox">
											<span class="moneyFont">즉시 구매가 : </span><span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span> 원
										</div>
										<div class="priceBtnBox">
											<button type="button" class="btn btn-danger float-right" id="buyBtn">즉시 구매</button>
											<form id="auctionBuyForm" method="post" action="/views/auction/auctionBuy.jsp" target="childwin">
											<input type="hidden" name="buyPrice" value="<%=p.getBuyPrice()%>"/>
											<input type="hidden" name="postNo" value="<%=p.getPostNo()%>"/>
										</form>
										<script>
											$(function(){
												$("#buyBtn").click(function(){
													<%if(m!=null){%>
													var settings = "width=500px, height=280px";
													auctionBuyPage = window.open("/views/auction/auctionBuy.jsp", "childwin", settings);
													$("#auctionBuyForm").submit();
													<%}else{%>
													alert("로그인 한 후 입찰기능을 이용할 수 있습니다.");
												<%}%>
												});
											});
										</script>
										</div>
									</div>
								</div>
								<br>
								<div class="col-12">
									<div>
										<div class="priceBox">
											<span class="moneyFont">현재 입찰금 : </span><span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
										</div>
										<div class="priceBtnBox">
											<button id="InterestedBtn" type="button" class="btn btn-secondary float-right" >찜하기</button>
										</div>
									</div>
								</div>	
							</div>
							<div id="price-navi-2">
							<div id="auctionBox"><button type="button" class="btn btn-dark" id="auctionBtn">입찰</button>

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
							
											<%if(m!=null){%>
											var settings = "width=500px, height=280px";
											auctionPage = window.open("/views/auction/auctionFunction.jsp", "childwin", settings);
											$('#auctionForm').submit();
											<%}else{%>
												alert("로그인 한 후 입찰기능을 이용할 수 있습니다.");
											<%}%>
										});
										
									});
									
									
								</script>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6">
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