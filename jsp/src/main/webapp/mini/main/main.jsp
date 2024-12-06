<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>체육센터</title>

<meta charset="utf-8">
<meta name="description" content="체육센터 홈페이지에 오신것을 환영합니다.">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">


<link rel="stylesheet" type="text/css" href="../layout/default1.css">
</head>
<body class="site_fmcs menu_design_main  ">



	<div id="jump_menu">
		<h1>건너뛰기 메뉴</h1>
		<ul>
			<li><a href="#">본문 바로가기</a></li>
			<li><a href="#" id="top">주메뉴 바로가기</a></li>
		</ul>
	</div>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div id="body">

		<hr class="linebreak">
		<div id="container" class="main">
			<div id="section">
				<div id="contents">

					<div class="section_1">
						<div class="align_1">
							<section class="main_visual"></section>
							<section class="link">
								<h2>메뉴 바로가기</h2>
								<ul>
									<li><a href="#">강좌신청</a></li>
									<li><a href="#">대관신청</a></li>
									<li><a href="#">시설안내</a></li>
									<li><a href="#">오시는길</a></li>
								</ul>
							</section>
						</div>
					</div>


					<div class="section_2">
						<div class="align_2">
							<section class="notice">
								<h2>
									<a href="../board/board-notice.jsp">공지사항</a>
								</h2>

								<ul>
									<%@include file="../db.jsp"%>
									<%
									ResultSet rs = null;
									Statement stmt = null;

									try {
										stmt = conn.createStatement();
										String query = "SELECT ROW_NUMBER() OVER (ORDER BY cdatetime DESC) AS rowNum, boardNo,contents, title,cdatetime, userId FROM board_notice LIMIT 4";
										rs = stmt.executeQuery(query);

										while (rs.next()) {
									%>
									<li class="c<%=rs.getInt("rowNum")%>"><a href="#"
										onclick="fnView('<%=rs.getString("boardNo")%>')"> <%=rs.getString("title")%>>
											<em class="category category_공지">공지</em> <strong
											class="title"><%=rs.getString("title")%></strong> <span
											class="content"><%=rs.getString("contents")%></span> <span
											class="date"><%=rs.getString("cdatetime")%></span>
									</a></li>

									<%
									}
									%>
								</ul>
							</section>
							<%
							} catch (SQLException ex) {
							out.println("SQLException : " + ex.getMessage());
							}
							%>

						</div>
					</div>

				</div>
			</div>
		</div>
		<hr class="linebreak">
		<jsp:include page="../layout/footer.jsp"></jsp:include>
	</div>
	<div class="gnb_cover" style="display: none;"></div>
</body>
</html>
<script>
	function fnView(boardNo) {
		location.href = "../board/board-noticeView.jsp?boardNo=" + boardNo;
	}
</script>