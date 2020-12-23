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
	table {
		margin: 10px;
		width: 100%;
	}
	td {
		font-size: 12px;
	}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

	<%
		ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
		int userNo = (int) request.getAttribute("userNo");
	%>
	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="contentWrapper m-0 p-0">
		
		<div class="row m-0">
		<div class="col-2 p-0 m-0 ">  

	<%@ include file="/views/admin/header&footer/adminSideNavi.jsp"%>

        </div>
		<div class="col-10">
				<div id="membertable" class="row" style="height: 100%;">
					<table border=1px cellspacing=1px cellpadding=1px>
						<tr>
							<th>회원번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>별명</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>신고 횟수</th>
							<th>취소 횟수</th>
							<th>가입일</th>
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
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>

</body>
</html>