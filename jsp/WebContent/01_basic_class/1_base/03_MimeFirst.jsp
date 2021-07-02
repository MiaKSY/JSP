<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> MIME 타입 </title>
</head>
<body>

	<!-- 
	
	파일형식을
	JSP에서는 :	contentType이라고 부르고
	웹에서는  :	MIME 타입이라고 부른다.
	
	지금 페이지 하기전에, 03_MimeSecond.jsp에 가서
	디비연동 계정, 비밀전호 등등 바꿀 거 바꾸고 오자!
	
	그리고 브라우저를 바꾸고 합시다! 크롬은 인식을 못 해서ㅎ
	윈도우 - 웹크라우저 - 인터넷익스플러로 변경!
	
	 -->
	 
	기본적으로 다른 응용 프로그램 실행하기<br><br>
	<a href="03_MimeSecond.jsp"> HTML 파일  </a><br><br><br>
	<a href="03_MimeSecond.jsp?type=word"> WORD  파일 </a><br><br><br>
	<a href="03_MimeSecond.jsp?type=excel"> EXCEL  파일 </a> <br><br><br>
	
	<!-- [문제] -->
	<!-- 현재 페이지에서 하이퍼링크를 타고 03_MimeSecond.jsp페이지로 갈건데... -->
	<!-- word를  클릭하면 워드를 열어서 워드에 결과값이 나오도록 해주시고!! -->
	<!-- excel를 클릭하면 엑셀을 열어서 엑셀에 결과값이 나오도록 해주세요!! -->
	
</body>
</html>
