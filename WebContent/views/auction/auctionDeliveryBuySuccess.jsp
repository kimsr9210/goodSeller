<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/auctionDetail.css" />

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
<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#postTitle {
	border: 1px solid #cccccc;
	color: #3c3c3c;
}

.postImg {
	width: 100%;
	padding: 10px;
	border-radius: 5%;
}

#main-img {
	height: 500px;
	overflow: hidden;
}

.priceBox {
	float: left;
	width: 55%;
	font-size: 12px;
	margin-left: 30px;
	margin-top: 5px;
}

.priceBtnBox {
	width: 30%;
	float: left;
}

.startPrice {
	font-family: RIDIBatang;
	font-weight: bold;
	color: #ED4C00;
	font-size: 21px;
}

.buyPrice {
	font-family: RIDIBatang;
	color: black;
	font-weight: normal;
	font-size: 19px;
}

.moneyFont {
	color: #808080;
	font-size: 12px;
}

.priceBtnBox>button {
	width: 78px;
	height: 50px;
	font-size: 12px;
	border-radius: 0;
	border-top: 1px solid white;
	font-weight: 700;
}

#price-navi-1 {
	width: 80%;
	float: left;
}

#price-navi-2 {
	width: 20%;
	float: left;
}

#auctionBtn {
	width: 100%;
	height: 100%;
	font-size: 16px;
	float: left;
	border-radius: 0;
	font-weight: 700;
	border-top: 1px solid white;
}

#auctionBox {
	width: 100px;
	height: 100px;
	margin-left: -18px;
}

#userImg {
	width: 80px;
	margin-top: 25px;
	margin-left: 10px;
}

#userImgBox {
	margin: 0 auto;
	width: 100%;
	height: 120px;
	overflow: hidden;
}

.selleInformation {
	width: 100%;
	text-align: left;
	border: 1px solid #cccccc;
	overflow: hidden;
	margin-top: 5px;
}

#userId {
	font-size: 12px;
	line-height: 30px;
	border-bottom: 1px solid #cccccc;
	font-family: '굴림';
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.wInfo {
	font-family: '굴림';
	font-size: 12px;
}

.infoFont {
	font-family: GmarketSansMedium;
	font-size: 14px;
}

#progress {
	width: 100%;
	height: 100%;
}

#progressFont {
	font-family: GmarketSansMedium;
	float: right;
	font-size: 14px;
}

#endDate {
	font-family: GmarketSansMedium;
	color: #ED4C00;
	font-size: 14px;
}

#textBox {
	width: 100%;
	height: 200px;
	border: 1px solid #cccccc;
	overflow: hidden;
}

#textarea {
	width: 90%;
	height: 90%;
	overflow: hidden;
	resize: none;
	font-family: "굴림";
	font-size: 14px;
	border: 0;
	background-color: white;
	margin: 15px;
}

.contentsFont {
	font-family: GmarketSansMedium;
	font-size: 15px;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
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
	</script>
	<div id="header">
		<div class="container">
			<div id="core-header" class="row">
				<div class="col-1 col-md-3 col-lg-2">
					<div id="main-navi">
						<a href="#" id="menu-navi-tag"><img
							src="/resources/images/main_menu.png" id="main-navi-img" /></a> <a
							href="/index.do"><img class="d-none d-md-block"
							src="/resources/images/logo.png" id="logo-img" /></a>
					</div>
				</div>
				<!--                    여기가 메뉴-->
				<ul id="main-menu">
					<li><a id="home" href="/auctionMain.do">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/home.png" class="imgSize" />&nbsp;&nbsp;Home
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=의류 브랜드 패션&subCategory=티셔츠">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/clothes.png" class="imgSize" />&nbsp;&nbsp;의류
							브랜드 패션
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=생활 건강&subCategory=인테리어 용품">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/muscle.png" class="imgSize" />&nbsp;&nbsp;생활
							건강
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=가구 가전&subCategory=수납 가구">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/product.png" class="imgSize" />&nbsp;&nbsp;가구
							가전
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=카메라">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/computer.png" class="imgSize" />&nbsp;&nbsp;디지털
							컴퓨터
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=도서 문구&subCategory=입문/문학">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/book.png" class="imgSize" />&nbsp;&nbsp;도서
							문구
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=뷰티 잡화&subCategory=화장품/향수">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/beauty.png" class="imgSize" />&nbsp;&nbsp;뷰티
							잡화
					</a></li>
					<li><a
						href="/auctionList.do?mainCategory=스포츠 레저&subCategory=골프">&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="/resources/images/sports.png" class="imgSize" />&nbsp;&nbsp;스포츠
							레저
					</a></li>
				</ul>
				<span id="tooltiptext-main">카테고리</span>



				<div class="col-6 col-md-5 col-lg-7">
					<div id="search-box">
						<div class="mb-3">
							<form id="searchForm" action="#">
								<fildset> <input type="text" id="search-input"
									placeholder="  찾고싶은 상품을 검색해주세요!" class="menu-none" />
								<button type="submit" id="search-btn">
									<img src="/resources/images/searchImg.png" id="search-img">
								</button>
								</fildset>
							</form>
							<span id="tooltiptext-search">검색</span> <span
								id="tooltiptext-side">고객센터</span>
						</div>
					</div>
				</div>
				<div class="col-5 col-md-4 col-lg-3">
					<div id="side-navi" class="container">
						<a href="#"><img
							src="/resources/images/iconmonstr-menu-2-240.png" id="menu-img2" /></a>
						<%
							Member m = (Member) session.getAttribute("member");
							if (m != null) {
						%>
						<a href="/views/member/memberInfo.jsp"><div
								class="btn btn-outline-dark" id="join">마이페이지</div></a> <a
							href="/memberLogout.do"><div class="btn btn-outline-dark"
								id="login">로그아웃</div></a>
						<%
							} else {
						%>
						<a href="/views/member/memberLogin.jsp"><div
								class="btn btn-outline-dark" id="login">로그인</div></a> <a
							href="/views/member/memberJoin.jsp"><div
								class="btn btn-outline-dark" id="join">회원가입</div></a>
						<%
							}
						%>
					</div>
					<ul id="side-menu">
						<li><a href="/boardAllListPage.do">&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="/resources/images/board1.png" class="imgSize" />&nbsp;&nbsp;Q&A
						</a></li>
						<li><a href="/views/reportBoard/reportWrite.jsp">&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="/resources/images/surprise.png" class="imgSize" />&nbsp;&nbsp;신고게시판
						</a></li>
						<li><a href="/views/common/guide.jsp">&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="/resources/images/info.png" class="imgSize" />&nbsp;&nbsp;이용안내
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--    자바 스크립트    -->
	<script type="text/javascript" src="/resources/js/header.js"></script>
	<%
		Post p = (Post) request.getAttribute("post");
		Member writer = (Member) request.getAttribute("writer");
		String postCount = (String) request.getAttribute("postCount");
		String auctionCount = (String) request.getAttribute("auctionCount");
		DecimalFormat formatter = new DecimalFormat("###,###");

		int writerBirthYear = Integer.parseInt(writer.getBirth().split("/")[0]);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);

		int writerAge = (year - writerBirthYear) + 1;
		String writerGender = "";
		if (writer.getGender() == 'M') {
			writerGender = "남";
		} else {
			writerGender = "여";
		}

		int buyerBirthYear = Integer.parseInt(m.getBirth().split("/")[0]);

		int buyerAge = (year - buyerBirthYear) + 1;
		String buyerGender = "";
		if (m.getGender() == 'M') {
			buyerGender = "남";
		} else {
			buyerGender = "여";
		}
	%>
	<div id="wrap">
		<!-- contents  -->
		<div id="contents">
			<div class="container">
				<div id="contents-deail-1" class="row">
					<span id="mainCate">거래정보 등록</span>
				</div>
				<div id="contents-deail-2" class="row">
					<div class="col-12">
						<span class="contentsFont">제목</span>
						<div id="postTitle" class="alert alert-light" role="alert"><%=p.getSubject()%></div>
						<hr>
					</div>
					<div></div>
				</div>

				<div id="contents-deail-3" class="row">
					<div id="main-img" class="col-12 col-md-6">
						<img class="postImg" alt="상품 메인이미지"
							src="/resources/file/<%=p.getMainImgName()%>">
					</div>
					<div id="sub-img" class="col-12 col-md-6">
						<div class="row">
							<div class="sub-img col-6">
								<%
									String sub_1 = "images/imgX.png";
									String sub_2 = "images/imgX.png";
									String sub_3 = "images/imgX.png";
									String sub_4 = "images/imgX.png";
									if (p.getSubImgName_1() != null) {
										sub_1 = "file/" + p.getSubImgName_1();
									}
									if (p.getSubImgName_2() != null) {
										sub_2 = "file/" + p.getSubImgName_2();
									}
									if (p.getSubImgName_3() != null) {
										sub_3 = "file/" + p.getSubImgName_3();
									}
									if (p.getSubImgName_4() != null) {
										sub_4 = "file/" + p.getSubImgName_4();
									}
								%>
								<img class="postImg" alt="상품 서브이미지 1"
									src="/resources/<%=sub_1%>">
							</div>
							<div class="sub-img col-6">
								<img class="postImg" alt="상품 서브이미지 2"
									src="/resources/<%=sub_2%>">
							</div>
						</div>
						<div class="row">
							<div class="sub-img col-6">
								<img class="postImg" alt="상품 서브이미지 3"
									src="/resources/<%=sub_3%>">
							</div>
							<div class="sub-img col-6">
								<img class="postImg" alt="상품 서브이미지 4"
									src="/resources/<%=sub_4%>">
							</div>
						</div>
					</div>
				</div>

				<hr>
				<div id="contents-deail-4" class="row">
					<div class="col-6 col-md-6">
						<span class="infoFont">판매자 정보</span>
						<div class="selleInformation">
							<div class="row">
								<div id="userImgBox" class="col-3 col-md-4 col-lg-3">
									<img id="userImg" src="/resources/images/userImage.png"
										alt="...">
								</div>
								<div class="col-9 col-md-8 col-lg-9">
									<div>
										<span style="display:block" class="infoFont my-2">판매자 아이디 : <%=p.getWriter()%></span><br>
										<span style="display:block" class="infoFont my-2">판매자 닉네임 : <%=writer.getUserNick()%></span><br>
										<span style="display:block" class="infoFont my-2">판매자 게시물 수 : <%=postCount%> 개</span><br>
										<span style="display:block" class="infoFont my-2">판매자 신고 횟수 : <%=writer.getReported()%>번</span><br>
										<span style="display:block" class="infoFont my-2">판매자 핸드폰 번호 : <%=writer.getPhone()%></span><br>
										<span style="display:block" class="infoFont my-2">판매자 나이(성별) : <%=writerAge%>세(<%=writerGender%>)</span><br>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="col-6 col-md-6">
						<span class="infoFont">구매자 정보</span>
						<div class="selleInformation">
							<div class="row">
								<div id="userImgBox" class="col-3 col-md-4 col-lg-3">
									<img id="userImg" src="/resources/images/userImage.png"
										alt="...">
								</div>
								<div class="col-9 col-md-8 col-lg-9">
									<div>
										<span style="display:block" class="infoFont my-2">구매자 아이디 : <%=m.getUserId()%></span> <br>
										<span style="display:block" class="infoFont my-2">구매자 닉네임 : <%=m.getUserNick()%></span><br>
										<span style="display:block" class="infoFont my-2">구매자 신고 횟수 : <%=m.getReported()%>번</span><br>
										<span style="display:block" class="infoFont my-2">구매자 핸드폰 번호 : <%=m.getPhone()%></span><br>
										<span style="display:block" class="infoFont my-2">구매자 나이(성별) : <%=buyerAge%>세(<%=buyerGender%>)</span><br>
										<span style="display:block" class="infoFont my-2">구매자 주소 : <%=m.getAddress()%></span><br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center my-3">
					<div class="col-12 text-center">
						<span class="infoFont">※구매자 정보를 변경하시려면 마이페이지에서 변동 후 이용해 주십시오※</span>
					</div>
				</div>

				<hr>
				<span class="infoFont">결제 정보</span>
				<div id="contents-deail-4" class="row">
					<div class="col-12 col-md-12">
						<div class="selleInformation">
							<div class="row">
								<div class="col-12">
									<div class="m-4 text-center">
										<span style="color:red; font-size:1.5em"class="infoFont">결제 금액 : <%=formatter.format(p.getBuyPrice())%></span><br>
										<span class="infoFont">거래 유형 : <%=p.getSellMethod() %></span><br>
										<span class="infoFont">상기 구매정보를 확인하였으며 결제를 진행합니다.</span><br>
										<span class="infoFont">구매 취소 시 패널티가 부과될 수 있습니다.</span><br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class ="row text-center my-3">
					<div class="col-12 text-center">
						<button type="button" class="btn btn-dark" id="paymentBtn">결제</button>
						<button type="button" class="btn btn-dark" id="buyCancle">구매 취소</button>
					</div>
				</div>
				<br>

			</div>
		</div>
	</div>
	<%@ include file="/views/common/header&footer/footer.jsp"%>
	<script>
	$(function() {
		$("#buyCancle").click(function() {
			if(confirm('구매를 취소하시겠습니까?')) {
				location.href="/buyCancel.do?postNo=<%=p.getPostNo()%>&userId=<%=m.getUserId()%>";
			} else {
				return false;
			}
		});
	});
	
	$('#paymentBtn').click(function() {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp20250053'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "<%=p.getSubject()%>",
            amount: "<%=p.getBuyPrice()%>",
            buyer_email: "<%=m.getEmail()%>",
            buyer_name: "<%=m.getUserName()%>",
            buyer_tel: "<%=m.getPhone()%>",
            buyer_addr: "<%=m.getAddress()%>"
        }, function(rsp) {
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);
  				$.ajax({
            		url: "/sendSmsTrade.do",
            		data: {
            			receiver: "<%=writer.getPhone()%>"
            		},
            		type: "post"
            	});		
                location.href="/auctionInfoChange.do?postNo=<%=p.getPostNo()%>&buyerId=<%=m.getUserId()%>&sellerId=<%=p.getWriter()%>";
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    })
	</script>
</body>
</html>