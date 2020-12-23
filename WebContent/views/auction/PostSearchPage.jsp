<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.user.post.model.vo.PostPageData" %>
<%@ page import="hotsix.goodseller.user.post.model.vo.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="hotsix.goodseller.member.model.vo.Member" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/auctionPage.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<!--    폰트-->
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'Wemakeprice-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	#keyword{
		font-family: Wemakeprice-Bold;
		font-size: 24px;
    	color: #ED4C00;
	}
	#keyResult{
		font-family: Wemakeprice-Regular;
		font-size: 24px;
    	color: black;
	}
	#notkeyBox{
		padding: 30px;
		border: 1px solid #cccccc;
	}
	#keyword_n{
		font-family: '굴림';
		font-size: 16px;
    	color: #ED4C00;
    	font-weight: bold;
	}
	#keyResult_n{
		font-family: '굴림';
		font-size: 16px;
    	color: black;
    	font-weight: normal;
	}
	.notkey{
		font-size: 14px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header&footer/header.jsp"%>
<%
	PostPageData ppd = (PostPageData)request.getAttribute("PostPageData");
	ArrayList<Post> list = ppd.getList();
	String pageNavi = ppd.getPageNavi();
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	String keyword = (String)request.getAttribute("keyword");
	String subject = "";
%>
	<script>
		$(function(){
			$('#search-input').val('<%=keyword%>');
		});
	</script>

	<div id="wrap">
		<!-- contents  -->
		<div id="contents" class="menu-none">
			<div class="container">
				<div id="core-contents-1" class="row">
					<span id="keyword">'<%=keyword %>'<span id="keyResult">에 대한 검색결과</span></span>
				</div>
				
				<br>
				<div id="core-contents-3" class="row">
					<div class="col-12 p-0">
						<hr>
						<%if(list.isEmpty()){ %>
						<div id="notkeyBox">
							<span id="keyword_n">'<%=keyword %>'<span id="keyResult_n">에 대한 검색결과가 없습니다</span></span><br><br>
							<p class="notkey">단어의 철자가 정확한지 확인해 보세요.</p>
							<p class="notkey">한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</p>
							<p class="notkey">검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</p>
							<p class="notkey">두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</p>
							<p class="notkey">검색 옵션을 변경해서 다시 검색해 보세요.</p>
						<%} %>
						</div>
						<div id="goods" class="row">
						<%for(Post p : list){ %>
							<%
							if(p.getSubject().length()>=32){
								subject = p.getSubject().substring(0,28)+"...";
							} else{
								subject = p.getSubject();
							}
							%>
							
							<div class="postBox col-md-3">
								<a id="postClick" href="/auctionDetailPage.do?postNo=<%=p.getPostNo()%>" class="post<%=p.getPostNo() %>">
									<div class="card" style="border:0; border-radius: 5px;">
										<div class="sellynText">판매가 완료된 상품입니다.</div>
										<div id="postImgBox">
											
											<img id="postImgMain" src="/resources/file/<%=p.getMainImgName() %>" class="card-img-top" alt="..." />
										</div>
										<div class="card-body-size">
											<h6 class="card-title"><%=subject %></h6>
											<p class="card-text">
												<span class="moneyFont">현재입찰금  </span><span class="startPrice"><%=formatter.format(p.getAuctionPrice()) %></span>
												원<br> <span class="moneyFont">즉시구매가  </span><span class="buyPrice"><%=formatter.format(p.getBuyPrice()) %></span>
												원
											</p>
											<p class="card-text"><span class="methodFont"><%=p.getSellMethod() %></span></p>
										</div>
									</div>
								</a>
							</div>
							<% if(p.getSell_yn()=='Y'){ %>
								<script>
									$(function(){
										var postNo = $('.post<%=p.getPostNo() %>');
										postNo.children().css('cursor','default');
										postNo.parent().css('opacity','0.7'); 
										postNo.children().children().css('display','block');
										$(postNo).click(function(){
											alert('판매 완료된 상품입니다.');
											return false;
										});
									});
								</script>
							<%} %>
							<%} %>		
					</div>
				</div>
			</div>
				<div id="core-contents-4" class="row">
					<div class="col-12 p-0">
						<a href="/views/auction/auctionInsert.jsp"><button id="insertBtn" type="button" class="btn btn-outline-dark float-right">상품등록</button></a>
					</div>
				</div>
				<div id="core-contents-5" class="row">
					<div class="col-12">
					<br>
					
						<nav aria-label="Page navigation example">
						<ul id="pageNaviBox" class="pagination justify-content-center" >
							<%=ppd.getPageNavi() %>
						</ul>
						</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="/views/common/header&footer/footer.jsp"%>


</body>
</html>