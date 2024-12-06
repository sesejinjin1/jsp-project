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
.login-container {
	margin-top: 20%;
	margin-left: 10%;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 100%;
	max-width: 70%;
}

.login-container h2 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
	text-align: center
}

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
				<form action="board-noticeInAction.jsp" name="board">
					<div>
						<label>제목 : <input type="text" name="title"></label>
					</div>
					<div>
						<label>내용 : <textarea cols="50" rows="10" name="contents"></textarea></label>
					</div>
					<div>
						<button type="button" onclick="fnCheck()">저장</button>
						<!-- <input type="button"> -->
					</div>
				</form>
			</div>
		</div>

	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
	function fnCheck() {
		var form = document.board;
		if (form.title.value == "") {
			alert("제목을 입력해주세요.");
			form.title.focus();
			return;
		}
		if (form.contents.value == "") {
			alert("내용을 입력해주세요.");
			form.contents.focus();
			return;
		}

		alert("저장되었습니다.");
		form.submit();

	}
</script>