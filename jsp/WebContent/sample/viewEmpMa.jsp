<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='java.util.*' %>
<%@ page import='sample.*' %>

<%
	// 이부분이 제일 중요한데....
	// eno 값을 가져올것이다.
	// 어떻게 가져올까? 파라메터
	// get 방식 
	// 클라이언트  ----- request ---->  서버
	// 클라이언트  <---- responset ---  서버
	// 지금은 request를 쓴다!
	// 서버에 요청을 한다. eno의 파라메터를 가져오고싶어요. 
	// request.getParameter("eno");
	// 그것을 변수에 넣어준다.	
	String eno = request.getParameter("eno");
	// 이전 화면에서 넘겨주는 (파라메터) 값을 받기
	
	// DAO에 viewEmp()호출
	EmpDAO dao = EmpDAO.getInstance();
	EmpVO vo = dao.viewEmp(eno);
%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>특정사원목록보기</title>
</head>


<body>

<!-- [*] 아래 화면에 해당 사원의 각각의 정보를 출력 -->


사번      : <%=vo.getEno() %>
사원명    : <%=vo.getEname() %>
업무      : <%=vo.getJob() %>
매니저    : <%=vo.getManager() %>
고용일    : <%=vo.getHiredate() %>
급여      : <%=vo.getSalary() %>
커미션    : <%=vo.getCommission() %>
부서번호  : <%=vo.getDno() %>

 
 
<br>
<br> 
 
 

<table border='2'>

	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>업무</td>
		<td>매니저</td>
		<td>고용일</td>
		<td>급여</td>
		<td>커미션</td>
		<td>부서번호</td>
	</tr>
	
	
	<tr>
		<td><%=vo.getEno()%></td>
		<td><%=vo.getEname() %></td> 
		<td><%=vo.getJob()%></td>
		<td><%=vo.getManager()%></td>
		<td><%=vo.getHiredate()%></td>
		<td><%=vo.getSalary()%></td>
		<td><%=vo.getCommission()%></td>
		<td><%=vo.getDno()%></td>
	</tr>

</table>

<a href='deleteEmp.jsp?eno=<%=vo.getEno()%>'>삭제</a><br>
<a href='modifyFormEmp.jsp?eno=<%=vo.getEno()%>'>수정</a><br>



</body>
</html>