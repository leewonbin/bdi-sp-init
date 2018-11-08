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
<<<<<<< HEAD
	var conf;
	var uinum,cnt,keys;
	var uinumSet=new Array();
	var uinumCheckSet=new Array();
	var sta1,sta2
	var dataSet='[]';
	/////////////유효성검사////////////////
	var pattern = /\s/g;
	var hanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	var emailPattern=/^([a-z0-9]+)@([\da-z]+)\.([a-z\.]{2,6})$/;
=======
	var sta1 = new Date()
>>>>>>> branch 'master' of https://github.com/leewonbin/bdi-sp-init.git
	//-----------------------------------------------------
		function doInit() {
			sta1 = new Date();
			console.log(sta1.getTime());
			console.log(sta1.getTime()-sta2.getTime());
			dxLayDiv = new dhtmlXLayoutObject('layDiv', '3J');
			dxLayDiv.cells('a').setText('유저리스트');
			dxLayDiv.cells('b').setText('유저 정보');
			dxLayDiv.cells('c').setText('일괄삭제');
			
			dxGrid = new dhtmlXGridObject('dxGrid');
			dxGrid.setImagePath('${gridPath}');
			dxGrid.setHeader('번호,아이디,비밀번호,이름,이메일,생년월일,주소,취미/특기,한줄소개,전화번호,수정,삭제');
			dxGrid.setColumnIds('uinum,uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uidesc,uitel,tnwjd,tkrwp');
			dxGrid.setColAlign('center,center,center,center,center,center,center,center,center,center,center,center');
			dxGrid.setColTypes('ro,ed,ed,ed,ed,ed,ed,ed,ed,ed,img,img');
			dxGrid.init();
			
			dxGrid2= new dhtmlXGridObject('dxGrid2');
			dxGrid2.setHeader('번호,아이디,비밀번호,이름,이메일,생년월일,주소,취미/특기,한줄소개,전화번호');
			dxGrid2.setColumnIds('uinum,uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uidesc,uitel');
			dxGrid2.setColAlign('center,center,center,center,center,center,center,center,center,center');
			dxGrid2.setColTypes('ro,ed,ed,ed,ed,ed,ed,ed,ed,ed');
			dxGrid2.init();
			//첫째 섹션에 전체 리스트 붙이기
			au.send({url:'/userpr',success:function(res){
				res=JSON.parse(res);
				dxGrid.parse(res,'js');
			}})
	
			dxLayDiv.cells('a').attachObject('dxGrid');
<<<<<<< HEAD
			dxLayDiv.cells('c').attachObject('dxGrid2');
			//중간에 버튼 붙이기 
			 html='';
			 html+='<button id="downitem" style="background-image:url(${imgsPath}/dhxpopup_skyblue/down.png);background-size: cover;background-repeat:no-repeat;margin:10% 47%; width:40px; height:40px; padding: 10px; border:none;"/>';
			 document.getElementsByClassName('dhx_cell_layout')[1].childNodes[1].insertAdjacentHTML('beforeend',html);
			 html='';
			 html+='<button id="deleteAllData" style="background-image:url(${imgsPath}/dhxpopup_skyblue/del.jpg);background-size: cover;background-repeat:no-repeat;margin:5% 35%; width:100px; height:120px; padding: 10px; border:none;"/>';
			 document.getElementsByClassName('dhx_cell_layout')[2].childNodes[1].insertAdjacentHTML('beforeend',html);
		
			
			
=======
			var sta2= new Date();
			console.log(sta2.getTime()-sta1.getTime());
>>>>>>> branch 'master' of https://github.com/leewonbin/bdi-sp-init.git
			};

		window.addEventListener('load',doInit);
		sta2 = new Date();
		
		setTimeout(	function(e){
			//alert('${ssuser.uiname}님 환영합니다.');
			var tnwjd = document.querySelectorAll('td img');
			
			for(var i=0;i<tnwjd.length;i++){
				
				if(i%2==0){
					tnwjd[i].setAttribute("class","수정");
					tnwjd[i].setAttribute("src","${imgsPath}/dhxacc_skyblue/11.png");
				}else{
					tnwjd[i].setAttribute("class","삭제");
					tnwjd[i].setAttribute("src","${imgsPath}/dhxacc_skyblue/delete.png");
				}
			}
//////////////////////////////////////////////추가버전 호영/////////////////////////////////////////
			dxGrid.attachEvent('onEditCell',function(stage,rId,cInd,nValue,oValue){
				uinum =dxGrid.cells(rId,0).getValue();
				var keys = ["uinum","uiid","uipwd","uiname","uiemail","uibirth","uiaddress","uihobby","uidesc","uitel"];
				console.log('uinum은'+uinum);
				var data={};
				data[keys[cInd]]=nValue
				data[keys[0]]=uinum
				
				if(stage==2){		
					conf={url:'/userpr/',
							method:'PUT',
							param :JSON.stringify(data),
							success:function(res){
								res=JSON.parse(res);
								alert(res.msg);
								location.href="/uri/watermelon/list";}
						};
					au.send(conf)
					return true; //트루면 바뀐 것이 들어가고  false면 안바뀌고 고대로 있음.
					};
								
				}
				
			);
			dxGrid.attachEvent("onRowSelect",function(rId,cInd){
				dxGrid2.clearSelection();
				uinum =dxGrid.cells(rId,0).getValue();
			    //alert('row번호는'+rId+'uinum은'+uinum+'입니다.');
			  
			 
			    var dbtn =document.getElementById('deleteData');
				dbtn.setAttribute('onclick','deleteData('+uinum+')');
				var pushdown = document.getElementById('downitem');
				
				pushdown.setAttribute('onclick','createDataAndDown('+uinum+')');
			    					
			    return true;
			});
			
//////////////////////////////////////////////추가버전 호영/////////////////////////////////////////
///////////////////C구간///////////////////////////////////////////////////////////////
				dxGrid2.attachEvent("onRowSelect",function(rId,cInd){
				dxGrid.clearSelection();
				for(var i=0;i<cnt;i++){
					uinumSet[i]=dxGrid.cells(i,0).getValue();
				}
				
				console.log(uinumSet);
				
			    //alert('row번호는'+rId+'uinum은'+uinum+'입니다.');
			  
			 
			
								    					
			    return true;
				});
///////////////////C구간 닫음////////////////////////////////////////////////////////////
//////////////////////이미지 클릭이벤트/////////////////////
			
			var tnwjd1 = document.getElementsByClassName('수정');
			for(var i=0;i<tnwjd1.length;i++){
				tnwjd1[i].addEventListener('click',findFactor);
			}
			var tkrwp1 = document.getElementsByClassName('삭제');
			for(var i=0;i<tnwjd1.length;i++){
				tkrwp1[i].addEventListener('click',findFactor2);
			}
		
			
			
///////////////이미지 클릭이벤트 닫음////////////////////////			
			
			
/////////////번호를 누르면 옆으로 이동///////////////////
		//	console.log(document.querySelectorAll('tbody')[1].childNodes);//선택자를 이용한 엘리먼트 pick
			console.log(document.querySelectorAll('tbody')[1].childNodes[1].childNodes[0].innerHTML);//선택자를 이용한 엘리먼트 pick
			
			var cnn = document.querySelectorAll('tbody')[1].childNodes;//cnn이 row의 수
			
			for(var i=1;i<cnn.length;i++){
				cnn[i].addEventListener('dblclick',function(e){
					//서버에서 데이터 가져오기
					uinum= this.childNodes[0].innerHTML;
					var uiid,uipwd,uiname,uiemail,uibirth,uiaddress,uihobby,uitel,uidesc;
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
<<<<<<< HEAD
			var sta3 = new Date();
			console.log(sta3.getTime()-sta1.getTime());
		},30);
///////////////////////////// 이하 맨 상위 //////////////		
=======
		
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
								
								alert(res.msg);
								location.href="/viewz/uri/watermelon/list";}
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
							console.log(res);
							alert(res.msg);
							location.href="/viewz/uri/watermelon/list";
						}
					}
					au.send(conf);
			}
			
			
			
		},100);
>>>>>>> branch 'master' of https://github.com/leewonbin/bdi-sp-init.git
		function logOut(){
			conf = {
					url:'/logout/',
					method:'POST',
					success : function(res){
						res=JSON.parse(res);
						alert(res.msg);
						location.href="/uri/watermelon/list";
						
					}
			}
			au.send(conf);
		}
		function findFactor(target){
			keys= new Array();
			for(var i=0;i<10;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
		//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
			keys[i]=target.path[2].childNodes[i].innerHTML;
			}
			checkvalue(keys);
		}
		function findFactor2(target){
			alert('눌렀다.');
			keys= new Array();
			for(var i=0;i<10;i++){ //i<3의 3은 이미지 앞에 있는 항목 개수.
		//	console.log(target.path[2].childNodes[i].innerHTML);//target:누르는 그림, path[2]:target을 기준으로 tr전체영역,
			keys[i]=target.path[2].childNodes[i].innerHTML;
			}
			uinum = keys[0];
			deleterow(uinum);
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
			if(!keys[4].match(emailPattern)){
				console.log(emailPattern);
				alert('email형식에 맞게 써야합니다. ex)aaa@aaa.com');
				return;
			}
			
			sendingToServer(keys);
		}
		function sendingToServer(keys){
			conf={
					url:'/userpr/'+keys[0]+'',
					method:'PUT',
					param :JSON.stringify({uinum:keys[0],uiid:keys[1],uipwd:keys[2],uiname:keys[3],uiemail:keys[4],uibirth:keys[5],uiaddress:keys[6],uihobby:keys[7],uidesc:keys[8],uitel:keys[9]}),
					success:function(res){
						res=JSON.parse(res);
						alert(res.msg);
						location.href="/uri/watermelon/list";
					}
				}
				
				au.send(conf);
		}
		//A셀안에 있는 삭제버튼 //
		function deleterow(uinum){
			conf={
					url:'/userpr/'+uinum+'',
					method:'DELETE',
					param :JSON.stringify({uinum:uinum}),
					success:function(res){
						res=JSON.parse(res);
						
						alert(res.msg);
						location.href="/uri/watermelon/list";}
				}
				if(confirm('이 데이터를 삭제하시겠습니까?')){
					au.send(conf);	
				};
		}
		
		//A셀 위에 있는 삭제버튼 //
		function deleteData(uinum){
			if(confirm('선택하신 row를 삭제하시겠습니까?'));{
				   conf={url:'/userpr/'+uinum,
							method:'DELETE',
							success:function(res){
								res=JSON.parse(res);
								alert(res.msg);
								location.href="/uri/watermelon/list";}
						};
		    	au.send(conf);	
		    	
		    }
		}
		function createDataAndDown(uinum){
			
			alert("uinum은 "+uinum);
			uinumCheck(uinum);
			function uinumCheck(uinum){
				 if(uinumCheckSet.length==0){
					console.log(uinumCheckSet);
				 	uinumCheckSet.push(uinum);
					conf={url:'/userpr/'+uinum,
						method:'GET',
						success:function(res){
						createDataSet(res);
					
						res=JSON.parse(dataSet);
						dxGrid2.parse(res,'js');
						}
					}
					au.send(conf);
				}else{
					var cks;
					for(var i=0;i<uinumCheckSet.length;i++){
						
						if(uinum==uinumCheckSet[i]){
							cks=0;
							alert(i+'번째 cks0');
							return;
						}else{
							cks=1;
							alert(i+'번째 cks1');
						}
					}
					if(cks==1){
						uinumCheckSet.push(uinum)
						conf={url:'/userpr/'+uinum,
							method:'GET',
							success:function(res){
							createDataSet(res);
							
							res=JSON.parse(dataSet);
							dxGrid2.parse(res,'js');
							}
						}; 
					au.send(conf);
					}
				} 
			}
			console.log(uinumCheckSet);
		    var dbtn =document.getElementById('deleteAllData');
			dbtn.setAttribute('onclick','deleteAllData('+uinumCheckSet+')');
		} 
		function createDataSet(res){
			
			dataSet=dataSet.substring(1,dataSet.length-1);
			if(dataSet!=''){
				dataSet+=','+res;
				cnt++;
				alert(cnt+'개 추가하고 있습니다.');
			}else{
				dataSet=res;
				cnt=1;
			}
			dataSet='['+dataSet+']';
		}
		function deleteAllData(){
			
			conf={url:'/userprs/',
				method:'DELETE',
				param :JSON.stringify(uinumCheckSet),
				success:function(res){
				res=JSON.parse(res);
				alert(res.msg);
				if(res.success=="success"){
					location.href="/uri/watermelon/list";
				}else{
					alert('다시 접속해주세요.');
				}
				
				
				}
			}; 
		au.send(conf);
		
		
		
		}
		
	</script>
	<button id="deleteData">삭제</button>
	<button onclick="logOut()" style="position: relative; left: 78%;">로그아웃</button>
	<div id="layDiv" style="margin: auto 0px; width: 100%; height: 100%;"></div>
	<div id="dxGrid" style="width: 100%; height: 65%"></div>
	<div id="dxGrid2" style="width: 100%; height: 65%"></div>

	<div id="userView"></div>
</body>


</html>