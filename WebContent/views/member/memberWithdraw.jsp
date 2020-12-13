<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#withdrawBtn {
	color: gray;
	cursor: pointer;
}
</style>

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<!--김소련 회원탈퇴 -->
	<!-- 마이페이지에 회원 탈퇴버튼이 있다고 가정 한다면 ?  -->

	<script>
	$(function(){
		$('#withdrawBtn').click(function(){
			var result = window.confirm("정말로 탈퇴 하시겠습니까?");
			if(result==true)
			{
				//탈퇴를 하겠다고 하면 form태그가 기본적으로 가지고 있는 submit 이벤트를 발동 시켜라!
				//$('#memberDelForm').submit();
				
				$('#userPw').attr('type','password');
				$('#checkBtn').css('display','inline');
				//form 태그안에 Btn을 만들면 기본적으로 submit 특징을 가지고 있음
			}
			else{
				return false;
			}
		});
		
	});
	</script>


	<!--<a href="/memberWithdraw.do" id="withdrawBtn">회원탈퇴</a> -->

	<form action="/memberWithdraw.do" method="post">
		<span id="withdrawBtn">회원탈퇴</span>
		<input type="hidden" name="userPw" id="userPw" placeholder="비밀번호를 입력 해주세요." />
		<input type="submit" id="checkBtn" style="display:none;" />
	</form>



</body>
</html>