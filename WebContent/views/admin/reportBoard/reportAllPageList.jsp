<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportPageData" %>
<%@ page import="hotsix.goodseller.user.board.model.vo.Report"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportAnswer" %>
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
	href="/resources/css/adminReportBoard.css?ver=1.1" />

</head>
<body>
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	
	<div id="wrapper">
	
		<%@ include file="/views/common/header&footer/header.jsp"%>
	
		<div id="content">
			<div id="container p-0 m-0">

				<div class="row title p-0 m-0">
					<div class="col-12 text-center p-0 m-0">신고 게시글 관리</div>
				</div>

				<div class="row p-0 m-0 category line-name text-center">
					<div class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name ">No</div>
					<div class="col-7 d-none d-lg-block p-0 m-0 font-weight-bold c-name">제목</div>
					<div class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">작성자</div>
					<div class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">날짜</div>
					<div class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">시간</div>
					<div class="col-1 d-none d-lg-block p-0 m-0 font-weight-bold c-name">답변여부</div>
				</div>

				<%
					ReportPageData rpd = (ReportPageData)request.getAttribute("ReportPageData");
						
						ArrayList<Report> list = rpd.getList();
						String pageNavi = rpd.getPageNavi();
				%>
				
				<%
					for(Report r : list){
				%>
				<div class="row p-0 m-0 line-content text-center">
					<div class="d-none d-md-block col-md-1 p-0 "><%=r.getReportNo() %></div>
					<div class="col-12 col-md-7 p-0"><a href="/adminReportClick.do?reportNo=<%=r.getReportNo()%>"><%=r.getSubject() %></a></div>
					<div class="col-3 col-md-1 p-0 "><%=r.getUserId() %></div>
					<% 
					String writeDate = String.valueOf(r.getWriteDate());
					String yymmdd = writeDate.substring(0, 10);
					String hhmm = writeDate.substring(11, 16);
					%>
					<div class="col-3 col-md-1 p-0 "><%=yymmdd %></div>
					<div class="col-3 col-md-1 p-0 "><%=hhmm %></div>
					<div class="col-2 col-md-1 p-0 ">
						<%if(r.getAnswerYN()=='N'){ %>
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

							<%=pageNavi %>

						</ul>
						</nav>
					</div>
				</div>
				
			</div>

		</div>

		<%@ include file="/views/common/header&footer/footer.jsp"%>
	</div>



</body>

</html>
