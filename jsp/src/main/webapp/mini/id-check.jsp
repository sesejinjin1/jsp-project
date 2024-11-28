<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String id = request.getParameter("userId");
	
	try {
		stmt = conn.createStatement();
		String query = "SELECT * FROM mini_user WHERE userId='" + id +"'";
		rs = stmt.executeQuery(query);
		System.out.println(query);
		

			if (rs.next()) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('중복된 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('사용가능한 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
		}	
		
	} catch (SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	
	%>

</body>
</html> 