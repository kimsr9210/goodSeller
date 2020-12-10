<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- css링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/memberInfo.css" />

<!-- bootstrap -->
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

<%@ include file="/views/common/header&footer/header.jsp" %>

    <div id="wrap"> <!-- 전체 틀-->
        <!-- -------------------------------------------------------------------- -->
        <div id="contents" class="menu-none">
                <div class="container">
                    <ul id="contents-navi" class="row">
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">회원정보</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">거래내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">구매내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">판매내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">관심목록</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">신고내역</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">Q&A</a></li>
                        <li class="col-6 col-md-3 col-lg-1"><a href="#">상품문의</a></li>
                    </ul>
                </div>
            <div id="contents-mypage">
                <div class="container">
                    <div id="modify-box" class="row col-12 col-lg-10">
                        <div id="info-title">
                            <div>기본 정보</div>
                        </div>
                        <div id="info-id" class="modify-box-size">
                            <a href="#">
                                <div>이름</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div id="info-gender" class="modify-box-size">
                            <a href="#">
                                <div>생년 월일</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>성별</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>비밀번호</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>닉네임</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>전화번호</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>주소</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>계좌번호</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>이메일</div>
                                <div>로직처리</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- -------------------------------------------------------------------- -->

    </div>
	
<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>

</html>
