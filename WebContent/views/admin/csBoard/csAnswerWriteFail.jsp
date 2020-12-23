<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	%>
	<script>
		alert("답변 게시글 작성에 실패하였습니다. 다시 시도해 주세요.");
		location.replace('/notAnswerCsBoardClick.do?boardNo=<%=boardNo%>');
	</script>
</body>
</html>