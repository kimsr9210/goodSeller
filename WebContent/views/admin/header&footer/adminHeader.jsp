<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/adminHeader.css" />
<style>
#contents-header>p {
	display: inline;
	float: right;
	margin-bottom: 0px;
	margin-top: 5px;
}
#contents-header>p>a {
	color: white;
	font-size: 12px;
}

#contents-header>p>a:hover {
	text-decoration: underline;
	color: red;
	
}
</style>
</head>
<body>
	<%
		Member admin = (Member) session.getAttribute("admin");
	%>
	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-12" id="contents-header">
					<a href="/index.do"><img src="/resources/images/logo.png"
						style="width: 80px;"></a> 웹 사이트 관리
					<%
						if (admin != null) {
					%>
					<p>
						<a href="#"><%=admin.getUserNick()%>(<%=admin.getUserId()%>)</a> 접속중 &nbsp
						<button style="border: 1px solid black; background-color: gray; color:white"
						onclick = "location.href = '/adminLogout.do'">로그아웃</button>
						<a href="/adminLogout.do"></a>
					</p>

					<%
						}
					%>
				</div>

			</div>
		</div>
	</div>
</body>
</html>