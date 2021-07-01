<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록 화면</title>
</head>
<body>

<!-- 사번 / 이름 / 월급 / 업무를 입력받는 화면을 만들어주세요 -->

<!-- 

내가 만든 화면

<form>

	사번 : <input type="text" id="eno"> <br>
	이름 : <input type="text" id="ename"> <br>
	월급 : <input type="text" id="salary"> <br>
	업무 : <input type="text" id="job"> <br>
	
	<input type="button" value="등록" id="register">

</form>

 -->
 
 
 
<!-- 배현호씨가 만든 화면 -->
<!-- 반드시 form 태그 안에 있을 때에만 사용자 입력값을 서버로 전송받을 수 있다. -->
<!-- 서버로 넘어갈 때에는 반드시 name이 있어야 한다. -->
<!-- 서버로 데이터를 보내서 넘어갈 때 name을 쓴다. -->
<form method="post" action="saveEmp.jsp">
<table>
	<tr>
		<td><label for="eno">사번</label></td>
		<td><input type="text" id="eno" name="eno" placeholder="사번" required ></td>
	</tr>
	<tr>
		<td><label for="ename">이름</label></td>
		<td><input type="text" id="ename" name="ename" placeholder="이름" required></td>
	</tr>
	<tr>
		<td><label for="salary">월급</label></td>
		<td><input type="text" id="salary" name="salary" placeholder="월급" required></td>
	</tr>
	<tr>
		<td><label for="job">직업</label></td>
		<td><input type="text" id="job" name="job" placeholder="직업" required></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value ="입력"><input type="reset" value ="초기화"></td>
	</tr>
</table>
</form> <!-- // 이거 없어서 그런것 같습니다. 정성님 감사...!!ㅠㅠ -->





</body>
</html>