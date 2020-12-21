<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
</head>
<body>


 <div id="wrap"> <!-- 전체 틀-->
        <div id="contents">
            <div class="container">
                <div id="core-contents-1" class="row">
                    <div class="col-12" style="height: 80%;">
                        <div class="col-4" style="margin: 0px auto;">
                        <img class="m-4" src="/resources/images/logo.png" width=200px>
                            
                            <p>goodSeller 관리자 로그인 페이지 입니다.</p>
                        	<form action="/memberLogin.do" method="post">
                            <input type="text" name="userId" placeholder="아이디">
                            <input type="password" name="userPw" placeholder="비밀번호">
                            <input type="submit" class="btn btn-dark" value="로그인" />
                            </form>
                            <div class="col-12">
                                <a href=#>아이디 찾기</a>
                                <span>|</span>
                                <a href=#>비밀번호 찾기</a>
                            </div>
                            <hr>
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>