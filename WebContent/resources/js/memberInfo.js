document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);

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
		
		$('#nickChangeOk').click(function() {
			if((/^[a-z][a-z0-9]{4,10}$/.test($("input[name='chNick']").val())) || 
				(/^[가-힣][가-힣0-9]{1,5}$/.test($("input[name='chNick']").val()))) {
				$.ajax({
					url: "/nickCheck.do",
					data: {
						userNickCheck: $("#chNick").val()
					},
					type: "post",
					success: function(data){
						if(data.result == "true"){
							if(confirm("사용 가능한 닉네임 입니다. 사용하시겠습니까?")){
								$('#updateNickForm').submit();
							}
						} else {
							alert("중복된 닉네임 입니다.");
						}
					}
				});	
			}
		});
		
		$('#phoneChange').click(function(){
			$('#phone').css('display','none');
			$('#chPhoneForm').css('display','block');
			$('#phoneChange').css('display','none');
		});
		$('#phoneChangeCancel').click(function(){
			$('#phone').css('display','block');
			$('#sendSms').css('display','inline-block');
			$('#chPhoneForm').css('display','none');
			$('#phoneChange').css('display','block');
			$('#phoneMessage').html('');
			$('#phoneChangeOk').css('display','none');
			$('#inputAuthNum').css('display','none');
			$('#inputAuthNum').val('');
			$('#chPhone').val('');
		});
		
		$(function() {
			$('#sendSms').click(
					function() {
						if (((/^(010[1-9][0-9]{7})$/.test($("#chPhone").val())))) {
							$.ajax({
								url: "/phoneCheck.do",
								data: {
									receiver: $("#chPhone").val()
								},
								type: "post",
								success: function(data){
									if(data.result == "true"){
										$('#phoneChangeOk').css('display','inline-block');
										$('#inputAuthNum').css('display','block');
										$('#phoneMessage').html('');
										$('#sendSms').css('display','none');
										$.ajax({
											url: "/sendSms.do",
											data: {
												receiver: $("#chPhone").val()
											},
											type: "post"
										});
									} else {
										alert("이미 가입된 전화번호 입니다.");
										$('#phoneMessage').css('color', 'red');
										$('#phoneMessage').html('이미 가입된 전화번호 입니다.');
									}
								}
							});
						} else {
							$('#phoneMessage').css('color', 'red');
							$('#phoneMessage').html('핸드폰번호는 010으로 시작해 11자리로 입력해주세요(- 제외하고 입력)');
						}
					});
			$('#phoneChangeOk').click(
					function() {
						$.ajax({
							url: "/smsCheck.do",
							type : "post",
							data: {
								inputNum: $("#inputAuthNum").val()
							},
							success: function(data){
								if(data.result == "true"){
									if(confirm('번호인증 성공 전화번호를 변경하시겠습니까?')){
										$('#updatePhoneForm').submit();
										
									}
									$('#phone').css('display','block');
									$('#sendSms').css('display','inline-block');
									$('#chPhoneForm').css('display','none');
									$('#phoneChange').css('display','block');
									$('#phoneMessage').html('');
									$('#phoneChangeOk').css('display','none');
									$('#inputAuthNum').css('display','none');
									$('#inputAuthNum').val('');
									$('#chPhone').val('');
								} else {
									alert("옳바르지 않은 인증번호 입니다.");
									$('#phoneMessage').html('올바르지 않은 인증번호');
								}
							}, error: function() {
								alert("알수없는 오류 관리자에게 문의하세요.");
								return false;
							}
						});
					});
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
	});
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