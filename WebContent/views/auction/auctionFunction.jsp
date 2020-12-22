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

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

	<%
		int startPrice = Integer.parseInt(request.getParameter("startPrice"));
		int auctionPrice = Integer.parseInt(request.getParameter("auctionPrice"));
		char sell_YN = request.getParameter("sell_YN").charAt(0);
		int postNo = Integer.parseInt(request.getParameter("postNo"));

	%>

	
	<center>
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
			<td><input type="text" name="offerPrice" id="offerPrice"/></td>
		</tr>
		
		<tr>
		<td colspan="2"><button id="submitBtn">입찰하기</button>
		<input type="reset" value="취소하기"/></td>
		
		</tr>
		
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
					
				$("#offerPrice", parent.opener.document).val(offerPrice);
				//부모창에 데이터를 보내주는것이 아닌 서블릿에 데이터 보내줘서 가격 업데이트?
				//새로운 tbl만들어야한다
				
					//창이닫히고 새로고침
			       opener.parent.location.replace("/auctionDetailPage.do?postNo=<%=postNo %>&offerPrice="+offerPrice);
			       self.close();
		}
			}
		});
	});
	
	</script>
	</table>
	
	</center>
	
</body>
</html>