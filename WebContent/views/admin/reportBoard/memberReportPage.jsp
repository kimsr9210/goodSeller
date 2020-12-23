<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportPageData"%>
<%@ page import="hotsix.goodseller.user.board.model.vo.Report"%>
<%@ page import="hotsix.goodseller.admin.board.report.vo.ReportAnswer"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<link rel="stylesheet" type="text/css"
	href="/resources/css/adminReportBoard.css?ver=1.1" />

<style>
@font-face {
	font-family: 'Wemakeprice-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#title {
	font-family: Wemakeprice-Bold;
}

#stitle {
	font-family: Binggrae-Bold;
}

#afont {
	color: black;
}

.memberReport
{
width:40%;
margin : 0 auto;
padding-top : 50px;
padding-bottom : 50px;
}


    .memberReport input {
        display: block;
        height: 50px;
        width: 100%;
        margin: 10px 0px;
    }

    .memberReport a {
        text-decoration: none;
        color: gray;
    }
    
    .memberReport span {
        color: rgba(128,128,128, 0.5);
        padding: 0px 5px;
    }

    .memberReport a:hover {
        text-decoration: none;
        color: blue;
    }
#title {
	font-family: Wemakeprice-Bold;
}


#afont {
	color: black;
}
    

</style>

</head>
<body>
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>


	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="contentWrapper m-0 p-0">

			<div class="row m-0">
				<div class="col-2 p-0 m-0 ">

	<%@ include file="/views/admin/header&footer/adminSideNavi.jsp"%>

				</div>
				<div class="col-10">
					<div class="row" style="height: 100%;">


						<div class="memberReport" >
								
						<center><H1 id="title">회원 신고</H1></center>
                        <form action="/memberReportAdmin.do" method="post">
                            <input type="text" name="reportId" placeholder="아이디">
                            <input type="text" name="reportReason" placeholder="신고사유">
                            <input type="submit" class="btn btn-dark" value="신고 처리" />
                        </form>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>



</body>

</html>
