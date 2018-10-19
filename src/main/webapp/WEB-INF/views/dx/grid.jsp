<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
	<script>
		function doInit() {
			dxGrid = new dhtmlXGridObject('dxGrid');
			dxGrid.setImagePath('${gridPath}');
			dxGrid.setHeader('번호,이름,아이디,수정,삭제');
			dxGrid.setColumnIds('num,name,id,modbtn,delbtn');
			
			dxGrid.setColTypes('ro,ed,ed,img,img');
			dxGrid.init();
			var data = [
				{num:1,name:'홍길동1',id:'hong',modbtn:'${imgsPath}/dhxacc_skyblue/dhxacc_btns.gif',delbtn:'${imgsPath}/dhxacc_skyblue/dhxacc_btns.gif'},
				{num:2,name:'홍길동2',id:'hongs',modbtn:'${imgsPath}/dhxacc_skyblue/dhxacc_btns.gif',delbtn:'${imgsPath}/dhxacc_skyblue/dhxacc_btns.gif'}
				]
			dxGrid.parse(data,'js');
			
		}
		window.addEventListener('load',doInit);
	
	
		window.addEventListener('load', function(e){
			var tnwjd = document.getElementsByTagName('img');
			for(var i=0;i<tnwjd.length;i++){
				if(i%2==0){
					tnwjd[i].setAttribute("class","수정");
				}else{
					tnwjd[i].setAttribute("class","삭제");
				}
			}
			
			var tnwjd1 = document.getElementsByClassName('수정');
			
			for(var i=0;i<tnwjd1.length;i++){
				tnwjd1[i].addEventListener('click',findFactor);
				
			}
			
		});
		function findFactor(target){
			var keys= new Array();
			for(var i=1;i<3;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
		//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
			keys[i-1]=target.path[2].childNodes[i].innerHTML;
			}
			checkvalue(keys);
			
		}
		function checkvalue(keys){
			var pattern = /\s/g;
			var hanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			for(var value of keys){
				console.log(keys);
			if(value.match(pattern)||value.length<2){
				console.log(value);
				alert('공백패턴또는 2글자 미만입니다.');
				return;
			}
			}
			if(keys[0].match(hanglePattern)){
				alert('이름은 한글로 써야합니다.');
				return;
			}
			sendingToServer(keys);
		}
		
		function sendingToServer(keys){
			var conf={
					url:'/login',
					method:'PUT',
					param :JSON.stringify({name:keys[0],id:keys[1]}),
					success:function(res){
						res=JSON.parse(res);
						alert(res.msg);
					}
				}
				au.send(conf);
		}
		
		
		
		
	
	
		
	</script>
<body>

<div id="dxGrid" style="width:400px;height:300px"></div>


</body>
</html>