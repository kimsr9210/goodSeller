<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Report"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportAnswer"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/css/boardMain.css?ver=1.8" />
<style>
#container {
	height: 60%;
	width: 60%;
}

.col-md-2 {
	border-right: 1px solid gray;
	height: 50px;
	text-align: center;
}

.input-sty {
	width: 90%;
	line-height: 3;
}

.row {
	border-top: 1px solid gray;
}

#rowBtn {
	text-align: center;
}

#note {
	height: 400px;
}

#noteText {
	height: 100%;
	width: 100%;
}

.btn-outline-secondary {
	height: 50px;
}
</style>
<body>

	<%
		Report r = (Report) request.getAttribute("register");	// 내용 출력
		
			ArrayList<ReportAnswer> list = (ArrayList<ReportAnswer>) request.getAttribute("commentList");	// 댓글 출력
	%>


	<div id="wrapper">
		<%@ include file="/views/common/header&footer/header.jsp"%>


		<div id="content">
			<div id="container">
				<h1 style="text-align: center;">신고 게시판</h1>
				<br>
				<div class="row">
					<div class="col-md-2">제목</div>
					<div class="col-md-10">
						<%=r.getSubject()%></div>
				</div>

				<div class="row">
					<div class="col-md-2">작성자</div>
					<div class="col-md-10"><%=r.getUserId()%></div>
				</div>

				<div class="row">
					<div class="col-md-2">신고자</div>
					<div class="col-md-10">
						<%=r.getReguserId()%></div>
				</div>

				<div class="row">
					<div class="col-md-2" id="note">내용</div>
					<div class="col-md-10" style="padding: 20px;">
						<textarea name="content" disabled="true"
							style="height: 100%; width: 100%; resize: none;"><%=r.getContent()%></textarea>

					</div>
				</div>

				<!-------------------------------댓글 작성 ------------------------------->
				
				<!----------------------------------------------------------------------->
		<div id="comment">
			<center>
				<%
					if (!list.isEmpty()) {
				%>

				<table>
					<tr>
						<th>댓글내용</th>
						<th>작성일</th>
					</tr>

					<%
						for (ReportAnswer rc : list) {
					%>
					<tr>
						<td id="content_<%=rc.getCommntNo()%>"><%=rc.getContent()%></td>
						<td><%=rc.getRegDate()%></td>


						<%
							//if (m != null && m.getUserId().equals(bc.getUserId())) {
						%>
						<%-- <td>
							<!-- 댓글 수정 폼태그 -->
							<form action="/boardCommentModify.kh" method="post"
								style="display: inline">
								<button type="button" class="commentModifyBtn">수정</button>
								<input type="hidden" name="commentNo"
									value="<%=bc.getCommentNo()%>" /> <input type="hidden"
									name="co_content" /> <input type="hidden" name="boardNo"
									value="<%=board.getBoardNo()%>" />

							</form> <!-- 댓글 삭제 폼태그 -->
							<form action="/boradCommentDelete.kh" method="post"
								style="display: inline">
								<button type="button" class="commentDeleteBtn">삭제</button>
								<input type="hidden" name="commentNo"
									value="<%=bc.getCommentNo()%>" /> <input type="hidden"
									name="boardNo" value="<%=board.getBoardNo()%>" />

							</form>
						</td> --%>
						<%
							//}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<%
					} else {
				%>
				<h2>댓글이 없습니다. 댓글을 작성해보세요</h2>
				<%
					}
				%>
				<form action="/registerCommentWrite.do" method="post">
					<br> <input type="text" size="70" name="comment"
						placeholder="댓글을 작성해주세요." /> <input type="hidden" name="boardNo"
						value="<%=r.getBoardNo()%>" /> <input type="submit"
						class="btn btn-outline-secondary" value="작성" /><br>
				</form>
			</center>
		</div>
				
			</div>
		</div>

		

		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>