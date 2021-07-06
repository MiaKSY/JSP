<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
	    $(function(){
	    	
	    	var param = { cate : 'kkk', name:'ooo' };
	    	
	    	$.ajax({
	    		type : 'get',
	    		url : '04_server.jsp',
	    		data : param,
	    		dataType : 'text',
	    		// 추후에 JSON 라이브러리를 이용하여 JSON으로 받기
	    		success : function(result){
	    			alert(result);
	    			var obj = {};
	    			obj = eval(result);
	    			// eval()함수 : 객체로 만들어버린다.
	    			$('#cate').val(obj.first);
	    		}
	    		// 함수 이름만 쓰고, 밖에서 함수를 만들어줘도 되고,
	    		// 바로 함수를 써도 되지만 (권장 X)
	    		// 함수 이름만 쓰고 밖에서 함수를 만드는 것을 권장한다!!
	    		
	    	});
	    	
	    })
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


