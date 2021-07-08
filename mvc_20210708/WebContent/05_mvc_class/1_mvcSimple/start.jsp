<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 변수로 우리의 프로젝트 이름을 저장해줍니다. -->   
<% String prjName = "/jsp"; %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> start.jsp </title>
</head>
<body>

	<!-- 기존방식 : 상대경로 -->
	<a href='simpleView.jsp'>기존방식1</a> <br>
	<!-- 기존방식 : 절대경로 -->
	<a href='/jsp/05_mvc_class/1_mvcSimple/simpleView.jsp'>기존방식2</a> <br>
	<!-- 위에 지정한 변수를 사용하는 방법 -->
	<a href='<%=prjName %>/05_mvc_class/1_mvcSimple/simpleView.jsp'>기존변수방식3</a> <br>
	<!-- 프로젝트에서 경로는 아주 중요하고, 경로를 상대경로로 잡을지, 절대경로로 잡을지는 맞춰야 한다. -->

<!-- 
	MVC 패턴으로 만들어봅시다!
		준비물 : 
			1. 사용자에게 보여주고 싶은 jsp파일
			2. ▲ 위 jsp 파일에 들어갈 수 있도록 링크를 써 준 jsp파일
			3. 서블릿 용도로 사용할 java파일
			4. web.xml(에서 서블릿연결)			

	
	0. 시작페이지.jsp 파일에서 변수로 우리의 프로젝트 이름을 저장해줍니다.
	
	1. Java Resources - src - New - Servlet 생성
		(생성된 자바 파일의 이름을 기억해주세요)
	
	2. 서블릿 용도로 생성한 자바파일에서
		- 주석, 골뱅이(어노테이션), 시리얼번호, 내용 전부 지워주세요
		- 심플한 생성자 함수
		- get 방식이 불려와도, post 방식이 불려와도 똑같이 processRequest함수를 불러올 겁니다.
		- processRequest함수 안에 경로를 정확히 맞춰주세요!
		
	3.웹 인포 밎에 web.xml
	(xml : 프로그램 설정 파일. 점. 하나 찍어도 톰캣 자체가 구동이 안 된다. **주의**)
	<servlet-class> 는 서블릿 용도로 만든 자바 클래스가 들어있는 패키지명.자바클래스 입니다.
	(헷갈리지 않도록) 서블릿용도로 만든 자바 클래스 이름과 네임을 같게 설정하고, 
	(필수로) <servlet>과 <servlet-mapping>의 <servlet-name>을 일치시켜줍니다. 
	<servlet-mapping> 안에 <url-pattern>은 여러개여도 상관이 없습니다.
	<url-pattern>을 지정해주는 방법은 1. 슬래시/값  2. *.확장자  
			(확장자는 아무거나로 하면 된다. 보통 do를 많이 쓴다.)
			(서로 다른 서블릿일 때, 확장자 이름은 달라야 합니다!)
	1. 슬래시/  로 했을 때 : 프로젝트명/값 으로 출력
	2. *.확장자 로 했을 때 : 프로젝트명/아아무무거거나나.확장자 로 출력
	
	4. start.jsp로 돌아온다.
	변수로 만든 프로젝트 이름/서블릿용도로 만든 자바 클래스 이름 
	의 형식으로 MVC 패턴을 완성해줍니다.
-->
	<hr>
	<a href='<%=prjName %>/sc'> MVC 방식 </a> <br>
	<!-- ▲ '안녕하세요'가 출력되었다. -->
	<!-- 파라메터 변경도 가능하다. -->
	<!-- ▼ '아무개님 화이팅'이 출력되었다. -->
	<a href='<%=prjName %>/sc?type=first'> MVC 방식 </a> <br>
	<a href='<%=prjName %>/kosmo.ksy?type=first'> MVC 방식 </a>
	
</body>
</html>



