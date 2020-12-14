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
if (m != null) {
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
                            <div class="container">
                            	<div class="row">
	                                <div class="col-3">이름</div>
	                                <div class="col-6"><%=m.getUserName() %></div>
	                                <div class="col-3"></div>
                            	</div>
                            </div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">아이디</div>
                                <div class="col-6"><%=m.getUserId() %></div>
                                <div class="col-3"></div>
                            </div></div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">비밀번호</div>
                                <div class="col-6">**********</div>
                                <div class="col-3"><button type="button" id="pwChange" class="btn btn-outline-secondary btn-sm">비밀번호 변경</button></div>
                            </div></div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">닉네임</div>
                                <div class="col-6"><%=m.getUserNick() %></div>
                                <div class="col-3"><button type="button" id="nickChange" class="btn btn-outline-secondary btn-sm">닉네임 변경</button></div>
                            </div></div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">생년월일</div>
                                <div class="col-6"><%=birthYear %>년 <%=birthMonth %>월 <%=birthDay %>일</div>
                                <div class="col-3"></div>
                            </div></div>
                        </div>
                        
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">성별</div>
                                <div class="col-6"><%=gender %></div>
                                <div class="col-3"></div>
                            </div></div>
                        </div>

						<div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">전화번호</div>
                                <div class="col-6"><%=m.getPhone() %></div>
                                <div class="col-3"><button type="button" id="phoneChange" class="btn btn-outline-secondary btn-sm">전화번호 변경</button></div>
                            </div></div>
                        </div>

						<div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">주소</div>
                                <div class="col-6"><%=m.getAddress() %></div>
                                <div class="col-3"><button type="button" id="addrChange" class="btn btn-outline-secondary btn-sm">주소 변경</button></div>
                            </div></div>
                        </div>

						<div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">계좌번호</div>
                                <div class="col-6"><%=m.getAccount() %></div>
                                <div class="col-3"><button type="button" id="accountChange" class="btn btn-outline-secondary btn-sm">계좌번호 변경</button></div>
                            </div></div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row" style="height:100%">
                                	<div class="col-3">이메일</div>
                                	<div id="email" class="col-6"><%=m.getEmail() %></div>
                                	<div id="chEmailForm" class="col-6" style="display:none">
                                		<form action="memberUpdate.do" method="post">
                                			<input type="text" name="chEmail" placeholder="변경할 이메일" class="form-input form-control"/>
                                			<input id="emailChangeOk" type="submit" value="변경" class="btn btn-outline-secondary" />
                                			<input id="emailChangeCancel" type="reset" value="취소" class="btn btn-outline-secondary" />
                                		</form>
                                	</div>
                                	<div class="col-3">
                                		<button style="display:block;" type="button" id="emailChange" class="btn btn-outline-secondary btn-sm">이메일 변경</button>
                                	</div>
                            	</div>
                            </div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">신고당한 횟수</div>
                                <div class="col-6"><%=m.getReported() %></div>
                                <div class="col-3"></div>
                            </div></div>
                        </div>
                        
                        <div class="modify-box-size">
                            <div class="container">
                            	<div class="row">
                                <div class="col-3">거래취소 횟수</div>
                                <div class="col-6"><%=m.getCancellation() %></div>
                                <div class="col-3"></div>
                            </div></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-11">
                        <!-- 여기작업하시면 되요 소련누나---------------------------- -->
                            <div id="delete-btn-box">
                                <a href="#" id="delete-btn"><div class="btn btn-outline-dark">회원탈퇴</div></a>
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
	<script>
	$(function(){
		$('#emailChange').click(function(){
			$('#email').css('display','none');
			$('#chEmailForm').css('display','block');
			$('#emailChange').css('display','none');
		});
		$('#emailChangeCancel').click(function(){
			$('#email').css('display','block');
			$('#chEmailForm').css('display','none');
			$('#emailChange').css('display','block');
		});
		$('#emailChangeOk').click(function(){
			if (/^[a-z0-9]{4,12}@/.test($("input[name='chEmail']").val())){
				if(confirm('이메일을 변경하시겠습니까?')){
					return true;
				} else {
					return false;
				}
			} else {
				alert('올바른 이메일 형식을 사용하세요.');
				return false;
			}
		});
	})
	</script>
<%@ include file="/views/common/header&footer/footer.jsp"%>
<%} else { %>
	<script>
		alert("세션 만료. 다시 로그인하여 주십시오");
		location.href ="/index.jsp";
	</script>
<% } %>
</body>

</html>
