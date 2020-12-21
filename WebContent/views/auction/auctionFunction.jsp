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
	
	<div class="wrapper">
	<div class="container">
		<div class="row p-0 m-0">
			<div class="col-4">입찰 시작가</div>
			<div class="col-8"><%=startPrice %></div>
		</div>
		<div class="row p-0 m-0">
			<div class="col-4">현재 입찰가</div>
			<div class="col-8"><%=startPrice %></div>
		</div>
		<div class="row p-0 m-0">
			<div class="col-4">제시할 입찰가</div>
			<div class="col-8"><input type="text" name="offerPrice"/></div>
		</div>
	</div>
	</div>
	
	
	<table class="auctionTbl" style="border:1px solid black; ">
		<legend>입찰</legend>
		
		<tr>
			<th>입찰 시작가</th>
			<td><%=startPrice %></td>
		</tr>
		<tr>
			<th>현재 입찰가</th>
			<td><%=auctionPrice %></td>
		</tr>
		<tr>
			<th>제시할 입찰가</th>
			<td><input type="text" name="offerPrice"/></td>
		</tr>
		
	</table>
	
	</center>
	
</body>
</html>