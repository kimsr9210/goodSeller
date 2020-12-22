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
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<style>
</style>
</head>
<body>
	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap" >
        <div class="container">
            <div id="contents" class="row" style="height: 100%;">
                    <div class="col-4" style="margin: 20px auto;">
                        <a href="/index.do"><img src="/resources/images/logo.png" class="m-3" style="width: 200px;"></a>
                        <p>goodSeller 관리자 로그인 페이지 입니다.</p>
                        <form action="/adminLogin.do" method="post">
                            <input type="text" name="userId" placeholder="아이디">
                            <input type="password" name="userPw" placeholder="비밀번호">
                            <input type="submit" class="btn btn-dark" value="로그인" />
                        </form>
                        <hr>
                    </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/admin/header&footer/adminFooter.jsp"%>
	

</body>
</html>