<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.auctionTbl
	{
		border: 1px solid black;
	}
	
	div{
	box-sizing:border-box;
	border : 1px solid black;
	}
	
	.wrapper{
	width:50%;
	padding: 30px 0;
	margin:50px auto;
	}
</style>
</head>
<body>
	<%
		int startPrice = Integer.parseInt(request.getParameter("startPrice"));
		int auctionPrice = Integer.parseInt(request.getParameter("auctionPrice"));
		char sell_YN = request.getParameter("sell_YN").charAt(0);

	%>

	
	<center>
	<form action = "">
	<table class="auctionTbl" style="border:1px solid black; ">
		<tr>
			<th colspan="2">입찰</th>
		</tr>
		<tr>
			<th>입찰 시작가</th>
			<td><%=startPrice %></td>
		</tr>
		<tr>
			<th>현재 입찰가</th>
			<td><%=auctionPrice %></td>
		</tr>
		<tr>
			<th>제시 할 입찰가</th>
			<td><input type="text" name="offerPrice"/></td>
		</tr>
		
		<tr>
		<td colspan="2"><button id="submitBtn">입찰하기</button>
		<input type="reset" value="취소하기"/></td>
		
		</tr>
		
	<script>
	$(function(){
		$('#submitBtn').click(function(){
			var result = window.confirm("입찰을 진행하시겠습니까? 입찰 후 취소는 패널티가 부과될 수 있습니다.");
		});
	});
	</script>
	</table>
	</form>
	</center>
	
</body>
</html>