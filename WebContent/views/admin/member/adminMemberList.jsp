<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
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
	href="/resources/css/adminIndex.css" />
<style>
#contents-navi {
	padding: 0px;
	margin: 10px 0px;
}

#contents-navi>li {
	list-style-type: none;
	float: left;
	text-align: center;
	height: 30px;
}

#contents-navi>li>a {
	text-decoration: none;
	color: black;
}

#contents-navi>li>a:hover {
	border-bottom: 2px solid #5B5AFF;
	color: #5B5AFF;
}
</style>
</head>
<body>
<body>
	<%
		ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
		int userNo = (int) request.getAttribute("userNo");
	%>
	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="container">
			<div class="row">
				<ul class="col-12" id="contents-navi" style="width: 100%;">
					<li class="col-3 col-md-3 col-lg-3"><a
						href="/memberAllList.do">회원 관리</a></li>
					<li class="col-3 col-md-3 col-lg-3"><a
						href="/views/member/memberList.jsp">게시글 관리</a></li>
					<li class="col-3 col-md-3 col-lg-3"><a
						href="/adminReportAllPageList.do">회원 신고</a></li>
					<li class="col-3 col-md-3 col-lg-3"><a
						href="/views/member/memberList.jsp">QnA</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="container">
				<div id="membertable" class="row" style="height: 100%;">
					<table border=1px cellspacing=1px cellpadding=1px>
						<tr>
							<td>회원번호</td>
							<td>ID</td>
							<td>이름</td>
							<td>별명</td>
							<td>생년월일</td>
							<td>성별</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>주소</td>
							<td>신고 횟수</td>
							<td>취소 횟수</td>
							<td>가입일</td>
						</tr>
						<%for (Member m : list){%>
						<tr>
							<td><%=m.getUserNo() %></td>
							<td><%=m.getUserId() %></td>
							<td><%=m.getUserName() %></td>
							<td><%=m.getUserNick() %></td>
							<td><%=m.getBirth() %></td>
							<td><%=m.getGender() %></td>
							<td><%=m.getEmail() %></td>
							<td><%=m.getPhone() %></td>
							<td><%=m.getAddress() %></td>
							<td><%=m.getReported() %></td>
							<td><%=m.getCancellation() %></td>
							<td><%=m.getEnrollDate() %></td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>

</body>
</html>