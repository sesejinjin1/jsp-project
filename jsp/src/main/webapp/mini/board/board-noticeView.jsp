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
.login-container h2 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
	text-align: center
}

form {
	display: flex;
	flex-direction: column;
}

input[type="hidden"] {
	display: none;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
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

.comment-section {
	margin-top: 20px;
}

.comment-section input.comment {
	width: calc(100% - 120px);
	display: inline-block;
	padding: 10px;
}

.comment-section input.comment1 {
	width: calc(100% - 120px);
	display: inline-block;
	padding: 10px;
}

.comment-section button {
	display: inline-block;
	margin-left: 5px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 10px 15px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.comment-section button:hover {
	background-color: #0056b3;
}

.comment-section button:focus {
	outline: none;
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5);
}

.comment-list {
	margin-top: 20px;
}

.comment-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px;
	border-bottom: 1px solid #ddd;
	margin-bottom: 10px;
}

.comment-text {
	flex: 1;
	margin-right: 20px;
}

.comment-actions {
	display: flex;
	gap: 10px;
}

.comment-actions button {
	font-size: 16px;
	padding: 8px 12px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.comment-actions button.edit {
	background-color: #28a745;
	color: #fff;
}

.comment-actions button.edit:hover {
	background-color: #218838;
}

.comment-actions button.delete {
	background-color: #dc3545;
	color: #fff;
}

.comment-actions button.delete:hover {
	background-color: #c82333;
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
					<form action="comment-insert.jsp" name="board">
						<%@ include file="../db.jsp"%>
						<%
						ResultSet rs = null;
						Statement stmt = null;
						String boardNo = request.getParameter("boardNo");
						try {
							stmt = conn.createStatement();
							String querytext = "SELECT * FROM board_notice WHERE BOARDNO = " + boardNo;
							rs = stmt.executeQuery(querytext);
							if (rs.next()) {
						%>
						<input type="hidden" value="<%=rs.getString("boardNo")%>"
							name="boardNo">
						<div class="content_header">
							<h3><%=rs.getString("title")%></h3>
							<dl>
								<dt>등록일자 :</dt>
								<dd><%=rs.getString("cdatetime")%></dd>
							</dl>
						</div>
						<div class="content_content">
							<%
							for (int i = 0; i < 7; i++) {
							%>
							<%=rs.getString("contents")%><br>
							<%
							}
							%>
						</div>

						<%
						if (("admin").equals(session.getAttribute("userId"))) {
						%>
						<div class="admin-actions">
							<button type="button" onclick="fnDelete()">삭제</button>
							<button type="button" onclick="fnUpdate()">수정</button>
						</div>
						<%
						}
						%>
						<hr>
						<div class="comment-section">
							<div>
								댓글 :

								<%
							if ((String) session.getAttribute("userId") != null) {
							%>
								<input class="comment" type="text" placeholder="댓글을 등록하세요."
									name="comment">
								<button type="button" onclick="fnComment()">등록</button>
								<%
								} else {
								%>
								<input class="comment1" type="text"
									placeholder="댓글은 로그인하셔야 등록가능합니다." name="comment" disabled>
								<%
								}
								%>
							</div>
						</div>
						<div class="comment-list">
							<%
							querytext = "SELECT * FROM board_comment WHERE BOARDNO = " + boardNo;
							rs = stmt.executeQuery(querytext);
							while (rs.next()) {
								String commentNo = rs.getString("commentNo");
							%>
							<div class="comment-item">
								<div class="comment-text">
									<%=rs.getString("userId")%>
									:
									<%=rs.getString("comment")%>
								</div>
								<div class="comment-actions">
									<%
									if (rs.getString("userId").equals(session.getAttribute("userId"))) {
									%>
									<button type="button" class="edit">수정</button>
									<button type="button" class="delete"
										onclick="fnCommentDel(<%=commentNo%>)">삭제</button>
									<%
									}
									%>
								</div>

							</div>
							<%
							}
							%>
							<div>
								<button type="button" onclick="fnBack()">목록</button>
							</div>
						</div>
						<%
						} else {
						out.println("삭제된 게시글 입니다.");
						}
						} catch (SQLException ex) {
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

	function fnUpdate(){
		var form = document.board;
		form.action = "board-update.jsp";
		form.submit();
	}
	
	function fnComment(){
		var form = document.board;
		console.log(form.boardNo.value);
		if (form.comment.value == "") {
			alert("댓글을 입력해주세요.");
			return;
	    }
		var url = "comment-insert.jsp?boardNo="+ form.boardNo.value + "&comment=" + form.comment.value;
		location.href = url;
	}
	
	function fnReload(){
		location.reload();
	}
	function fnCommentDel(commentNo){
		var form = document.board;
		var url = "comment-delete.jsp?commentNo=" + commentNo+"&boardNo="+form.boardNo.value;
		console.log(url);
		if (!confirm("정말로 이 댓글을 삭제하시겠습니까?")){
			 alert("댓글 삭제가 취소되었습니다.");
			 return;
	    }
		
		
		location.href = url;
		
	}
	function fnDelete(){
		if(!confirm("삭제 하시겠습니까?")){
		    alert("취소 되었습니다.");
		    location.reload();
		}else{
		var form = document.board;
		form.action = "board-delete.jsp";
		form.submit();
		}
	}
	function fnBack(){
		window.history.go(-1)
	}
</script>