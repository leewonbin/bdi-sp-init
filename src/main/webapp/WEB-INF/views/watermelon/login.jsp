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
		{type:'input',name:'name',label:'이름',validate:'ValidHangle',required:true},
		{type:'input',name:'email',label:'이메일',validate:'ValidEmail',required:true},
		{type:'calendar',name:'birth',label:'생년월일',dateFormat:"%Y-%m-%d",validate:'NotEmpty',required:true},
		{type:'input',name:'address',label:'주소',validate:'ValidHangle',required:true},
		{type:'input',name:'hobby',label:'취미',validate:'ValidHangle',required:true},
		{type:'input',name:'desc',label:'자기소개',validate:'ValidHangle',required:true},
		{type:'input',name:'tel',label:'전화번호',validate:'ValidNumeric',required:true},
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
				dxWin.window('w1').button('close').disable();
				
				
				//항목넣기
				var signupForms = new dhtmlXForm('signupForm',signupFormData);

			
				signupForms.disableItem("insertbtn");
				
				dxWin.window('w1').attachObject('signupForm');//반드시 divd영역의 아이디이다. 만들어놓은 var 값이 아님. 
				
				signupForms.attachEvent('onButtonClick',function(name){
						if(name=="btn"){
							console.log(signupForms);
							if(signupForms.getItemValue('id')!=''){
								var id=signupForms.getItemValue('id');
								var conf = {
										url:'/userprdup',
										method:'POST',
										param : JSON.stringify({uiid:id}),
										success : function(res){
										res=JSON.parse(res);
										alert(res.msg);
										if(res.msg=="쓸 수 있는 아이디입니다."){
											signupForms.enableItem("insertbtn");
										}else{
											signupForms.disableItem("insertbtn");
										}
										}
								}
								au.send(conf);
							}else{
								alert('빈칸입니다');
								signupForms.disableItem("insertbtn");
								

							}
					}else if(name=="insertbtn"){
					
						//console.log(signupForms.getItemValue('birth'));
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
									location.href='/uri/watermelon/login';
								}
						}
						au.send(conf);
						}else{
							alert('필수항목을 채워야합니다.');
							signupForms.disableItem("insertbtn");
						}
					}else if(name=="cancel"){
						if(confirm('닫을래요?')){
							dxWin.window('w1').hide();
						}else{
							
						};
					}

				})
			}else{
				dxWin.window('w1').show();
			
				
			}
		}
	});
		
	signinForm.attachEvent('onButtonClick',function(name){
				if(name=='signinbtn') {
					if(signinForm.validate()){
					var id = signinForm.getItemValue('id');
					var pwd = signinForm.getItemValue('pwd');
					
					var conf = {
							url:'/login',
							method:'POST',
							param : JSON.stringify({uiid:id,uipwd:pwd}),

							success : function(res){
								res=JSON.parse(res);
								alert(res.msg);
								if(res.success=="success"){
								location.href="/viewz/uri/watermelon/list";
								};
								
							}
					}
					au.send(conf);
				}
				}
			});
	};

	function ValidHangle(data){
		var nothanglePattern=/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		if(data.match(nothanglePattern)){
			 alert('한글이 아닙니다.');
			 return false;
		}else{
			return true;
		}		
	}


	window.addEventListener('load',doInit);
</script>

	<div id="test"></div>
	<div class="container">
		<div id="section1">
			<img
				src="https://253qv1sx4ey389p9wtpp9sj0-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/Castelvetro.jpg" />
			<div class="atag">
				<a href="www.google.com" target="_blank"> Wine Sofa</a>
			</div>
		</div>

		<div id="section2">

			<div id="blockLog">

				<!-- <div class="atag">
         <a href="http://www.google.com" target="_blank">Forgot Password?</a>
        </div> -->
			</div>


		</div>

	</div>
	<div id="signupForm" style="width: 240px; height: 250px;"></div>
	<script>

</script>
</body>
</html>