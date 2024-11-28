<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미니프로젝트</title>
    <link rel="stylesheet" href="styles.css">
<style>
	.login-container {margin: 0 auto;padding: 20px;background-color: #f9f9f9;border-radius: 8px;box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);height: auto;min-height: 800px;margin-top: 20%;}
	.login-container h2 { text-align: center;}
	table {width: 100%;border-collapse: collapse;margin-top: 20px;}
	th, td {padding: 12px;text-align: left;border-bottom: 1px solid #ddd;}
	th {background-color: #f4f4f4;color: #333;font-weight: bold;}
	tr:nth-child(even) {background-color: #f9f9f9;}
	tr:hover {background-color: #f1f1f1;}
	a {color: #0066cc;text-decoration: none;}
	a:hover {text-decoration: underline;}
	button {margin-top: 20px;padding: 10px 20px;background-color: #007bff;color: white;border: none;border-radius: 5px;cursor: pointer;font-size: 16px;}
	button:hover {background-color: #0056b3;}
	.pagination {text-align: center;margin-top: 20px;}
	.pagination a {display: inline-block;padding: 8px 16px;margin: 0 4px;background-color: #007bff;color: white;border-radius: 5px;text-decoration: none;font-size: 16px;}
	.pagination a.active {background-color: #0056b3;}
	.pagination a:hover {background-color: #0056b3;}
	.pagination .disabled {background-color: #ddd;color: #666;cursor: not-allowed;}   
</style>
</head>
<body>
    <header>
        <div class="top-bar">
            <div class="actions">
            	<%if((String)session.getAttribute("userId") != null){ %>
            	<p> <%= (String)session.getAttribute("userId") %> 님 환영합니다.</p>
            		<%if(session.getAttribute("status").equals("A")){ %>
            			<a href="userlist.jsp" class="logout">회원목록</a>
            			<%} %>
            			
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
        <h2>공지사항</h2>
				<%@include file="db.jsp"%>	
				<%
				int pageSize = 10;
				int currentPage = 1;
				if (request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				int offset = (currentPage - 1) * pageSize;
				ResultSet rs = null;
				Statement stmt = null;
				
				System.out.println(session.getAttribute("userId"));
				try{
					stmt = conn.createStatement();
					String countQuery = "SELECT COUNT(*) AS total FROM board_notice";
					ResultSet coun_rs = stmt.executeQuery(countQuery);
					int total = 0;
					if (coun_rs.next()) {
						total = coun_rs.getInt("total");
					}
					coun_rs.close();
					int totalPages = (int) Math.ceil((double) total / pageSize);
					String querytext = "WITH RankedPosts AS (SELECT B.boardNo,title,B.cnt,cdatetime,userName,COALESCE(C.commentCnt, 0) AS commentCnt,B.userId,ROW_NUMBER() OVER (ORDER BY cdatetime ASC) AS rowNum FROM board_notice B INNER JOIN mini_user U ON B.userId = U.userId LEFT JOIN (SELECT boardNo, COUNT(*) AS commentCnt FROM board_comment GROUP BY boardNo) C ON B.boardNo = C.boardNo)SELECT *FROM RankedPosts ORDER BY rowNum DESC LIMIT "+pageSize+" OFFSET "+ offset;
					String query = 
							  "SELECT B.boardNo, title, B.cnt, cdatetime, userName, commentCnt, B.userId "
							+ "FROM board_notice B "
							+ "INNER JOIN mini_user U ON B.userId = U.userId "
							+ "LEFT JOIN ( "
							+ 	"SELECT COUNT(*) AS commentCnt, boardNo "
							+	"FROM board_comment "
							+	"GROUP BY boardNo "
							+ ") C ON B.boardNo = C.boardNo";
					rs = stmt.executeQuery(querytext);
					System.out.println(querytext);
				%>
					<table>
					<tr>
						<th> 번호 </th>
						<th> 제목 </th>
						<th> 작성자 </th>
						<th> 조회수 </th>
						<th> 작성일 </th>
					</tr>			
				<%
				while (rs.next()) {
					String commentCnt = "";
					if(rs.getString("commentCnt") != null){
						commentCnt = "(" + rs.getString("commentCnt") + ")";
					} 
				%>
					<tr>
						<td> <%= rs.getString("rowNum") %></td>
						<td> 
							<a href="#" onclick="fnView('<%= rs.getString("boardNo") %>')">
								<%= rs.getString("title") %><% if(rs.getInt("commentCnt")>0){%> <%= commentCnt %> <%} %>
							</a>
						</td>
						<td>						
						 		<%= rs.getString("userName") %>
						 </td>
						<td> <%= rs.getString("cnt") %></td>
						<td> <%= rs.getString("cdatetime") %></td>
					</tr>
				<%
				}
				%>
				
				</table><%if ("A".equals(session.getAttribute("status"))){ %>
				<button onclick="location.href='board-noticeIn.jsp'">글쓰기</button>
				<%} %>
				<div class="pagination">
					<%
					if (currentPage > 1) {
						int prevPage = currentPage - 1;
						out.print("<a href=?page=" + prevPage + ">이전</a>");
					}
					for (int i = 1; i <= totalPages; i++) {
						if (i == currentPage) {
							out.print("<a href=?page=" + i + " class=active>" + i + "</a>");
						} else {
							out.print("<a href=?page=" + i + ">" + i + "</a>");
						}
					}
					if (currentPage < totalPages) {
						int nextPage = currentPage + 1;
						System.out.println("<a href=?page=" + nextPage + ">다음</a>");
						out.print("<a href=?page=" + nextPage + ">다음</a>");
					}
					%>
				</div>
				<%
				} catch(SQLException ex) {
					out.println("SQLException : " + ex.getMessage());
				}
				%>
									
                   
        </div>
						
    </main>

    <footer>
        <p>&copy; 세세진진 사이트.</p>
    </footer>
</body>
</html>
<script>
	function fnView(boardNo){
		location.href="board-noticeView.jsp?boardNo="+boardNo;
	}
</script>
