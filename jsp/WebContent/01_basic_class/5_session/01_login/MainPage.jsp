<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 반드시 로그인을 해야지만 메인페이지로 넘어갈 수 있도록 만들어주세요.

	//# 1."id"로 저장된 세션값을 얻어온다.
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	
	// 세션에서 id값을 가져옵니다.
	// 변수에 넣어주는데, 자료형은 Object를 써줍니다.
	// session은 무조건 Object로만 받을 수 있습니다.
	Object obj = session.getAttribute("id");
	
	// id가 없다면....
	if (obj == null)
	{
		// 로그인창으로 보내!
		response.sendRedirect("LoginForm.jsp");
		return;
	}
	// null이 아니면 if문 밖으로 나온다.
	// 세션에서 받아온 id값을 변수에 넣어주고
	// 이따 아래에서 로그인에 성공하면 인사문구에 써준다.
	String id = (String)obj;
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	<%=id %>님, 로그인 중입니다.
	<!-- 위에서 선언한 변수 id -->

</body>
</html>