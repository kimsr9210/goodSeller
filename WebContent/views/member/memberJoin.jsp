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

<!-- 주소API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- index.css -->

<link rel="stylesheet" type="text/css" href="/resources/css/join.css" />
<title>GoodSeller 회원가입</title>
</head>

<body>
	<!-- 전체 틀-->
	<div id="wrap">
	
		<!-- Header -->
		<%@ include file="/views/common/header&footer/header.jsp"%>
	
		<!-- Contents -->
		<div id="contents" class="menu-none">
			<div class="container">
				<div id="core-contents-top" class="row m-3">
					<div class="col-2"></div>
					<div class="col-8">
						<form action="/memberJoin.do" method="post">
							<div class="container">

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										아이디 <input type="text" class="form-input form-control"
											name="userId" id="userId" placeholder="아이디 입력(영문,숫자 5~11자)"
											readonly onblur="idCheck();" />
											<button type="button" id="idCheckBtn" class="btn btn-outline-secondary btn-sm">중복확인</button>
											 <span id="idMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										비밀번호 <input type="password" class="form-input form-control"
											name="userPw" id="userPw"
											placeholder="비밀번호(숫자,영문,특수문자 조합 최소 8자 최대 16자)"
											onblur="pwCheck();" /> <span id="pwMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										비밀번호 확인 <input type="password" class="form-input form-control"
											id="userPwRe" placeholder="비밀번호 확인" onblur="pwReCheck();" />
										<span id="pwReMessage" class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										닉네임 <input type="text" class="form-input form-control"
											name="userNick" id="userNick"
											placeholder="닉네임 입력(영문,숫자 5~11자, 한글 2~6자)"
											onblur="nickCheck();" readonly /> 
											<button type="button" id="nickCheckBtn" class="btn btn-outline-secondary btn-sm">중복확인</button>
											<span id="nickMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										이름 <input type="text" class="form-input form-control"
											name="userName" id="userName" onblur="nameCheck();"
											placeholder="이름 입력" /> <span id="nameMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										성별 <br> <input type="radio"
											class="form-check form-check-inline m-0" name="gender"
											value="M" checked>남 &nbsp; <input type="radio"
											class="form-check form-check-inline m-0" name="gender"
											value="F">여
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										출생 <br> <select name="birthYear"
											class="form-control form-check-inline m-0"
											style="width: 30%;">
											<option value="1960">1960</option>
											<option value="1961">1961</option>
											<option value="1962">1962</option>
											<option value="1963">1963</option>
											<option value="1964">1964</option>
											<option value="1965">1965</option>
											<option value="1966">1966</option>
											<option value="1967">1967</option>
											<option value="1968">1968</option>
											<option value="1969">1969</option>
											<option value="1970">1970</option>
											<option value="1971">1971</option>
											<option value="1972">1972</option>
											<option value="1973">1973</option>
											<option value="1974">1974</option>
											<option value="1975">1975</option>
											<option value="1976">1976</option>
											<option value="1977">1977</option>
											<option value="1978">1978</option>
											<option value="1979">1979</option>
											<option value="1980">1980</option>
											<option value="1981">1981</option>
											<option value="1982">1982</option>
											<option value="1983">1983</option>
											<option value="1984">1984</option>
											<option value="1985">1985</option>
											<option value="1986">1986</option>
											<option value="1987">1987</option>
											<option value="1988">1988</option>
											<option value="1989">1989</option>
											<option value="1990">1990</option>
											<option value="1991">1991</option>
											<option value="1992">1992</option>
											<option value="1993">1993</option>
											<option value="1994">1994</option>
											<option value="1995">1995</option>
											<option value="1996">1996</option>
											<option value="1997">1997</option>
											<option value="1998">1998</option>
											<option value="1999">1999</option>
											<option value="2000" selected>2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>년 <select name="birthMonth"
											class="form-control form-check-inline m-0"
											style="width: 20%;">
											<option value="01" selected>1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>월 <select name="birthDay"
											class="form-control form-check-inline m-0"
											style="width: 20%;">
											<option value="1" selected>1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select>일
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										휴대전화 <input type="text" class="form-input form-control"
											name="phone" id="phone" maxlength="11"
											placeholder="- 제외하고 입력" onblur="phoneCheck();" /> <span
											id="phoneMessage" class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>


								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										주소<br>
										<div class="form-check-inline border-0">
											<input type="text" class="mb-2 form-control" name="addrCode"
												id="addr_postCode" readonly />
										</div>
										<input type="button" class="btn btn-outline-secondary"
											onclick="addrSearch();" value="주소찾기" /> <input type="text"
											class="form-input mb-2 form-control" name="addr"
											id="addr_address" readonly /> <input type="text"
											class="form-input mb-2 form-control" name="detailAddr"
											id="addr_detailAddress" placeholder="상세주소 입력"
											onblur="addrCheck();" /> <span id="addrMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>


								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										이메일 <input type="text" class="form-input form-control"
											name="email" id="email" placeholder="이메일"
											onblur="emailCheck();" /> <span id="emailMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										계좌번호 <input type="text" class="form-input form-control"
											name="account" id="account" placeholder="계좌번호"
											onblur="accountCheck();" /> <span id="accountMessage"
											class="checkMessage"></span>
									</div>
									<div class="d-none d-md-block col-md-2 border-0"></div>
								</div>

								<div class="row border-0 my-3">
									<div class="d-none d-md-block col-md-2 border-0"></div>
									<div class="col-12 col-md-8 border-0">
										<input type="submit" class="btn btn-outline-secondary"
											value="회원가입" onclick="return check();" /> <a
											href="/index.jsp" class="btn btn-outline-secondary">돌아가기</a>
									</div>
									<div class="d-none d-md-block col-  md-2 border-0"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		
	</div>
	<script>
	window.onload = function() {
		idMessage = document.getElementById("idMessage");
		pwMessage = document.getElementById("pwMessage");
		pwReMessage = document.getElementById("pwReMessage");
		nickMessage = document.getElementById("nickMessage");
		nameMessage = document.getElementById("nameMessage");
		emailMessage = document.getElementById("emailMessage");
		phoneMessage = document.getElementById("phoneMessage");
		addrMessage = document.getElementById("addrMessage");
		accountMessage = document.getElementById("accountMessage");

		userId = document.getElementById("userId");
		userPw = document.getElementById("userPw");
		userPwRe = document.getElementById("userPwRe");
		userNick = document.getElementById("userNick");
		userName = document.getElementById("userName");
		phone = document.getElementById("phone");
		addr = document.getElementById("addr_address");
		detailAddr = document.getElementById("addr_detailAddress");
		email = document.getElementById("email");
		account = document.getElementById("account");
	}

	function check() {
		if(!idCheck()){
			userId.focus();
			return false;
		} else if (!pwCheck()){
			userPw.focus();
			return false;
		} else if (!pwReCheck()){
			userPwRe.focus();
			return false;
		} else if (!nickCheck()) {
			userNick.focus();
			return false;
		} else if (!nameCheck()) {
			userName.focus();
			return false;
		} else if (!phoneCheck()) {
			phone.focus();
			return false;
		} else if (!addrCheck()) {
			addr.focus();
			return false;
		} else if (!emailCheck()) {
			email.focus();
			return false;
		} else if (!accountCheck()){
			account.focus();
			return false;
		} else {
			return true;
		}
	}

	function idCheck() {
		if (userId.value == "") {
			idMessage.style.color = "red";
			idMessage.innerHTML = "중복확인 버튼을 눌러 아이디를 입력하세요";
			return false;
		} else {
			return true;
		}
	}

	function pwCheck() {
		if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
				.test(userPw.value))) //비밀번호 검사
		{
			pwMessage.style.color = "red";
			pwMessage.innerHTML = "비밀번호는 소문자,특수문자,숫자를 조합하여 8~16글자로 입력 바랍니다.";
			return false;
		} else {
			pwMessage.style.color = "blue";
			pwMessage.innerHTML = "유효한 비밀번호입니다.";
			return true;
		}
	}

	function pwReCheck() {
		if (!(userPw.value == userPwRe.value)) //PW와 PW_RE 비교 검사
		{
			pwReMessage.style.color = "red";
			pwReMessage.innerHTML = "비밀번호와 비밀번호 확인 값은 같아야 합니다.";
			return false;
		} else if (userPwRe.value == "" || userPw.value == "") {
			pwReMessage.style.color = "red";
			pwReMessage.innerHTML = "비밀번호를 입력해 주십시오";
			return false;
		} else {
			pwReMessage.style.color = "blue";
			pwReMessage.innerHTML = "비밀번호 동일";
			return true;
		}
	}
	function nickCheck() {
		if (userNick.value == "") //아이디 검사
		{
			nickMessage.style.color = "red";
			nickMessage.innerHTML = "중복확인 버튼을 눌러 닉네임을 입력하세요";
			return false;
		} else {
			return true;
		}
	}

	function nameCheck() {
		if (!(/[가-힣]+$/.test(userName.value))) //이름 검사
		{
			nameMessage.style.color = "red";
			nameMessage.innerHTML = "이름은 한글(최소1글자)만 가능합니다.";
			return false;
		} else {
			nameMessage.innerHTML = "";
			return true;
		}
	}

	function phoneCheck() {
		if (!((/^(010[1-9][0-9]{7})$/.test(phone.value)))) //폰 검사
		{
			phoneMessage.style.color = "red";
			phoneMessage.innerHTML = "핸드폰 번호는 010으로 시작하며 숫자 11자리로 입력하여 주십시오";
			return false;
		} else {
			phoneMessage.innerHTML = "";
			return true;
		}
	}

	function addrCheck() {
		if (addr.value == "") //주소검사
		{
			addrMessage.style.color = "red";
			addrMessage.innerHTML = "주소찾기를 이용해 주소를 입력하여 주십시오";
			return false;
		} else if (detailAddr.value == ""){
			addrMessage.style.color = "red";
			addrMessage.innerHTML = "상세주소 입력 바랍니다.";
		} else {
			addrMessage.innerHTML = "";
			return true;
		}
	}

	function emailCheck() {
		if (!(/^[a-z0-9]{4,12}@/.test(email.value))) //이메일 검사
		{
			emailMessage.style.color = "red";
			emailMessage.innerHTML = "이메일을 재확인해주세요(@앞에는 영어 또는 숫자만 가능/첫시작은 소문자)";
			return false;
		} else {
			emailMessage.style.color = "blue";
			emailMessage.innerHTML = "유효한 이메일입니다.";
			return true;
		}
	}

	function accountCheck() {
		if (!(/^[0-9]{8,12}/.test(account.value))) //이메일 검사
		{
			accountMessage.style.color = "red";
			accountMessage.innerHTML = "계좌번호 재확인 바람";
			return false;
		} else {
			accountMessage.style.color = "blue";
			accountMessage.innerHTML = "유효한 계좌번호입니다.";
			return true;
		}
	}
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

	$(function() {
		$('#idCheckBtn').click(
				function() {
					window.open("/views/member/memberIdCheck.jsp", "_blank",
							"width=500px height=200px");
				});
	});

	$(function() {
		$('#nickCheckBtn').click(
				function() {
					window.open("/views/member/memberNickCheck.jsp", "_blank",
							"width=500px height=200px");
				});
	});

	</script>
	
	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>