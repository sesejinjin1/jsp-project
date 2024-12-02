<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
}
</style>

</head>
<body>
	<%@include file="../db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		String comment = request.getParameter("comment");
		String sessionId = (String) session.getAttribute("userId");
		try{
			stmt = conn.createStatement();
			String querytext = 
					"INSERT INTO board_comment VALUES ("
					+ "NULL, " + boardNo + ",'" + sessionId + "', '" + comment + "', "
					+ "0, now(), now()"
					+ ")";
			stmt.executeUpdate(querytext);
			out.println(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
 	alert("저장되었습니다.");
 	location.href = document.referrer;
</script>
​
