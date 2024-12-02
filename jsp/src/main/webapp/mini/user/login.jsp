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
    <header>
        <div class="top-bar">
            <div class="actions">
            	<%if((String)session.getAttribute("userId") != null){ %>
            	<p> <%= (String)session.getAttribute("userId") %> 님 환영합니다.</p>
            	<a href="logoutAction.jsp" class="logout">로그아웃</a>
            	<%} else{%>
                <a href="login.jsp" class="login">로그인</a>
                <a href="join.jsp" class="signup">회원가입</a>
                <%}  %>
            </div>
        </div>
        <div class="main-header container">
            <div class="logo">
                <a href="main.jsp">세세진진</a> <!-- 홈 링크 추가 -->
            </div>
            <nav>
                <ul class="nav-menu">
                    <li class="nav-item dropdown">
                        <a href="#">메뉴1</a>
                        <ul class="dropdown-menu">
                            <li><a href="board-notice.jsp">공지사항</a></li>
                            <li><a href="#">서브 메뉴 2</a></li>
                            <li><a href="#">서브 메뉴 3</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#">메뉴2</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">서브 메뉴 1</a></li>
                            <li><a href="#">서브 메뉴 2</a></li>
                            <li><a href="#">서브 메뉴 3</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#">메뉴3</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">서브 메뉴 1</a></li>
                            <li><a href="#">서브 메뉴 2</a></li>
                            <li><a href="#">서브 메뉴 3</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#">메뉴4</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">서브 메뉴 1</a></li>
                            <li><a href="#">서브 메뉴 2</a></li>
                            <li><a href="#">서브 메뉴 3</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="login-container">
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
						
    </main>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
