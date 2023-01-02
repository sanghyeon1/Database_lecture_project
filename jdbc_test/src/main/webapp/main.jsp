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
        <title>engineer</title>
        <style type="text/css">
			.square {
				border:1px solid; 
				padding:10px; 
				position: relative;
				width: 40%;
				height: 100%;
				margin-right: 100px;
			}
			.slider_range {
				margin-bottom:0px;
				width: 100%;
			}
			.insert_btn {
				width: 40%;
				margin-top: 30px;
				align-items: center;
				border-radius: 10px;
			}
			.end_drive {
				width: 10%;
				margin-top: 30px;
				align-items: center;
				border-radius: 10px;
			}
			.search_btn {
				width: 15%;
				float: right;
				margin-top: 30px;
				border-radius: 10px;
			}
			.ins_val {
				margin-bottom: 10px;
				border-radius: 7px;
			}
			.input_time {
				margin-bottom: 10px;
				border-radius: 7px;
				width: 25%;
				font-weight: bold;
			}
			.rows {
				margin-top: 10px;
				margin-bottom: 10px;
				padding: 5px;
				display: flex;
			}
			.hr_line {
				background-color: pink;
				padding: 2px;
				margin: auto;
				margin-top: 70px;
				margin-bottom: 70px;
				width: 70%;
			}
			.btns {
				text-align: center;
			}
			.srch_square {				
				border:1px solid; 
				padding:10px; 
				position: relative;
				width: 60%;
				height: 80%;
				margin: 10px;
			}
			.inp_title {
				font-size: 20px;
				margin: 2px;
				margin-top: 10px;
				margin-bottom: 40px;
			}
			.logout_btn {
				margin: 10px;
				border-radius: 7px;
				width: 10%;
			}

			#columns {
				margin: 15px;
			}
			#srch {
				width: 80%;
				margin: 10px;
			}
			#searchInput {
				width: 30%;
			}
			#srch_div {
				width: 60%;
			}
			body {
				background-color: #afafc7;
			}
			
			select {
				margin-bottom: 10px;
			}
			input {
				width: 90%;
				background-color: #e2c3c8;
				color: #ce7d88;
			}
			p {
				width: 90%;
				border-radius: 7px;
				background-color: #5f7daf; 
				color: #e2c3c8;
				font-size: 15px;
				margin: 0px;
				margin-top: 15px;
				font-weight: bold;
			}
			button {
				width: 20%;
				padding: 10px;
				background-color: #e2c3c8;
				color: #ce7d88;
				border-radius: 10px;
				font-size: 15px;
				font-weight: bold;
			}
			
			
			.title {
				border-radius: 7px;
				width: 10%;
				text-align: center;
				background-color: #5f7daf; 
				color: #e2c3c8;
			}
			.second_line {
				margin: 20px;
			}
			.line {				
				width: 50%
				
			}
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
	        details {
	        	margin-left: 20px;
	        	margin-right: 20px;
	        	margin-top: 20px;
	        }
		</style>
    </head>
    <%
		String id=(String)session.getAttribute("userID");			
		if(id==null){			
			response.sendRedirect("logins/login_page.jsp");
		}			
	%>
	<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;    		
	Statement stmt = null;			
	ResultSet result = null;
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
		String dbUser = "root";
		String dbPass = "1q2w3e4r!";
		
		// DB Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 생성
		stmt = conn.createStatement();		
		// Query 실행
	%>
    <body>	
		<h1>🚆연세 철도 주식회사 For Engineer🚆</h1>	
		<br><%=session.getAttribute("userID") %>님이 로그인하셨습니다
		<br><input class="logout_btn" type="button" value="로그아웃" onclick="location.href='logins/logout.jsp'"><br><br>
	     	
			<div class="square" style="float:left;">				
				<form action="engineer/insert_operation.jsp" method="post">
					<div>
						<h3 class="inp_title">운행 기록 생성</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="운행 ID 입력" name="op_id"/><br>
					<p>--운행 상태</p>
					<select required name="op_status">
						<option selected disabled>선택해주세요.</option>
						<option value="0">운행 전</option>
						<option value="1">운행 중</option>
						<option value="2">운행 완료</option>						
						<option value="3">운행 이상</option>			
					</select><br>
					<p>--출발 상태</p>
					<select required name="op_deptstatus">
						<option selected disabled>선택해주세요.</option>
						<option value="0">출발 전</option>
						<option value="1">출발 후</option>		
					</select><br>
					<p>--도착 상태</p>
					<select required name="op_arvstatus">
						<option selected disabled>선택해주세요.</option>
						<option value="0">도착 전</option>
						<option value="1">도착 후</option>	
					</select><br>
					<p>--현재 시간</p>
					<input class="input_time" type="time" value="06:00:00" required name="op_updatetime"/><br>
					<p>--열차편 ID</p>
					<input class="ins_val" type="text" required placeholder="운행 열차편 입력" name="op_traincode_id"/><br>
					<p>--기관사 ID</p>
					<input class="ins_val" type="text" required placeholder="운행 기관사ID 입력" name="op_engineer_id"/><br>
					<p>--운행 기차 ID</p>
					<input class="ins_val" type="text" required placeholder="운행 기차ID 입력" name="op_train_id"/><br>
					
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
				
				<hr size="5" width="90%" align="center" color="#f7dfd3"
					style="margin-top:50px; margin-bottom: 50px;">
				
				
				<form action="engineer/update_operation.jsp" method="post">
					<div>
						<h3 class="inp_title">운행 기록 업데이트</h3>	
						<h4>-- 업데이트할 필요가 없는 칼럼은 건너뜁니다.</h4>				
					</div>
					<p>--운행 ID : 업데이트 할 행의 "운행 ID"를 선택해주세요.</p>
					<select required name="op_id_update">
						<option selected disabled>선택해주세요.</option>
					<%
				    String query = "SELECT ID from operation;";
					result = stmt.executeQuery(query);
					while(result.next()) {
						String ID = result.getString("ID");
					%>	
						<option value="<%= ID %>"><%= ID %></option>					
					<%
					}
					%>
					</select><br>
					<p>--업데이트 할 운행 상태</p>
					<select name="op_status_update">
						<option selected disabled>선택해주세요.</option>
						<option value="0">운행 전</option>
						<option value="1">운행 중</option>
						<option value="2">운행 완료</option>						
						<option value="3">운행 이상</option>			
					</select><br>
					<p>--업데이트 할 출발 상태</p>
					<select name="op_deptstatus_update">
						<option selected disabled>선택해주세요.</option>
						<option value="0">출발 전</option>
						<option value="1">출발 후</option>		
					</select><br>
					<p>--업데이트 할 도착 상태</p>
					<select name="op_arvstatus_update">
						<option selected disabled>선택해주세요.</option>
						<option value="0">도착 전</option>
						<option value="1">도착 후</option>	
					</select><br>
					<p>--업데이트 할 현재 시간</p>
					<input class="input_time" type="time" value="06:00:00" name="op_updatetime_update"/><br>
					<p>--업데이트 할 열차편 ID</p>
					<input class="ins_val" type="text" placeholder="운행 열차편 입력" name="op_traincode_id_update"/><br>
					<p>--업데이트 할 기관사 ID</p>
					<input class="ins_val" type="text" placeholder="운행 기관사ID 입력" name="op_engineer_id_update"/><br>
					<p>--업데이트 할 운행 기차 ID</p>
					<input class="ins_val" type="text" placeholder="운행 기차ID 입력" name="op_train_id_update"/><br>
					
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
			
			<h3 class="inp_title" style="margin-bottom: 10px;">운행 기록 테이블</h3>
			<div>	
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>ID</th>
		                    <th>status</th>
		                    <th>deptstatus</th>
		                    <th>arvstatus</th>
		                    <th>updatetime</th>
		                    <th>Traincode_ID</th>
		                    <th>engineer</th>
		                    <th>train_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
	    <%
	    result.close();
	    String query2 = "SELECT o.ID, o.status, o.deptstatus, o.arvstatus, o.updatetime, " 
	    				+ "o.Traincode_ID , u.name, o.train_ID "
	    				+ "FROM operation o, user u WHERE u.id = o.engineer_ID;";
	    				
		result = stmt.executeQuery(query2);

		while(result.next()) {
			String ID = result.getString("o.ID");
			int status = result.getInt("o.status");		
			int deptstatus = result.getInt("o.deptstatus");	
			int arvstatus = result.getInt("o.arvstatus");	
			String updatetime = result.getString("o.updatetime");	
			String Traincode_ID = result.getString("o.Traincode_ID");	
			String engineer_ID = result.getString("u.name");	
			String train_ID = result.getString("o.train_ID");	
			
			String str_status = "";
			String str_deptstatus = "";
			String str_arvstatus = "";
			
			if (status == 0) {
				str_status = "운행 전";
			}
			else if (status == 1) {
				str_status = "운행 중";
			}
			else if (status == 2) {
				str_status = "운행 완료";
			}
			else if (status == 3) {
				str_status = "운행 이상";
			}
			
			if (deptstatus == 0) {
				str_deptstatus = "출발 전";
			}
			else if (deptstatus == 1) {
				str_deptstatus = "출발 후";
			}
			
			if (arvstatus == 0) {
				str_arvstatus = "도착 전";
			}
			else if (arvstatus == 1) {
				str_arvstatus = "도칙 후";
			}
		%>	
				<tr>                    
					<td><%=ID 				%></td>
			        <td><%=str_status		%></td>
			        <td><%=str_deptstatus 	%></td>
			        <td><%=str_arvstatus	%></td>
			        <td><%=updatetime 		%></td>
			        <td><%=Traincode_ID		%></td>
			        <td><%=engineer_ID 		%></td>
			        <td><%=train_ID			%></td>
				</tr>
		<%
		}
	    %>
		    	</tbody>
	    	</table>	    	
			
			<div style="height: 30px;"></div>
			<h3 class="inp_title" style="margin-bottom: 10px;">운행 완료</h3>
			<div>	
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>name</th>
		                    <th>status</th>
		                    <th>updatetime</th>
		                    <th>Traincode_ID</th>
		                    <th>train_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
	    <%
	    result.close();
	    String query2_2 = "SELECT engineer_id, STATUS, updatetime, traincode_id, train_id "
	    				+ "FROM operation WHERE status=2;";
	    				
		result = stmt.executeQuery(query2_2);

		while(result.next()) {
			String engineer_id2 = result.getString("engineer_id");
			int STATUS2 = result.getInt("STATUS");		
			String updatetime2 = result.getString("updatetime");	
			String Traincode_ID2 = result.getString("Traincode_ID");	
			String train_ID2 = result.getString("train_ID");	
			
			String str_status2 = "";
			
			if (STATUS2 == 0) {
				str_status2 = "운행 전";
			}
			else if (STATUS2 == 1) {
				str_status2 = "운행 중";
			}
			else if (STATUS2 == 2) {
				str_status2 = "운행 완료";
			}
			else if (STATUS2 == 3) {
				str_status2 = "운행 이상";
			}
		%>	
				<tr>                    
					<td><%=engineer_id2		%></td>
			        <td><%=str_status2		%></td>
			        <td><%=updatetime2 		%></td>
			        <td><%=Traincode_ID2	%></td>
			        <td><%=train_ID2		%></td>
				</tr>
		<%
		}
	    %>
		    	</tbody>
	    	</table>
	    	
	    	<div style="height: 30px;"></div>
	    	<h3 class="inp_title" style="margin-bottom: 10px;">운행 중</h3>
			<div>	
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>name</th>
		                    <th>status</th>
		                    <th>updatetime</th>
		                    <th>Traincode_ID</th>
		                    <th>train_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
	    <%
	    result.close();
	    String query2_3 = "SELECT engineer_id, STATUS, updatetime, traincode_id, train_id "
	    				+ "FROM operation WHERE status=1;";
	    				
		result = stmt.executeQuery(query2_3);

		while(result.next()) {
			String engineer_id2 = result.getString("engineer_id");
			int STATUS2 = result.getInt("STATUS");		
			String updatetime2 = result.getString("updatetime");	
			String Traincode_ID2 = result.getString("Traincode_ID");	
			String train_ID2 = result.getString("train_ID");	
			
			String str_status2 = "";
			
			if (STATUS2 == 0) {
				str_status2 = "운행 전";
			}
			else if (STATUS2 == 1) {
				str_status2 = "운행 중";
			}
			else if (STATUS2 == 2) {
				str_status2 = "운행 완료";
			}
			else if (STATUS2 == 3) {
				str_status2 = "운행 이상";
			}
		%>	
				<tr>                    
					<td><%=engineer_id2		%></td>
			        <td><%=str_status2		%></td>
			        <td><%=updatetime2 		%></td>
			        <td><%=Traincode_ID2	%></td>
			        <td><%=train_ID2		%></td>
				</tr>
		<%
		}
	    %>
		    	</tbody>
	    	</table>
		
		<div style="height: 30px;"></div>
		<h3 class="inp_title" style="margin-bottom: 10px;">운행 전</h3>
			<div>	
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>name</th>
		                    <th>status</th>
		                    <th>updatetime</th>
		                    <th>Traincode_ID</th>
		                    <th>train_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
	    <%
	    result.close();
	    String query2_4 = "SELECT engineer_id, STATUS, updatetime, traincode_id, train_id "
	    				+ "FROM operation WHERE status=0;";
	    				
		result = stmt.executeQuery(query2_4);

		while(result.next()) {
			String engineer_id2 = result.getString("engineer_id");
			int STATUS2 = result.getInt("STATUS");		
			String updatetime2 = result.getString("updatetime");	
			String Traincode_ID2 = result.getString("Traincode_ID");	
			String train_ID2 = result.getString("train_ID");	
			
			String str_status2 = "";
			
			if (STATUS2 == 0) {
				str_status2 = "운행 전";
			}
			else if (STATUS2 == 1) {
				str_status2 = "운행 중";
			}
			else if (STATUS2 == 2) {
				str_status2 = "운행 완료";
			}
			else if (STATUS2 == 3) {
				str_status2 = "운행 이상";
			}
		%>	
				<tr>                    
					<td><%=engineer_id2		%></td>
			        <td><%=str_status2		%></td>
			        <td><%=updatetime2 		%></td>
			        <td><%=Traincode_ID2	%></td>
			        <td><%=train_ID2		%></td>
				</tr>
		<%
		}
	    %>
		    	</tbody>
	    	</table>
		<div style="height: 30px;"></div>
		<h3 class="inp_title" style="margin-bottom: 10px;">운행 이상</h3>
			<div>	
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>name</th>
		                    <th>status</th>
		                    <th>updatetime</th>
		                    <th>Traincode_ID</th>
		                    <th>train_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
	    <%
	    result.close();
	    String query2_5 = "SELECT engineer_id, STATUS, updatetime, traincode_id, train_id "
	    				+ "FROM operation WHERE status=3;";
	    				
		result = stmt.executeQuery(query2_5);

		while(result.next()) {
			String engineer_id2 = result.getString("engineer_id");
			int STATUS2 = result.getInt("STATUS");		
			String updatetime2 = result.getString("updatetime");	
			String Traincode_ID2 = result.getString("Traincode_ID");	
			String train_ID2 = result.getString("train_ID");	
			
			String str_status2 = "";
			
			if (STATUS2 == 0) {
				str_status2 = "운행 전";
			}
			else if (STATUS2 == 1) {
				str_status2 = "운행 중";
			}
			else if (STATUS2 == 2) {
				str_status2 = "운행 완료";
			}
			else if (STATUS2 == 3) {
				str_status2 = "운행 이상";
			}
		%>	
				<tr>                    
					<td><%=engineer_id2		%></td>
			        <td><%=str_status2		%></td>
			        <td><%=updatetime2 		%></td>
			        <td><%=Traincode_ID2	%></td>
			        <td><%=train_ID2		%></td>
				</tr>
		<%
		}
	    %>
		    	</tbody>
	    	</table>
	    	
					
			<hr size="5" width="40%" align="center" color="#f7dfd3"
			style="margin-top:50px; margin-bottom: 50px;">
					
	    	<h3 class="inp_title">운행 종료하기</h3>
		    <div>
		    	<form action="engineer/update_end_drive.jsp" method="post">
					<h4 style="color: #5f7daf">--운행 ID : 종료할 "운행 ID"를 선택해주세요.</h4>
					<select required name="op_id_update">
						<option selected disabled>선택해주세요.</option>
					<%
					result.close();
				    String query3 = "SELECT ID from operation WHERE status<>2;";
					result = stmt.executeQuery(query3);
					while(result.next()) {
						String ID = result.getString("ID");
					%>	
						<option value="<%= ID %>"><%= ID %></option>					
					<%
					}
					%>
					</select><br>
					<div class="btns">
						<input class="end_drive" type="submit" value=" 운행종료 " />	
					</div>				
				</form>
		    </div>	
    	</div>    	

	<%
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
    </body>
</html>
