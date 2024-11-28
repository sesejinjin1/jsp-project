<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Connection Test</title>
</head>
<body>

	<%
		Connection conn;
		Class.forName("com.mysql.cj.jdbc.Driver");
		// MySQL 연결 URL, useSSL=false, serverTimezone=UTC 추가
		String db_url = "jdbc:mysql://localhost:3306/mini?useSSL=false&serverTimezone=UTC";
		String db_id = "root";
		String db_pw = "test1234";
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		System.out.println("DB 연결 완료");
	%>

</body>
</html>
