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
		  {type:'password',name:'pwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
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
				dxWin.createWindow('w1',0,10,220,230);
				dxWin.window('w1').setText('회원가입');
				dxWin.window('w1').centerOnScreen();
				//항목넣기
				var signupForms = new dhtmlXForm('signupForm',signupFormData);
				console.log(signupForms)
				dxWin.window('w1').attachObject('signupForm');//반드시 divd영역의 아이디이다. 만들어놓은 var 값이 아님. 
				
			}else{
				alert('안나온다');//xWindow를 닫으면 다시 눌렀을 때 실행되야 하므로 넣어줘야함. 
				
			}
			signinForm.attachEvent('onButtonClick',function(name){
				if(name=='signinbtn') {
					if(signinForm.validate()){
					var id = signinForm.getItemValue('id');
					var pwd = signinForm.getItemValue('pwd');
					var conf = {
							url:'/login',
							method:'POST',
							param : JSON.stringify({id:id,pwd:pwd}),
							success : function(res){
								res = JSON.parse(res);
								alert(res.msg);
							}
					}
					au.send(conf);
				}
				}
			})
		}
	});

	}
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