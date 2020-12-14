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
	box-sizing:borderbox;
	}
		.wrapper{
		width:50%;
		padding: 30px 0;
		margin:50px auto;
		}
		#postTop
		{
			padding-bottom:50px;
		}
		
		#postContent
		{
			border-radius: 10px;
			border:1px solid black;
		}

		.subject
		{
			border-top-left-radius: 10px;
			background-color:gray;
			color:white;
			height:50px;
			line-height:50px;
			border-bottom: 1px solid white;
		}
		.realSubject
		{
			line-height:50px;
		}
		
		.content
		{
			border-bottom-left-radius: 10px;
			background-color:gray;
			color:white;
			height:400px;
			line-height:350px;
		}
		
		.realContent
		{
			margin-top: 10px;
		}
	</style>
</head>
<body>
	<%
		Board board = (Board)request.getAttribute("board");
	%>
	
	
	<%@ include file="/views/common/header&footer/header.jsp"%>
		

	<div class="wrapper">
	<div id="postTop">
		<div class="container">
			<div class="row p-0 m-0">
				<center><H1>Q&A게시판</H1></center>
			</div>
		</div>
	</div>
	
	<div id="postContent">
		<div class="row p-0 m-0">
			<div class="col-2 subject">제목</div>
			<div class="col-10 realSubject"><%=board.getSubject() %></div>
		</div>
		
		<div class="row p-0 m-0">
			<div class="col-2 content">내용</div>
			<div class="col-10 realContent"><%=board.getBoardContent() %></div>
		</div>
	</div>
	<div></div>
	</div>
	<!-- 
		<H1>Q&A 게시판</H1>
			<H4>글번호 :
				<%=board.getBoardNo()%>
				/ 글쓴이 :
				<%=board.getUserId()%>
				/ 작성일 :
				<%=board.getWriteDate()%>
			</H4>
			<br>
			<h2>
			글 제목 : <%=board.getSubject()%>
			</h2>
			<br>
		 -->	

		<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>