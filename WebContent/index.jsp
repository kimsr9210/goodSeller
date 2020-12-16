<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                        <a href="/views/auction/auctionInsert.jsp">게시물 작성페이지</a><br>
                        <a href="/views/member/memberInfo.jsp">마이페이지로 이동</a>
                    </div>
                </div>
                <div id="core-contents-bottom" class="row">
                    <div class="col-md-12" style="font:50px Gamja Flower; text-align:center; line-height:350px">Hot-Six</div>
                </div>
            </div>
        </div>
        
    </div>
        <%@ include file="/views/common/header&footer/footer.jsp" %>
</body>
</html>