<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.page {
	text-align: center;
}
</style>




	<script>
		function board(){
			var totalcnt;
			var conf = {
				url : '/board/',
				method : 'GET',
				//	param : JSON.stringify({uiid:id,uipwd:pwd,uiname:name,uiemail:email,uibirth:birth,uiaddress:address,uihobby:hobby,uidesc:desc,uitel:tel}),
				success : function(res) {
					alert(res);
					res = JSON.parse(res);
					totalcnt =res.totalBoard;
					console.log(24);
					addz(res);
				}
			}
			au.send(conf);
			
		}
		board();
		function addz(res){
			console.log(res);
			var add = document.querySelector('#add');
			var html='';
			for(var i=1;i<res.totalBoard;i++){
				if(i!=res.currentpage){
					html +='<a href="./comment/'+i+'"><'+i+'></a>'+'&nbsp;';
				}else{
					html +='<'+i+'>&nbsp;';
				}
				
			}
			
			add.insertAdjacentHTML('beforeend',html);
		}
	
		
	</script>
<body>
<div id="add"></div>
<div>

</div>
</body>
	
	

	