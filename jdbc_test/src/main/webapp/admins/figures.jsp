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
	<h2 class="title">통계</h2>
	<div >
		<div style="float: left;">
		    <details>
		        <summary>                
		            <b>🚉line당 station</b>      
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>line_ID</th>
		                    <th>station_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
			    <%
			    String query = "SELECT line_ID, station_ID from connect_sl;";
				result = stmt.executeQuery(query);
				String past_line_ID="";
		
				while(result.next()) {
					String line_ID = result.getString("line_ID");
					String station_ID = result.getString("station_ID");			
				%>	
						<tr>                    
							<td><%=line_ID 		%></td>
					        <td><%=station_ID	%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
	    </div>
	    <div style="float: left;">
		    <details>
		        <summary>                
		            <b>🚉하나의 열차에 배정된 차량 목록</b>      
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>train_ID</th>
		                    <th>vehicle_ID</th>
		                </tr>            
		            </thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT * FROM connect_tv;";	    
				result = stmt.executeQuery(query);
		
				while(result.next()) {
					String train_ID = result.getString("train_ID");
					String vehicle_ID = result.getString("vehicle_ID");			
				%>	
						<tr>                    
							<td><%=train_ID 	%></td>
					        <td><%=vehicle_ID	%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
		</div>
		<div style="float: left;">
		    <details>
		        <summary>                
		            <b>🚉열차 정보</b>      
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>ID</th>
		                    <th>code</th>
		                    <th>DAY</th>
		                    <th>start station</th>
		                    <th>end station</th>
		                    <th>start time</th>
		                    <th>end time</th>
		                </tr>            
		            </thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT l.ID, t.code, t.DAY, t.startstation, t.endstation, t.starttime, t.endtime "
			    		+ "FROM traincode t, line as l WHERE t.line_ID = l.ID;";	    
				
			   	result = stmt.executeQuery(query);
		
				while(result.next()) {
					String ID = result.getString("ID");
					String code = result.getString("code");
					String DAY = result.getString("DAY");
					String startstation = result.getString("startstation");
					String endstation = result.getString("endstation");
					String starttime = result.getString("starttime");
					String endtime = result.getString("endtime");
				%>	
						<tr>                    
							<td><%=ID 			%></td>
					        <td><%=code			%></td>
					        <td><%=DAY 			%></td>
					        <td><%=startstation	%></td>
					        <td><%=endstation 	%></td>
					        <td><%=starttime	%></td>
					        <td><%=endtime		%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
		</div>
		<div style="float: left;">
		    <details>
		        <summary>                
		            <b>🚉본부 당 관리 기차역 및 개수</b>      
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		            	<tr>
		                    <th>headquater_name</th>
		                    <th>planet</th>
		                    <th>continent</th>
		                    <th>station</th>
		                    <th>name</th>
		                    <th>tel</th>
		                </tr>            
		            </thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT h.name AS 'headquater_name', h.planet, h.continent, s.ID AS 'station', s.name, s.tel "
			    		+ "FROM headquater h, station s WHERE h.ID = s.hq_ID;";	    
				
			   	result = stmt.executeQuery(query);
		
				while(result.next()) {
					String headquater_name = result.getString("headquater_name");
					String planet = result.getString("planet");
					String continent = result.getString("continent");
					String station = result.getString("station");
					String name = result.getString("name");
					String tel = result.getString("tel");
				%>	
						<tr>                    
							<td><%=headquater_name 	%></td>
					        <td><%=planet			%></td>
					        <td><%=continent 		%></td>
					        <td><%=station			%></td>
					        <td><%=name 			%></td>
					        <td><%=tel				%></td>
						</tr>
				<%
				}
				
				result.close();
			    query = "SELECT COUNT(*) AS 'station_number' "
			    		+ "FROM headquater, station " 
			    		+ "WHERE headquater.ID = station.hq_ID;";	    
				
			   	result = stmt.executeQuery(query);
			   	while (result.next()) {
			   		String station_number = result.getString("station_number");
				%>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
			    			<td style="font-weight: bold;">
			    				station number
			    			</td>
			    			<td style="font-weight: bold;">
			    				<%=station_number 	%>
			    			</td>
			    		</tr>
				<%
			   	}			   		
			    %>		
			    	</tbody>
		    	</table>
		    </details>
		</div>
		<div><br><br><br><br>
		</div>
	</div>
	
	<div>
		<div style="float: left;">
			<details>
		        <summary>                
		            <b>🚉기차 유형별 개수</b>
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		           	    <tr>
		                    <th>train type</th>
		                    <th>number</th>
	                	</tr>            
		           	</thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT type, COUNT(TYPE) AS cnt FROM train GROUP BY type;";	    
				
			   	result = stmt.executeQuery(query);
			
				while(result.next()) {
					String type = result.getString("type");
					String cnt = result.getString("cnt");
				%>	
						<tr>                    
							<td><%=type 	%></td>
					        <td><%=cnt		%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
		</div>
		<div style="float: left;">
			<details>
		        <summary>                
		            <b>🚉기차역 최대 예산 및 최소 예산</b>
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		           	    <tr>
		                    <th>headquater ID</th>
		                    <th>station name</th>
		                    <th>tel number</th>
		                    <th>budget</th>
	                	</tr>            
		           	</thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT hq_ID AS 'headquater_ID', NAME AS 'station_name', tel, budget "
			    		+ "from station WHERE budget = (SELECT MAX(budget) FROM station) "
			    		+ "or budget = (SELECT MIN(budget) FROM station) ORDER BY budget DESC;";	    
				
			   	result = stmt.executeQuery(query);
			
				while(result.next()) {
					String headquater_ID = result.getString("headquater_ID");
					String station_name = result.getString("station_name");
					String tel = result.getString("tel");
					String budget = result.getString("budget");
				%>	
						<tr>                    
							<td><%=headquater_ID 	%></td>
					        <td><%=station_name		%></td>
					        <td><%=tel 				%></td>
					        <td><%=budget			%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
		</div>
		<div style="float: left;">
			<details>
		        <summary>                
		            <b>🚉기차역 평균 예산, 총합</b>
		        </summary>
				&nbsp;
				<table class="line">
		            <thead>
		           	    <tr>
		                    <th>average budget</th>
		                    <th>total</th>
	                	</tr>            
		           	</thead>
		            <tbody>                     
			    <%
			    result.close();
			    query = "SELECT ROUND(AVG(budget), 0) AS 'avbudget', "
			    		+ "SUM(budget) AS 'total' FROM station;";	    
				
			   	result = stmt.executeQuery(query);
			
				while(result.next()) {
					String avbudget = result.getString("avbudget");
					String total = result.getString("total");
				%>	
						<tr>                    
							<td><%=avbudget 	%></td>
					        <td><%=total		%></td>
						</tr>
				<%
				}
			    %>
			    	</tbody>
		    	</table>
		    </details>
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


