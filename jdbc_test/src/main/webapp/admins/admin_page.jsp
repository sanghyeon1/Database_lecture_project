<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Page</title>
		<style type="text/css">
			.square {
				border:1px solid; 
				padding:10px; 
				position: relative;
				width: 90%;
				height: 100%;
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
			.search_btn {
				width: 15%;
				float: right;
				margin-top: 30px;
				border-radius: 10px;
			}
			.ins_val {
				margin-bottom: 10px;
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
			h4 {
				color: #e2c3c8;
				font-size: 20px;
				margin: 2px;
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
		</style>
	</head>
<body>
	<%
		String id=(String)session.getAttribute("userID");			
		if(id==null){
			response.sendRedirect("../logins/login_page.jsp");
		} 
	%>
	<h1>Admin Page</h1><br>
	<p>관리자 <%=session.getAttribute("userID") %> 로그인</p>
	<div>
		<button type="button" onclick="location.href='../logins/logout.jsp'">
			로그아웃
		</button>
	</div>
	
	<br>
	<div class="rows">
		<div id="columns">			
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="user"/>
						<h3 class="inp_title">User 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="us_id"/><br>
					<input class="ins_val" type="text" required placeholder="year 입력" name="us_password"/><br>
					<input class="ins_val" type="text" required placeholder="name 입력" name="us_name"/><br>
					<input class="ins_val" type="text" required placeholder="rank 입력" name="us_rank"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">			
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="headquater"/>
						<h3 class="inp_title">headquater 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="hq_id"/><br>
					<input class="ins_val" type="text" required placeholder="name 입력" name="hq_name"/><br>
					<font size=3>행성 선택</font>
					<select name="hq_planet">
						<option value="Mercury">수성</option>
						<option value="Venus">금성</option>
						<option value="Earth">지구</option>
						<option value="Mars">화성</option>
						<option value="Jupiter">목성</option>
						<option value="Saturn">토성</option>
						<option value="Uranus">천왕성</option>
						<option value="Neptune">해왕성</option>
					</select><br>
					<input class="ins_val" type="text" required placeholder="continent 입력" name="hq_continent"/><br>
					<input class="ins_val" type="text" required placeholder="managername 입력" name="hq_managername"/><br>
					<input class="ins_val" type="text" required placeholder="budget 입력" name="hq_budget"/><br>

					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="station"/>
						<h3 class="inp_title">station 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="st_id"/><br>
					<input class="ins_val" type="text" required placeholder="name 입력" name="st_name"/><br>
					<input class="ins_val" type="text" required placeholder="address 입력" name="st_address"/><br>
					<input class="ins_val" type="text" required placeholder="전화번호 입력" name="st_tel"/><br>
					<input class="ins_val" type="text" required placeholder="managername 입력" name="st_managername"/><br>
					<input class="ins_val" type="text" required placeholder="budget 입력" name="st_budget"/><br>
					<input class="ins_val" type="text" required placeholder="hq_ID 입력" name="st_hqid"/><br>
					
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="train"/>
						<h3 class="inp_title">train 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="tr_id"/><br>
					<input class="ins_val" type="text" required placeholder="type 입력" name="tr_type"/><br>
					<input class="ins_val" type="text" required placeholder="conditions 입력" name="tr_conditions"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="traincode"/>
						<h3 class="inp_title">traincode 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="trcd_id"/><br>
					<input class="ins_val" type="text" required placeholder="code 입력" name="trcd_code"/><br>
					<input class="ins_val" type="text" required placeholder="DAY 입력" name="trcd_DAY"/><br>
					<input class="ins_val" type="text" required placeholder="startstation 입력" name="trcd_startstation"/><br>
					<input class="ins_val" type="text" required placeholder="starttime 입력" name="trcd_starttime"/><br>
					<input class="ins_val" type="text" required placeholder="endstation 입력" name="trcd_endstation"/><br>
					<input class="ins_val" type="text" required placeholder="endtime 입력" name="trcd_endtime"/><br>
					<input class="ins_val" type="text" required placeholder="line_ID 입력" name="trcd_lineid"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
	</div>
	<div class="rows">
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="connect_sl"/>
						<h3 class="inp_title">connect_sl 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="station_ID 입력" name="cnsl_stid"/><br>
					<input class="ins_val" type="text" required placeholder="line_ID 입력" name="cnsl_lnid"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="connect_tv"/>
						<h3 class="inp_title">connect_tv 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="train_ID 입력" name="cntv_trid"/><br>
					<input class="ins_val" type="text" required placeholder="vehicle_ID 입력" name="cntv_veid"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="vehicle"/>
						<h3 class="inp_title">vehicle 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="id 입력" name="vh_id"/><br>
					<input class="ins_val" type="text" required placeholder="type 입력" name="vh_type"/><br>
					<input class="ins_val" type="text" required placeholder="model 입력" name="vh_model"/><br>
					<input class="ins_val" type="text" required placeholder="year 입력" name="vh_year"/><br>
					<input class="ins_val" type="text" required placeholder="status 입력" name="vh_status"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="line"/>
						<h3 class="inp_title">line 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="ln_id"/><br>
					<input class="ins_val" type="text" required placeholder="name 입력" name="ln_name"/><br>
					<input class="ins_val" type="text" required placeholder="builtYear 입력" name="ln_builtyear"/><br>
					<input class="ins_val" type="text" required placeholder="capacity 입력" name="ln_capacity"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
		<div id="columns">
			<div class="square">				
				<form action="insert_data.jsp" method="post">
					<div>
						<input type="checkbox" name="table_name" value="engineer"/>
						<h3 class="inp_title">engineer 입력</h3>					
					</div>
					<input class="ins_val" type="text" required placeholder="ID 입력" name="eg_id"/><br>
					<input class="ins_val" type="text" required placeholder="year 입력" name="eg_year"/><br>
					<input class="ins_val" type="text" required placeholder="variety 입력" name="eg_variety"/><br>
					<input class="ins_val" type="text" required placeholder="amount 입력" name="eg_amount"/><br>
					<input class="ins_val" type="text" required placeholder="hq_ID 입력" name="eg_hqid"/><br>
					<div class="btns">
						<input class="insert_btn" type="submit" value=" 삽입 " />	
					</div>				
				</form>
			</div>
		</div>
	</div>
	
	
	<div><div class="hr_line"></div></div>	
	<div style="display: flex;">
		<h3 style="margin: 20px; margin-right: 200px;">정보 수정</h3>
		<h3 style="margin: 20px">정보 삭제</h3>
	</div>
		
	<div class="rows" style="width: 30%;"> 
		<form action="update_data.jsp" method="post">
		
			<div class="srch_square" style="width: 100%;">
				<font size=3>수정할 테이블 선택</font><br>
				<select name="table_name">
					<option selected disabled>테이블을 선택해주세요.</option>
					<option value="engineer">engineer</option>
					<option value="headquater">headquater</option>
					<option value="line">line</option>
					<option value="station">station</option>
					<option value="train">train</option>
					<option value="traincode">traincode</option>
					<option value="user">user</option>
					<option value="vehicle">vehicle</option>
				</select><br>
				<font size=3>수정할 칼럼 입력</font><br>
				<input class="ins_val" type="text" required placeholder="column 입력" name="col_name"/><br>
				<font size=3>새 데이터 입력</font><br>
				<input class="ins_val" type="text" required placeholder="데이터 입력" name="new_data"/><br>
				<font size=3>수정할 row의 ID 입력</font><br>
				<input class="ins_val" type="text" required placeholder="row ID 입력" name="row_id"/><br>
				<div style="position: right" id="srch_div">
					<input style="width:40%; border-radius: 10px;" type="submit" value=" 수정 " />	
				</div>
			</div>				
		</form>
	
		<div style="margin-right: 100px; width: 100%;">
		
		</div>
		<form action="delete_data.jsp" method="post">		
			<div class="srch_square" style="width: 100%;">
				<font size=3>삭제할 테이블 선택</font><br>
				<select name="table_name">
					<option selected disabled>테이블을 선택해주세요.</option>
					<option value="engineer">engineer</option>
					<option value="headquater">headquater</option>
					<option value="line">line</option>
					<option value="station">station</option>
					<option value="train">train</option>
					<option value="traincode">traincode</option>
					<option value="user">user</option>
					<option value="vehicle">vehicle</option>
				</select><br>
				<font size=3>삭제할 row의 ID 입력</font><br>
				<input class="ins_val" type="text" required placeholder="row ID 입력" name="row_name"/><br>
				<div style="position: right" id="srch_div">
					<input style="width:40%; border-radius: 10px;" type="submit" value=" 삭제 " />	
				</div>
			</div>				
		</form>
	</div>
	
	<div><div class="hr_line"></div></div>	
	
	<h3 style="margin: 20px">정보 검색</h3>
	<form action="search_data.jsp" method="post">
		<div class="rows" style="width: 30%"> 
			<div class="srch_square">
				<font size=3>검색할 테이블 선택</font>
				<select name="table_name">		
					<option selected disabled>table 선택</option>				
					<option value="connect_sl">connect_sl</option>
					<option value="connect_tv">connect_tv</option>
					<option value="engineer">engineer</option>
					<option value="headquater">headquater</option>
					<option value="line">line</option>
					<option value="operation">operation</option>
					<option value="station">station</option>
					<option value="train">train</option>
					<option value="traincode">traincode</option>
					<option value="user">user</option>
					<option value="vehicle">vehicle</option>
				</select><br>	
			</div>
		</div>
		<div class="rows" id="srch">
			<div class="srch_square">
				<h4>[connect_sl]</h4>
				<select name="colName1">
					<option selected disabled>column선택</option>
					<option value="station_id">station_id</option>
					<option value="line_id">line_id</option>						
				</select>
			</div>
			<div class="srch_square">
				<h4>[connect_tv]</h4>
				<select name="colName2">
					<option selected disabled>column선택</option>
					<option value="train_id">train_id</option>
					<option value="vehicle_id">vehicle_id</option>						
				</select>
			</div>
			<div class="srch_square">
				<h4>[engineer]</h4>
				<select name="colName3">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="year">year</option>
					<option value="variety">variety</option>
					<option value="amount">amount</option>
					<option value="hq_ID">hq_ID</option>						
				</select>
			</div>
			<div class="srch_square">
				<h4>[headquater]</h4>
				<select name="colName4">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="name">name</option>	
					<option value="planet">planet</option>		
					<option value="continent">continent</option>		
					<option value="managername">managername</option>		
					<option value="budget">budget</option>								
				</select>
			</div>
			<div class="srch_square">
				<h4>[line]</h4>
				<select name="colName5">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="name">name</option>		
					<option value="builtYear">builtYear</option>		
					<option value="capacity">capacity</option>						
				</select>
			</div>
		</div>
		<div class="rows" id="srch">
			<div class="srch_square">
				<h4>[operation]</h4>
				<select name="colName6">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="status">status</option>		
					<option value="deptstatus">deptstatus</option>	
					<option value="arvstatus">arvstatus</option>	
					<option value="updatetime">updatetime</option>	
					<option value="Traincode_ID">Traincode_ID</option>
					<option value="engineer_ID">engineer_ID</option>
					<option value="train_ID">train_ID</option>
				</select>
			</div>
			<div class="srch_square">
				<h4>[station]</h4>
				<select name="colName7">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="name">name</option>		
					<option value="address">address</option>	
					<option value="tel">tel</option>	
					<option value="managername">managername</option>	
					<option value="buget">buget</option>
					<option value="hq_ID">hq_ID</option>
				</select>
			</div>
			<div class="srch_square">
				<h4>[train]</h4>
				<select name="colName8">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="type">type</option>	
					<option value="conditions">conditions</option>		
				</select>
			</div>
			<div class="srch_square">
				<h4>[traincode]</h4>
				<select name="colName9">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="code">code</option>		
					<option value="DAY">DAY</option>
					<option value="startstation">startstation</option>		
					<option value="starttime">starttime</option>
					<option value="endstation">endstation</option>
					<option value="endtime">endtime</option>
					<option value="line_ID">line_ID</option>								
				</select>
			</div>
			<div class="srch_square">
				<h4>[user]</h4>
				<select name="colName10">
					<option selected disabled>column선택</option>
					<option value="id">id</option>
					<option value="PASSWORD">PASSWORD</option>	
					<option value="NAME">NAME</option>
					<option value="RANK">RANK</option>								
				</select>
			</div>
			<div class="srch_square">
				<h4>[vehicle]</h4>
				<select name="colName11">
					<option selected disabled>column선택</option>
					<option value="ID">ID</option>
					<option value="type">type</option>	
					<option value="model">model</option>
					<option value="YEAR">YEAR</option>
					<option value="STATUS">STATUS</option>					
				</select>
			</div>
		</div>
		<div class="rows" id="srch">
			<input class="ins_val" id="searchInput" type="text" 
				name="colValue" placeholder="데이터을(를) 입력해주세요"/>				
		</div>
		<div class="rows" id="srch_div">
			<input class="search_btn" type="submit" value=" 검색 " />	
		</div>
	</form>
	
	<div><div class="hr_line"></div></div>	
	
	<h3 style="margin: 20px">제약 조건 검색</h3>
	<form action="search_constraints.jsp" method="post">
		<div class="rows" style="width: 30%"> 
			<div class="srch_square">
				<font size=3>검색할 테이블 선택</font><br>
				<select name="table_name">
					<option selected disabled>테이블을 선택해주세요.</option>
					<option value="all_tables">all tables</option>
					<option value="connect_sl">connect_sl</option>
					<option value="connect_tv">connect_tv</option>
					<option value="engineer">engineer</option>
					<option value="headquater">headquater</option>
					<option value="line">line</option>
					<option value="operation">operation</option>
					<option value="station">station</option>
					<option value="train">train</option>
					<option value="traincode">traincode</option>
					<option value="user">user</option>
					<option value="vehicle">vehicle</option>
				</select><br>
				<div style="position: right" id="srch_div">
					<input style="width:40%; border-radius: 10px;" type="submit" value=" 검색 " />	
				</div>
			</div>			
		</div>		
	</form>
	
	<div><div class="hr_line"></div></div>	
	
	<div style="text-align: center;">
		<h1>통계 조회</h1>
		<button onclick="location.href='figures.jsp'">조회하기</button>
	</div>
</body>
</html>