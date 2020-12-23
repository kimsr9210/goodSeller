<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<title>Insert title here</title>
	<style>
@font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Binggrae-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#core-contents-3 {
	height: 100%;
	padding: 0;
	box-sizing: border-box;
}

#goods {
	height: 100%;
	width: 100%;
	margin: 0 auto;
}

.card {
	width: 95%;
	height: 95%;
	margin: 5px auto;
	border: 1px solid red;
	border-radius: 10%;
	overflow: hidden;
}

.card:hover {
	cursor: pointer;
	box-shadow: 0px 0px 3px #9E9E9E;
}

#postImgMain:hover {
	transform: scale(1.02);
}

#postImgMain {
	transform: scale(1);
	transition: all 0.2s ease-in-out;
}

#postImgMain {
	overflow: hidden;
}

.card-title{
	z-index: 1;
	height: 30px;
	overflow: hidden;
	font-size: 12px;
}
.card-text{
	z-index: 1;
	overflow: hidden;
	font-size: 12px;
	color: black;
	font-weight: normal;
}
.startPrice{
	font-weight: bold;
	color: #ED4C00;
	font-size: 14px;
}
.buyPrice{
	color: black;
	font-weight: normal;
	font-size: 12px;
}
#postImgBox{
	height:250px;
	overflow:hidden;
}
#postClick{
	color:black;
	text-decoration: none;
}
.moneyFont{
		font-size: 11px;
		color: #808080;
}
.postBox{
		border-bottom: 1px solid #cccccc;
}
.card-body-size{
	padding: 5px;
}
#hotPostTitle{
	font-size: 20px;
	font-family: Wemakeprice-Bold;
}
.main-img{
	width: 100%;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	.methodFont{
		font-family: GmarketSansMedium;
	}
</style>
</head>

<body>

	<%
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	DecimalFormat formatter = new DecimalFormat("###,###");
	String subject = "";
	%>
	<%@ include file="/views/common/header&footer/header.jsp"%>
	<div id="wrap">
		<!-- 전체 틀-->
		<div id="contents" class="menu-none">
			<div class="container py-5">
			
			
				<div id="core-contents-top" class="row">
					<div class="col-12 col-md-6">
						<img src="/resources/images/mainContentImg_1.png" class="main-img">
					</div>
					<div class="col-12 col-md-6" class="row">
						<img src="/resources/images/mainContentImg_2.png" class="main-img">
					</div>
				</div>
				
				<hr>
				<div id="core-contents-bottom" class="row">
					<div class="col-12">
						<span id="hotPostTitle">현재 핫한 상품</span></div>
				</div>
				<br>
				
				<div id="core-contents-3" class="row">
					<div class="col-12 p-0">
						<div id="goods" class="row">
							<%for(Post p : list){ %>
							<%
							if(p.getSubject().length()>=32){
								subject = p.getSubject().substring(0,28)+"...";
							} else{
								subject = p.getSubject();
							}
							%>
							<div class="postBox col-md-3">
								<a id="postClick" href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>" class="post<%=p.getPostNo() %>">
									<div class="card" style="border:0; border-radius: 5px;">
										<div id="postImgBox">
											<img id="postImgMain" src="/resources/file/<%=p.getMainImgName() %>" class="card-img-top" alt="..." />
										</div>
										<div class="card-body-size">
											<h6 class="card-title"><%=subject %></h6>
											<p class="card-text">
												<span class="moneyFont">현재입찰금  </span><span class="startPrice"><%=formatter.format(p.getAuctionPrice()) %></span>
												원<br> <span class="moneyFont">즉시구매가  </span><span class="buyPrice"><%=formatter.format(p.getBuyPrice()) %></span>
												원
											</p>
											<p class="card-text"><span class="methodFont"><%=p.getSellMethod() %></span></p>
										</div>
									</div>
								</a>
							</div>
							<%} %>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>