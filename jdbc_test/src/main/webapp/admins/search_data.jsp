<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter" %>
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
	
	if (table_name == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('[Error] 테이블의 체크박스를 체크 후 다시 시도해주세요.')");
		script.println("location.href = 'admin_page.jsp'");
		script.println("</script>");
	}
	
	String colName = "";
	for (int a=1; a < 12; a++) {
		
		colName = request.getParameter("colName"+a);
		System.out.println("fififififfi: " + colName);
		if (colName != null) 
			break;
	}
	String colValue = request.getParameter("colValue");
	
	System.out.println("table_name: " + table_name);
	System.out.println("colName: " + colName);
	System.out.println("colValue: " + colValue);
		
		Connection conn = null;    		
		Statement stmt = null;			
		ResultSet result = null;
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
			String dbUser = "root";
			String dbPass = "1q2w3e4r!";
			String query = "SELECT * FROM " + table_name + " WHERE " 
							+ colName + "=\"" + colValue + "\";";
			if (colName == null) {
				query = "SELECT * FROM " + table_name + ";";
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
            <%
			if (table_name.equals("connect_sl")) {
			%>
                <tr>
                    <th>station_ID</th>
                    <th>line_ID</th>
                </tr>
            <%
			}
            else if (table_name.equals("connect_tv")) {
			%>
                <tr>
                    <th>train_ID</th>
                    <th>vehicle_ID</th>
                </tr>
            <%
			}
            else if (table_name.equals("engineer")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>year</th>
                    <th>variety</th>
                    <th>amount</th>
                    <th>hq_ID</th>
                </tr>
            <%
			}
        	else if (table_name.equals("headquater")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>name</th>
                    <th>planet</th>
                    <th>continent</th>
                    <th>managername</th>
                    <th>budget</th>
                </tr>
            <%
			}
        	else if (table_name.equals("line")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>name</th>
                    <th>builtYear</th>
                    <th>capacity</th>
                </tr>
            <%
			}
        	else if (table_name.equals("operation")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>status</th>
                    <th>deptstatus</th>
                    <th>arvstatus</th>
                    <th>updatetime</th>
                    <th>Traincode_ID</th>
                    <th>engineer_ID</th>
                    <th>train_ID</th>
                </tr>
            <%
			}
        	else if (table_name.equals("station")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>name</th>
                    <th>address</th>
                    <th>tel</th>
                    <th>managername</th>
                    <th>budget</th>
                    <th>hq_ID</th>
                </tr>
            <%
			}
        	else if (table_name.equals("train")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>type</th>
                    <th>conditions</th>
                </tr>
            <%
			}
        	else if (table_name.equals("traincode")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>code</th>
                    <th>DAY</th>
                    <th>startstation</th>
                    <th>starttime</th>
                    <th>endstation</th>
                    <th>endtime</th>
                    <th>line_ID</th>
                </tr>
            <%
			}
        	else if (table_name.equals("user")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>PASSWORD</th>
                    <th>NAME</th>
                    <th>RANK</th>                    
                </tr>
            <%
			}
        	else if (table_name.equals("vehicle")) {
			%>
                <tr>
                    <th>ID</th>
                    <th>type</th>
                    <th>model</th>
                    <th>YEAR</th>
                    <th>STATUS</th>
                </tr>
            <%
			}
        	%>
            </thead>
            <tbody>                     
    <%
	if (table_name.equals("connect_sl")) {
		while(result.next()) {
			String station_ID = result.getString("station_ID");
			String line_ID = result.getString("line_ID");
	%>
					<tr>                    
						<td><%=station_ID 	%></td>
				        <td><%=line_ID 		%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("connect_tv")) {
		while(result.next()) {
			String train_ID = result.getString("train_ID");
			String vehicle_ID = result.getString("vehicle_ID");
	%>
					<tr>                    
						<td><%=train_ID 	%></td>
				        <td><%=vehicle_ID 	%></td>
					</tr>
	<%
		}
	}	
	else if (table_name.equals("engineer")) {
		while(result.next()) {
			String ID = result.getString("ID");
			int year = result.getInt("year");
			String variety = result.getString("variety");
			int amount = result.getInt("amount");
			String hq_ID = result.getString("hq_ID");
	%>
					<tr>                    
						<td><%=ID 		%></td>
				        <td><%=year 	%></td>
				        <td><%=variety 	%></td>
				        <td><%=amount 	%></td>
				        <td><%=hq_ID	%></td>
					</tr>
	<%
		}
	}	
	else if (table_name.equals("headquater")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String name = result.getString("name");
			String planet = result.getString("planet");
			String continent = result.getString("continent");
			String managername = result.getString("managername");
			int budget = result.getInt("budget");
	%>
					<tr>                    
						<td><%=ID 			%></td>
				        <td><%=name 		%></td>
				        <td><%=planet 		%></td>
				        <td><%=continent 	%></td>
				        <td><%=managername	%></td>
				        <td><%=budget 		%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("line")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String name = result.getString("name");
			String builtYear = result.getString("builtYear");
			String capacity = result.getString("capacity");
	%>
					<tr>                    
						<td><%=ID 		%></td>
				        <td><%=name 		%></td>
				        <td><%=builtYear 	%></td>
				        <td><%=capacity 	%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("operation")) {
		while(result.next()) {
			String ID = result.getString("ID");
			int status = result.getInt("status");
			int deptstatus = result.getInt("deptstatus");
			int arvstatus = result.getInt("arvstatus");
			String updatetime = result.getString("updatetime");
			String Traincode_ID = result.getString("Traincode_ID");
			String engineer_ID = result.getString("engineer_ID");
			String train_ID = result.getString("train_ID");
	%>
					<tr>                    
						<td><%=ID 			%></td>
				        <td><%=status 		%></td>
				        <td><%=deptstatus 	%></td>
				        <td><%=arvstatus 	%></td>
				        <td><%=updatetime	%></td>
				        <td><%=Traincode_ID %></td>
				        <td><%=engineer_ID 	%></td>
				        <td><%=train_ID 	%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("station")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String name = result.getString("name");
			String address = result.getString("address");
			String tel = result.getString("tel");
			String managername = result.getString("managername");
			int budget = result.getInt("budget");
			String hq_ID = result.getString("hq_ID");
	%>
					<tr>                    
						<td><%=ID 			%></td>
				        <td><%=name 		%></td>
				        <td><%=address 		%></td>
				        <td><%=tel 			%></td>
				        <td><%=managername	%></td>
				        <td><%=budget 		%></td>
				        <td><%=hq_ID 		%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("train")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String type = result.getString("type");
			String conditions = result.getString("conditions");
	%>
					<tr>                    
						<td><%=ID 			%></td>
				        <td><%=type 		%></td>
				        <td><%=conditions 	%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("traincode")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String code = result.getString("code");
			String DAY = result.getString("DAY");
			String startstation = result.getString("startstation");
			String starttime = result.getString("starttime");
			String endstation = result.getString("endstation");
			String endtime = result.getString("endtime");
			String line_ID = result.getString("line_ID");
	%>
					<tr>                    
						<td><%=ID 			%></td>
				        <td><%=code 		%></td>
				        <td><%=DAY 			%></td>
				        <td><%=startstation %></td>
				        <td><%=starttime	%></td>
				        <td><%=endstation 	%></td>
				        <td><%=endtime 		%></td>
				        <td><%=line_ID 		%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("user")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String PASSWORD = result.getString("PASSWORD");
			String NAME = result.getString("NAME");
			String RANK = result.getString("RANK");
	%>
					<tr>                    
						<td><%=ID 		%></td>
				        <td><%=PASSWORD %></td>
				        <td><%=NAME 	%></td>
				        <td><%=RANK 	%></td>
					</tr>
	<%
		}
	}
	else if (table_name.equals("vehicle")) {
		while(result.next()) {
			String ID = result.getString("ID");
			String type = result.getString("type");
			String model = result.getString("model");
			int YEAR = result.getInt("YEAR");
			int STATUS = result.getInt("STATUS");
	%>
					<tr>                    
						<td><%=ID 		%></td>
				        <td><%=type 	%></td>
				        <td><%=model 	%></td>
				        <td><%=YEAR 	%></td>
				        <td><%=STATUS	%></td>
					</tr>
	<%
		}
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


