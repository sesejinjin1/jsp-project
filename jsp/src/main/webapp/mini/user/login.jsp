<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미니프로젝트</title>
    <link rel="stylesheet" href="../styles.css">
	<link rel="stylesheet" href="../layout/default1.css">
    <style>
    

.login-container {margin-top: 20%;}
.login-container h2 {margin-bottom: 20px;font-size: 24px;text-align: center;color: #333;}
.login-form {width: 100%;}
.login-form fieldset {border: none;padding: 0;margin: 0;}
.login-form legend {font-size: 1.2em;color: #007BFF;margin-bottom: 15px;}
.form-group {margin-bottom: 15px;}
.form-group label {display: block;margin-bottom: 5px;color: #333;}
.form-group input {width: 100%;padding: 10px;border: 1px solid #ccc;border-radius: 5px;font-size: 16px;box-sizing: border-box;}
.form-group button {width: 100%;padding: 10px;border: none;border-radius: 5px;background-color: #007BFF;color: white;font-size: 16px;cursor: pointer;}
.form-group button:hover {background-color: #0056b3;}
.link_box {margin-top: 20px;text-align: center;}
.link_box a {color: #007BFF;text-decoration: none;margin: 0 10px;font-size: 16px;}
.link_box a:hover {text-decoration: underline;}

    
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div id="container" class="sub" data-menu-name="회원메뉴">
        <div class="container_align">
        	<div id="section">
		        <h2>회원 로그인</h2>
				<form id="loginForm" action="loginAction.jsp" method="post" class="login-form">
                          <fieldset>	
                              	<div class="form-group">
                                 		<p><label for="userId">아이디</label><input id="userId" name="userId" placeholder="아이디" autofocus="autofocus" type="text" value="" maxlength="15"/></p>
							</div>
							<div class="form-group">
								<p><label for="userPwd">비밀번호</label><input id="userPwd" name="userPwd" placeholder="비밀번호" type="password" value="" maxlength="15"/></p>
							</div>
							<div class="form-group">
								<button type="submit">로그인</button>
							</div>
						
			    	</fieldset>
                      </form>
                   <div class="link_box">
					    <a href="join.jsp">회원가입</a>
					    <a href="#">아이디찾기</a>
					    <a href="#">비밀번호찾기</a>
                   </div>
           	</div>
        </div>
						
    </div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
