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
	
	String query = "UPDATE operation SET "; // Query문 초기화.
	
	String op_id = request.getParameter("op_id_update");
	if (op_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삽입 실패. ID를 선택해주세요.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	String op_status = request.getParameter("op_status_update");
	if (op_status != null) {
		query = query + "status='" + op_status + "', ";
	}
	String op_deptstatus = request.getParameter("op_deptstatus_update");	
	if (op_deptstatus != null) {
		query = query + "deptstatus='" + op_deptstatus + "', ";
	}
	String op_arvstatus = request.getParameter("op_arvstatus_update");
	if (op_arvstatus != null) {
		query = query + "arvstatus='" + op_arvstatus + "', ";
	}
	String op_updatetime = request.getParameter("op_updatetime_update");
	if (op_updatetime != null) {
		query = query + "updatetime='" + op_updatetime + "', ";
	}
	String op_traincode_id = request.getParameter("op_traincode_id_update");
	System.out.println("aa" + op_traincode_id);
	if (op_traincode_id != "") {
		query = query + "Traincode_ID='" + op_traincode_id + "', ";
	}
	String op_engineer_id = request.getParameter("op_engineer_id_update");
	System.out.println("aa" + op_engineer_id);
	if (op_engineer_id != "") {
		query = query + "engineer_ID='" + op_engineer_id + "', ";
	}
	String op_train_id = request.getParameter("op_train_id_update");
	System.out.println("aa" + op_train_id);
	if (op_train_id != "") {
		query = query + "train_ID='" + op_train_id + "', ";
	}
	query = query.substring(0, query.length() - 2);
	query += " where ID=" + op_id + ";";
	System.out.println("완성된 쿼리: " + query);
	
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		

		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성				
	
		pstmt = conn.prepareStatement(query);

		// Query 실행
		pstmt.executeUpdate();	
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('업데이트에 성공하였습니다.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	} catch(Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('[SQL Error]  참조하는 ID의 외래키가 존재하지 않습니다. 데이터 확인 후 다시 시도해주세요.')");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
	} finally {
		try {
			conn.close();
			pstmt.close();			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
	}
	
   	%>
</body>
</html>