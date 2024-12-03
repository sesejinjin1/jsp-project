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
.join-form {width: 100%;max-width: 600px;margin: 0 auto;}
fieldset {border: none;padding: 0;margin: 0;}
legend {font-size: 1.2em;color: #007BFF;margin-bottom: 15px;}
.inbox p {margin-bottom: 15px;display: flex;align-items: center;}
.inbox label {display: block;margin-right: 10px;color: #333;width: 120px;}
.inbox input[type="text"], .inbox input[type="password"] {flex: 1;padding: 10px;border: 1px solid #ccc;border-radius: 5px;font-size: 16px;box-sizing: border-box;}
.inbox button {padding: 10px 15px;border: none;border-radius: 5px;background-color: #007BFF;color: white;font-size: 16px;cursor: pointer;margin-left: 10px;}
.inbox button:hover {background-color: #0056b3;}
.inbox input[type="button"], .inbox input[type="submit"] {cursor: pointer;}
.inbox input[type="radio"] {margin-right: 5px;}
.form-actions {margin-left: 40%;}
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<header>
	</header>

	<div id="container" class="sub" data-menu-name="회원메뉴">
		<div class="container_align">
			<div class="section">
				<h2 style="text-align: center;">회원 가입</h2>
				<div id="contents" class="contents">
				<form id="joinForm" action="joinAction.jsp" method="post"
					style="text-align: center;" name="joinForm">
					<fieldset>
						<div class="inbox">
							<p>
								<label for="userId">아이디 </label><input id="userId" name="userId" class="idbox"
									style="ime-mode: disabled;" placeholder="아이디"
									autofocus="autofocus" type="text" value="" maxlength="30" />
								<button type="button" onclick="fnCheck()"> 중복체크 </button>
							</p>
							<p>
								<label for="userPwd">비밀번호 </label><input id="userPwd"
									name="userPwd" placeholder="비밀번호" type="password" value=""
									maxlength="30" />
							</p>
							<p>
								<label for="userPwd2">비밀번호 확인 </label><input id="userPwd2"
									name="userPwd2" placeholder="비밀번호 확인" type="password" value=""
									maxlength="30" />
							</p>
							<p>
								<label for="userName">이름 </label><input id="userName"
									name="userName" placeholder="이름" type="text" value=""
									maxlength="30" />
							</p>
							<p>
								<label for="userJumin1">주민등록번호 </label><input id="userJumin1"
									name="userJumin1" placeholder="앞 6자리" type="text" value=""
									maxlength="6" /> - <input id="userJumin2"
									name="userJumin2" placeholder="뒤 7자리" type="text" value=""
									maxlength="7" />
							</p>
							<p>
								<label for="userPhone">핸드폰 번호 </label><input id="userPhone"
									name="userPhone" placeholder="- 제외하고 입력해주세요" type="text"
									value="" maxlength="11" />
							</p>
							<p>
								<label for="userEmail">이메일 주소 </label><input id="userEmail1"
									name="userEmail1" placeholder="이메일 주소" type="text" value=""
									maxlength="30" />
							</p>
							<p>
								<label>성별</label><label> 남 <input type="radio" name="userGender"
									value="M" checked="checked" ></label> <label>여 <input type="radio"
									name="userGender" value="F"></label>
							</p>
							<p class="form-actions">
								<button type="button" onclick="fnSave()">회원가입</button>
								<button type="reset">다시입력</button>
							</p>
						</div>
					</fieldset>
				</form>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
<script src="joincheck.js"></script>
