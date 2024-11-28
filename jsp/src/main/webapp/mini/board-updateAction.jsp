<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String boardNo = request.getParameter("boardNo");
		ResultSet rs = null;
		Statement stmt = null;	
		try{
			stmt = conn.createStatement();
			String query = "UPDATE board_notice SET title='"+title+"', contents='"+contents+"' WHERE boardNo ='"+boardNo+"'";
			stmt.executeUpdate(query);
			System.out.println("쿼리문 : " + query);
			response.sendRedirect("board-notice.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>