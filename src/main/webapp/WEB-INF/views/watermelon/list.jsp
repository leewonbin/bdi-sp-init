<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>유저리스트</title>
</head>
<body>
	<script>
	//---------------------------------------------------
	var AjaxObject = function (conf) {
		var xhr = new XMLHttpRequest() {
			if(xhr.readyState ==4) {
				if(xhr.status==200){
					conf.suc(xhr.responseText);
				}
			}
		}
		xhr.open(conf.method,conf.url);
		xhr.send();
	}
	//-----------------------------------------------------
		function doInit() {
			dxGrid = new dhtmlXGridObject('dxGrid');
			dxGrid.setImagePath('${gridPath}');
			dxGrid.setHeader('번호,아이디,비밀번호,이름,이메일,생년월일,주소,취미/특기,한줄소개,전화번호,수정/삭제');
			dxGrid.setColumnIds('uinum,uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uidesc,uitel,uier');
			dxGrid.setColAlign('center,center,center,center,center,center,center,center,center,center,center');
			dxGrid.setColTypes('ro,ed,ed,ed,ed,ed,ed,ed,ed,ed,img');
			dxGrid.init();
			au.send({url:'/userpr',success:function(res){
				res=JSON.parse(res);
				dxGrid.parse(res,'js')
			}})
			
			
			
			//----------------------------------------------------------------
			var conf = {method:'GET',url:'japans',suc:function(res){
				alert(res);
			}}
			alert(conf.suc);
			var ao = new AjaxOnject(conf);
		}
		//---------------------------------------------
		window.addEventListener('load',doInit);
	</script>
</body>
	<div id="dxGrid" style="width:100%; height:65%"></div>
</html>