<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'Wemakeprice-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#title{
font-family: Wemakeprice-Bold;
}


div {
	box-sizing: border-box;
}

textarea {
	font-size: 10px;
}

.wrapper {
	width: 50%;
	padding: 30px 0;
	margin: 50px auto;
}

#postTitle {
	padding-bottom: 50px;
}

.subject {
	background-color: #dcdcdc;
	text-align: center;
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	line-height: 30px;
	height: 33px;
}

.realSubject {
	height: 33px;
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
}

.report {
	background-color: #dcdcdc;
	text-align: center;
	border-bottom: 2px solid gray;
}

.realReport {
	border-bottom: 2px solid gray;
}

.content {
	background-color: #dcdcdc;
	height: 400px;
	line-height: 350px;
	text-align: center;
	border-bottom: 2px solid gray;
}

.realContent {
	border-bottom: 2px solid gray;
}

#QnAtitle {
	display: inline-block;
}

.titleBox {
	height: 33px;
}
</style>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			$('#backBtn').click(function() {
				history.back(-1); //그전의 기록으로 돌아감
			});
		});
	</script>


	<%@ include file="/views/common/header&footer/header.jsp"%>


	<div class="wrapper">

		<div id="postTitle">
			<div class="container">
				<center>
					<div class="row p-0 m-0" id="QnAtitle">
						<H1 id="title">회원 신고</H1>
					</div>
				</center>
			</div>
		</div>

		<div id="postContent">

			<%
				if (m != null) {
			%>
			<form action="/reportWrite.do" method="get">
				<div class="row p-0 m-0 titleBox">
					<div class="col-3 subject">제목</div>
					<div class="col-9 p-0 realSubject">
						<textarea style="resize: none; border: none; outline: none;"
							rows="1" cols="101" placeholder="제목을 작성하세요" name="subject"></textarea>
					</div>
				</div>

				<div class="row p-0 m-0">
					<div class="col-3 report">신고할 회원 ID</div>
					<div class="col-9 p-0 realReport">
						<textarea style="resize: none; border: none; outline: none;"
							rows="1" cols="101" placeholder="신고할 회원의 ID를 입력하세요"
							name="reportId"></textarea>
					</div>
				</div>
				<div class="row p-0 m-0 ">
					<div class="col-3 content">내용</div>
					<div class="col-9 p-0 realContent">
						<textarea style="resize: none; border: none; outline: none;"
							rows="16" cols="101" placeholder="신고사항을 작성하세요" name="content"></textarea>
					</div>
				</div>
				<div>
					<center>
						<br>
						<button type="submit" class="btn btn-outline-secondary">작성
							완료</button>
						<button type="reset" class="btn btn-outline-secondary">작성
							초기화</button>
					</center>
				</div>
			</form>
			<%
				} else {
			%>
			<script>
				alert('로그인 후 회원 신고가 가능합니다. \n 로그인 후 이용해 주세요.');
				history.back(-1);
			</script>
			<%
				}
			%>
		</div>
	</div>


	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>