<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		try{
			stmt = conn.createStatement();
			String query = "DELETE FROM mini_user WHERE userId ='" +id+"'";
			stmt.executeUpdate(query);
			System.out.println(query);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+ id + "님의 아이디가 삭제되었습니다.')");
			script.println("location.href = 'userlist.jsp'");
			script.println("</script>");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>