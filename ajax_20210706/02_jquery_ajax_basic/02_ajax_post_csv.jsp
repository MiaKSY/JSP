<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script type="text/javascript">
	
	$ (function(){
	
		var param = { cate : 'book', name : 'hong' }
					// key : value, key : value
		
		// ▼ 축약형
		// $.post( '02_server.jsp', param, parseData );
			// post 방식으로
			// 우리 모르게 02_server.jsp에 다녀와주세요
			// param 가지고 갈건데
			// 다녀오면서 parseData라는 함수 불러주세요
		// ▲ 축약형
		
		// ▼ 원본 (+ error 부분)		
		$.ajax({
			type : 'post',
			// 전송타입
			// 브라우저별로 type의 기본값 'get','post'이 다르니까, 개발자가 지정해주자.
			url : '02_server.jsp',
			// 요청되는 파일
			data : param,
			dataType : text, 
			// 받을 때 데이터 타입
			success : parseData,
			error : function(){
				alert('error')
			}
		});
		// 자바스크립트에서는 함수도 변수다.
		// 그래서 여기서 error에 함수를 통으로 넣어버렸다.
		
		
		function parseData(strText){
			alert(strText);
		}
		
		var aryData = strText.split("|");
		
		for(var i=0;i<aryData.length;i++){
			var param  = aryData[i].split("=");				
			if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
				 document.getElementById("cate").value = param[1];
			}
			
			if( param[0].trim() == 'name'){
				document.getElementById("name").value = param[1];
			}
		
		}
		
	})
	
	</script>


</head>


<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


