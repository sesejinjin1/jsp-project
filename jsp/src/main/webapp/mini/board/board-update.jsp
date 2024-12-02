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
input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
	height: 500px;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 10px 15px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

button:focus {
	outline: none;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5);
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="container" class="sub" data-menu-name="참여 / 공간">
		<div class="container_align">
			<div id="section">
				<h2>공지사항</h2>
				<div id="contents" class="contents">
				<form action="board-updateAction.jsp" name="board">
					<%@include file="../db.jsp"%>
					<%
			ResultSet rs = null;
			Statement stmt = null;
			String boardNo = request.getParameter("boardNo");
			
			try{
				stmt = conn.createStatement();
				String querytext = "SELECT * FROM board_notice WHERE BOARDNO = " + boardNo;
				rs = stmt.executeQuery(querytext);
				
				if(rs.next()){
		%>
					<input type="hidden" value="<%= rs.getString("boardNo") %>"
						name="boardNo">
					<div>
						제목 : <input value="<%= rs.getString("title") %>" name="title">
					</div>
					<div>
						내용 :
						<textarea cols="50" rows="10" name="contents"><%= rs.getString("contents") %></textarea>
					</div>
					<button type="button" onclick="fnCheck()">저장</button>
					<%			
				} else {
					out.println("삭제된 게시글 입니다.");
				}
				
			} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		%>
				</form>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
	function fnCheck(){
		var form = document.board;
		if(form.title.value == ""){
			alert("제목을 입력해주세요.");
			form.title.focus();
			return;
		}	
		if(form.contents.value == ""){
			alert("내용을 입력해주세요.");
			form.contents.focus();
			return;
		}
		alert("수정되었습니다.");
		form.submit();	
	}
</script>