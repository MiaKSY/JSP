<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 임포트하기!! 자바가족들이랑 우리가 만든 샘플폴더들 -->
<%@ page import='java.util.*' %>
<%@ page import='sample.*' %>
    
<!-- 위에서 임포트한 우리의 샘플폴더들 중 우리가 필요한 부분을 변수로 설정한다. -->
<!-- 
	 그런데
	 EmpDAO dao = new EmpDAO();
	 이 부분을 그냥 이렇게 쓰지 않고, 
	 싱글톤 패턴으로 만들거다. 그 이유는?
	 왜 싱글톤 패턴으로 쓸까여?
	 우리의 서버는 하나인데, 하나의 서버에 한번에 100명, 10000명이 접속한다!
	 메모리에 100개 10000개가 뜨게 하지 않고
	 메모리에 딱 하나만 띄우게 하기 위해서다.
	 new를 하는 순간, EmpDAO.java에 있는 드라이버 로딩하는 생성자 함수가 실행된다.
	 생성자 함수를 못 부르게 막아버리자. 
	 어떻게? private로! 
	 생성자함수는 EmpDAO.java에서만 볼 수 있게 되었다.
	 -->
<%
	// 싱글톤 패턴이 아닐경우
	// EmpDAO dao = new EmpDAO();
	// 싱글톤 패턴일 경우
	EmpDAO dao = EmpDAO.getInstance();
	List<EmpVO> list = dao.selectEmp();
%>
    

<!-- 웹에서 표현될 부분 -->    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원목록보기</title>
</head>


<body>

<!-- 사원테이블을 볼 테이블을 만든다. -->
<table border='2'>

	<!-- 테이블 맨 윗줄 부분 -->
	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>매니저</td>
		<td>업무</td>
	</tr>
	
	<!-- SQL에서 가져온 부분들을 표현할 테이블 아랫부분 -->
	<!-- 향상된 for문으로 가져온다. -->
	<!-- html태그 부분은 그냥 쓰면 되고 -->
	<!-- 자바 문법은 < %  % > 이런 친구들을 써주어한다. -->
	<% for(EmpVO vo : list){ %>
	<tr>
		<td><%=vo.getEno()%></td>
		<td><a href="viewEmp.jsp?eno=<%=vo.getEno()%>"><%=vo.getEname()%></a></td> 
		<!-- 이름에 하이퍼링크를 하나 달았다. -->
		<!-- 이름을 클릭했을때 viewEmp.jsp를 불러올거에요 -->
		<!-- 그런데 나 자신에 대해서만 불러올거에여 -->
		<!-- 나 자신을 식별하기 위해서 사원번호를 가져왔다. -->
		<!-- 만약에 사원번호를 가져오지 않고 매니저 번호를 가져오게 되면 나의 매니저를 불러오게 된다. -->
		<!-- 뒤에 물음표하나찍고, eno를 걸어준다. -->
		<!-- 물음표를 찍은 이유는? 우리가 method="get"으로 가져와서 그런거다! -->
		<!-- url뒤에 ? 를 찍고 변수이름=값 과 같은 방식! -->
		<!-- 잘 실행되려나 보려면, 굳이 하이퍼링크를 클릭해볼 필요는 없고, 살짤 손가락만 갖다대면 왼쪽 하단에 eno 값이 다들 바뀌는지 확인해보면 된다. -->
		<td><%=vo.getManager()%></td>
		<td><%=vo.getJob()%></td>
	</tr>
	<% } // end of for %>

</table>



</body>
</html>