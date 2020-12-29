<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Report"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportAnswer"%>
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

#title {
	font-family: Wemakeprice-Bold;
}

div {
	box-sizing: border-box;
}

.contentWrapper {
	width: 50%;
	padding: 30px 0;
	margin: 50px auto;
	border: 1px solid red;
}

#postTitle {
	padding-bottom: 50px;
}

.subject {
	background-color: #FBF1F2;
	line-height: 50px;
	text-align: center;
	border-top: 2px solid #D6626E;
	border-bottom: 1px solid #D6626E;
}

.realSubject {
	line-height: 50px;
	border-top: 2px solid #D6626E;
	border-bottom: 1px solid #D6626E;
}

.postInfo {
	line-height: 28px;
	text-align: center;
	border-bottom: 1px solid #D6626E;
}

.postInfoNone {
	line-height: 28px;
	border-bottom: 1px solid #D6626E;
}

.postInfoMain {
	background-color: #FBF1F2;
	border-bottom: 1px solid #D6626E;
}

.content {
	background-color: #FBF1F2;
	height: 400px;
	line-height: 350px;
	text-align: center;
	border-bottom: 2px solid #D6626E;
}

.realContent {
	padding-top: 10px;
	border-bottom: 2px solid #D6626E;
}

#ReportTitle {
	display: inline-block;
}

</style>
</head>
<body>

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>


	<script>
		$(function() {
			$('#backBtn').click(function() {
				location.href = "/reportList.do";
			});

		});
	</script>
	<%
		Report r = (Report) request.getAttribute("report");

		String writeDate = String.valueOf(r.getWriteDate());
		String yymmdd = writeDate.substring(0, 10);
		String hhmm = writeDate.substring(11, 16);
	%>

	<%@ include file="/views/common/header&footer/header.jsp"%>
	<div id="wrap">
		<div class="contentWrapper">


			<div id="postTitle">
				<div class="container">
					<center>
						<div class="row p-0 m-0" id="ReportTitle">
							<H1 id="title">나의 신고 내역</H1>
						</div>
					</center>
				</div>
			</div>

			<div id="postContent">
				<div class="row p-0 m-0 contentTitle">
					<div class="col-2 subject">제목</div>
					<div class="col-10 realSubject">
						<b><%=r.getSubject()%></b>
					</div>
				</div>
				<div class="row p-0 m-0">
					<div class="col-2 postInfo postInfoMain">작성자</div>
					<div class="col-2 postInfo"><%=r.getUserId()%></div>
					<div class="col-2 postInfo postInfoMain">작성 날짜</div>
					<div class="col-2 postInfo"><%=yymmdd%></div>
					<div class="col-2 postInfo postInfoMain">작성 시간</div>
					<div class="col-2 postInfo"><%=hhmm%></div>
				</div>
				<div class="row p-0 m-0 contentTitle">
					<div class="col-2 postInfo postInfoMain">신고 회원</div>
					<div class="col-10 postInfoNone">
						<b><%=r.getReportId()%></b>
					</div>
				</div>
				<div class="row p-0 m-0">
					<div class="col-2 content">내용</div>
					<div class="col-10 realContent"><%=r.getContent()%></div>
				</div>
			</div>
			<hr>

			<div id="postHome">
				<br> <br>
				<center>
					<button type="submmit" id="backBtn"
						class="btn btn-outline-secondary">나의 신고 내역으로 돌아가기</button>
				</center>
				<br> <br>

			</div>

		</div>

	</div>

	<%@ include file="/views/common/header&footer/footer.jsp"%>

</body>
</html>