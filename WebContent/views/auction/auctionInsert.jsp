<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/auctionInsert.css" />

</head>
<body>
	<%@ include file="/views/common/header&footer/header.jsp"%>
<%
	if(m != null){
%>
	<div id="wrap">
		<!-- 전체 틀-->
		<div id="contents" class="menu-none">
			<div class="container">
				<div id="page-title">
					<p>게시물 작성</p>
				</div>
				<div id="post-contents-box">
					<form action="/postInsert.do" method="post" enctype="multipart/form-data">

						<div id="post-title">
							<input id="subject" name="subject" placeholder="제목을 입력하세요." />
						</div>


						<div id="post-img-box" class="row">
							<div id="post-img-main" class="col-12 col-md-12 col-lg-6" >
								<div>메인 사진 선택</div>
								<div>
									<img src="/resources/images/basic_img.png" class='img-size'/><br><input
										type="file" id="mainImg" name="mainImg" class="file-upload"/>
								</div>
							</div>
							<div id="post-img-sub" class="col-12 col-md-12 col-lg-6">
								<div>서브 사진 선택</div>
								<div id="img-sub-top">
									<div>
										<img src="/resources/images/basic_img.png" class='img-size'/><br><input
											type="file" name="subImg_1" class="file-upload-top file-upload" />
									</div>
									<div>
										<img src="/resources/images/basic_img.png" class='img-size'/><br><input
											type="file" name="subImg_2" class="file-upload-top file-upload" />
									</div>

								</div>
								<div id="img-sub-bottom">
									<div>
										<img src="/resources/images/basic_img.png" class='img-size'/><br><input
											type="file" name="subImg_3" class="file-upload-bot file-upload"  />
									</div>
									<div >
										<img src="/resources/images/basic_img.png" class='img-size'/><br><input
											type="file" name="subImg_4" class="file-upload-bot file-upload" />
									</div>
								</div>
							</div>
                            
                            
							<div class="col-6 col-md-4 col-lg-2 post-select">
								<div>
									<div>종료 날짜 설정</div>
									<div>
										<input type="date" class="input-date" value="2020-12-12" name="endDate"/>
									</div>
								</div>
							</div>
                            
                            <div class="col-6 col-md-4 col-lg-2 post-select">
								<div>
									<div>시작 금액 설정</div>
									<div>
										<input type="type" id="startPrice" name="startPrice" class="input-text" placeholder="0"
											onkeyup="f_setCommaValue(this);" onkeypress="f_onlyNum();" />
										원
									</div>
								</div>
							</div>
                            
                            <div class="col-6 col-md-4 col-lg-2 post-select">
								<div> 
									<div>즉시 구매 금액</div>
									<div>
										<input type="type" id="buyPrice" name="buyPrice" class="input-text" placeholder="0"
											onkeyup="f_setCommaValue(this);" onkeypress="f_onlyNum();" />
										원
									</div>
								</div>
							</div>

							<div class="col-6 col-md-4 col-lg-2 post-select">
								<div>
									<div>거래 방식</div>
									<div>
										<select id="trans-method" name="sellMethod">
											<option>------선택------</option>
											<option>직거래</option>
											<option>택배거래</option>
										</select>
									</div>
								</div>
							</div>
                            
                            <div class="col-6 col-md-4 col-lg-2 post-select">
								<div>
									<div>주 카테고리</div>
									<div>
										<select id="category-main" name="mainCategory">
											<option>------선택------</option>
											<option>의류 브랜드 패션</option>
											<option>생활 건강</option>
											<option>가구 가전</option>
											<option>디지털 컴퓨터</option>
											<option>도서 문구</option>
											<option>뷰티 잡화</option>
											<option>스포츠 레저</option>
										</select>
									</div>
								</div>
							</div>
                            
                            <div class="col-6 col-md-4 col-lg-2 post-select">
								<div>
									<div>상세 카테고리</div>
									<div>
										<select id="category-sub" name="subCategory">
											<option>------선택------</option>
										</select>
									</div>
								</div>
							</div>
                            
                            
						</div>
						<div id="text-box">
							<div>상세내용 입력</div>
							<textarea placeholder="내용을 입력하세요" id="content" name="content"></textarea>
						</div>



						<div id="submit-btn-box">
							<input type="submit" id="submit-btn" value="작성하기" />
						</div>


					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/header&footer/footer.jsp"%>
	
	<%} else { %>
	<script>
		alert("로그인 후 상품 등록이 가능합니다.");
		history.back(-1);
	</script>
	<% } %>
	<!--    자바 스크립트    -->
	<script type="text/javascript" src="/resources/js/auctionInsert.js"></script>

</body>
</html>