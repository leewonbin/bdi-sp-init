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
	언어1 : <select onchange="mf()" id="source">
			<option value="ko">한국어</option>	
			<option value="en">영어</option>
			<option value="ja">일본어</option>
			<option value="zh-CN">중국어</option>
		  </select>
		  
	언어2 : <select id="target">
			<option value="en">영어</option>
			<option value="ja">일본어</option>
			<option value="zh-CN">중국어</option>
		  </select>
	
	번역내용 : <textarea id="text"></textarea> 
	<button type="button" onclick="trans()">번역</button>
	번역된 메시지 : <textarea id="textresult"></textarea> 
</form>
<script>
	function mf() {
		var source = document.querySelector('#source').value;
		var target = document.querySelector('#target');
		if(source=='ko') {
			target.innerHTML='<option value="en">영어</option>';
			target.innerHTML+='<option value="ja">일본어</option>';
			target.innerHTML+='<option value="zh-CN">중국어</option>';
		}
		if(source=='en') {
			target.innerHTML='<option value="ko">한국어</option>';
		}
		if(source=='ja') {
			target.innerHTML='<option value="ko">한국어</option>';
		}
		if(source=='zh-CN') {
			target.innerHTML='<option value="ko">한국어</option>';
		}
	}

	function trans() {
		var source = document.querySelector('#source').value;
		var target = document.querySelector('#target').value;
		var text = document.querySelector('#text').value;
		var textresult = document.querySelector('#textresult');
		var param = 'source=' + source + '&target=' + target + '&text=' + text; 
		
		var conf = {
				url : encodeURI('/trans?' + param),
				success : function(res) {
					res=JSON.parse(res);
					textresult.value = res.message.result.translatedText;
				}
		};
		au.send(conf);
	}
</script>
</body>
</html>