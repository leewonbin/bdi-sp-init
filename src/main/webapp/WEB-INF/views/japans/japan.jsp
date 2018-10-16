<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>스프링테스트</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>${japan.jpnum }</td>
			<td>${japan.jpname }</td>
			<td>${japan.jpdesc }</td>
		</tr>

	</table>
	<button onclick="go()">리스트돌아가기</button>
</body>
<script>
function go(){
	location.href="/japans";
}
</script>
</html>