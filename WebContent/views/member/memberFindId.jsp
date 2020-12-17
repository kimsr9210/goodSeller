<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
   <!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/findId.css" />
</head>
<body>

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
   <!--    자바 스크립트    -->
	<script type="text/javascript" src="/resources/js/findId.js"></script>
    <div id="wrap">
        <!-- 전체 틀-->
        <%@ include file="/views/common/header&footer/header.jsp"%>

        <div id="contents">
            <div class="container">
                <div id="contents" class="row">
                    <div class="col-4" style="margin: 0 auto;">
                        <h3>아이디 찾기</h3><hr>
                        <form action="/memberFindId.do" method="post">
                            <div class="row">
                                <p class="check_method">
                                    <input type="radio" name="method" value="email" checked />이메일로 찾기

                                </p>
                                <p class="check_method">
                                    <input type="radio" name="method" value="phone" />휴대폰 번호로 찾기
                                </p>
                            </div>
                            <div class="row">
                                <p class="textbox"><label>이름</label><input type="text" name="userName" placeholder="이름"></p>
                                <p class="textbox"><label id="changeMethod">이메일</label><input type="text" name="userInfo" placeholder="이메일 입력"></p>
                            </div>
                            <div class="row">
                                <input type="submit" class="btn btn-outline-secondary" value="확인" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%@ include file="/views/common/header&footer/footer.jsp"%>
        </div>
    </div>
</body>
</html>