<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<!-- css -->
	<!-- <link rel="stylesheet" type="text/css" href="/resources/css/purchaseList.css" /> -->
<style>
	@charset "UTF-8";
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
        #contents-navi>li:nth-child(2)>a{
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
            border-bottom: 1px solid #CCCCCC;
            margin: 10px auto;
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
        
        /*a:hover{
            color: #5B5AFF;
            font-weight: 800;
        }*/
        /*---회원정보 페이지 contents-----------------------------------------------------------------*/
        /*
</style>

</head>
<body>
<%@ include file="/views/common/header&footer/header.jsp" %>
    <div id="wrap"> <!-- 전체 틀-->
        <!-- -------------------------------------------------------------------- -->
        <div id="contents" class="menu-none">
            <%@ include file="/views/common/memberInfoNav.jsp"%>
            <div id="contents-mypage">
                <div class="container">
                    <div id="transaction-box" class="row col-12 col-lg-12">
                        <div id="info-title">
                            <div>구매 내역</div>
                        </div>
                        <div id="search-date">
                                <button class="d-none d-md-inline">1주일</button>
                                <button class="d-none d-md-inline">1개월</button>
                                <button class="d-none d-md-inline">3개월</button>
                                <button class="d-none d-md-inline">전체시기</button>
                            <form>
                                <input type="date" value="2020-12-12" name="date-first"/>
                                -
                                <input type="date" value="2020-12-12" name="date-last"/>
                                <button>검색</button>
                            </form>
                        </div>
                        <div id="transaction-navi">
                                <div>상품정보</div>
                                <div>거래일자</div>
                                <div>거래금액</div>
                                <div>판매자</div>
                                <div>거래상태</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#"><img src="/resources/images/exe.jpg" class="image"></a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                        <div class="transaction-box-size">
                                <div><a href="#">사진</a></div>
                                <div><a href="#">와이드 히든 밴딩 슬랙스</a></div>
                                <div>2020.12.11</div>
                                <div>30,000원</div>
                                <div><a href="#">asd0049</a></div>
                                <div>거래완료</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/header&footer/footer.jsp" %>
</body>
</html>