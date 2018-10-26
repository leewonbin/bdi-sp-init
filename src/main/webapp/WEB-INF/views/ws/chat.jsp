<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<body>
<fieldset>
	<legend>채팅</legend> 	
	<textarea id="chat" style="width:30%; height:500px;"></textarea><br>
	이름 : <input type="text" id="name" style="height:30px;"><br>
	메세지 : <input type="text" id="msg" style="width:10%; height:30px;">
	<button onclick="send()">전송 </button>
</fieldset>
<script>
	function send() {
		var msg = document.querySelector('#msg').value;
		var name = document.querySelector('#name').value;
		var chatMsg = {name:name, msg:msg}
		document.querySelector('#chat').value += '나 : ' + msg + '\n';
		ws.send(JSON.stringify(chatMsg)); 
	}
	var ws;
	function doInit() {
		ws = new WebSocket('ws://localhost/chat');
		ws.onerror = function(event) {
			console.log(event);
		}
		ws.onopen = function(event) {
			alert('연결성공!');
		}
		ws.onmessage = function(event) {
			var chat = JSON.parse(event.data);
			document.querySelector('#chat').value += chat.name + ' : ' + chat.msg + '\n';
		}
	}
	window.addEventListener('load',doInit);
</script>
</body>
</html>