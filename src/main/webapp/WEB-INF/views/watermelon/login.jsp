<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>퍼플시티</title>
	<link rel="stylesheet" type="text/css" href="${resPath}/css/login.css">
</head>
<body>
<script>
var dxForm,dxWin; 
var signupFormData = [
		{type:'input',name:'id',label:'ID',validate:'ValidAplhaNumeric',required:true},
		{type:'button',name:'btn',value:'중복확인하자 제발'},
		{type:'password',name:'pwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'name',label:'이름',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'email',label:'이메일',validate:'ValidEmail',required:true},
		{type:'input',name:'birth',label:'생년월일',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'address',label:'주소',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'hobby',label:'취미',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'desc',label:'자기소개',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'tel',label:'전화번호',validate:'ValidAplhaNumeric',required:true},
		{type:'button',name:'insertbtn',value:'Sign Up'},
		{type:'button',name:'cancel',value:'Cancel'}
	];
	
function doInit(){
	var signinFormData = [
		{type:'fieldset',name:'Signin',label:'login',inputWidth:'auto',
		list:[{type:'input',name:'id',label:'ID',validate:'ValidAplhaNumeric',required:true},
			  {type:'password',name:'pwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
			  {type:'button',name:'signinbtn',value:'Sign In'},
			  {type:'button',name:'signupbtn',value:'Sign Up'}
			]	
		}
	];
	

	var signinForm= new dhtmlXForm('blockLog', signinFormData);
	signinForm.attachEvent('onButtonClick',function(name){
		if(name=='signupbtn'){
		
			if(!dxWin){
				dxWin = new dhtmlXWindows();
				dxWin.createWindow('w1',0,10,700,700);
				dxWin.window('w1').setText('회원가입');
				dxWin.window('w1').centerOnScreen();
				//항목넣기
				var signupForms = new dhtmlXForm('signupForm',signupFormData);
				
				
				dxWin.window('w1').attachObject('signupForm');//반드시 divd영역의 아이디이다. 만들어놓은 var 값이 아님. 
				var dup = document.getElementsByClassName('dhxform_btn');
				console.log(dup);
				dup[3].addEventListener('click',function(){
					console.log('제발되라');
					
					if(signupForms.validate()){
					var id=signupForms.getItemValue('id');
					var pwd=signupForms.getItemValue('pwd');
					var name=signupForms.getItemValue('name');
					var email=signupForms.getItemValue('email');
					var birth=signupForms.getItemValue('birth');
					var address=signupForms.getItemValue('address');
					var hobby=signupForms.getItemValue('hobby');
					var desc=signupForms.getItemValue('desc');
					var tel=signupForms.getItemValue('tel');
					
				
				
					
			
					var conf = {
							url:'/userpr',
							method:'POST',
							param : JSON.stringify({uiid:id,uipwd:pwd,uiname:name,uiemail:email,uibirth:birth,uiaddress:address,uihobby:hobby,uidesc:desc,uitel:tel}),
							success : function(res){
								res = JSON.parse(res);
								alert(res.msg);
								alert('되자제발');
								location.href='/uri/watermelon/login';
							}
					}
					au.send(conf);
					
					}
				})
				dup[2].addEventListener('click',function(){
					console.log(signupForms);
					if(signupForms.validate()){
						var id=signupForms.getItemValue('id');
						var conf = {
								url:'/userprs',
								method:'POST',
								param : JSON.stringify({uiid:id}),
								success : function(res){
									
									alert(res);
									alert('뭘까');
									location.href='/uri/watermelon/login';
								}
						}
						au.send(conf);
					}
						
					});
				
				
			}else{
				alert('안나온다');//xWindow를 닫으면 다시 눌렀을 때 실행되야 하므로 넣어줘야함. 
				
			}
		}
	});
		
	signinForm.attachEvent('onButtonClick',function(name){
				if(name=='signinbtn') {
					if(signinForm.validate()){
					var id = signinForm.getItemValue('id');
					var pwd = signinForm.getItemValue('pwd');
					alert('hi');
					var conf = {
							url:'/login',
							method:'POST',
							param : JSON.stringify({uiid:id,uipwd:pwd}),
							success : function(res){
								alert(res);
								location.href="/uri/watermelon/list"
							}
					}
					au.send(conf);
				}
				}
			});
	};
	
	window.addEventListener('load',doInit);
</script>
<div id="test"></div>
<div class="container">
  <div id="section1">
  <img src="https://253qv1sx4ey389p9wtpp9sj0-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/Castelvetro.jpg"/>
    <div class="atag">
    <a href="www.google.com" target="_blank"> Wine Sofa</a>
    </div>
  </div>
  
  <div id="section2">
  
      <div id="blockLog">
        
        <div class="atag">
         <a href="http://www.google.com" target="_blank">Forgot Password?</a>
        </div>
      </div>
    
      
   </div>  
  
</div>
  <div class="pagefooter">안녕</div>
 
  <div id="signupForm" style="width:240px;height:250px;"></div>
 <script>
</script>
</body>
</html>