<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		try{
			stmt = conn.createStatement();
			String querytext = "DELETE FROM board_notice WHERE boardNo = " + boardNo;
			stmt.executeUpdate(querytext);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("삭제되었습니다.");
	location.href="../main/main.jsp";
</script>