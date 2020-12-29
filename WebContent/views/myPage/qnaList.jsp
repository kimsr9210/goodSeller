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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" type="text/css"
	href="/resources/css/qnaList.css" /> -->
<style>
@charset "UTF-8";
/* -------------------------------폰트 모음----------------------------- */
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
/* -------------------------------폰트 모음----------------------------- */
#mainCate {
	font-family: Wemakeprice-Bold;
	font-size: 30px;
}

#contents {
	background-color: white;
}

#contents-navi {
	margin-left: -40px;
	line-height: 50px;
}

#contents-navi>li {
	list-style-type: none;
	float: left;
	text-align: center;
	height: 30px;
}

#contents-navi>li>a {
	height: 300px;
	height: 100%;
	text-decoration: none;
	font-size: 12px;
	color: black;
	font-weight: 600;
}

#contents-navi>li>a:hover {
	color: #5B5AFF;
	border-bottom: 2px solid #5B5AFF;
}

#contents-mypage {
	border-top: 1px solid #CCCCCC;
}
/* 선택된 front 색깔 표시*/
#contents-navi>li:nth-child(7)>a {
	color: #5B5AFF;
	border-bottom: 2px solid #5B5AFF;
}
/*-----------------컨텐츠내용-------------------*/
#qna-box {
	border: 1px solid #CCCCCC;
	margin: 30px auto;
	border-radius: 12px;
	padding: 0;
}

#info-title {
	width: 100%;
	align-content: center;
	margin: 30px 0px 30px 20px;
	font-size: 20px;
	font-weight: 600;
}

/* 거래내역 네비 */
#qna-navi {
	width: 100%;
	margin: 0px 0px 0px 0px;
	height: 30px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	line-height: 30px;
	font-weight: 800;
	text-align: center;
	overflow: hidden;
}

#qna-navi>div:nth-child(1) {
	/*width: 10%;*/
	float: left;
	font-size: 12px;
	border-right: 1px solid black;
}

#qna-navi>div:nth-child(2) {
	/*width: 10%;*/
	float: left;
	font-size: 12px;
	border-right: 1px solid black;
}

#qna-navi>div:nth-child(3) {
	/*width: 10%;*/
	float: left;
	font-size: 12px;
	border-right: 1px solid black;
}

#qna-navi>div:nth-child(4) {
	/*width: 10%;*/
	float: left;
	font-size: 12px;
	border-right: 1px solid black;
}

#qna-navi>div:nth-child(5) {
	width: 10%;
	float: left;
	font-size: 12px;
}

/* 태그 글자 색 */
.qna-box-size a {
	color: black;
}

#qna-btn {
	width: 100px;
	height: 40px;
	line-height: 40px;
	float: right;
	font-size: 13px;
	background-color: black;
	text-align: center;
	text-decoration: 0;
	color: white;
	font-weight: 800;
	transition: 0.2s;
}

#qna-btn-box {
	height: 40px;
	margin-top: -20px;
	margin-bottom: 30px;
}

#qna-btn:hover {
	background-color: #D9D9D9;
	color: black;
}

#qnaPostSubject>a{
text-decoration : none;
}
</style>
</head>
<body>
	<%
		BoardPageData bpd = (BoardPageData) request.getAttribute("pageData");

		ArrayList<Board> list = bpd.getList();
		String pageNavi = bpd.getPageNavi();
	%>
	<%@ include file="/views/common/header&footer/header.jsp"%>
	<%
		if (m != null) {
			if (!list.isEmpty()) {
	%>
	<div id="wrap">
		<!-- 전체 틀-->
		<!-- -------------------------------------------------------------------- -->
		<div id="contents" class="menu-none">
			<%@ include file="/views/common/memberInfoNav.jsp"%>
			<div id="contents-mypage">
				<div class="container" id="qna-box">
					<div class="row col-12 col-lg-12">
						<div id="info-title">
							<div>Q&A</div>
						</div>
					</div>
					<div id="qna-navi" class="row col-12 col-lg-12">
						<div class="col-1">번호</div>
						<div class="col-7">글제목</div>
						<div class="col-2">작성일</div>
						<div class="col-1">조회수</div>
						<div class="col-1">상태</div>
					</div>

					<%
						for (Board board : list) {
					%>
					<div class="row p-0 m-0 line-content text-center py-1">
						<div class="d-none d-md-block col-md-1 p-0 "><%=board.getBoardNo()%></div>

						<div class="col-7 col-md-7 p-0" id="qnaPostSubject">
						<%if(board.getAnswerYN() == 'Y'){ %>
							<a href="/myPageCsBoardClick.do?boardNo=<%=board.getBoardNo()%>"
									id="postClickBtn"><%=board.getSubject() %></a>
						<%}else{ %>
							<a href="/myPageCsBoardClickNotAns.do?boardNo=<%=board.getBoardNo()%>"
									id="postClickBtn"><%=board.getSubject() %></a>
						<%} %>
						</div>

						<div class="col-2 col-md-2 p-0 "><%=board.getWriteDate()%></div>
						<div class="col-1 col-md-1 p-0 "><%=board.getHit()%></div>

						<div class="col-1 col-md-1 p-0 ">
							<%
								if (board.getAnswerYN() == 'N') {
							%>
							미답변
							<%
								} else {
							%>
							답변완료
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>

				</div>

				<div class="row p-0 m-0 boardNavi">
					<div class="col-12 p-0 m-0 overview">
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%=pageNavi%>
						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%
		} else {
	%>
	<div id="wrap">
		<div id="contents" class="menu-none">
			<%@ include file="/views/common/memberInfoNav.jsp"%>
			<div id="contents-mypage">
				<div class="container" id="qna-box">
					<div class="row">
						<div class="col-12 text-center">
							<img src="/resources/images/hide.png" />

						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<span id="mainCate">내가 작성한 Q&A 게시물이 없습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		} else {
	%>
	<script>
		alert("세션 만료. 다시 로그인하여 주십시오");
		location.href = "/index.do";
	</script>
	<%
		}
	%>
	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>