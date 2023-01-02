<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
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
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;    			
	PreparedStatement pstmt = null;
	String op_id = request.getParameter("op_id");	
	if (op_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. ID를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	String op_status = request.getParameter("op_status");
	if (op_status == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. 운행상태/출발상태/도착상태를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	String op_deptstatus = request.getParameter("op_deptstatus");
	if (op_deptstatus == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. 운행상태/출발상태/도착상태를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	String op_arvstatus = request.getParameter("op_arvstatus");
	if (op_arvstatus == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. 운행상태/출발상태/도착상태를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	String op_updatetime = request.getParameter("op_updatetime");
	String op_traincode_id = request.getParameter("op_traincode_id");
	String op_engineer_id = request.getParameter("op_engineer_id");
	String op_train_id = request.getParameter("op_train_id");
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		String query = ""; // Query문 초기화.
		
		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성		
		

		query = "INSERT INTO operation VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, op_id);
		pstmt.setString(2, op_status);
		pstmt.setString(3, op_deptstatus);
		pstmt.setString(4, op_arvstatus);
		pstmt.setString(5, op_updatetime);
		pstmt.setString(6, op_traincode_id);
		pstmt.setString(7, op_engineer_id);
		pstmt.setString(8, op_train_id);
		
		// Query 실행
		int result = pstmt.executeUpdate();
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삽입에 성공하였습니다.')");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
		}
	} catch(Exception e) {
			e.printStackTrace();
	} finally {
		try {
			conn.close();
			pstmt.close();			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('[SQL Error]  운행 ID 중복 또는 데이터 자료형이 맞지 않거나 참조하는 ID의 외래키가 존재하지 않습니다. 데이터 확인 후 다시 시도해주세요.')");
	script.println("location.href = '../main.jsp'");
	script.println("</script>");
   	%>
</body>
</html>