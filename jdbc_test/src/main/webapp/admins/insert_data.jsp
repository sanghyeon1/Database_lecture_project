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
		String query = ""; // Query문 초기화.
		
		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성		
		
	if (table_name.equals("connect_sl")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?);";
		
		String cnsl_stid = request.getParameter("cnsl_stid");	
		String cnsl_lnid = request.getParameter("cnsl_lnid");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, cnsl_stid);
		pstmt.setString(2, cnsl_lnid);
	}
	else if (table_name.equals("connect_tv")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?);";
		
		String cntv_trid = request.getParameter("cntv_trid");	
		String cntv_veid = request.getParameter("cntv_veid");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, cntv_trid);
		pstmt.setString(2, cntv_veid);
	}
	else if (table_name.equals("engineer")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?, ?);";
		
		String eg_id = request.getParameter("eg_id");	
		String eg_year = request.getParameter("eg_year");
		String eg_variety = request.getParameter("eg_variety");
		String eg_amount = request.getParameter("eg_amount");
		String eg_hqid = request.getParameter("eg_hqid");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, eg_id);
		pstmt.setString(2, eg_year);
		pstmt.setString(3, eg_variety);
		pstmt.setString(4, eg_amount);
		pstmt.setString(5, eg_hqid);
	}
	else if (table_name.equals("headquater")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?, ?, ?);";
		
		String hq_id = request.getParameter("hq_id");	
		String hq_name = request.getParameter("hq_name");
		String hq_planet = request.getParameter("hq_planet");
		String hq_continent = request.getParameter("hq_continent");
		String hq_managername = request.getParameter("hq_managername");
		String hq_budget = request.getParameter("hq_budget");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, hq_id);
		pstmt.setString(2, hq_name);
		pstmt.setString(3, hq_planet);
		pstmt.setString(4, hq_continent);
		pstmt.setString(5, hq_managername);
		pstmt.setString(6, hq_budget);
	}
	else if (table_name.equals("line")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?);";
		
		String ln_id = request.getParameter("ln_id");	
		String ln_name = request.getParameter("ln_name");
		String ln_builtyear = request.getParameter("ln_builtyear");
		String ln_capacity = request.getParameter("ln_capacity");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ln_id);
		pstmt.setString(2, ln_name);
		pstmt.setString(3, ln_builtyear);
		pstmt.setString(4, ln_capacity);
	}
	else if (table_name.equals("station")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?, ?, ?, ?);";
		
		String st_id = request.getParameter("st_id");	
		String st_name = request.getParameter("st_name");
		String st_address = request.getParameter("st_address");
		String st_tel = request.getParameter("st_tel");
		String st_managername = request.getParameter("st_managername");
		String st_budget = request.getParameter("st_budget");
		String st_hqid = request.getParameter("st_hqid");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, st_id);
		pstmt.setString(2, st_name);
		pstmt.setString(3, st_address);
		pstmt.setString(4, st_tel);
		pstmt.setString(5, st_managername);
		pstmt.setString(6, st_budget);
		pstmt.setString(7, st_hqid);
	}
	else if (table_name.equals("train")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?);";
		
		String tr_id = request.getParameter("tr_id");	
		String tr_type = request.getParameter("tr_type");
		String tr_conditions = request.getParameter("tr_conditions");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, tr_id);
		pstmt.setString(2, tr_type);
		pstmt.setString(3, tr_conditions);
	}
	else if (table_name.equals("traincode")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		
		String trcd_id = request.getParameter("trcd_id");	
		String trcd_code = request.getParameter("trcd_code");
		String trcd_DAY = request.getParameter("trcd_DAY");
		String trcd_startstation = request.getParameter("trcd_startstation");
		String trcd_starttime = request.getParameter("trcd_starttime");
		String trcd_endstation = request.getParameter("trcd_endstation");
		String trcd_endtime = request.getParameter("trcd_endtime");
		String trcd_lineid = request.getParameter("trcd_lineid");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, trcd_id);
		pstmt.setString(2, trcd_code);
		pstmt.setString(3, trcd_DAY);
		pstmt.setString(4, trcd_startstation);
		pstmt.setString(5, trcd_starttime);
		pstmt.setString(6, trcd_endstation);
		pstmt.setString(7, trcd_endtime);
		pstmt.setString(8, trcd_lineid);
	}
	else if (table_name.equals("user")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?);";
		
		String us_id = request.getParameter("us_id");	
		String us_password = request.getParameter("us_password");
		String us_name = request.getParameter("us_name");
		String us_rank = request.getParameter("us_rank");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, us_id);
		pstmt.setString(2, us_password);
		pstmt.setString(3, us_name);
		pstmt.setString(4, us_rank);
	}
	else if (table_name.equals("vehicle")) {
		query = "INSERT INTO " + table_name + " VALUES (?, ?, ?, ?, ?);";
		
		String vh_id = request.getParameter("vh_id");	
		String vh_type = request.getParameter("vh_type");
		String vh_model = request.getParameter("vh_model");
		String vh_year = request.getParameter("vh_year");
		String vh_status = request.getParameter("vh_status");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, vh_id);
		pstmt.setString(2, vh_type);
		pstmt.setString(3, vh_model);
		pstmt.setString(4, vh_year);
		pstmt.setString(5, vh_status);
	}

		// Query 실행
		int result = pstmt.executeUpdate();
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삽입에 성공하였습니다.')");
			script.println("location.href = 'admin_page.jsp'");
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
   	%>
	<%
	PrintWriter script = response.getWriter();
	if (table_name == null) {
		script.println("<script>");
		script.println("alert('삽입 실패. 체크박스 체크 후 다시 시도해주세요.')");
		script.println("location.href = 'admin_page.jsp'");
		script.println("</script>");
	}	
	else {
		script.println("<script>");
		script.println("alert('SQL Error. 참조 외래 키 또는 데이터 확인 후 다시 시도해주세요.')");
		script.println("location.href = 'admin_page.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>