<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
<link rel="stylesheet" type="text/css" href="${resPath}/css/mycss.css">
</head>
<body>
<div id="container">
		<div id="welcome">Welcome back!</div>
		<div id="loginbox">
      <h2 id="h2">LOGIN</h2>
			<input type="text" id="id" placeholder="  Email address"><br>
			<input type="password" id="pwd" placeholder="  password"><br>
			<button id="login" onclick="btn();">Login</button>
		</div>
		<div id=f style="float: left" onmouseover="this.style.opacity='0.4'" onmouseout="this.style.opacity='1'" onclick="btn1()">Forgot your password? 
		</div>
		<div id=d onmouseover="this.style.opacity='0.4'" onmouseout="this.style.opacity='1'" onclick="btn2()">Don't have an account? Sign Up
		</div>
	</div>
</body>
<script>
function btn() {
	var login = document.getElmentById('id').value;
	alert("안녕하십니까" + login + "님");
}
function btn1() {
	alert("비밀번호를 잊어버리셨네요 ㅋ");
}
function btn2() {
	alert("회원이 아니시네요. 회원가입 하세요.");
}
</script>
</html>