<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

table.auctionTbl {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 10px;
}

table.auctionTbl th {
	width: 155px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border: 1px solid #ccc;
}

table.auctionTbl td {
	width: 349px;
	padding: 10px;
	vertical-align: top;
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<%
		int startPrice = Integer.parseInt(request.getParameter("startPrice"));
		int auctionPrice = Integer.parseInt(request.getParameter("auctionPrice"));
		char sell_YN = request.getParameter("sell_YN").charAt(0);
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		Member m = (Member) session.getAttribute("member");
	%>


		<table class="auctionTbl" style="border: 1px solid black;"
			id="auctionTable">
			<tr>
				<th colspan="2">입찰</th>
			</tr>
			<tr>
				<th scope="row">입찰 시작가</th>
				<td><%=startPrice%></td>
			</tr>
			<tr>
				<th scope="row">현재 입찰가</th>
				<td><%=auctionPrice%></td>
			</tr>
			<tr>
				<th scope="row">제시 할 입찰가</th>
				<td><input type="text" name="offerPrice" id="offerPrice" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<center>
						<button id="submitBtn">입찰하기</button>
						<input type="reset" value="취소하기" />
					</center>
				</td>
			</tr>
		</table>


		<script>
		$(function(){
			$('#submitBtn').click(function(){
				var offerPrice = $('#offerPrice').val();
				//유효성검사 진행 
			
				if(offerPrice < <%=auctionPrice%> || offerPrice == <%=auctionPrice%>){
					alert('입찰가격은 현재 입찰가보다 높아야 합니다.');
					return false;
				}else if(offerPrice > <%=auctionPrice%>){
					var result = window.confirm("입찰을 진행하시겠습니까? 입찰 후 취소는 패널티가 부과될 수 있습니다.");
					if(result == true){
					
					//$("#offerPrice", parent.opener.document).val(offerPrice);
					opener.parent.location.replace("/auctionOffer.do?postNo=<%=postNo%>&offerPrice="+offerPrice+"&userId=<%=m.getUserId()%>);
					self.close();
					}
				}
				
				});
			});
		</script>
</body>
</html>