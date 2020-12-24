<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post"%>
<%@ page import="hotsix.goodseller.user.trade.model.vo.Trade"%>
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!-- css -->
<!-- 	<link rel="stylesheet" type="text/css" href="/resources/css/reportList.css" /> -->
<style>
@charset "UTF-8";
/* -------------------------------폰트 모음----------------------------- */
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
/* -------------------------------폰트 모음----------------------------- */
#mainCate {
	font-family: Wemakeprice-Bold;
	font-size: 30px;
}

		#contents{
            background-color: white;
        }
        #contents-navi{
            margin-left: -40px;
            line-height: 50px;
        }
        #contents-navi>li{
            list-style-type: none;
            float: left;
            text-align: center;
            height: 30px;
        }
        #contents-navi>li>a{
            height: 300px;
            height: 100%;
            text-decoration: none;
            font-size: 12px;
            color: black;
            font-weight: 600;
        }
        #contents-navi>li>a:hover{
            color: #5B5AFF;
            border-bottom: 2px solid #5B5AFF;
        }
        
        #contents-mypage{
            border-top: 1px solid #CCCCCC;
        }
        /* 선택된 front 색깔 표시*/
        #contents-navi>li:nth-child(4)>a{
            color: #5B5AFF;
            border-bottom: 2px solid #5B5AFF;
        }
        /*-----------------컨텐츠내용-------------------*/
        #transaction-box{
            border: 1px solid #CCCCCC;
            margin: 30px auto;
            border-radius: 12px;
            padding: 0;
        }
        
        #info-title{
            width: 100%;
            align-content: center;
            margin: 30px 0px 30px 20px;
            font-size: 20px;
            font-weight: 600;
        }
        
        /* 거래내역 네비 */
        #transaction-navi{
            width: 100%;
            margin: 0px 0px 0px 0px;
            height: 50px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            line-height: 50px;
            font-weight: 800;
            text-align: center;
            overflow: hidden;
        }
        
        #transaction-navi>div:nth-child(1){
            width: 45%;
            float: left;
            font-size: 16px;
        }
        #transaction-navi>div:nth-child(2){
            width: 15%;
            float: left;
            font-size: 14px;
        }
        #transaction-navi>div:nth-child(3){
            width: 15%;
            float: left;
            font-size: 14px;
        }
        #transaction-navi>div:nth-child(4){
            width: 13%;
            float: left;
            font-size: 14px;
        }
        #transaction-navi>div:nth-child(5){
            width: 12%;
            float: left;
            font-size: 14px;
        }
        
        /* 거래내역 상세 */
        .transaction-box-size{
            width: 100%;
            height: 100px;
            margin: 10px auto;
            border-bottom: 1px solid #CCCCCC;
            text-align: center;
            line-height: 100px;
            overflow: hidden;
        }
        .transaction-box-size>div:nth-child(1){
            width: 15%;
            float: left;
            font-size: 14px;
        }
        .transaction-box-size>div:nth-child(2){
            width: 30%;
            float: left;
            font-size: 14px;
            text-align:left;
        }
        .transaction-box-size>div:nth-child(3){
            width: 15%;
            float: left;
            font-size: 14px;
        }
        .transaction-box-size>div:nth-child(4){
            width: 15%;
            float: left;
            font-size: 14px;
        }
        .transaction-box-size>div:nth-child(5){
            width: 13%;
            float: left;
            font-size: 14px;
        }
        .transaction-box-size>div:nth-child(6){
            width: 12%;
            float: left;
            font-size: 14px;
        }
        .transaction-box-size:nth-last-child(1){
            margin-bottom: 0;
            border-bottom: 0;
        }
        /* 상품 사진 크기*/
        .transaction-box-size img{
            width: 60%;
        }
        /* 태그 글자 색 */
        .transaction-box-size a{
            color: black;
        }
        /* 날짜 선택 태그 */
        #search-date{
            margin-bottom:10px;
            margin-left:10px;
        }
        #search-date input[type="date"]{
            border-radius: 3px;
            background-color: white;
            border: 1px solid #cccccc;
        }
        #search-date button{
            border-radius: 3px;
            background-color: #e8e8e8;
            border: 1px solid #cccccc;
            font-size: 12px;
        }
        #search-date button:hover{
            background-color: #D9D9D9;
        }
        #search-date form{
            display: inline;
            font-size: 12px;
        }
	</style>
</head>
<body>
<%

	ArrayList<Trade> sellList = (ArrayList<Trade>) request.getAttribute("sellList");
	ArrayList<Post> sellPostList = (ArrayList<Post>) request.getAttribute("sellPostList");

	
%>
	<%@ include file="/views/common/header&footer/header.jsp"%>
	<%
	if (m != null) {
		if (!sellList.isEmpty() && !sellPostList.isEmpty()) {
%>
	<div id="wrap"> <!-- 전체 틀-->
    
        <!-- -------------------------------------------------------------------- -->
        <div id="contents" class="menu-none">
            <%@ include file="/views/common/memberInfoNav.jsp"%>
            <div id="contents-mypage">
                <div class="container">
                    <div id="transaction-box" class="row col-12 col-lg-12">
                        <div id="info-title">
                            <div>거래 내역(판매)</div>
                        </div>
                        
                        <div id="transaction-navi">
                                <div>상품정보</div>
                                <div>등록일자</div>
                                <div>판매가격</div>
                                <div>판매자</div>
                                <div>거래상태</div>
                        </div>
                        
                         
                        <%for(Post p : sellPostList){ %>
                        
                                <%for(Trade t : sellList){
                                	if(t.getPostNo() == p.getPostNo()) {
                                		%>
                                    	<div class="transaction-box-size"><% 
                                 		if(t.getSellerState() == 'N') {
                                 %>
		                                 <div>
			                                 <a href="/trade.do?postNo=<%=p.getPostNo()%>&buyerId=<%=m.getUserId()%>&sellerId=<%=p.getWriter()%>">
			                                	<img id="postImgMain" src="/resources/file/<%=p.getMainImgName() %>" class="image">
			                                </a>
			                             </div>
		                                
		                                <div>
			                                <a href="/trade.do?postNo=<%=p.getPostNo()%>&buyerId=<%=m.getUserId()%>&sellerId=<%=p.getWriter()%>">
			                                <%= p.getSubject()%></a>
		                                </div>
                          			<%} else {%>
		                          		<div>
		                                	<a href="/tradeSellerEnd.do?postNo=<%=p.getPostNo()%>&sellerId=<%=p.getWriter()%>&buyerId=<%=m.getUserId()%>">
		                                		<img id="postImgMain" src="/resources/file/<%=p.getMainImgName() %>" class="image">
		                                	</a>
		                                </div>
                                		
                                		<div>
                                			<a href="/tradeSellerEnd.do?postNo=<%=p.getPostNo()%>&sellerId=<%=p.getWriter()%>&buyerId=<%=m.getUserId()%>">
                                			<%= p.getSubject()%></a>
                                		</div>
              						<%} %>
              						<div><%= p.getRegDate()%></div>
                               			
                               		<div><%= p.getBuyPrice()%></div>
                                		
                                	<div><%=p.getWriter()%></div>
                                	
                                	<%
                                 	if(t.getTradeEnd() == 'N') {
                                 	%>
                                 		<div>거래중</div>
                                 <% } else {%>
                             			<div>거래완료</div>
                                 <%} %>
                                 </div>          
                        	<%}
                            }
                         }%>

                    </div>
                </div>
            </div>
        </div>
    </div>
	<%
		} else {
	%>
	<div id="wrap">
		<div id="contents" class="menu-none">
			<%@ include file="/views/common/memberInfoNav.jsp"%>
			<div id="contents-mypage">
				<div class="container" id="report-box">
					<div class="row">
						<div class="col-12 text-center">
							<img src="/resources/images/hide.png" />

						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<span id="mainCate">판매 내역이 없습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		} else {
	%>
	<script>
		alert("세션 만료. 다시 로그인하여 주십시오");
		location.href = "/index.do";
	</script>
	<%
		}
	%>
	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>