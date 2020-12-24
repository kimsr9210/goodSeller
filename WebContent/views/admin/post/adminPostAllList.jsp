<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.PostPageData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/auctionPage.css" />
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

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!-- css -->

<style>
table {
	margin: 10px;
	width: 100%;
}

th {
	font-size: 14px;
}

td {
	font-size: 12px;
}


.changeBtn {
	width: 100%;
	height: 100%;
	background-color: #cccccc;
}
.pagination>ul>a{
	color: black;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<%
		PostPageData ppd = (PostPageData) request.getAttribute("PostPageData");
		ArrayList<Post> list = ppd.getList();
		String pageNavi = ppd.getPageNavi();
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


						<div class="reportBoardContents" >

					<div id="membertable" class="row">
						<table border=1px cellspacing=1px cellpadding=1px>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>입찰종료일</th>
								<th>작성일</th>
								<th>시작금액</th>
								<th>즉시구매</th>
								<th>구매자</th>
								<th>구매방법</th>
								<th>경매최종</th>
								<th>카테고리</th>
								<th>상세카테고리</th>
								<th>종료여부</th>
								<th>삭제여부</th>
								<th>조회수</th>
							</tr>
							<%
								for (Post p : list) {
							%>
							<tr>
								<td><%=p.getPostNo()%></td>
								<td><%=p.getSubject()%></td>
								<td><%=p.getContent()%></td>
								<td><%=p.getWriter()%></td>
								<td><%=p.getEndDate()%></td>
								<td><%=p.getRegDate()%></td>
								<td><%=p.getStartPrice()%></td>
								<td><%=p.getBuyPrice()%></td>
								<td><%=p.getBuyer()%></td>
								<td><%=p.getSellMethod()%></td>
								<td><%=p.getAuctionPrice()%></td>
								<td><%=p.getMainCategory()%></td>
								<td><%=p.getSubCategory()%></td>

								<form action="/adminSellStateChange.do" method="post">
									<input type="hidden" name="postNo" value="<%=p.getPostNo()%>" />
									<input type="hidden" name="sell_yn" value="<%=p.getSell_yn()%>" />
									<td><button type="submit" id="sellBtn" class="changeBtn"><%=p.getSell_yn()%></button></td>
								</form>

								<form action="/adminDellStateChange.do" method="post">
									<input type="hidden" name="postNo" value="<%=p.getPostNo()%>" />
									<input type="hidden" name="del_yn" value="<%=p.getDel_yn()%>" />
									<td><button type="submit" id="delBtn" class="changeBtn"><%=p.getDel_yn()%></button></td>
									<td><%=p.getHit()%></td>
								</form>
							</tr>
							<%
								}
							%>
						</table>

					</div>

							<div class="row p-0 m-0 boardNavi">
								<div class="col-12 p-0 m-0 overview">
									<br>
									
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
			</div>

		</div>
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>
	
	
	
</body>
</html>