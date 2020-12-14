<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/auctionMain.css" />
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
	<div id="wrap">
		<%@ include file="/views/common/header&footer/header.jsp"%>
		<!-- contents  -->
		<div id="contents">
			<div class="container">
				<div id="core-contents-1" class="row">
					<h3>제품 페이지</h3>
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
										class="dropdown-item" href="#">바지</a> <a
										class="dropdown-item" href="#">아우터</a> <a
										class="dropdown-item" href="#">가방</a> <a 
										class="dropdown-item" href="#">신발</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">생활
									건강</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionLiving.jsp">생활 건강 메인</a>
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
									<a class="dropdown-item" href="./auctionHomeAppliances.jsp">가구&가전 메인</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">수납 가구</a> <a
										class="dropdown-item" href="#">거실 가구</a> <a
										class="dropdown-item" href="#">침실 가구</a> <a 
										class="dropdown-item" href="#">TV</a> <a
										class="dropdown-item" href="#">냉장고</a> <a
										class="dropdown-item" href="#">에어컨</a> <a
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
										class="dropdown-item" href="#">게임</a> <a 
										class="dropdown-item"href="#">핸드폰</a> <a 
										class="dropdown-item" href="#">테블릿</a><a 
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
										class="dropdown-item" href="#">어린이 도서</a>
										<a class="dropdown-item" href="#">장난감</a> <a
										class="dropdown-item" href="#">피규어</a> <a
										class="dropdown-item" href="#">사무용품</a>
								</div></li>
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">뷰티&잡화</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./auctionBeauty.jsp">뷰티&잡화 메인</a>
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src=https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
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
					<div class="col-12 p-0" style="height: 70px; text-align: left"">
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
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
					<div class="col-12 p-0" style="height: 70px; text-align: left"">
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>
												</div>
											</div>
										</div>
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src=https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F194704364F3108E836"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src=https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
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
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">

									<div id="goods" class="row">
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img
													src="https://image.auction.co.kr/itemimage/13/ba/9a/13ba9acf86.jpg"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title">(판매자가 제목입력)</h6>
													<p class="card-text">
														현재 입찰금 : 50,000원<br>즉시구매가 : 150,000원
													</p>

												</div>
											</div>
										</div>
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