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

	//-----------------------------------------------------
		function doInit() {
			dxGrid = new dhtmlXGridObject('dxGrid');
			dxGrid.setImagePath('${gridPath}');
			dxGrid.setHeader('번호,아이디,비밀번호,이름,이메일,생년월일,주소,취미/특기,한줄소개,전화번호,수정,삭제');
			dxGrid.setColumnIds('uinum,uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uidesc,uitel,tnwjd,tkrwp');
			dxGrid.setColAlign('center,center,center,center,center,center,center,center,center,center,center,center');
			dxGrid.setColTypes('ro,ed,ed,ed,ed,ed,ed,ed,ed,ed,img,img');
			dxGrid.set
			dxGrid.init();
			au.send({url:'/userpr',success:function(res){
				res=JSON.parse(res);
				dxGrid.parse(res,'js')
			}})
			
	};

		window.addEventListener('load',doInit);
		setTimeout(	function(e){
			alert('되자');
			var tnwjd = document.getElementsByTagName('img');
			
			for(var i=0;i<tnwjd.length;i++){
				
				if(i%2==0){
					tnwjd[i].setAttribute("class","수정");
					tnwjd[i].setAttribute("src","${imgsPath}/dhxacc_skyblue/11.png");
				}else{
					tnwjd[i].setAttribute("class","삭제");
					tnwjd[i].setAttribute("src","${imgsPath}/dhxacc_skyblue/delete.png");
				}
			}
			
			var tnwjd1 = document.getElementsByClassName('수정');
			for(var i=0;i<tnwjd1.length;i++){
				tnwjd1[i].addEventListener('click',findFactor);
			}
			var tkrwp1 = document.getElementsByClassName('삭제');
			for(var i=0;i<tnwjd1.length;i++){
				tkrwp1[i].addEventListener('click',findFactor2);
			}
			
			
			function findFactor(target){
				var keys= new Array();
				for(var i=0;i<10;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
			//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
				keys[i]=target.path[2].childNodes[i].innerHTML;
				}
				checkvalue(keys);
			}
			function findFactor2(target){
				var keys= new Array();
				for(var i=0;i<10;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
			//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
				keys[i]=target.path[2].childNodes[i].innerHTML;
				}
				console.log(keys[0]);
				var uinum = keys[0];
				deleterow(uinum);
				function deleterow(uinum){
					var conf={
							url:'/userpr/'+uinum+'',
							method:'DELETE',
							param :JSON.stringify({uinum:uinum}),
							success:function(res){
								res=JSON.parse(res);
								alert(res.msg);
								location.href="/uri/watermelon/list";
							}
						}
						alert(conf.url);
						au.send(conf);
						}
				}
			
			
			
			function checkvalue(keys){
				var pattern = /\s/g;
				var hanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
				for(var i=1;i<keys.length;i++){
					
				if(keys[i].match(pattern)||keys[i].length<2){
					if(i!=5){
					alert(keys[i]+'가 공백패턴또는 2글자 미만입니다.');
					return;
					}
				}}
				if(keys[3].match(hanglePattern)){
					alert('이름은 한글로 써야합니다.');
					return;
				}
				sendingToServer(keys);
			}
			
			function sendingToServer(keys){
				var conf={
						url:'/userpr/'+keys[0]+'',
						method:'PUT',
						param :JSON.stringify({uinum:keys[0],uiid:keys[1],uipwd:keys[2],uiname:keys[3],uiemail:keys[4],uibirth:keys[5],uiaddress:keys[6],uihobby:keys[7],uidesc:keys[8],uitel:keys[9]}),
						success:function(res){
							res=JSON.parse(res);
							alert(res.msg);
						}
					}
					alert(conf.url);
					au.send(conf);
			}
			
			
		},2000);
	</script>
</body>
	<div id="dxGrid" style="width:100%; height:65%"></div>
</html>