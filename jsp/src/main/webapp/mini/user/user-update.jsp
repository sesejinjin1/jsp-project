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

/* 제목 스타일링 */
.top-section h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

/* 폼 스타일링 */
form {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

fieldset {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    width: 100%;
}

legend {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #007bff;
}

/* 입력 필드 및 레이블 스타일링 */
.inbox p {
    margin-bottom: 15px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"] {
    max-width: 100%;
}

input[type="radio"] {
    margin-right: 5px;
}

/* 버튼 스타일링 */
button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin: 5px;
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
	<header>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<%@include file="../db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String userId = request.getParameter("userId");
		try{
			stmt = conn.createStatement();
			String query = "SELECT * FROM mini_user WHERE userId=" +userId ;
			rs = stmt.executeQuery(query);
			System.out.println(query);
			while(rs.next()){
		
	%>
	
	<main class="container">
		<div class="top-section">
			<h2 style="text-align: center;">회원 정보 수정</h2>
			<form id="joinForm" action="userUpdateAction.jsp" method="post"
				style="text-align: center;" name="joinForm">
				<fieldset>
					<div class="inbox">
						<p>
							<label for="userId">아이디 </label><input id="userId" name="userId"
								style="ime-mode: disabled;" placeholder="아이디"
								autofocus="autofocus" type="text" value="<%=rs.getString("userId") %>" maxlength="30" readonly="readonly"/>
						</p>
						<p>
							<label for="userPwd">비밀번호 </label><input id="userPwd"
								name="userPwd" placeholder="비밀번호" type="password" value="<%=rs.getString("userPwd") %>"
								maxlength="30" />
						</p>
						<p>
							<label for="userPwd2">비밀번호 확인 </label><input id="userPwd2"
								name="userPwd2" placeholder="비밀번호 확인" type="password" value="<%=rs.getString("userPwd") %>"
								maxlength="30" />
						</p>
						<p>
							<label for="userName">이름 </label><input id="userName"
								name="userName" placeholder="이름" type="text" value="<%=rs.getString("userName") %>"
								maxlength="30" />
						</p>
						<p>
							<label for="userJumin1">주민등록번호 </label><input id="userJumin1"
								name="userJumin1" placeholder="앞 6자리" type="text" value="<%=rs.getString("userJumin1") %>"
								maxlength="6" /> - <input id="userJumin2"
								name="userJumin2" placeholder="뒤 7자리" type="text" value="<%=rs.getString("userJumin2") %>"
								maxlength="7" />
						</p>
						<p>
							<label for="userPhone">핸드폰 번호 </label><input id="userPhone"
								name="userPhone" placeholder="- 제외하고 입력해주세요" type="text"
								value="<%=rs.getString("userPhone") %>" maxlength="11" />
						</p>
						<p>
							<label for="userEmail">이메일 주소 </label><input id="userEmail1"
								name="userEmail1" placeholder="이메일 주소" type="text" value="<%=rs.getString("userEmail") %>"
								maxlength="30" />
						</p>
						<p><%if(rs.getString("userGender").equals("M")){%>
							성별 <label>남 <input type="radio" name="userGender"
								value="M" checked="checked" ></label> <label>여 <input type="radio"
								name="userGender" value="F"></label><%}else{%>
							성별 <label>남 <input type="radio" name="userGender"
								value="M"></label> <label>여 <input type="radio"
								name="userGender" value="F"  checked="checked" ></label><%} %>
						</p>
						<p>
							<button type="submit">정보수정</button>
							<button type="reset">다시입력</button>
						</p>
					</div>
				</fieldset>
			</form>
		</div>

	</main>
<%}} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}%>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
<script>

</script>
