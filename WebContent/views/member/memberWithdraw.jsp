<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
* {
	margin: 0;
	padding: 0;
	margin: 0 auto;
}

.wrap {
	width: 100%;
	height: 800px;
}

.box {
	width: 600px;
	height: 500px;
	border: 1px solid #ccc;
	padding: 50px;
	margin-top: 120px;
}

p {
	margin: 10px 0 50px 0;
}

.box input {
	width: 500px;
	height: 50px;
	margin: 10px;
	float: right;
}

.form {
	height: 300px;
	margn-top: 200px;
}

span{
border : 1px;
}
</style>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<%@ include file="/views/common/header&footer/header.jsp"%>

	<!-- 전체 틀-->

	<div class="wrap">
		<div class="box">
			<h2>비밀번호 재확인</h2>
			<p>안전한 탈퇴를 위해 비밀번호를 확인해 주세요.</p>
			<div class="form">
				<form action="/memberWithdraw.do" method="post">
					<div><input type="text" name=userId value="<%=m.getUserId() %>" />
					<input type="password" name="userPw" placeholder="  비밀번호를 입력해 주세요. " /><br> 
					<input id="withdrawBtn" type="submit" class="btn btn-outline-secondary" value="확인" />
				</form>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/header&footer/footer.jsp"%>

</body>
</html>