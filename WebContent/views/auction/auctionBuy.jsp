<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
<%
		int buyPrice = Integer.parseInt(request.getParameter("buyPrice"));
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		DecimalFormat formatter = new DecimalFormat("###,###");
		Member m = (Member) session.getAttribute("member");
%>
	
<center>
			<table class="auctionBuyTbl">
				<tr>
					<th colspan="2">즉시 구매</th>
				</tr>
				<tr>
					<th>즉시 구매가</th>
					<td><%=formatter.format(buyPrice)%>원</td>
				</tr>
				<tr>
					<td colspan="2"><button id="submitBuyBtn">즉시 구매</button> 
					<input type="reset" value="취소하기" />
					</td>
				</tr>
			</table>
		</center>
		<script>
		$(function(){
			$('#submitBuyBtn').click(function(){

					var result = window.confirm("즉시구매를 진행하시겠습니까? 구매 후 취소는 패널티가 부과될 수 있습니다.");
					if(result == true){
					
					//$("#offerPrice", parent.opener.document).val(offerPrice);
					opener.parent.location.replace("/auctionBuy.do?postNo=<%=postNo%>&userId=<%=m.getUserId()%>");
					self.close();
					}

				});
			});
		</script>
	
</body>
</html>