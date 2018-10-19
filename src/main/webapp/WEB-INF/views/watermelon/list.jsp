<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>유저리스트</title>


</head>

	
		
	
<body>
${ssuser.uiname}님. 환영합니다.

	<script>
	//---------------------------------------------------
	var dxLayDiv, myForm, formData;
	
	//-----------------------------------------------------
		function doInit() {
			
			dxLayDiv = new dhtmlXLayoutObject('layDiv', '3J');
			dxLayDiv.cells('a').setText('유저리스트');
			dxLayDiv.cells('b').setText('유저 정보');
			dxLayDiv.cells('c').setText('미구현');
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
				dxGrid.parse(res,'js');
			}})
			dxLayDiv.cells('a').attachObject('dxGrid');
		
			
			
		
			
	};

		window.addEventListener('load',doInit);
		setTimeout(	function(e){
			//alert('${ssuser.uiname}님 환영합니다.');
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
			//번호를 누르면 옆으로 이동
		//	console.log(document.querySelectorAll('tbody')[1].childNodes);//선택자를 이용한 엘리먼트 pick
			console.log(document.querySelectorAll('tbody')[1].childNodes[1].childNodes[0].innerHTML);//선택자를 이용한 엘리먼트 pick
			
			var cnn = document.querySelectorAll('tbody')[1].childNodes;//cnn이 row의 수
			
			for(var i=1;i<cnn.length;i++){
				cnn[i].addEventListener('click',function(e){
					//서버에서 데이터 가져오기
				
					var uinum= this.childNodes[0].innerHTML;
					var uinum,uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uitel,uidesc;
				//	console.log(uinum);
					
					
					au.send({url:'/userpr/'+uinum,success:function(res){
						res=JSON.parse(res);
						uinum=res.uinum;
						uiid=res.uiid;
						uipwd=res.uipwd;
						uiname=res.uiname;
						uiemail=res.uiemail;
						uibirth=res.uibirth;
						uiaddress=res.uiaddress;
						uihobby=res.uihobby;
						uitel=res.uitel;
						uidesc=res.uidesc;
						parseInput();
					}}) 
					
					//파싱해서 넣기
			
					function parseInput(){
							
							if(formData){
								
								document.getElementsByClassName('dhxform_base')[0].remove();
							}
							formData = [
								 {type: "settings", position: "label-left", labelWidth: 130, inputWidth: 130},
								{type: "image", name: "photo", label: "사진", imageWidth: 126, imageHeight: 126, url:"${imgsPath}/dhxacc_skyblue/ryan.jpg"},
								{type:"input",name:"num",label:"번호",value:uinum },
								{type: "input", name: "id", label: "ID", value:uiid},
								{type: "password", name: "pwd", label: "Password", value:uipwd},
								{type: "input", name: "name", label: "이름", value:uiname},
								{type: "input", name: "email", label: "Email 주소", value: uiemail},
								{type: "input", name: "birth", label: "생일", value:uibirth},
								{type: "input", name: "address", label: "주소", value:uiaddress},
								{type: "input", name: "hobby", label: "취미/특기", value:uihobby},
								{type: "input", name: "desc", label: "한줄소개", value:uidesc},
								{type: "input", name: "tel", label: "전화번호", value:uitel}
							];
							
							myForm = new dhtmlXForm('userView', formData); 
							myForm.disableItem("num");
							 dxLayDiv.cells('b').attachObject('userView');
							 html='';
							 html+='<button onclick="findFactor3()">수정</button>';
							 document.getElementsByClassName('dhxform_base')[0].insertAdjacentHTML('beforeend',html);
						
							
							 
							
						
						
						
					}
					
				});
			}
		
			function findFactor2(target){
				var keys= new Array();
				for(var i=0;i<10;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
			//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
				
				keys[i]=target.path[2].childNodes[i].innerHTML;
				
				}
			
				
				var uinum = keys[0];
				deleterow(uinum);
				function deleterow(uinum){
					var conf={
							url:'/userpr/'+uinum+'',
							method:'DELETE',
							param :JSON.stringify({uinum:uinum}),
							success:function(res){
								res=JSON.parse(res);
								console.log(res);
								console.log(res.msg);
								location.href="/viewz/uri/watermelon/list";
							}
						}
						if(confirm('이 데이터를 삭제하시겠습니까?')){
							au.send(conf);	
						};
						}
				}
			
			
			
			function checkvalue(keys){
				var pattern = /\s/g;
				var hanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
				for(var i=1;i<keys.length;i++){
					
				if(keys[i].match(pattern)||keys[i].length<2){
					if(i!=5||i!=1){
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
							location.href="/viewz/uri/watermelon/list";
						}
					}
					au.send(conf);
			}
			
			
			
		},1000);
		function logOut(){
			var conf = {
					url:'/logout/',
					method:'POST',
					success : function(res){
						res=JSON.parse(res);
						alert(res.msg);
						location.href="/viewz/uri/watermelon/list";
						
					}
			}
			au.send(conf);
		}
		function findFactor3(){
			var keys= new Array();
		//	console.log(document.querySelectorAll('div.dhxform_control')[1].querySelector('input').value);//값을 잡는다.
			var spec= document.querySelectorAll('div.dhxform_control')[1].querySelector('input').value
			for(var i=1;i<11;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
			keys[i-1]=document.querySelectorAll('div.dhxform_control')[i].querySelector('input').value
		//	keys[i]=target.path[2].childNodes[i].innerHTML;
			
			}
			console.log(keys);
			checkvalue(keys);
		}
		function checkvalue(keys){
			var pattern = /\s/g;
			var hanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			for(var i=1;i<keys.length;i++){
				
			if(keys[i].match(pattern)||keys[i].length<2){
				if(i!=5||i!=0){
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
						location.href="/viewz/uri/watermelon/list";
					}
				}
				
				au.send(conf);
		}
		
	</script>
</body>
	<button onclick="logOut()" style="position:relative; left:78%;">로그아웃</button>
	<div id="layDiv" style="margin: auto 0px;width: 100%;height: 100%;"></div>
	<div id="dxGrid" style="width:100%; height:65%"></div>
	
	<div id="userView"></div>
</html>