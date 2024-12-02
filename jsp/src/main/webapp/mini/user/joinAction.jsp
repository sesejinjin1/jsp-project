<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file = "../db.jsp" %>
	<%
		
		request.setCharacterEncoding("UTF-8");
	
		ResultSet rs = null;
		Statement stmt = null;
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String name = request.getParameter("userName");
		String jumin1 = request.getParameter("userJumin1");
		String jumin2 = request.getParameter("userJumin2");
		String phone = request.getParameter("userPhone");
		String email1 = request.getParameter("userEmail1");
		String email2 = request.getParameter("userEmail2");
		String gender = request.getParameter("userGender");
		try{
			stmt = conn.createStatement();
			String query = "INSERT INTO mini_user (userId, userPwd, userName, userJumin1, userJumin2, userPhone, userGender, userEmail) VALUES ('"
							+ id +"', '" + pwd + "' , '" + name  + "' , '" + jumin1  + "' , '" + jumin2  + "' , '" + phone  + "' , '" + gender  + "' , '" + email1  + "' )";
			//System.out.println(query);
			stmt.executeUpdate(query);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+ name + "님 회원가입 되었습니다.')");
			script.println("location.href = '../main/main.jsp'");
			script.println("</script>");
		}catch(SQLException ex){
			out.println("SQLException :" + ex.getMessage());
		}
	%>
</body>
</html>