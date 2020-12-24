<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<%@ page import="hotsix.goodseller.admin.member.model.vo.MemberPageData"%>
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
	border-top: 2px solid black;
	border-bottom: 1px solid gray;
}

th {
	background-color: ghostwhite;
	font-size: 12px;
}

.column {
	text-align: center;
	padding: 10px;
}

td {
	font-size: 12px;
	text-align: center;
	padding: 10px 5px;
	padding:
}

#title {
	margin: 10px 0;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			//최상단 체크박스 클릭
			$("#checkAll").click(function() {
				//클릭되었으면
				if ($("#checkAll").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input[name=chk]").prop("checked", true);
					//클릭이 안되있으면
				} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input[name=chk]").prop("checked", false);
				}
			})
		})
	</script>
	<%
		MemberPageData mpd = (MemberPageData) request.getAttribute("MemberPageData");
	ArrayList<Member> list = mpd.getList();
	String pageNavi = mpd.getPageNavi();
	%>
	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="contentWrapper m-0 p-0">

			<div class="row m-0">
				<div class="col-2 p-0 m-0 ">

					<%@ include file="/views/admin/header&footer/adminSideNavi.jsp"%>

				</div>
				<div class="col-10">
					<h3 id="title">관리자 회원</h3>
					<div>
						<div>
							<form action="/memberSearchList.do" method="get">
								<label>회원 검색</label>&nbsp&nbsp&nbsp 
								<select name="select">
									<option value="userId">아이디</option>
									<option value="userNick">닉네임</option>
								</select>
								<input type="text" name="keyword"/>
								<input type="submit" value="검색" />
							</form>
						</div>
					</div>

					<div id="membertable" class="row" style="height:">
						<table cellspacing=1px cellpadding=1px>
							<tr>
								<th class="column"><input type="checkbox" id="checkAll" /></th>
								<th class="column">회원번호</th>
								<th class="column">ID</th>
								<th class="column">이름</th>
								<th class="column">별명</th>
								<th class="column">생년월일</th>
								<th class="column">성별</th>
								<th class="column">이메일</th>
								<th class="column">전화번호</th>
								<th class="column" style="width: 200px;">주소</th>
								<th class="column">신고 횟수</th>
								<th class="column">취소 횟수</th>
								<th class="column">가입일</th>
							</tr>
							<form>
								<%
									for (Member m : list) {
								%>
								<tr>
									<td><input type="checkbox" name="chk" /></td>
									<td><%=m.getUserNo()%></td>
									<td><%=m.getUserId()%></td>
									<td><%=m.getUserName()%></td>
									<td><%=m.getUserNick()%></td>
									<td><%=m.getBirth()%></td>
									<%
										if (m.getGender() == 'M') {
									%>
									<td>남</td>
									<%
										} else {
									%>
									<td>여</td>
									<%
										}
									%>
									<td><%=m.getEmail()%></td>
									<td><%=m.getPhone()%></td>
									<td><%=m.getAddress()%></td>
									<td><%=m.getReported()%></td>
									<td><%=m.getCancellation()%></td>
									<td><%=m.getEnrollDate()%></td>
								</tr>
								<%
									}
								%>
							</form>
						</table>
						<p style="margin: 10px">
							선택한 회원을 <input type="submit" value="강제탈퇴" />
						</p>

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
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>

</body>
</html>