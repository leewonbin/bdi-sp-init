<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<body>
<button onclick="hlo()">button</button>
<script>
function hlo(){
	/* var id = document.getElementsByClassName('dhxform_base')[0]; 
	id.childNodes[0].parentNode.removeChild(id.childNodes[0]);	// x.parentNode.removeChild(x);  
	html = '<button>생성</button>';
	id.insertAdjacentHTML('beforebegin',html); */
	var close = document.getElementsByClassName('dhxwin_button dhxwin_button_close')[0];
	close.setAttribute("title","민혁");
	close.setAttribute("id","천재");
	
} 

function doInit() {
var dxForm,dxWin; 
var signupFormData = [
		{type:'input',name:'id',label:'ID',validate:'ValidAplhaNumeric',required:true},
		{type:'password',name:'pwd',label:'PWD',validate:'ValidAplhaNumeric',required:true},
		{type:'input',name:'name',label:'이름',validate:'ValidHangle',required:true},
		{type:'input',name:'email',label:'이메일',validate:'ValidEmail',required:true},
		{type:'calendar',name:'birth',label:'생년월일',dateFormat:"%Y-%m-%d",validate:'NotEmpty',required:true},
		{type:'input',name:'address',label:'주소',validate:'ValidHangle',required:true},
		{type:'input',name:'hobby',label:'취미',validate:'ValidHangle',required:true},
		{type:'input',name:'desc',label:'자기소개',validate:'ValidHangle',required:true},
		{type:'input',name:'tel',label:'전화번호',validate:'ValidNumeric',required:true}, 
	];

	dxWin = new dhtmlXWindows();
	dxWin.createWindow('w1',0,10,700,700);
	dxWin.window('w1').setText('회원가입');
	dxWin.window('w1').centerOnScreen();
	

	

	var user2Form = new dhtmlXForm('유저',signupFormData);	
	
	dxWin.window('w1').attachObject('유저');	//반드시 div영역의 아이디이다. 만들어놓은 var 값이 아님. 
}
	
	window.addEventListener('load',doInit);
	
</script>
<div id="유저" style="width:250px;height:250px;"></div>
</body>
</html>