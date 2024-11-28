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
	<%@include file="db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		try{
			stmt = conn.createStatement();
			String query = "SELECT * FROM mini_user WHERE userId = '" + id +"'";
			rs = stmt.executeQuery(query); //쿼리문 DB에서 실행(?)
			
			if(rs.next()){//아이디 존재
				if(rs.getString("userPwd").equals(pwd)){	//아이디 비밀번호 둘다 일치
					if(rs.getInt("cnt") >=5){	// 로그인 5번 이상 실패
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('로그인에 5번 이상 실패하셨습니다. 관리자에게 문의해주세요.')");
						script.println("history.back()");
						script.println("</script>");
						
					}else{	//로그인 성공
						//System.out.println("1");	
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('"+ rs.getString("userName") + "님 로그인 되었습니다.')");
						//script.println("location.href = 'main.jsp'");
						script.println("</script>");
						
						session.setAttribute("userId",rs.getString("userId"));
						session.setAttribute("status",rs.getString("status"));
						session.setMaxInactiveInterval(60*30);	//세션 (60초x30) 30분 유지
						System.out.println(session.getAttribute("userId"));
						response.sendRedirect("main.jsp");
						
						query = "UPDATE mini_user SET cnt = 0 WHERE userId = '" + id + "'";	//로그인시 카운트 초기화
						stmt.executeUpdate(query);
						}
					
				}else{	//비밀번호가 틀림
					//System.out.println("2");
					
					
					if(rs.getInt("cnt") >=5){	// 로그인 5번 이상 실패
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('로그인에 5번 이상 실패하셨습니다. 관리자에게 문의해주세요.')");
						script.println("history.back()");
						script.println("</script>");
						
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('비밀번호를 확인해주세요.')");
						script.println("history.back()");
						script.println("</script>");
					}
					query = "UPDATE mini_user SET cnt = cnt + 1 WHERE userId = '" + id + "'";
					stmt.executeUpdate(query);
				}
			}else{//아이디 존재x
				//System.out.println("3");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다. 아이디를 확인해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			
		}catch(SQLException ex){
			out.println("SQLException :" + ex.getMessage());
			
		}
	%>


</body>
</html>