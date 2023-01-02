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
	
	
	String table_name = request.getParameter("table_name");
	String row_name = request.getParameter("row_name");
	
	if (table_name == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('[Error] 테이블의 체크박스를 체크 후 다시 시도해주세요.')");
		script.println("location.href = 'admin_page.jsp'");
		script.println("</script>");
	}
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		String query = "DELETE FROM " + table_name + " WHERE id='" + row_name + "';"; // Query문 초기화.
		System.out.println(query);
		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성				
	
		pstmt = conn.prepareStatement(query);

		// Query 실행
		pstmt.executeUpdate();	
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('" + table_name + "의 " + row_name + "행을 삭제하였습니다.')");
		script.println("location.href = 'admin_page.jsp'");
		script.println("</script>");
	} catch(Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('[SQL Error]  참조하는 ID의 외래키가 존재하지 않습니다. 데이터 확인 후 다시 시도해주세요.')");
			script.println("location.href = 'admin_page.jsp'");
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