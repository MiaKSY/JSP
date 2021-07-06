<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>

<!-- 제이쿼리 라이크러리를 cnd 방식으로 연결 -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	
	// '중복체크' 버튼이 클릭되었을 때 아래 함수를 불러주세요
	$('#id_check').click(function(){
		
		// 키보드를 누를 때마다, 한 키 한 키 서버에 보내서
		// 일치하는지 일치하지 않는지 알려주세요
		// (예전에 유행, 하지만 서버에 일을 너무 많이 해야한다.)
		// (요즘에는 click으로 많이 쓴다.)
		// $('.userinput').keyup(function(){
			
		// var id = $('.userinput').val();
		// 변수로 줘도 되고 안 줘도 되고..
		
		// ajax 할게요
		$.ajax({
			type : 'get',
			data : { 'id' : $('.userinput').val()},
			// id라는 이름 아래에 클래스 userinput의 값을 가져다 넣기
			url : 'IdCheck.jsp',
			dataType : 'text',
			// datatType......오타주의!!!!ㅠㅠ 넘나 오래 고생한 것....
			success : function(data){
				// alert(data)
				
				// ***********************
				// 통신으로 데이터를 주고 받을 때
				// ***********************
				// 공백제거 : trim()
				// ***********************
				if(data.trim() == 'YES'){
					$('#idmessage').text('이미 사용중인 아이디입니다.');
					$('#idmessage').show();
				}else{
					$('#idmessage').text('사용 가능 아이디입니다.');
					$('#idmessage').show();
				}
			}
		});
	});
}) 


/* 
정성님 감사...!

$(function(){
	$('#id_check').click(function(){
		// 실시간 아이디 검사 click => keyup
		// $('.userinput').keyup(function(){})
			$.ajax({
			type : "get",
			data : { 'id' : $('.userinput').val() },
			url : 'IdCheck.jsp',
			dataType : 'text',
			success : parseData
		});
		
		function parseData(data) {
			//alert(data);
			
			if( data.trim() == "YES"){
				$('#idmessage').text("이미 사용 중인 아이디입니다.");
				$('#idmessage').show();
			}
			else{
				$('#idmessage').text("사용 가능한 아이디입니다.");
				$('#idmessage').show();
			}
			
		} 
	})
})
 */


</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none"></div>

</body>
</html>