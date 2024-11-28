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
		String userId = (String) session.getAttribute("userId");
		ResultSet rs = null;
		Statement stmt = null;	
		try{
			stmt = conn.createStatement();
			String query = "INSERT INTO board_notice VALUES" 
					+ "("
					+ "NULL, '" + title + "', '" + contents 
					+ "', 0, '" + userId + "', 'number', now(), now()" 	
					+ ")";
			stmt.executeUpdate(query);
			System.out.println("쿼리문 : " + query);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디입니다.')");
			script.println("</script>");
			response.sendRedirect("board-notice.jsp");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>