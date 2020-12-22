<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.PostPageData"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/auctionMain.css" />
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

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!--    폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(function() {
			$(".card").click(function() {
				location.href = "/views/auction/auctionDetailPage.jsp";
			});
		});
	</script>
	<%
		ArrayList<Post> clothingList = (ArrayList<Post>) request.getAttribute("clothingList");
		ArrayList<Post> livingList = (ArrayList<Post>) request.getAttribute("livingList");
		ArrayList<Post> homeAppliancesList = (ArrayList<Post>) request.getAttribute("homeAppliancesList");
		ArrayList<Post> digitalList = (ArrayList<Post>) request.getAttribute("digitalList");
		ArrayList<Post> booksList = (ArrayList<Post>) request.getAttribute("booksList");
		ArrayList<Post> beautyList = (ArrayList<Post>) request.getAttribute("beautyList");
		ArrayList<Post> sportsList = (ArrayList<Post>) request.getAttribute("sportsList");

		DecimalFormat formatter = new DecimalFormat("###,###");
		String subject = "";
	%>
	<div id="wrap">
		<%@ include file="/views/common/header&footer/header.jsp"%>
		<!-- contents  -->
		<div id="contents">
			<div class="container">
				<div id="core-contents-1" class="row">
					<span>제품 페이지</span>
				</div>
				<div id="core-contents-2" class="row">
					<div class="d-none d-md-block col-md-1"></div>
					<div class="col-md-10">
						<ul class="nav nav-pills">

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">의 류</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionClothing.jsp">의류 메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">티셔츠</a> <a
										class="dropdown-item" href="#">바지</a> <a class="dropdown-item"
										href="#">아우터</a> <a class="dropdown-item" href="#">가방</a> <a
										class="dropdown-item" href="#">신발</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">생활
									건강</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionLiving.jsp">생활 건강
										메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">인테리어 용품</a> <a
										class="dropdown-item" href="#">수납 용품</a> <a
										class="dropdown-item" href="#">주방 용품</a> <a
										class="dropdown-item" href="#">세탁 용품</a> <a
										class="dropdown-item" href="#">욕실 용품</a>

								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">가구&가전</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionHomeAppliances.jsp">가구&가전
										메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">수납 가구</a> <a
										class="dropdown-item" href="#">거실 가구</a> <a
										class="dropdown-item" href="#">침실 가구</a> <a
										class="dropdown-item" href="#">TV</a> <a class="dropdown-item"
										href="#">냉장고</a> <a class="dropdown-item" href="#">에어컨</a> <a
										class="dropdown-item" href="#">스타일러</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">디지털</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionDigital.jsp">디지털 메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">카메라</a> <a
										class="dropdown-item" href="#">음향기기</a> <a
										class="dropdown-item" href="#">게임</a> <a class="dropdown-item"
										href="#">핸드폰</a> <a class="dropdown-item" href="#">테블릿</a><a
										class="dropdown-item" href="#">컴퓨터</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">도서&문구</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionBooks.jsp">도서&문구 메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">입문/문학</a> <a
										class="dropdown-item" href="#">교육/참고서</a> <a
										class="dropdown-item" href="#">어린이 도서</a> <a
										class="dropdown-item" href="#">장난감</a> <a
										class="dropdown-item" href="#">피규어</a> <a
										class="dropdown-item" href="#">사무용품</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">뷰티&잡화</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionBeauty.jsp">뷰티&잡화
										메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">화장품/향수</a> <a
										class="dropdown-item" href="#">바디/헤어</a> <a
										class="dropdown-item" href="#">패션잡화</a> <a
										class="dropdown-item" href="#">쥬얼리/시계/선글라스</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">스포츠</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionSports.jsp">스포츠 메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">골프</a> <a
										class="dropdown-item" href="#">스키/보드</a> <a
										class="dropdown-item" href="#">수영/수상레저</a> <a
										class="dropdown-item" href="#">구기/라켓</a> <a
										class="dropdown-item" href="#">헬스/요가/필라테스</a>
								</div></li>


						</ul>
					</div>
					<div class="d-none d-md-block col-md-1"></div>

				</div>
				<div id="core-contents-3" class="row">
					<div class="col-12 p-0" style="height: 90px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;의류 브랜드 패션<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-1" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">
									<%if(clothingList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = clothingList.get(i);
												
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>

									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">

					
										<%
										if(clothingList.isEmpty()){%>
										등록된 상품이 없습니다. 옥션에 참여해보세요!
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = clothingList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-1" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-1" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 70px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;생활 건강<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-2" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">
										
										<%if(livingList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = livingList.get(i);
										
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
										
									</div>
								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<%if(livingList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = livingList.get(i);
												
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-2" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-2" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 70px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;가구 가전<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-3" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">

										<%if(homeAppliancesList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = homeAppliancesList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>
								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										
										<%if(homeAppliancesList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = homeAppliancesList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-3" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-3" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 90px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;디지털 컴퓨터<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-4" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div id="goods" class="row">

										<%if(digitalList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = digitalList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>
								</div>
								<div class="carousel-item">
									<div id="goods" class="row">
										<%if(digitalList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = digitalList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-4" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-4" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 90px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;도서 문구<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-5" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">

										<%if(booksList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = booksList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<%if(booksList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = booksList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-5" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-5" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 90px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;뷰티 잡화<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-6" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">

										<%if(beautyList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = beautyList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<%if(beautyList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = beautyList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-6" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-6" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12 p-0" style="height: 90px; text-align: left">
						<hr>
						<h4>
							<b>&nbsp;&nbsp;&nbsp;&nbsp;스포츠 레저<b>
						</h4>
					</div>
					<div class="col-12 p-0">
						<div id="carouselExampleControls-7" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div id="goods" class="row">

										<%if(sportsList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 0; i < 4; i++) {
												Post p = new Post();
												p = sportsList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										<%
											}
										}
										%>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<%if(sportsList.isEmpty()){ %>
										등록된 게시글이 없습니다. 게시글 등록 후 이용해주세요 
										<%}else{
											for (int i = 4; i < 8; i++) {
												Post p = new Post();
												p = sportsList.get(i);
										%>
										<%
											if (p.getSubject().length() >= 28) {
													subject = p.getSubject().substring(0, 25) + "...";
												} else {
													subject = p.getSubject();
												}
										%>
										<div class="col-md-3">
											<a id="postClick"
												href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>">
												<div class="card" style="border: 0; border-radius: 10%;">
													<div id="postImgBox">
														<img id="postImgMain"
															src="/resources/file/<%=p.getMainImgName()%>"
															class="card-img-top" alt="..." />
													</div>
													<div class="card-body">
														<h6 class="card-title"><%=subject%></h6>
														<p class="card-text">
															현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice())%></span>원
															<br> 즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice())%></span>원
														</p>
													</div>
												</div>
											</a>
										</div>
										
										<%}
											}%>
									</div>

								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls-7" role="button"
								data-slide="prev" style="width: 80px;"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only"">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls-7" role="button"
								data-slide="next" style="width: 80px;"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<br>
					</div>
					<div class="col-12">
						<br> <br> <br> <br>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>

</body>
</html>