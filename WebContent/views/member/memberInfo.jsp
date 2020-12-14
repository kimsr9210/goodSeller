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
<%
	String birthYear = m.getBirth().split("/")[0];
	String birthMonth = m.getBirth().split("/")[1];
	String birthDay = m.getBirth().split("/")[2];
	String gender = "";
	if(m.getGender() == 'M'){
		gender = "남자";
	}else{
		gender = "여자";
	}
%>

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
                    <div id="modify-box" class="row col-12 col-lg-10">
                        <div id="info-title">
                            <div>기본 정보</div>
                        </div>
                        
                        <div class="modify-box-size">
                            <a href="#">
                                <div>이름</div>
                                <div><%=m.getUserName() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>아이디</div>
                                <div><%=m.getUserId() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>비밀번호</div>
                                <div>**********</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>닉네임</div>
                                <div><%=m.getUserNick() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>생년 월일</div>
                                <div><%=birthYear %>년 <%=birthMonth %>월 <%=birthDay %>일</div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>성별</div>
                                <div><%=gender %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>전화번호</div>
                                <div><%=m.getPhone() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>주소</div>
                                <div><%=m.getAddress() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>계좌번호</div>
                                <div><%=m.getAccount() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>이메일</div>
                                <div><%=m.getEmail() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>신고당한 횟수</div>
                                <div><%=m.getReported() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                        <div class="modify-box-size">
                            <a href="#">
                                <div>거래취소 횟수</div>
                                <div><%=m.getCancellation() %></div>
                                <div>&nbsp;<img src="/resources/images/d-right.png" style="width:10px;"/></div>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-11">
                        <!-- 여기작업하시면 되요 소련누나---------------------------- -->
                            <div id="delete-btn-box">
                                <a href="#" id="delete-btn">회원탈퇴</a>
                            </div>
                        <!-- 여기작업하시면 되요 소련누나---------------------------- -->
                        </div>
                        <div class="col-lg-1"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- -------------------------------------------------------------------- -->
    </div>
	
<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>

</html>
