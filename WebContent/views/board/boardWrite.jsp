<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	textarea 
	{
	font-size: 10px;
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
		.subject
		{
			background-color:#dcdcdc;
			text-align:center;
			border-top: 2px solid gray;
			border-bottom: 1px solid gray;
			line-height:30px;
		height:33px;
		}
		.realSubject
		{
		height:33px;
			border-top: 2px solid gray;
			border-bottom: 1px solid gray;
		}
		
		.postInfo
		{
			line-height:28px;
			border-bottom: 1px solid gray;
		}
		
		.postInfoMain
		{
			background-color:#dcdcdc;
			text-align:center;
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
			border-bottom: 2px solid gray;
		}
		
		#QnAtitle{
		display:inline-block;
		}
		.titleBox{
		height:33px;}
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
				<H1>Q&A게시글 작성</H1>
			</div>
		</center>
		</div>
	</div>
	
	<div id="postContent">
	<form action="/boardWrite.do" method="get">
		<div class="row p-0 m-0 titleBox">
			<div class="col-2 subject">제목</div>
			<div class="col-10 p-0 realSubject">
			<textarea style="resize:none; border:none; outline: none;" rows="1" cols="101" placeholder="제목을 작성하세요" name="subject"></textarea>
			</div>
		</div>
		
		<div class="row p-0 m-0">
			<div class="col-2 postInfo postInfoMain">옵션</div>
			<div class="col-10 postInfo">
				<input type="radio" name="postLock" value="Y"> 비밀글 &nbsp;
				<input type="radio" name="postLock" value="N"> 공개글
			</div>
		</div>
		<div class="row p-0 m-0 ">
			<div class="col-2 content">내용</div>
			<div class="col-10 p-0 realContent">
				<textarea style="resize:none ; border:none; outline: none;" rows="16" cols="101" placeholder="문의내용을 작성하세요"
					name="content"></textarea>
			</div>
		</div>
		<div>
				<center>	
				<br>
				<input type="submit" value="작성완료" />
				<button type="button" id="backBtn">목록</button>
				<input type="reset" value="작성 초기화" />
				</center>
		</div>
		</form>
	</div>
	</div>
	

	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>