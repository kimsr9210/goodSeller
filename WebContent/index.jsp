<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.post.model.vo.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="hotsix.goodseller.member.model.vo.Member" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<style>
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
}

.card:hover {
	cursor:pointer;
	box-shadow: 0px 0px 10px #A4A4A4;
}

#postImgMain:hover{
	transform: scale(1.02);
}

#postImgMain{
	border-radius: 10%;
	transform: scale(1);
	transition: all 0.2s ease-in-out;
}

#postImgMain{
    overflow: hidden;
}
.card-title{
	z-index: 1;
	font-weight : 800;
	height: 40px;
	overflow: hidden;
}
.card-text{
	z-index: 1;
	overflow: hidden;
	font-weight: 600;
}
.startPrice{
	font-weight: 500;
	color: red;
	font-size: 18px;
}
.buyPrice{
	font-weight: 500;
	color: #5B5AFF;
	font-size: 18px;
}
</style>
<%
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	DecimalFormat formatter = new DecimalFormat("###,###");
	String subject = "";
%>
	<%@ include file="/views/common/header&footer/header.jsp" %>
    <div id="wrap"> <!-- 전체 틀-->
        <div id="contents" class="menu-none">
            <div class="container py-5">
                <div id="core-contents-top" class="row">
                    <div class="col-12 col-md-6">
                        <img src="/resources/images/carrot.jpg" class="col-10 col-md-12" id="main-img">
                    </div>
                    <div class="col-12 col-md-6" id="contents-exp">
                        <pre>간단 경매 방법!<br></pre>
                        <p>첫번째, 간편 회원가입 후 로그인<br><br></p>
                        <p>두번째, 원하는 물품 검색 후 입찰<br><br></p>
                        <p>세번째, 더이상 입찰하는 고객이 없으면 즉시 구매!<br><br></p>
                        <a href="/views/auction/auctionInsert.jsp">게시물 작 성페이지</a><br>
                        <a href="/views/member/memberInfo.jsp">마이페이지로 이동</a><br>
                        <a href="/auctionList.do?mainCategory=의류 브랜드 패션&subCategory=티셔츠" >의류 브랜드 패션</a><br>
                    </div>
                </div>
                <div id="core-contents-bottom" class="row">
                    <div class="col-md-12" style="font:50px Gamja Flower; text-align:center; line-height:350px">
                    	현재 핫한 상품
                    </div>
                </div>
                <div id="core-contents-3" class="row">
					<div class="col-12 p-0">
						<div id="goods" class="row">
						<%for(Post p : list){ %>
						<%
							if(p.getSubject().length()>=28){
								subject = p.getSubject().substring(0,25)+"...";
							} else{
								subject = p.getSubject();
							}
						%>
										<div class="col-md-3">
											<div class="card"
												style="border: 1px solid white; border-radius: 10%; overflow: hidden;">
												<div style="height:300px;overflow:hidden;">
													<img id="postImgMain"
													src="/resources/file/<%=p.getMainImgName() %>"
													class="card-img-top" alt="...">
												</div>
												<div class="card-body">
													<h6 class="card-title"><%=subject %></h6>
													<p class="card-text">
														현재 입찰금 : <span class="startPrice"><%=formatter.format(p.getAuctionPrice()) %></span> 원<br>
														즉시 구매가 : <span class="buyPrice"><%=formatter.format(p.getBuyPrice()) %></span> 원
													</p>

												</div>
											</div>
										</div>
						<%} %>		
					</div>
				</div>
            </div>
        </div>
        
    </div>
        <%@ include file="/views/common/header&footer/footer.jsp" %>
</body>
</html>