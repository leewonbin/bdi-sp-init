<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<title>스프링테스트</title>
<link rel="stylesheet" type="text/css" href="${resPath}/dhtmlx/skins/skyblue/dhtmlx.css" />
</head>
<script>
	var deGird;
	window.addEventListener('load',function() {
		deGird = new dhtmlXGridObject('divGrid');
		deGird.setImagePath('${resPath}/dhtmlx/skins/skyblue/imgs/dhxgrid_skyblue/');
		deGird.setHeader('부서번호,부서명,부서설명,인원수');
		deGird.setColumnIds('diNo,diName,diDesc,diCnt');
		deGird.setColAlign('center,center,center,center');
		deGird.setColTypes('ro,ed,ed,ed');
		deGird.setColSorting('int,str,str,int');
		deGird.init();
		au.send({url:'/depart',success:function(res) {
			res=JSON.parse(res);
		deGird.parse(res,'js');
		}})
	});
</script>
<body>
	<div id="divGrid" style="width: 500px; height: 350px; background-color:white;"></div>
</body>
</html>
