<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
 <!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/findIdResult.css" />
</head>
<body>
	<%
		boolean result = (boolean)request.getAttribute("result");
	%>
	<%if(result==true) {%>
	<% 
		String userInfo = (String)request.getAttribute("userInfo");
		String method = (String)request.getAttribute("method");
		String userName = (String)request.getAttribute("name");
		String maskedUserId = (String)request.getAttribute("maskedUserId");
		String maskedPhone = (String)request.getAttribute("maskedPhone");
		String maskedEmail = (String)request.getAttribute("maskedEmail");
		
	%>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <div id="wrap">
        <!-- 전체 틀-->
        <%@ include file="/views/common/header&footer/header.jsp"%>

        <div id="contents">
            <div class="container">
                <div id="core-contents-1" class="row">
                    <div class="col-4" style="margin: 0 auto"> 
                        <h3>아이디 찾기</h3>
                        <hr>
                        <h5><b>아이디 찾기 결과</b></h5>
                            <div class="row">
                               <p><%=userName %> / <%=userInfo %> 으로 찾은 아이디</p>
                                <p >
                                    <input type="radio" value="email" class="p" checked /> <%=maskedUserId %>
                                </p>
                            </div>
                            <br>
                            <div class="row">
                               <h6><b>아이디 전체 확인하기</b></h6>
                                <fieldset>
                                   <form action="/memberFindFullIdPhone.do" method="post">
                                   <div class="check_method">
                                       <p>등록된 휴대폰 번호로 확인 : <%=maskedPhone %></p>
                                       <input type="hidden" name="userName" value="<%=userName %>"/>
                                       <input type="hidden" name="method" value="<%=method %>"/>
                                       <input type="hidden" name="userInfo" value="<%=userInfo %>"/>
                                       <p><input type="submit" class="btn btn-outline-secondary" value="아이디발송" /></p>
                                   </div>
                                   </form>
                                    <hr>
                                    <form action="/memberFindFullIdEmail.do" method="post">
                                    <div class="check_method">
                                       <p>등록된 이메일로 확인 : <%=maskedEmail %></p>
                                       <input type="hidden" name="userName" value="<%=userName %>"/>
                                       <input type="hidden" name="method" value="<%=method %>"/>
                                       <input type="hidden" name="userInfo" value="<%=userInfo %>"/>
                                       <p><input type="submit" class="btn btn-outline-secondary" value="아이디발송" /></p>
                                   </div>
                                   </form>
                               </fieldset>
                               <span>회원정보 상에 등록되어있는 이메일, 휴대폰번호로 전체 아이디가 발송됩니다.</span>
                               
                            </div>
                    </div>
                </div>
            </div>

            <%@ include file="/views/common/header&footer/footer.jsp"%>
        </div>
    </div>
	<%} else if(result==false){ %>
		<script>
			alert("입력한 회원정보로 가입된 아이디가 존재하지 않습니다.\n입력한 정보를 다시 확인해주세요");
			location.replace("/views/member/memberFindId.jsp");
		</script>
	<%} %>
    
</body>
</html>