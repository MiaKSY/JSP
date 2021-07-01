<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 임포트해주고 -->
<%@ page import="java.util.*" %> 
<%@ page import="sample.* "%>


<!-- 자바 코드 씁니다 -->
<%
	
	// 클라이언트가 있고, 서버가 있다.
	
	// 클라이언트  ----- request ---->  서버
	// 클라이언트  <---- responset ---  서버
	
	// request와 responset을 구별합시다!
	
	// 단계 : 
	// 1. 이전 화면에서 사용자의 입력값을 얻어오기		
	// 2. 입력값을 VO객체의 변수로 지정하기	
	// 3. DAO의 insert함수를 호출
	
	
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	
	
	
	// 1. 이전 화면에서 사용자의 입력값을 얻어오기
	// (이전화면 : insertFormEmp.jsp)
	// ***************************************************
	// 여기서 진짜 진짜 진짜 중요한 것은
	// 우리가 form 태그 안에 각각 name 값으로 지정해 준 그 친구들을 가져와야 한다.
	// 대소문자 하나라도 다르면 안된다.
	// 근데 보통을 헷갈리니까 id값, name값을 똑같게 지정해준다.
	// ***************************************************
	// 입력값 가져온 후에, 변수에 지정해주어야한다.
	// 사번
	String eno = request.getParameter("eno");
	// 사원명
	String ename = request.getParameter("ename");
	// 월급
	String salary = request.getParameter("salary");
	// 직업
	String job = request.getParameter("job");	
	
	
	
	// 2. 입력값을 VO객체의 변수로 지정하기
	EmpVO vo = new EmpVO();
	
	// 사번
	// url, 파라메터로 얻어온 값들은 전부 String이다.
	//형변환
	vo.setEno(Integer.parseInt(eno));
	// 사원명
	vo.setEname(ename);
	// 월급
	vo.setSalary(Integer.parseInt(salary));
	// 직업
	vo.setJob(job);
	
	
	
	// 3. DAO의 insert함수를 호출
	EmpDAO dao = EmpDAO.getInstance();
	dao.insertEmp(vo);
	
	

	// 입력하자마자 전체 목록 보기로 페이지 변경하는 코드
	// 주의, 여기서는 response를 썼다. (아까 위에는 request)
	response.sendRedirect("selectEmp.jsp");

	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

입력되었습니다.

</body>
</html>