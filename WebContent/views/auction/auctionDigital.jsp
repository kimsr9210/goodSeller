<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.post.model.vo.PostPageData" %>
<%@ page import="hotsix.goodseller.post.model.vo.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="hotsix.goodseller.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/auctionMain.css" />
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
<!--    폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/common/header&footer/header.jsp"%>
<%
	PostPageData ppd = (PostPageData)request.getAttribute("PostPageData");
	String subCategory = (String)request.getAttribute("subCategory");
	ArrayList<Post> list = ppd.getList();
	String pageNavi = ppd.getPageNavi();
%>
	
	<% if(subCategory.equals("카메라")){ %>
			<style>
				#subCategory>li:nth-child(1)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} else if(subCategory.equals("음향기기")){%>
			<style>
				#subCategory>li:nth-child(2)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} else if(subCategory.equals("게임")){%>
			<style>
				#subCategory>li:nth-child(3)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} else if(subCategory.equals("핸드폰")){%>
			<style>
				#subCategory>li:nth-child(4)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} else if(subCategory.equals("테블릿")){%>
			<style>
				#subCategory>li:nth-child(5)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} else if(subCategory.equals("컴퓨터")){%>
			<style>
				#subCategory>li:nth-child(6)>a{
	            color: #5B5AFF;
	            font-weight: 800;
				}
			</style>
	<%} %>

	<div id="wrap">
		<!-- contents  -->
		<div id="contents" class="menu-none">
			<div class="container">
				<div id="core-contents-1" class="row">
					<h3>디지털 컴퓨터</h3>
				</div>
				<div id="core-contents-2" class="row">
					<div class="d-none d-md-block col-md-3"></div>
					<div class="col-md-6">
						<ul id="subCategory"class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=카메라">카메라</a></li>
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=음향기기">음향기기</a></li>
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=게임">게임</a></li>
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=핸드폰">핸드폰</a></li>
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=테블릿">테블릿</a></li>
							<li class="nav-item"><a class="nav-link" href="/auctionList.do?mainCategory=디지털 컴퓨터&subCategory=컴퓨터">컴퓨터</a></li>
							
						</ul>
					</div>
					<div class="d-none d-md-block col-md-3"></div>
				</div>
				<br>
				<div id="core-contents-3" class="row">
					<div class="col-12 p-0">
						<div id="goods" class="row">
						<%for(Post p : list){ %>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<img id="postImgMain"
													src="/resources/file/<%=p.getMainImgName() %>"
													class="card-img-top" alt="...">
												<div class="card-body">
													<h6 class="card-title"><%=p.getSubject() %></h6>
													<p class="card-text">
														현재 입찰금 : <%=p.getStartPrice() %><br>즉시구매가 : <%=p.getBuyPrice() %>
													</p>

												</div>
											</div>
										</div>
						<%} %>		
					</div>
				</div>
			</div>
				<div id="core-contents-4" class="row">
					<div class="col-12 p-0">
						<a href="/views/auction/auctionInsert.jsp"><button type="button" class="btn btn-outline-dark float-right">상품등록</button></a>
					</div>
				</div>
				<div id="core-contents-5" class="row">
					<div class="col-12">
					<br>
					
						<nav aria-label="Page navigation example">
						<ul id="" class="pagination justify-content-center" >
							<%=ppd.getPageNavi() %>
						</ul>
						</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="/views/common/header&footer/footer.jsp"%>
<script type="text/javascript" src="/resources/js/auction.js"></script>

</body>
</html>