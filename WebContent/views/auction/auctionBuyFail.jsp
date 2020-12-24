<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int postNo = (int)request.getAttribute("postNo"); %>
	
	<script>
		alert("이미 판매가 완료된 게시물이거나 삭제된 게시물입니다.");
		location.replace('/auctionMain.do');
	</script>
</body>
</html>