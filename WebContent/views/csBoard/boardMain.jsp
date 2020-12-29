<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.BoardPageData"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Board"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/boardMain.css?ver=1.9" />

<style>
@font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Binggrae-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#title{
font-family: Wemakeprice-Bold;
}

#stitle{
font-family: Binggrae-Bold;
}


</style>


</head>
<body>

	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	
	<div id="wrapper">
		<!-- 
		<div id="header">
			<div id="container top ">
				<div id="core-header" class="row p-0 m-0">
					
				</div>
			</div>
		</div>
		 -->
		<%@ include file="/views/common/header&footer/header.jsp"%>
		<div id="content">
			<div id="container p-0 m-0">

				<div class="row title p-0 m-0">
					<div id="title"class="col-12 text-center p-0 m-0">게시판</div>
				</div>
				<div class="row p-0 m-0">
					<div class="col-12 p-0 searchBar">
						<form action="/postSearch.do" method="get">
							<fieldset>
								<select name="selectBox">
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select> <input type="text" name="searchText" id="searchText" />
								<input type="submit" class="btn btn-outline-dark"
									name="searchBtn" id="searchBtn" value="검색">
								<br>
							</fieldset>
						</form>
						<br>
					</div>
				</div>

				<div  id="stitle" class="row p-0 m-0 category line-name text-center">
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name ">No</div>
					<div
						class="col-5 d-none d-lg-block p-0 m-0 font-weight-bold c-name">제목</div>
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">작성자</div>
					<div
						class="col-2 d-none d-lg-block p-0 m-0 font-weight-bold c-name">날짜</div>
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">조회수</div>
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">공개여부</div>
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">답변여부</div>
				</div>

				<%
				BoardPageData bpd = (BoardPageData)request.getAttribute("pageData");
				
				ArrayList<Board> list = bpd.getList();
				String pageNavi = bpd.getPageNavi();
				%>

				<%for(Board board : list){ %>
				<div class="row p-0 m-0 line-content text-center">
					<div class="d-none d-md-block col-md-1 p-0 "><%=board.getBoardNo() %></div>
					<div class="col-12 col-md-5 p-0">

						<%if(board.getPostLockYN()=='N'){ %>
							<%if(board.getAnswerYN()=='Y'){ //답변 후%>
							<a href="/boardPostClick.do?boardNo=<%=board.getBoardNo()%>"
									id="postClickBtn"><%=board.getSubject() %></a>
							<%}else{ //답변 전%>
							<a href="/boardPostClickNotAns.do?boardNo=<%=board.getBoardNo()%>"
								id="postClickBtn"><%=board.getSubject() %></a>
							<%} %>
							
						<%}else if(board.getPostLockYN()=='Y'){ %>
							<%if(board.getUserId().equals(m.getUserId())){ %>
								<%if(board.getAnswerYN()=='Y'){ //답변 후%>
								<a href="/boardPostClick.do?boardNo=<%=board.getBoardNo()%>"
										id="postClickBtn"><%=board.getSubject() %></a>
								<%}else{ //답변 전%>
								<a href="/boardPostClickNotAns.do?boardNo=<%=board.getBoardNo()%>"
									id="postClickBtn"><%=board.getSubject() %></a>
								<%} %>
							<%}else{ %>
							<a href="/boardAllListPage.do" id="postLock"><%=board.getSubject() %></a>
							<%} %>
						<%} %>
							
						
					</div>
					<div class="col-3 col-md-1 p-0 "><%=board.getUserId() %></div>
					<%
					String writeDate = String.valueOf(board.getWriteDate());
					String yymmdd = writeDate.substring(0, 10);
					%>
					<div class="col-3 col-md-2 p-0 "><%=yymmdd%></div>
					<div class="col-2 col-md-1 p-0 "><%=board.getHit() %></div>
					<div class="col-2 col-md-1 p-0 ">
						<%if(board.getPostLockYN()=='Y'){ %>
						비밀글
						<%}else{ %>
						공개글
						<%} %>
					</div>
					<div class="col-2 col-md-1 p-0 ">
						<%if(board.getAnswerYN()=='N'){ %>
						미답변
						<%}else{ %>
						답변
						<%} %>
					</div>
				</div>
				<%} %>
				
				<%if(m!=null){ %>
				<div class="row p-0 m-0 write">
					<div class="col-12 p-0 ">
					</div>
				</div>
				<div class="row p-0 m-0 write">
					<div class="col-12 p-0 ">
						<button type="button" class="btn btn-danger" id="writeBtn">게시글 작성</button>
					</div>
				</div>

				<%} %>
				
				<div class="row p-0 m-0 boardNavi">
				
					<div class="col-12 p-0 m-0 overview">
					<br>
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<!-- 
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						-->

							<%=pageNavi %>

						</ul>
						</nav>
					</div>
				</div>

			</div>

		</div>

		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>
	<script>
		$(function() {
			$('#writeBtn').click(function() {
				location.href = "/views/csBoard/boardWrite.jsp";
			});

			$('#postLock').click(function() {
				alert("작성자만 게시글을 조회할 수 있습니다.");
			});
			

		})
	</script>


</body>

</html>
