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
	href="/resources/css/boardMain.css?ver=1.6" />

</head>
				<%
				BoardPageData bpd = (BoardPageData)request.getAttribute("pageData");
				
				ArrayList<Board> list = bpd.getList();
				String pageNavi = bpd.getPageNavi();
				
				String selectBox = (String)request.getAttribute("selectBox");
				String searchText = (String)request.getAttribute("searchText");
				%>
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
						<form action="/postSearch.do" method="get">
							<fieldset>
								<select name="selectBox" id="selectOne">
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select> <input type="text" name="searchText" id="searchText" value="<%=searchText%>"/>
								<input type="submit" class="btn btn-outline-dark"
									name="searchBtn" id="searchBtn">
								<br>
							</fieldset>
						</form>
						<br>
					</div>
				</div>

				<div class="row p-0 m-0 category line-name text-center">
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


				<%for(Board board : list){ %>
				<div class="row p-0 m-0 line-content text-center">
					<div class="d-none d-md-block col-md-1 p-0 "><%=board.getBoardNo() %></div>
					<div class="col-12 col-md-5 p-0">

						<%if(board.getPostLockYN()=='N'){ %>
							<a href="boardPostClick.do?boardNo=<%=board.getBoardNo()%>"
								id="postClickBtn"><%=board.getSubject() %></a>
						<%}else if(board.getPostLockYN()=='Y'){ %>
							<%if(m!=null &&(m.getUserId().equals(board.getUserId()))){ %>
							<a href="boardPostClick.do?boardNo=<%=board.getBoardNo()%>"
								id="postClickBtn"><%=board.getSubject() %></a>
							<%}else{ %>
							<a href="/boardAllListPage.do" id="postLock"><%=board.getSubject() %></a>
							<%} %>
						<%}%>
					</div>
					<div class="col-3 col-md-1 p-0 "><%=board.getUserId() %></div>
					<div class="col-3 col-md-2 p-0 "><%=board.getWriteDate() %></div>
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

				<div class="row p-0 m-0 boardNavi">
					<div class="col-12 p-0 m-0 overview">
					<br><br>
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
				<%if(m!=null){ %>
				<div class="row p-0 m-0 write">
					<div class="col-12 p-0 ">
						<button type="button" class="btn btn-primary" id="writeBtn">게시글 작성</button>
					</div>
				</div>
				<%} %>
			</div>

		</div>

		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>
	<script>
		$(function() {
			$('#writeBtn').click(function() {
				location.href = "/views/board/boardWrite.jsp";
			});

			$('#postLock').click(function() {
				alert("작성자만 게시글을 조회할 수 있습니다.");
			});
			 
		})
	</script>
	
	<%if(selectBox.equals("subject")){ %>
		<script>
			$("#selectOne option:eq(0)").attr("selected", "selected");
		</script>
	
	<%}else if(selectBox.equals("content")){ %>
	
		<script>
			$("#selectOne option:eq(1)").attr("selected", "selected");
		</script>
	
	<%}else{ %>
	
		<script>
			$("#selectOne option:eq(2)").attr("selected", "selected");
		</script>
	
	<%} %>
</body>

</html>
