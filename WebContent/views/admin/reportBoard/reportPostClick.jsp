<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Report"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportAnswer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/resources/css/boardClickAns.css?ver=1.1" />
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


#reportAnswerWrite {
	display: none
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
				location.href = "/adminReportAllPageList.do";
			});

			//answerWriteBtn 누르면 히든 폼 나와서 입력후 servlet전달?
			$("#answerWriteBtn").click(function() {
				var reportAnswerWrite = $('#reportAnswerWrite');

				//화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (reportAnswerWrite.is(":visible")) {
					reportAnswerWrite.slideUp();
				} else {
					reportAnswerWrite.slideDown();
				}
			});
		});
	</script>
	<%
		Report r = (Report) request.getAttribute("report");

		String writeDate = String.valueOf(r.getWriteDate());
		String yymmdd = writeDate.substring(0, 10);
		String hhmm = writeDate.substring(11, 16);
		
		ReportAnswer rAnswer = (ReportAnswer)request.getAttribute("reportAnswer");

		String writeDateRA = String.valueOf(rAnswer.getWriteDate());
		String yymmddRA = writeDate.substring(0, 10);
		String hhmmRA = writeDate.substring(11, 16);

	%>

	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="contentWrapper m-0 p-0">

			<div class="row m-0">
				<div class="col-2 p-0 m-0 ">

					<%@ include file="/views/admin/header&footer/adminSideNavi.jsp"%>

				</div>
				<div class="col-10">
					<div class="row" style="height: 100%;">


						<div class="reportBoardContents">


							<div id="postTitle">
								<div class="container">
									<center>
										<div class="row p-0 m-0" id="ReportTitle">
											<H1 id="title">회원 신고 관리 게시판</H1>
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

							<%
								if (r.getAnswerYN() == 'Y') {
									//답변이 완료된 상태일때만 보여줌
							%>

							<div id="postAnswer">

								<div class="row p-0 m-0 contentTitle">
									<div class="col-2 subject">제목</div>
									<div class="col-10 realSubject">
										<b> 
										<%=rAnswer.getSubject() %>
										</b>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col-2 postInfo postInfoMain">작성자</div>
									<div class="col-2 postInfo">
										<%=rAnswer.getAdminId() %>
									</div>
									<div class="col-2 postInfo postInfoMain">작성 날짜</div>
									<div class="col-2 postInfo">
										<%=yymmddRA %>
									</div>
									<div class="col-2 postInfo postInfoMain">작성 시간</div>
									<div class="col-2 postInfo">
										<%=hhmmRA %>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col-2 content">내용</div>
									<div class="col-10 realContent">
										<%=rAnswer.getContent() %>
									</div>
								</div>

							</div>
							
							<%
								}
							%>
							<div id="postHome">
								<br> <br>
								<center>
									<%
										if (r.getAnswerYN() == 'N') {
									%>
									<button type="button" id="answerWriteBtn"
										class="btn btn-outline-secondary">게시글 답변 작성</button>
									<%
										}
									%>
									<button type="submmit" id="backBtn"
										class="btn btn-outline-secondary">신고 관리 게시판으로 돌아가기</button>
								</center>
								<br> <br>

							</div>

						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>

</body>
</html>