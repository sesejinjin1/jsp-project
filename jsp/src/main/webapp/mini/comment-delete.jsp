<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String commentNo = request.getParameter("commentNo");
		String boardNo = request.getParameter("boardNo");
		try{
			stmt = conn.createStatement();
			
			String querytext = "DELETE FROM board_comment WHERE commentNo=" + commentNo;
			System.out.println(querytext);
			System.out.println(boardNo);
			stmt.executeUpdate(querytext);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("삭제되었다!");
	location.href = "board-noticeView.jsp?boardNo=<%=boardNo%>";
</script>