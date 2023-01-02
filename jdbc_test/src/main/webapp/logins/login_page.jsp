<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<style>
		body {
		  background-color: #afafc7;
		}
		h1 {
		  font-family: "Arial", sans-serif;
		  text-align: center;
		  margin-top: 60px;
		  color: #f6f6f6;
		  font-size: 2em;
		  letter-spacing: 8px;
		}		
		p {
		  color: #5f7daf;
		  font-family: "Arial";
		  font-size: 18px;
		  letter-spacing: 4px;		  
		  text-align: center;
		}		
		span {
		  color: #e2c3c8;
		}
		forms {		  
		  display: flex;
		  align-items: center;
		  padding-top: 7px;
		  text-align: center;
		}
		input {
		  align-items: center;
		  background: #e2c3c8;
		  border: none;
		  color: #ce7d88;
		  margin: 7px;
		  margin-left: 35%;
		  padding: 9px;
		  width: 30%;
		}
		input::placeholder {
		  color: #ffffff;
		  letter-spacing: 2px;
		  font-size: 15px;
		}
		button {
		  padding: 12px;
		  border-radius: 10px;
		  font-family: "Arial";
		  font-size: 13px;
		  letter-spacing: 3px;	  
		  margin: auto;
		  display: block;
		}
		/* 버튼에 마우스 올릴 때.*/
		button:hover {
		  background: #f7dfd3;
		  color: #ffffff;
		  transition: background-color 0.3s;
		}
		
		.title {
		  font-family: "Palatino";
		  font-size: 70px;
		  color: #5f7daf;
		  text-align: center;		  		  
		  letter-spacing: 5px;		  
		  font-weight: 200;
		  margin-top: 10%;
		}		
		.small_title {
		  margin-top: -8px;
		}		
		.login {
		  align-items: center;
		  background-color: #cccff;
		}		
	</style>
</head>
<body>
<div>
	<div>
		<h2 class="title"><span>Yonsei </span> Train<br>Corporation</h2>
	    <p class="small_title"> management of <span>train system</span></p>
	</div>
	<div>
		<div class="login">
	        <h1>login</h1>
	        <form class="forms" method="post", action="loginAction.jsp">
	        	<input type="text" placeholder="id" name="userID"><br>
	        	<input type="password" placeholder="password" name="userPassword">	            
	        	<button class="button submit">ENTER</button>
	      	</form>
	    </div>
	</div>
</div>

</body>
</html>