<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
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

#title {
	font-family: Wemakeprice-Bold;
}

#stitle {
	font-family: Binggrae-Bold;
}

.incomeReport
{
width:80%;
margin : 0 auto;
padding-top : 50px;
padding-bottom : 50px;
}

</style>
<body>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

<%
	ArrayList list = (ArrayList)request.getAttribute("list");
	for(int i=0 ;i<list.size();i++){
		list.get(i);
	}
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


						<div class="incomeReport">

							<center>
								<H1 id="title">2020년 월별 회원가입 통계</H1>
							
							
							<canvas id="myChart" style="height:30vh; width:50vw"></canvas>
							<script>
								var ctx = document.getElementById('myChart');
								var myChart = new Chart(
										ctx,
										{
											type : 'line',
											data : {
												labels : [ '1월', '2월',
														'3월', '4월',
														'5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
												
												datasets : [ {
													label : '월별 회원가입 수 (명) ',
													data : [ 
														<%=list.get(0)%>,<%=list.get(1)%>,<%=list.get(2)%>,<%=list.get(3)%>,<%=list.get(4)%>,
														<%=list.get(5)%>,<%=list.get(6)%>,<%=list.get(7)%>,<%=list.get(8)%>,<%=list.get(9)%>,
														<%=list.get(10)%>,<%=list.get(11)%>,
													],
													backgroundColor : [
															'rgba(255, 99, 132, 0.2)',
															'rgba(54, 162, 235, 0.2)',
															'rgba(255, 206, 86, 0.2)',
															'rgba(75, 192, 192, 0.2)',
															'rgba(153, 102, 255, 0.2)',
															'rgba(255, 159, 64, 0.2)',
															'rgba(255, 99, 132, 0.2)',
															'rgba(54, 162, 235, 0.2)',
															'rgba(255, 206, 86, 0.2)',
															'rgba(75, 192, 192, 0.2)',
															'rgba(153, 102, 255, 0.2)',
															'rgba(255, 159, 64, 0.2)' ],
													borderColor : [
															'rgba(255, 99, 132, 1)',
															'rgba(54, 162, 235, 1)',
															'rgba(255, 206, 86, 1)',
															'rgba(75, 192, 192, 1)',
															'rgba(153, 102, 255, 1)',
															'rgba(255, 159, 64, 1)',
															'rgba(255, 99, 132, 1)',
															'rgba(54, 162, 235, 1)',
															'rgba(255, 206, 86, 1)',
															'rgba(75, 192, 192, 1)',
															'rgba(153, 102, 255, 1)',
															'rgba(255, 159, 64, 1)' ],
													borderWidth : 2
												} ]
											},
											options : {
												responsive : false,
												scales : {
													yAxes : [ {
														ticks : {
															beginAtZero : true
														}
													} ]
												},
											}
										});
							
								
								
							</script>
							</center>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>
</body>
</html>