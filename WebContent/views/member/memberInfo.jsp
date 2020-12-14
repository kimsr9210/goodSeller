<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- css링크 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/memberInfo.css" />

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

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</head>
<body>

	<%@ include file="/views/common/header&footer/header.jsp"%>
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

	<div id="wrap">
		<!-- 전체 틀-->
		<!-- -------------------------------------------------------------------- -->
		<div id="contents" class="menu-none">
			<div class="container">
				<ul id="contents-navi" class="row">
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/member/memberInfo.jsp">회원정보</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/transactionList.jsp">거래내역</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/purchaseList.jsp">구매내역</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/salesList.jsp">판매내역</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/interestList.jsp">관심목록</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/reportList.jsp">신고내역</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/qnaList.jsp">Q&A</a></li>
					<li class="col-6 col-md-3 col-lg-1"><a
						href="/views/myPage/productInquiryList.jsp">상품문의</a></li>
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
								</div>
							</div>
						</div>

						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">비밀번호</div>
									<div id="pw" class="col-6">********</div>
									<div id="chPwForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											현재 비밀번호<input type="password" name="currentPw"
												placeholder="현재 비밀번호" class="form-input form-control" /> 변경할
											비밀번호<input type="password" name="chPw"
												placeholder="변경할 비밀번호 (숫자,영문,특수문자 조합 최소 8자 최대 16자)"
												class="form-input form-control" /> 변경할 비밀번호 확인<input
												type="password" name="chPwRe" placeholder="변경할 비밀번호 확인"
												class="form-input form-control" /> <input id="pwChangeOk"
												type="submit" value="변경" class="btn btn-outline-secondary" />
											<input id="pwChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button" id="pwChange"
											class="btn btn-outline-secondary btn-sm">비밀번호 변경</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">닉네임</div>
									<div id="nick" class="col-6"><%=m.getUserNick() %></div>
									<div id="chNickForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											<input type="text" name="chNick"
												placeholder="변경할 닉네임 (영문,숫자 5~11자, 한글 2~6자)"
												class="form-input form-control" /> <input id="nickChangeOk"
												type="submit" value="변경" class="btn btn-outline-secondary" />
											<input id="nickChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button" id="nickChange"
											class="btn btn-outline-secondary btn-sm">닉네임 변경</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">생년월일</div>
									<div class="col-6"><%=birthYear %>년
										<%=birthMonth %>월
										<%=birthDay %>일
									</div>
									<div class="col-3"></div>
								</div>
							</div>
						</div>


						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">성별</div>
									<div class="col-6"><%=gender %></div>
									<div class="col-3"></div>
								</div>
							</div>
						</div>


						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">전화번호</div>
									<div id="phone" class="col-6"><%=m.getPhone() %></div>
									<div id="chPhoneForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											<input type="text" name="chPhone"
												placeholder="변경할 전화번호 (-빼고 입력)"
												class="form-input form-control" /> <input id="phoneChangeOk"
												type="submit" value="변경" class="btn btn-outline-secondary" />
											<input id="phoneChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button" id="phoneChange"
											class="btn btn-outline-secondary btn-sm">전화번호 변경</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">주소</div>
									<div id="addr" class="col-6"><%=m.getAddress() %></div>
									<div id="chAddrForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											<div class="form-check-inline border-0">
												<input type="text" class="mb-2 form-control" name="addrCode" id="addr_postCode" readonly />
											</div><input type="button" class="btn btn-outline-secondary" onclick="addrSearch();" value="주소찾기" />
											<input type="text" class="form-input mb-2 form-control" name="addr" id="addr_address" readonly />
											<input type="text" class="form-input mb-2 form-control" name="detailAddr" id="addr_detailAddress" placeholder="상세주소 입력" />
											<input id="addrChangeOk" type="submit" value="변경" class="btn btn-outline-secondary" />
											<input id="addrChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button" id="addrChange"
											class="btn btn-outline-secondary btn-sm">주소 변경</button>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">계좌번호</div>
									<div id="account" class="col-6"><%=m.getAccount() %></div>
									<div id="chAccountForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											<input type="text" name="chAccount" placeholder="변경할 계좌번호"
												class="form-input form-control" /> <input
												id="accountChangeOk" type="submit" value="변경"
												class="btn btn-outline-secondary" /> <input
												id="accountChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button"
											id="accountChange" class="btn btn-outline-secondary btn-sm">계좌번호
											변경</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">이메일</div>
									<div id="email" class="col-6"><%=m.getEmail() %></div>
									<div id="chEmailForm" class="col-6" style="display: none">
										<form action="/memberUpdate.do" method="post">
											<input type="text" name="chEmail" placeholder="변경할 이메일"
												class="form-input form-control" /> <input id="emailChangeOk"
												type="submit" value="변경" class="btn btn-outline-secondary" />
											<input id="emailChangeCancel" type="reset" value="취소"
												class="btn btn-outline-secondary" />
										</form>
									</div>
									<div class="col-3">
										<button style="display: block;" type="button" id="emailChange"
											class="btn btn-outline-secondary btn-sm">이메일 변경</button>
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
								</div>
							</div>
						</div>

						<div class="modify-box-size">
							<div class="container">
								<div class="row">
									<div class="col-3">거래취소 횟수</div>
									<div class="col-6"><%=m.getCancellation() %></div>
									<div class="col-3"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-lg-11">
							<!-- 여기작업하시면 되요 소련누나---------------------------- -->
							<div id="delete-btn-box">
								<a href="#" id="delete-btn"><div
										class="btn btn-outline-dark">회원탈퇴</div></a>
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
		$('#pwChange').click(function(){
			$('#pw').css('display','none');
			$('#chPwForm').css('display','block');
			$('#pwChange').css('display','none');
		});
		$('#pwChangeCancel').click(function(){
			$('#pw').css('display','block');
			$('#chPwForm').css('display','none');
			$('#pwChange').css('display','block');
		});
		$('#pwChangeOk').click(function(){
			if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test($("input[name='chPw']").val())){
				if($("input[name='chPw']").val() != $("input[name='chPwRe']").val()){
					alert('비밀번호와 비밀번호 확인이 동일하지 않습니다.');
					return false;
				} else {
					if(confirm('비밀번호를 변경하시겠습니까?')){
						return true;
					} else {
						return false;
					}	
				}
			} else {
				alert('비밀번호는 숫자,영문,특수문자 조합 최소 8자 최대 16자로 입력하여 주십시오');
				return false;
			}
		});
		
		$('#nickChange').click(function(){
			$('#nick').css('display','none');
			$('#chNickForm').css('display','block');
			$('#nickChange').css('display','none');
		});
		$('#nickChangeCancel').click(function(){
			$('#nick').css('display','block');
			$('#chNickForm').css('display','none');
			$('#nickChange').css('display','block');
		});
		$('#nickChangeOk').click(function(){
			if ((/^[a-z][a-z0-9]{4,10}$/.test($("input[name='chNick']").val())) || 
					(/^[가-힣][가-힣0-9]{1,5}$/.test($("input[name='chNick']").val()))){
				if(confirm('닉네임을 변경하시겠습니까?')){
					return true;
				} else {
					return false;
				}
			} else {
				alert('올바른 닉네임 형식을 사용하세요.');
				return false;
			}
		});
		
		$('#phoneChange').click(function(){
			$('#phone').css('display','none');
			$('#chPhoneForm').css('display','block');
			$('#phoneChange').css('display','none');
		});
		$('#phoneChangeCancel').click(function(){
			$('#phone').css('display','block');
			$('#chPhoneForm').css('display','none');
			$('#phoneChange').css('display','block');
		});
		$('#phoneChangeOk').click(function(){
			if (/^(010[1-9][0-9]{7})$/.test($("input[name='chPhone']").val())){
				if(confirm('전화번호를 변경하시겠습니까?')){
					return true;
				} else {
					return false;
				}
			} else {
				alert('올바른 전화번호 형식을 사용하세요.');
				return false;
			}
		});
		
		$('#addrChange').click(function(){
			$('#addr').css('display','none');
			$('#chAddrForm').css('display','block');
			$('#addrChange').css('display','none');
		});
		$('#addrChangeCancel').click(function(){
			$('#addr').css('display','block');
			$('#chAddrForm').css('display','none');
			$('#addrChange').css('display','block');
		});
		$('#addrChangeOk').click(function(){
			if($("input[name='addr']").val() == "") {
				alert('주소찾기를 눌러 주소를 입력해 주세요.');
				return false;
			} else {
				if ($("input[name='detailAddr']").val()!=""){
					if(confirm('주소를 변경하시겠습니까?')){
						return true;
					} else {
						return false;
					}
				} else {
					alert('상세주소를 입력해주세요.');
					return false;
				}	
			}
		});
		
		
		$('#accountChange').click(function(){
			$('#account').css('display','none');
			$('#chAccountForm').css('display','block');
			$('#accountChange').css('display','none');
		});
		$('#accountChangeCancel').click(function(){
			$('#account').css('display','block');
			$('#chAccountForm').css('display','none');
			$('#accountChange').css('display','block');
		});
		$('#accountChangeOk').click(function(){
			if (/^[0-9]{8,12}/.test($("input[name='chAccount']").val())){
				if(confirm('계좌번호를 변경하시겠습니까?')){
					return true;
				} else {
					return false;
				}
			} else {
				alert('올바른 계좌번호 형식을 사용하세요.');
				return false;
			}
		});
		
		
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
	
function addrSearch() {
	//여기다가 테마 변경 코드 넣기
	var themeObj = {
		bgColor : "#F7F8C7", //바탕 배경색
		searchBgColor : "#F6B3B3", //검색창 배경색
		contentBgColor : "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		pageBgColor : "#FAFAFA", //페이지 배경색
		textColor : "#333333", //기본 글자색
		queryTextColor : "#222222", //검색창 글자색
		postcodeTextColor : "#FA4256", //우편번호 글자색
		emphTextColor : "#008BD3", //강조 글자색
		outlineColor : "#E0E0E0" //테두리
	};

	new daum.Postcode({
		theme : themeObj, //테마변경코드
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				addr = addr + ' ' + extraAddr;

			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addr_postCode').value = data.zonecode;
			document.getElementById("addr_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr_detailAddress").focus();
		}
	}).open();
}

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
