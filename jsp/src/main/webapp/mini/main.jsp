<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미니프로젝트</title>
    <link rel="stylesheet" href="styles.css">
    <!-- <link rel="stylesheet" href="common.css"> -->
</head>
<body>
    <div class="top-bar">
        <div class="actions">
                <a href="#" class="login">로그인</a>
                <a href="#" class="signup">회원가입</a>
        </div>
    </div>
    <div class="main-header container">
        <div class="logo">
            <a href="#">세세진진</a>
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
    
    <main class="container">
        <div class="top-section">
            <h2> 목록 </h2>
            <div class="info-boxes">
                <div class="info-box">
                    <h3>목록1</h3>
                    <p> 목록 1의 내용</p>
                </div>
                <div class="info-box">
                    <h3>목록2</h3>
                    <p>목록2의 내용</p>
                </div>
                <div class="info-box">
                    <h3>목록 3</h3>
                    <p>목록 3의 내용</p>
                </div>
                <div class="info-box">
                    <h3>목록 4</h3>
                    <p>목록 4의 내용</p>
                </div>
            </div>
        </div>

        <div class="bottom-section">
            <h2>목록2</h2>
            <div class="info-boxes">
                <div class="info-box">
                    <h3>목록2 항목1</h3>
                    <p>목록2 항목1의 설명</p>
                </div>
                <div class="info-box">
                    <h3>목록2 항목2</h3>
                    <p>목록2 항목2의 설명</p>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 세세진진 사이트.</p>
    </footer>

</body>
</html>
