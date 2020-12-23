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
		alert("정상적으로 구매처가 되지 않았습니다. 지속적으로 문제 발생 시 문의게시판을 이용해주세요");
		location.replace('/auctionDetailPage.do?postNo=<%=postNo%>');
	</script>
</body>
</html>