<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Board"%>
<%@ page import="hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer"%>
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

#title {
	font-family: Wemakeprice-Bold;
}

div {
	box-sizing: border-box;
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

.postInfoMain {
	background-color: #FBF1F2;
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

#QnAtitle {
	display: inline-block;
}


</style>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>


	<%
		Board board = (Board) request.getAttribute("board");
		String writeDate = String.valueOf(board.getWriteDate());
		String yymmdd = writeDate.substring(0, 10);
		
		BoardAnswer bAnswer = (BoardAnswer) request.getAttribute("boardAnswer");

		String writeDateANS = String.valueOf(bAnswer.getWriteDate());
		String yymmddANS = writeDateANS.substring(0, 10);
		String hhmmANS = writeDateANS.substring(11, 16);
	%>


	<%@ include file="/views/common/header&footer/header.jsp"%>


	<div class="wrapper">

		<div id="postTitle">
			<div class="container">
				<center>
					<div class="row p-0 m-0" id="QnAtitle">
						<H1 id="title">Q&A게시판</H1>
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
				<div class="col-2 postInfo postInfoMain">작성일</div>
				<div class="col-2 postInfo"><%=yymmdd%></div>
				<div class="col-2 postInfo postInfoMain">조회수</div>
				<div class="col-2 postInfo"><%=board.getHit()%></div>
			</div>
			<div class="row p-0 m-0">
				<div class="col-2 content">내용</div>
				<div class="col-10 realContent"><%=board.getContent()%></div>
			</div>
		</div>
<hr>
							<%
								if (board.getAnswerYN() == 'Y') {
									//답변이 완료된 상태일때만 보여줌
							%>

							<div id="postAnswer">

								<div class="row p-0 m-0 contentTitle">
									<div class="col-2 subject">제목</div>
									<div class="col-10 realSubject">
										<b> 
										<%=bAnswer.getSubject() %>
										</b>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col-2 postInfo postInfoMain">작성자</div>
									<div class="col-2 postInfo">
										<%=bAnswer.getAdminId() %>
									</div>
									<div class="col-2 postInfo postInfoMain">작성 날짜</div>
									<div class="col-2 postInfo">
										<%=yymmddANS %>
									</div>
									<div class="col-2 postInfo postInfoMain">작성 시간</div>
									<div class="col-2 postInfo">
										<%=hhmmANS %>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col-2 content">내용</div>
									<div class="col-10 realContent">
										<%=bAnswer.getContent() %>
									</div>
									
								</div>
					
							</div>
							
							<%
								}
							%>
		<div id="postHome">
			<center>
				<%
					if (m != null && m.getUserId().equals(board.getUserId())) {
				%>
				<br><br>
				<button type="submmit" id="postDelBtn"
										class="btn btn-outline-secondary">삭제</button>
				<%
					}
				%>
				<button type="submmit" id="backBtn"
										class="btn btn-outline-secondary">QnA 게시판으로 돌아가기</button>
				
			</center>

		</div>
		<script>
		$(function(){
			$('#postDelBtn').click(function(){
				var result = window.confirm("해당 문의글을 삭제하시겠습니까?");
				
				if(result==true)
				{
					location.href="/boardDelete.do?boardNo=<%=board.getBoardNo()%>";	
				}

				});
			
			$('#backBtn').click(function() {
				location.href = "/boardAllListPage.do";
			});
		});
		</script>

	</div>

	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>