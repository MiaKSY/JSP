<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 하나씩 천천히 도전합시다 -->
<!-- 잊지 말자 임포트 -->
<%@ page import="member.beans.*" %>

<!-- 한글처리 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 				   class 여기에 패키지 이름부터 적었기 때문에, 
					   위에서 페이지 임포트를 해주지 않아도 된다. -->
<jsp:useBean id="haha_bean" class="member.beans.Member">
	<jsp:setProperty name="haha_bean" property='*'/>
	<!-- property='*' : 해당하는 멤버변수 알아서 각자 들어갑시다. -->
</jsp:useBean>

<%
	// private 해서 객체를 만들지 못 하게 만든것이라도, 뭐라도 객체를 만들 수 있는 방법이 있다.
	// MemberDao dao = new MemberDao();
	MemberDao dao = MemberDao.getInstance();
	dao.insertMember(haha_bean);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
</head>
<body>
	아이디 : <%=haha_bean.getId() %><br>
	패스워드 : <%=haha_bean.getPassword() %><br>
	이름 : <%=haha_bean.getName() %><br>
	전화 : <%=haha_bean.getTel() %><br>
	주소 : <%=haha_bean.getAddr() %><br>
</body>
</html>