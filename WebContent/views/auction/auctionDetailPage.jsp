<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						<div class="alert alert-light" role="alert" style="border: 1px solid black; text-align: left;">하루입은 옷 경매시작함(제목등록)</div>
					</div>
					<div>
					</div>
				</div>

				<div id="contents-deail-3" class="row">
					<div id="main-img" class="col-6">
							<img alt="" src="https://cdn.imweb.me/thumbnail/20200924/04d62185d7243.jpg">
					</div>
					<div id="sub-img" class="col-6">
						<div class="row">
						<div class="sub-img col-6">
							<img alt="" src="https://img.maisonkorea.com/2020/05/msk_5ec5cfb8aa17a.jpg">
						</div>
						<div class="sub-img col-6">
							<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9anatZdJ9PehB7sLgmXbdA7lVEfs-tv0QA&usqp=CAU">
						</div>
						</div>
						<div class="row">
						<div class="sub-img col-6">
							<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIbXBL78qMxffbLmm2PNBrhl1-ORm_SbkoXw&usqp=CAU">
						</div>
						<div class="sub-img col-6">
							<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCzXx9f0jod1W0na_iSS3QWfNaOdqzR0yLA&usqp=CAU">
						</div>
						</div>
					</div>
				</div>
				<div id="contents-deail-4" class="row">
					<div class="col-6">
						<div id="bid">
							<div id="progress-height" class="col-12">
								<div class="progress" style="height: 100%; margin: 1px;">
 									 <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">남은기간 :3일</div>
								</div>
							</div>
							<br>
							<div class="col-12">
								<div class="row">
									<div class="col-9" style="font-size: x-large; margin-top: 5px; text-align: left;">
										즉시 구매가 : 150000원
									</div>
									<div class="col-3  p-1">
										<button type="button" class="btn btn-danger float-right" style="width: 140px">즉시 구매</button>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="row">
									<div class="col-9" style="font-size: x-large; margin-top: 5px; text-align: left;">
										현재 입찰가 : <strong style="color:red">50000원</strong>
									</div>
									<div class="col-3  p-1">
										<button id="InterestedBtn" type="button" class="btn btn-secondary float-right" style="width: 140px">관심상품등록</button>
									</div>
								</div>
							</div>	
							<div class="col-12 p-1">
								<button type="button" class="btn btn-primary btn-lg btn-block ">입찰 하기</button>
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
   							 	<h4 class="mt-0" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매자 ID</h4>
   							 	<br>
   							 		<p style="margin: 0;text-align: left;"> 주소 : 서울시 영등포구</p>
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
						<textarea name="textarea" id="textarea" readonly="readonly" disabled></textarea>
					</div>
				</div>
					
			
				
		</div>
	</div>
		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>
	<script type="text/javascript" src="/resources/js/auction.js"></script>
	
</body>
</html>