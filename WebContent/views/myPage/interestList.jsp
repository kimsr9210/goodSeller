<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/interestList.css" />

</head>
<body>
<%@ include file="/views/common/header&footer/header.jsp" %>
    <div id="wrap"> <!-- 전체 틀-->
    
    
        <!-- -------------------------------------------------------------------- -->
        <div id="contents" class="menu-none">
                <div class="container">
                    <ul id="contents-navi" class="row">
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/member/memberInfo.jsp">회원정보</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/transactionList.jsp">거래내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/purchaseList.jsp">구매내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/salesList.jsp">판매내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/interestList.jsp">관심목록</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/reportList.jsp">신고내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/qnaList.jsp">Q&A</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="/views/myPage/productInquiryList.jsp">상품문의</a></li>
                    </ul>
                </div>
            <div id="contents-mypage">
                <div class="container">
                    <div id="transaction-box" class="row col-12 col-lg-12">
                        <div id="info-title">
                            <div>관심 목록</div>
                        </div>
                        <div id="transaction-navi">
                                <div>상품정보</div>
                                <div>시작가</div>
                                <div>현재가</div>
                                <div>판매자</div>
                                <div>거래상태</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#"><img src="/resources/images/exe.jpg" class="image"></a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>20,000원</div>
                                <div>30,000원</div >
                                <div><a href="#">asd0049</a></div>
                                <div>판매중</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/header&footer/footer.jsp" %>
</body>
</html>