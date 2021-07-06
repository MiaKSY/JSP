<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 삭제할 글번호를 넘겨받기
	String messageId = request.getParameter("messageId");
	
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
	메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	
	<!-- 잘 모르겠으면 method="post"를 method="get"로 바꿔서 url 확인! -->
	<!-- password를 받아서 해당 password인 모든 게시글들을 지우는 것이 아니라 -->
	<!-- 글번호! 가 일치하는 게시글을 지워야한다. -->
	<form action="deleteConfirm.jsp" method="post">
		<!-- 사용자가 보지 못 하게 하는 form태그 하나 생성 -->
		<!-- 그리고 messageId 값 가져오기 -->
		<input type='hidden' name='messageId' value='<%=messageId %>'>
		암호 : <input type="password" name="password" />
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>