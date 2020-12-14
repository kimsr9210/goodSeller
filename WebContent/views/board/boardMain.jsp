<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="hotsix.goodseller.board.model.vo.BoardPageData" %>
	<%@ page import="hotsix.goodseller.board.model.vo.Board" %>
	<%@ page import="java.util.ArrayList" %>
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
<link rel="stylesheet" type="text/css" href="/resources/css/boardMain.css?ver=1.3" />

</head>
<body>
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
					<div class="col-12 text-center p-0 m-0">게시판</div>
				</div>
				<div class="row p-0 m-0">
					<div class="col-12 p-0 searchBar">
						<form action="" method=get>
						<fieldset>
							<select>
								<option>제목</option>
								<option>내용</option>
								<option>작성자</option>
							</select>
							<input type="text" name="search" id="search"/>
							<button type="button" class="btn btn-outline-dark" name="searchBtn" id="searchBtn">검색</button>
							<br>
						</fieldset>
						</form>
					</div>
				</div>

				<div class="row p-0 m-0 category line-name text-center">
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name ">No</div>
					<div
						class="col-5 d-none d-lg-block p-0 m-0 font-weight-bold c-name">제목</div>
					<div
						class="col-2 d-none d-lg-block p-0 m-0 font-weight-bold c-name">작성자</div>
					<div
						class="col-2 d-none d-lg-block p-0 m-0 font-weight-bold c-name">날짜</div>
					<div
						class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">조회수</div>
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
						<div class="col-12 col-md-5 p-0"><a href="boardPostClick.do?boardNo=<%=board.getBoardNo()%>"><%=board.getSubject() %></a></div>
						<div class="col-3 col-md-2 p-0 "><%=board.getUserId() %></div>
						<div class="col-3 col-md-2 p-0 "><%=board.getWriteDate() %></div>
						<div class="col-3 col-md-1 p-0 "><%=board.getHit() %></div>
						<div class="col-3 col-md-1 p-0 "><%=board.getAnswerYN() %></div>
					</div>
				<%} %>

				<div class="row p-0 m-0 boardNavi">
					<div class="col-12 p-0 m-0 overview">
						<nav aria-label="Page navigation example">
						<ul class="pagination">
						
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

				<div class="row p-0 m-0 write">
					<div class="col-12 p-0 ">
						<button type="button" class="btn btn-primary" id="writeBtn">게시글 작성</button>
					</div>
				</div>
			</div>

		</div>

		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>
	
	<script>
	$(function(){
		$('#writeBtn').click(function(){
			location.href="/views/board/boardWrite.jsp";
		});
		
	})
	</script>
	
	
</body>

</html>
