<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.time.LocalTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	LocalTime now_time = LocalTime.now();
	DateTimeFormatter fmted = DateTimeFormatter.ofPattern("hh:mm:ss");
    String new_now_time = now_time.format(fmted);
    System.out.println("time: " + new_now_time);
    
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;    			
	PreparedStatement pstmt = null;
	Statement stmt = null;	
	ResultSet result = null;
	
	String op_id = request.getParameter("op_id_update");
	
	if (op_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. ID를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		String query = "UPDATE operation SET status=2, deptstatus=0, arvstatus=0, "
				+ "updatetime='" + new_now_time + "' WHERE ID=" + op_id + ";"; 
				// Query문 초기화.

		int flag = 0;
		String query2 = "SELECT status, deptstatus, arvstatus "
						+ "FROM operation WHERE ID=" + op_id + ";";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query2);
		while(result.next()) {
			int status = result.getInt("status");
			int deptstatus = result.getInt("deptstatus");
			int arvstatus = result.getInt("arvstatus");
			
			if (status == 2 && deptstatus == 0 && arvstatus == 0) {
				flag = 1;
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 운행 종료된 ID입니다.')");
				script.println("location.href = '../main.jsp'");
				script.println("</script>");
			}
		}

		// DB Connection 생성
		conn.close();
		result.close();
		if (flag == 0) {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// Statement 생성				
		
			pstmt = conn.prepareStatement(query);

			// Query 실행
			pstmt.executeUpdate();	
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공적으로 운행 종료하였습니다.')");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
		}
	} catch(Exception e) {
			e.printStackTrace();
	} finally {
		try {
			conn.close();
			stmt.close();
			pstmt.close();			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
	}
	
   	%>
</body>
</html>