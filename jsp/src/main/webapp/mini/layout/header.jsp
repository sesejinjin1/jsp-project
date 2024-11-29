<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미니프로젝트</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<header>
    <div class="top-bar">
        <div class="actions">
            <% if((String)session.getAttribute("userId") != null) { %>
                <p> <%= (String) session.getAttribute("userId") %> 님 환영합니다.</p>
                <% if(session.getAttribute("status").equals("A")) { %>
                    <a href="userlist.jsp" class="logout">회원목록</a>
                <% } %>
                <a href="logoutAction.jsp" class="logout">로그아웃</a>
            <% } else { %>
                <a href="login.jsp" class="login">로그인</a>
                <a href="join.jsp" class="signup">회원가입</a>
            <% } %>
        </div>
    </div>
    <div class="main-header container">
        <div class="logo">
            <a href="main.jsp">세세진진</a>
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
            </ul>
        </nav>
    </div>
</header>
