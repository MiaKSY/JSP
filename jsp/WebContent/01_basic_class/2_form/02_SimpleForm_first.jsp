<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 폼과 서블릿 </title></head>

<body>
	<form method="get" action="02_SimpleForm_second.jsp">
		<h4>  입력 후 전송 버튼을 누릅니다 </h4>

		이름	: <input type="text" name="name"><br/>

		성별    : <input type="radio" name="gender" value="male" checked="checked"> 남
 			   <input type="radio" name="gender" value="female"> 여 <br/>


		직업	: <select name="occupation">
						<option> programmer
						<option> web designer
						<option> white hand
						<option> people
			</select><br/>

		취미    :	 <input type="checkbox" name="hobby" value="쓰타크래프트"> 쓰타크래프트
					 <input type="checkbox" name="hobby" value="한솥밥먹기"> 한솥밥먹기
					 <input type="checkbox" name="hobby" value="멍때리기"> 멍때리기
					 <input type="checkbox" name="hobby" value="그냥있기"> 그냥있기 <br/> <br/>

		
		<input type="submit" value='전송'>
		<input type="reset" value='취소'>
	</form>
	
	<!-- [문제] -->
	<!-- 하나의 jsp파일을 더 만들어서, 현재 페이지의 전송값을 받아서 출력하는 페이지를 만들어주세요. -->
	<!-- checkbox에서 여러개의 값을 받아야 하는데, 어떻게 받아오면 좋을까요? -->
	<!-- HINT : 배열 -->
	
	
</body>
</html>
