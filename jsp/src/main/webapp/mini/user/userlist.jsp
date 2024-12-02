	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>미니프로젝트</title>
<link rel="stylesheet" href="../styles.css">
<link rel="stylesheet" href="../layout/default1.css">

<style>
.container1 {
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    height: auto;
    background-color: #f4f4f4;
    padding: 20px;
}

/* 상단 섹션 스타일링 */
.top-section {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    box-sizing: border-box;
    padding: 20px;
}
.top-section h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

/* 테이블 스타일링 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    text-align: center;
    
}

th {
    background-color: #007bff;
    color: #fff;
}

td a {
    color: #007bff;
    text-decoration: none;
    font-size: 15px;
    font-weight: bold;
}

td a:hover {
    text-decoration: underline;
}

/* 버튼 스타일링 */
button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 8px 12px;
    font-size: 14px;
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

/* 삭제 링크 스타일링 */
.deleteUser {
    color: #dc3545;
    font-size: 15px;
    font-weight: bold;
}

.deleteUser:hover {
    text-decoration: underline;
}
	
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<main class="container1">
		<div class="top-section">
		<%if(session.getAttribute("status").equals("A")){ %>
			<h2 style="text-align: center;">회원 목록</h2>
					<div>
						<table style="margin-top : 20px; ">
							<tr>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>주민등록번호</th>
								<th>연락처</th>
								<th>성별</th>
								<th>이메일주소</th>
								<th>권한</th>
								<th>정보수정</th>
								<th>회원삭제</th>
								<th>로그인 초기화</th>
								
							</tr>
						<%@ include file="../db.jsp" %>
						<%
							ResultSet rs = null;
							Statement stmt = null;
							try{
								stmt = conn.createStatement();
								String query = "SELECT * FROM mini_user";
								rs = stmt.executeQuery(query);
								System.out.println(query);
								while(rs.next()){
									String status = rs.getString("status").equals("A") ? "관리자" : "일반회원";
									
								%>
								
								<tr>
									<td><%= rs.getString("userId") %></td>
									<td><%= rs.getString("userPwd") %></td>
									<td><%= rs.getString("userName") %></td>
									<td><%= rs.getString("userJumin1") %> - <%= rs.getString("userJumin2") %></td>
									<td><%= rs.getString("userPhone") %></td>
									<%if(rs.getString("userGender").equals("M")){%><td>남자</td><%}else{%><td>여자</td><%} %>
									<td><%= rs.getString("userEmail") %></td>
									<td><%= status %></td>
									<td><a href="user-update.jsp?userId='<%=rs.getString("userId")%>'&userGender='<%=rs.getString("userGender") %>'" class="updateUser" style="color: black; text-decoration: none; font-size: 15px; font-weight: bold;">수정하기</a></td>
									<td><a href="javascript:fnDelete('<%= rs.getString("userId") %>')" class="deleteUser">삭제하기</a></td>
										<% if(rs.getInt("cnt")>=5){ %>	
												<td>								
												<button onclick="fnReset('<%= rs.getString("userId") %>')">초기화</button>
												</td>
										<% } %>
		
									
								</tr>
							
						<%	}	
							}catch(SQLException ex){
								out.println("SQLException : " + ex.getMessage());
							}
							
						
						%>
							
							
						</table>
					</div>
					<%}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('관리자만 접근 가능합니다!')");
						script.println("history.back()");
						script.println("</script>");
					}%>
						
					
		</div>

	</main>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
<script>
	function fnReset(userId){
		if(!confirm("초기화 하시겠습니까?")){
		    alert("취소 되었습니다.");
		    location.reload();
		}else{
		    location.href="pwd-reset.jsp?userId=" +userId ;
		}
	}
	function fnDelete(userId){
		if(!confirm("삭제 하시겠습니까?")){
		    alert("취소 되었습니다.");
		    location.reload();
		}else{
		    location.href="user-delete.jsp?userId=" +userId ;
		}
	}

</script>
