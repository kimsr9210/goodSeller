<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hotsix.goodseller.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/adminIndex.css" />
<style>
#contents-navi {
	padding: 0px;
	margin: 10px 0px;
}

#contents-navi>li {
	list-style-type: none;
	float: left;
	text-align: center;
	height: 30px;
}

#contents-navi>li>a {
	text-decoration: none;
	color: black;
}

#contents-navi>li>a:hover {
	border-bottom: 2px solid #5B5AFF;
	color: #5B5AFF;
}
</style>
</head>
<style>
    #navigation>ul {
        padding: 0px;
        margin: 0px;
        background-color: ghostwhite;
    }
    
    
    #navigation>ul>li {
        list-style-type: none;
        text-align: left;
        
        color: black;
        padding: 10px;
    }
    
     #navigation>ul>li:hover {
        background-color: whitesmoke;
        color: black;
    }
    
    .menu>a {
       color: black;
    }
    
    a {
    color: black;
    }
    
    .hide {
        display: none;
        list-style-type: none;
        margin-top: 10px;
    }
    
    .hide>li {
        padding: 1px;
    }
    table {
    
    }
    
</style>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
     $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
	<%
		ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
		int userNo = (int) request.getAttribute("userNo");
	%>
	<%@ include file="/views/admin/header&footer/adminHeader.jsp"%>
	<div id="wrap">
		<div class="container">
            <div id="contents" class="row" style="height: 100%;">
                <div class="col-lg-3 col-md-4 col-sm-3" id="navigation">
                    <ul>
                        <li class="menu">
                           <a>회원관리</a>
                            <ul class="hide">
                                <li >전체 회원 관리</li><hr>
                                <li>탈퇴 회원 관리</li><hr>
                                <li>관리자</li>
                            </ul>
                        </li><hr>
                        <li><a>게시물 관리</a></li><hr>
                        <li><a href="/adminReportAllPageList.do">신고 관리</a></li><hr>
                        <li>QnA</li><hr>
                        <li class="menu">
                          <a>통계</a>
                            <ul class="hide">
                                <li>수익현황</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		<div>
			<div class="container">
				<div id="membertable" class="row" style="height: 100%;">
					<table border=1px cellspacing=1px cellpadding=1px>
						<tr>
							<td>회원번호</td>
							<td>ID</td>
							<td>이름</td>
							<td>별명</td>
							<td>생년월일</td>
							<td>성별</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>주소</td>
							<td>신고 횟수</td>
							<td>취소 횟수</td>
							<td>가입일</td>
						</tr>
						<%for (Member m : list){%>
						<tr>
							<td><%=m.getUserNo() %></td>
							<td><%=m.getUserId() %></td>
							<td><%=m.getUserName() %></td>
							<td><%=m.getUserNick() %></td>
							<td><%=m.getBirth() %></td>
							<td><%=m.getGender() %></td>
							<td><%=m.getEmail() %></td>
							<td><%=m.getPhone() %></td>
							<td><%=m.getAddress() %></td>
							<td><%=m.getReported() %></td>
							<td><%=m.getCancellation() %></td>
							<td><%=m.getEnrollDate() %></td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/admin/header&footer/adminFooter.jsp"%>

</body>
</html>