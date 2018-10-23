<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<body>
<form>
id : <input type="text" id="id" name="name"></input><br>
password : <input type="password" id="password" name="pwd"></input><br><div id="box" style="background-color:green; width:20px; height:20px; float:none;">  </div>
passwordcheck : <input type="password" id="passwordcheck" name="pwdck"></input><br><div id="box1" style="background-color:green; width:20px; height:20px; float:none;">  </div>
email : <input type="email" id="email" name="email" pattern=".+@naver.com" required></input><br> 
<button>제출</button> 
</form>
<script>
	var pwd = document.getElementById('password'); 	 
	var pwdck = document.getElementById('passwordcheck'); 
	
	pwd.addEventListener('keyup',function(){
		setTimeout(a,1000);
		function a() {
		
			setTimeout(b,1000); 
			pwdck.addEventListener('keyup',function(){
			});
		};
		function b() {
			
			var pvck = pwdck.value; 
			var pv = pwd.value; 
			if(pv!=pvck){
				document.getElementById('box').style.backgroundColor = "red";   
			}
		};
	});
	pwdck.addEventListener('keyup',function(){
		setTimeout(c,1000);
		function c() {
		
			setTimeout(d,1000); 
			pwd.addEventListener('keyup',function(){
			});
		};
		function d() {
			
			var pvck = pwdck.value; 
			var pv = pwd.value; 
			if(pv!=pvck){
				document.getElementById('box1').style.backgroundColor = "yellow";   
			}
		};
	});
</script>
</body>  
</html>