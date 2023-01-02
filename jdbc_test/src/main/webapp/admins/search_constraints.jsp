<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search result</title>
	<style>
        b {
            color: #6eceda;
            transition: background-color 0.3s, color 0.3s;
        }
        b:hover {
            color: white;
            background-color: #6eceda;
        }
        body {
        	background-color: #afafc7;
            padding:20px;
        }
        table {
            border: 1px #a39485 solid;
            box-shadow: 2px 2px 2px #999999;
            border-radius: 5px;
            font-size: 15px;            
            width: 100%;
        }
        th {
        	padding: 5px;
            text-align: left;
        }            
        thead {
            font-weight: bold;
            color: #ffffff;
            background: #e2c3c8;
        }            
        td {
        	padding: 5px;
            border-bottom: 1px solid #cccccc;
            background: #f7dfd3;
        }
        a {
            color: blueviolet;
        }
    </style>
</head>
	<% 
	request.setCharacterEncoding("UTF-8");
	String table_name = request.getParameter("table_name");
	
	Connection conn = null;    		
	Statement stmt = null;			
	ResultSet result = null;
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		String query = "";
		
		if (table_name.equals("all_tables")) {
			// 모든 테이블 제약조건 검색.
			query = "SELECT * FROM information_schema.table_constraints "
					+ "WHERE CONSTRAINT_SCHEMA=\'train_db2\';";
		}			
		else{
			// 특정 테이블 제약조건 검색.
			query = "SELECT * FROM information_schema.table_constraints "
					+ "WHERE TABLE_NAME=\'" + table_name + "\' " 
					+ "AND CONSTRAINT_SCHEMA=\'train_db2\';";
		}
		System.out.println(query);
		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성
		stmt = conn.createStatement();		
		// Query 실행
		result = stmt.executeQuery(query);
			
	%>
<body>
	<h2>Tables:</h2>
    <details>
        <summary>                
            <b>🚉<%=table_name%></b>      
        </summary>
		&nbsp;
		<table>
            <thead>
            	<tr>
                    <th>CONSTRAINT_CATALOG</th>
                    <th>CONSTRAINT_SCHEMA</th>
                    <th>CONSTRAINT_NAME</th>
                    <th>TABLE_SCHEMA</th>
                    <th>TABLE_NAME</th>
                    <th>CONSTRAINT_TYPE</th>
                </tr>            
            </thead>
            <tbody>                     
	    <%
		while(result.next()) {
			String CONSTRAINT_CATALOG = result.getString("CONSTRAINT_CATALOG");
			String CONSTRAINT_SCHEMA = result.getString("CONSTRAINT_SCHEMA");
			String CONSTRAINT_NAME = result.getString("CONSTRAINT_NAME");
			String TABLE_SCHEMA = result.getString("TABLE_SCHEMA");
			String TABLE_NAME = result.getString("TABLE_NAME");
			String CONSTRAINT_TYPE = result.getString("CONSTRAINT_TYPE");
		%>
					<tr>                    
						<td><%=CONSTRAINT_CATALOG 	%></td>
				        <td><%=CONSTRAINT_SCHEMA 	%></td>
				        <td><%=CONSTRAINT_NAME 		%></td>
				        <td><%=TABLE_SCHEMA 		%></td>
				        <td><%=TABLE_NAME 			%></td>
				        <td><%=CONSTRAINT_TYPE 		%></td>
					</tr>
		<%
		}
	} catch(Exception e) {
			e.printStackTrace();
	} finally {
		try {
			result.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}		
  	%>
			</tbody>
    	</table>
	</details>
</body>
</html>


