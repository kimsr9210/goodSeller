<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.guideImg{
	width: 100%;
}
.guideTitle{
	font-family: NEXON Lv1 Gothic OTF Bold;
	font-size: 30px;
	color: #3c3c3c;
}
.guideSub{
	font-family: NEXON Lv1 Gothic OTF;
	font-size: 20px;
	color: #3c3c3c;
}
.guideTip{
	font-family: NEXON Lv1 Gothic OTF;
	font-size: 14px;
	color: #3c3c3c;
}
.tips{
	width:20px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header&footer/header.jsp"%>
	<div id="wrap">
		<!-- 전체 틀-->
		<div id="contents" class="menu-none">
			<div class="container py-5">
			
			
				<div class="row">
					<div class="col-12 col-md-12">
					<span class="guideTitle">굿셀러 이용방법</span><br>
					<span class="guideSub">대화없이 클릭으로 끝내요!</span>
						<img src="/resources/images/guide_1.png" class="guideImg">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-6">
						<img src="/resources/images/guide_2.png" class="guideImg"/>
					</div>
					<div class="col-6">
						<span class="guideTitle">
							01<br> 회원가입
						</span><br><br>
						<span class="guideSub">
							간편가입 후 결제정보를 입력해<br>
							회원가입을 완료합니다.
						</span><br><br>
						<span class="guideTip">
							<img src="/resources/images/tips.png" class="tips"/> 결제정보는 언제든 수정가능해요.
						</span>
					</div>
				</div>
				<hr>
				
				
				<div class="row">
					<div class="col-6">
						<span class="guideTitle">
							02<br> 상품 클릭
						</span><br><br>
						<span class="guideSub">
							원하는 카테고리에서 원하는 상품을<br>
							선택하고 상태를 확인합니다.
						</span><br><br>
						<span class="guideTip">
							<img src="/resources/images/tips.png" class="tips"/> 가품 혹은 사기일 경우 100% 환불조치해드려요.
						</span>
					</div>
					<div class="col-6">
						<img src="/resources/images/guide_3.png" class="guideImg"/>
					</div>
				</div>
				<br>
				<hr>
				
				
				<div id="" class="row">
					<div class="col-6">
						<img src="/resources/images/guide_4.png" class="guideImg"/>
					</div>
					<div class="col-6">
						<span class="guideTitle">
							03<br> 입찰
						</span><br><br>
						<span class="guideSub">
							원하시는 금액에 맞게 설정하여<br>
							금액을 설정하여 입찰합니다.
						</span><br><br>
						<span class="guideTip">
							<img src="/resources/images/tips.png" class="tips"/> 즉시입찰을 누르시면 바로 구매하실 수 있어요.
						</span>
					</div>
				</div>
				<br>
				<hr>
				
				
				<div id="" class="row">
					<div class="col-6">
						<span class="guideTitle">
							04<br> 금액 송금
						</span><br><br>
						<span class="guideSub">
							낙찰에 성공하시면 결제안내에 따라<br>
							금액을 송금합니다.
						</span><br><br>
						<span class="guideTip">
							<img src="/resources/images/tips.png" class="tips"/> 낙찰 후 거래파기시 패널티를 입을 수 있어요.
						</span>
					</div>
					<div class="col-6">
						<img src="" class="guideImg"/>
					</div>
				</div>
				<br>
				<hr>
				
				
				<div id="" class="row">
					<div class="col-6">
						<img src="/resources/images/guide_6.png" class="guideImg"/>
					</div>
					<div class="col-6">
						<span class="guideTitle">
							05<br> 거래완료
						</span><br><br>
						<span class="guideSub">
							거래방식에 따라 거래를<br>
							마무리합니다.
						</span><br><br>
						<span class="guideTip">
							<img src="/resources/images/tips.png" class="tips"/> 결제정보는 언제든 수정가능해요.
						</span>
					</div>
				</div>
				<br>
				<hr>
				
				<div id="moveBtn">거래하러 가기</div>
		</div>
	</div>

	<%@ include file="/views/common/header&footer/footer.jsp"%>
</body>
</html>