<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- sample 패키지에 있는 모든 클래스 가져올게요 -->    
<%@ page import='sample.*' %>    
    
    
<%

// 1. 삭제할 사번을 넘겨받기
								// 반드시 소문자
								// viewEmp에서 하이퍼링크를 적을때
								// ?eno=
								// 이라고 쓴 부분이 있는데 그 부분하고 일치시켜주어야 한다.
	String eno = request.getParameter("eno");
	//변수로 안담으면 저장이 안된다.

// 2. DAO의 deleteEmp() 호출시 사번을 넘겨주기
	EmpDAO dao = EmpDAO.getInstance();
	// 객체가 아닌 클래스명으로 접근이 가능한 이유는 : static으로 선언했었기 때문이다.
	int result = dao.deleteEmp(eno);
	// 주의! 변수에 담아두자
	
	if( result > 0 ){
		// 화면 변경하기
		// 삭제를 한 후에, 목록보기 페이지로 넘어갈래여 
		response.sendRedirect("selectEmp.jsp");
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보삭제</title>
</head>
<body>

</body>
</html>