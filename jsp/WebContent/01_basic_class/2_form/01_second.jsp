<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 사용자 입력값을 받아옵니다. 그리고 변수에 넣어줍니다.
// name="요기에 지정한 것"과 똑!같!이! 써서 파라메터를 가져옵니다.
String name = request.getParameter("User");
String pass = request.getParameter("Pass");
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	
	<!-- 원하는 것을 출력해줍니다. -->
	입력한 아이디 : <%=name %>
	<br/>
	입력한 패스워드 : <%=pass %>
	
</body>
</html>