<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미니프로젝트</title>
    <link rel="stylesheet" href="test.css">
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
                <a href="main.jsp">세세진진</a>
            </div>
            <nav>
                <ul class="nav-menu">
                    <!-- Navigation Menu Items -->
                </ul>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="login-container">
            <h2>회원 로그인</h2>
            <form id="loginForm" action="loginAction.jsp" method="post" class="login-form">
                <fieldset>
                    <legend>회원 로그인</legend>
                    <div class="form-group">
                        <label for="userId">아이디</label>
                        <input id="userId" name="userId" placeholder="아이디" autofocus="autofocus" type="text" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label for="userPwd">비밀번호</label>
                        <input id="userPwd" name="userPwd" placeholder="비밀번호" type="password" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <button type="submit">로그인</button>
                    </div>
                </fieldset>
            </form>
            <div class="link_box">
                <a href="#">회원가입</a>
                <a href="#">아이디찾기</a>
                <a href="#">비밀번호찾기</a>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 세세진진 사이트.</p>
    </footer>
</body>
</html>