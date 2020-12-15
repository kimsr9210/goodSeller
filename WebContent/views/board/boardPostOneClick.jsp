<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hotsix.goodseller.board.model.vo.Board" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
	
	div
	{
	box-sizing:border-box;
	}
		.wrapper{
		width:50%;
		padding: 30px 0;
		margin:50px auto;
		}
		#postTitle
		{
			padding-bottom:50px;
		}
		
		#postContent
		{
			border-radius: 10px;
		}

		.subject
		{
			background-color:#dcdcdc;
			line-height:50px;
			text-align:center;
			border-top: 2px solid gray;
			border-bottom: 1px solid gray;
		}
		.realSubject
		{
			line-height:50px;
			border-top: 2px solid gray;
			border-bottom: 1px solid gray;
		}
		
		.postInfo
		{
			height:30px;
			line-height:28px;
			text-align:center;
			border-bottom: 1px solid gray;
		}
		
		.postInfoMain
		{
			background-color:#dcdcdc;
		}
		
		.content
		{
			background-color:#dcdcdc;
			height:400px;
			line-height:350px;
			text-align:center;
			border-bottom: 2px solid gray;
		}
		
		.realContent
		{
			padding-top: 10px;
			border-bottom: 2px solid gray;
		}
		
		#QnAtitle{
		display:inline-block;
		}
		#postHome>center>a
		{
		text-decoration : none;
		color: black;
		border:1px solid gray;
		border-radius:5px;
		}
		#postHome>center>a:hover
		{
		text-decoration : none;
		color: white;
		background-color: gray;
		}
		
	</style>
</head>
<body>
	<%
		Board board = (Board)request.getAttribute("board");
	%>
	
	
	<%@ include file="/views/common/header&footer/header.jsp"%>
		

	<div class="wrapper">
	
	<div id="postTitle">
		<div class="container">
		<center>
			<div class="row p-0 m-0" id="QnAtitle">
				<H1>Q&A게시판</H1>
			</div>
		</center>
		</div>
	</div>
	
	<div id="postContent">
		<div class="row p-0 m-0 contentTitle">
			<div class="col-2 subject">제목</div>
			<div class="col-10 realSubject"><b><%=board.getSubject() %></b></div>
		</div>
		<div class="row p-0 m-0">
			<div class="col-2 postInfo postInfoMain">작성자</div>
			<div class="col-2 postInfo"><%=board.getUserId() %></div>
			<div class="col-2 postInfo postInfoMain">작성일</div>
			<div class="col-2 postInfo"><%=board.getWriteDate() %></div>
			<div class="col-2 postInfo postInfoMain">조회수</div>
			<div class="col-2 postInfo"><%=board.getHit() %></div>
		</div>
		<div class="row p-0 m-0">
			<div class="col-2 content">내용</div>
			<div class="col-10 realContent"><%=board.getBoardContent() %></div>
		</div>
	</div>
	
	<div id="postAnswer">
		<div class="row p-0 m-0">
		<br><br>
		관리자페이지에서 답변 표시 (if문 사용해서 answer_YN='Y'이면 보여주고 없으면 아직 답변전이라고 안내)
		<br><br>
		</div>
	</div>
	
	<div id="postHome">
		<center>
		<%if(m != null && m.getUserId().equals(board.getUserId())){%>
			<a id="postDelBtn">&nbsp; 삭제 &nbsp;</a>
		<%} %>
			<a href="/boardAllListPage.do">&nbsp; 게시판으로 돌아가기 &nbsp;</a>
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
		});
	</script>
	
	</div>

		<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>