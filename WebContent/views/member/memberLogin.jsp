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
#contents div {
	text-align: center;
}

/*--Header--*/
#core-header {
	height: 80px;
}

/*--contents--*/
#core-contents-1 {
	
}

#core-contents-1 input {
	display: block;
	height: 50px;
	width: 100%;
	margin: 10px 0px;
}

#core-contents-1 a {
	text-decoration: none;
	color: gray;
}

#core-contents-1 span {
	color: rgba(128, 128, 128, 0.5);
	padding: 0px 5px;
}

#core-contents-1 a:hover {
	text-decoration: none;
	color: #212529;
}

/*--footer--*/
#core-footer {
	height: 100px;
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

	<div id="wrap">
		<!-- 전체 틀-->
		<%@ include file="/views/common/header&footer/header.jsp"%>

		<div id="contents" class="menu-none">
			<div class="container">
				<div id="core-contents-1" class="row">
					<div class="col-12">
						<div class="col-4" style="margin: 0px auto;">
							<br><h2>로그인</h2>
							<form action="/memberLogin.do" method="post">
								<input type="text" name="userId" placeholder="아이디"> <input
									type="password" name="userPw" placeholder="비밀번호"> <input
									type="submit" class="btn btn-outline-secondary" value="로그인" />
							</form>
							<div class="col-12">
								<a href='/views/member/memberFindId.jsp'>아이디 찾기</a> <span>|</span> <a href='/views/member/memberFindPw.jsp'>비밀번호 찾기</a> <span>|</span>
								<a href='/views/member/memberJoin.jsp'>회원가입</a>
							</div>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>

</body>
</html>