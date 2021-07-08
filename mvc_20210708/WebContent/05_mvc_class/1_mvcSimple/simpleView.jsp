<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
	// **************************************
	// request 객체에 저장한 것을 얻어올 때
	// setAttribute로 저장한 것을 가져온다.
	// setAttribute는 서블릿에 저장되어 있다.
	// 서블릿에 다녀와야하는 구조다.
	// **************************************
	Object obj = request.getAttribute("param");
	// 자료형 Object
	// **************************************
	// 이전화면에서 넘겨받는 파라메터
	String str = request.getParameter("type");
	// 자료형 String
	// **************************************
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 메인이라네 </title>
</head>
<body>
	
		<%=str %> 겟파라메터값<br>
		<%=obj %> 겟어트리뷰트값<br/>
		복잡하다고 지나친 좌절과 놀람은 금물입니다. <br/><br/>
		<img src="05_mvc_class/1_mvcSimple/imgs/sponge_1.JPG"/><br/><br/>
		<!-- MVC 패턴을 썼을 경우 상대경로의 중심기준 : URL 기준! -->
		<!-- 이미지 소스 경로의 상대경로를 예전처럼 생각하면 안된다. -->
		
		<!-- MVC패턴을 사용하면 경로를 잡는 것이 가장 어렵다. -->
		
		<!-- 이미지를 절대경로로 변경하면?? -->
		<img src="/jsp/05_mvc_class/1_mvcSimple/imgs/sponge_1.JPG"/><br/><br/>
		<!-- 
		start.jsp에서 
			Model 1 방식을 사용했을 때
				이미지 소스가 상대경로 : 그림 X
				이미지 소스가 절대경로 : 그림 O
			MVC 패턴을 사용했을 때
				이미지 소스가 상대경로 : 그림 O
				이미지 소스가 절대경로 : 그림 O
		-->
		
</body>
</html>