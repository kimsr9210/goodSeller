<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<!--김소련 회원수정 -->
	<!-- 마이페이지에 회원 수정버튼이 있다고 가정 한다면 ?  -->
	
		
			<script>
	$(function(){
		$('#changeBtn').click(function(){
			var result = window.confirm("변경사항을 적용 하시겠습니까?");
			if(result==true)
			{
				
			}
			else{
				return false;
			}
		});
		
	});
	</script>



	<form action="memberChange.do" method="post">
		<span id="changeBtn">수정</span>
	</form>
		

</body>
</html>