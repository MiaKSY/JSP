<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page import="member.beans.*" %>  
  
<%
	// url에서 가저오는 값이다. 그 url에 있는 것과 완전히 똑같아야 한다.
	String id = request.getParameter("userId");
	MemberDao dao = MemberDao.getInstance();
	boolean result = dao.isDuplicatedId(id); //중복이 되었는지 물어봅니다. 자료형은 boolean
%>
  
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<%
	if( result == true ) {
%>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>
</body>
</html>