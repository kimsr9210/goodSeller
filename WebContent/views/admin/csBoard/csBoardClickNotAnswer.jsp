<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Board"%>
<%@ page import="hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/resources/css/boardClickNotAns.css?ver=1.1" />
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

#csBoardAnswerWrite {
	display: none
}
</style>
</head>
<body>

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<%
		Board board = (Board) request.getAttribute("board");

		String writeDate = String.valueOf(board.getWriteDate());
		String yymmdd = writeDate.substring(0, 10);
		String hhmm = writeDate.substring(11, 16);
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
											<H1 id="title">QnA 게시판</H1>
										</div>
									</center>
								</div>
							</div>

							<div id="postContent">
								<div class="row p-0 m-0 contentTitle">
									<div class="col-2 subject">제목</div>
									<div class="col-10 realSubject">
										<b><%=board.getSubject()%></b>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col-2 postInfo postInfoMain">작성자</div>
									<div class="col-2 postInfo"><%=board.getUserId()%></div>
									<div class="col-2 postInfo postInfoMain">작성 날짜</div>
									<div class="col-2 postInfo"><%=yymmdd%></div>
									<div class="col-2 postInfo postInfoMain">작성 시간</div>
									<div class="col-2 postInfo"><%=hhmm%></div>
								</div>

								<div class="row p-0 m-0">
									<div class="col-2 content">내용</div>
									<div class="col-10 realContent"><%=board.getContent()%></div>
								</div>
							</div>
							<hr>

							<div id="postAnswer">

							<%
								if(board.getAnswerYN() == 'N') {
							%>
							<div id="csBoardAnswerWrite">

								<form action="/QnABoardAnswerWrite.do" method="post">
									<div class="row p-0 m-0 titleBox">
										<div class="col-2 subject">제목</div>
										<div class="col-10 p-0 realSubject">
											<textarea style="resize: none; border: none; outline: none;"
												rows="1" cols="101" placeholder="제목을 작성하세요" name="subject"></textarea>
										</div>
									</div>
									<div class="row p-0 m-0 ">
										<div class="col-2 content">내용</div>
										<div class="col-10 p-0 realContent">
											<textarea style="resize: none; border: none; outline: none;"
												rows="16" cols="101" placeholder="신고사항에 대해 조치한 내용을 적어주세요"
												name="content"></textarea>
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
										<input type="hidden" name="boardNo"
											value="<%=board.getBoardNo()%>" />
									</div>
								</form>
							</div>
							<%
								}
							%>
								
							<div id="postHome">
								<br> <br>
								<center>
									<%
										if (board.getAnswerYN() == 'N') {
									%>
									<button type="button" id="answerWriteBtn"
										class="btn btn-outline-secondary">문의글 답변 작성</button>
									<%
										}
									%>
									<button type="submmit" id="backBtn"
										class="btn btn-outline-secondary">QnA 관리 게시판으로 돌아가기</button>
								</center>
								<br> <br>
								<script>
									$(function() {
										$('#backBtn')
												.click(
														function() {
															location.href = "/adminCsBoardAllPageList.do";
														});

										//answerWriteBtn 누르면 히든 폼 나와서 입력후 servlet전달?
										$("#answerWriteBtn").click(function() {
											var csBoardAnswerWrite = $('#csBoardAnswerWrite');

											if (csBoardAnswerWrite.is(":visible")) {
												csBoardAnswerWrite.slideUp();
											} else {
												csBoardAnswerWrite.slideDown();
											}
										});
										
									});
								</script>
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