
<!-- contentType : 파일 형식을 의미한다. -->
<!-- language="java"는 생략해주어도 된다. JSP는 어차피 자바언어니까. 그리고 안 써줘도 어차피 디폴트값이라서 상관없다. -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%! String name = "홍길자"; %>
<!-- 위와 아래, 이 두개의 차이는 무엇일까요? -->
<% String msg = "오늘도 화이팅!!!"; %>





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스란?</title>
</head>
<body>

<!-- 위에서 선언한 변수들을 확인해봅시다. 어떤 차이가 있을까요 -->
<%=name %>님, <%=msg %>

<!--

인덱스는 가장 첫 페이지 입니다.

ctrl + F11

url확인해봅시다!

http://localhost:8082/jsp/index.jsp
					(jsp : 프로젝트이름)
					(index.jsp : 파일이름)
					
** URL 간간하게 만들기 대작전! ** 

localhost, IP주소 등은 나중에 어디에 서버를 연결하는지의 문제

여기서 index.jsp을 생략하면?
생략해도 문제없다!
왜?
WEB-INF 폴더안에 web.xml 파일을 열어서, 거기서 source를 확인해보자.
<welcome-file>index.jsp</welcome-file>
요것이 있어서 그랬다.
나머지는  지금 쓰지않는다면 지워줘도 상관없다.

하단 servers에서 '톰캣 버전 서버~' 를 더블클릭해준다.
여기서 ports
port번호가 충돌나면 바꾸어 줄 수도 있고
port번호 80으로 지정하면, 포트번호 생략이 가능하다.
우리가 평소 인터넷을 할 때, url에 포트번호가 없는 이유는 포트번호 80은 생략가능이었기 때문!

Modules에서 /JSP를 찾아서 Edit을 누르고 Path에 /JSP를 지워주고 / 만 써주면 url에 JSP를 안 써줘도 된다.

탐색기에서 나의 작업경로를 찾아봅시다.
워크스페이스에서 .metadata  . plugins  
폴더 앞에 점.이 있는거는 뭐에여?
리눅스로 넘어갔을 때, 점. 으로 시작하는 것은 숨김이 된다.
그래서 앞에 점.이 있어요

경로를 확인해봅시다

C:\zzz\workspace\eclipse_jquery_2021.07.02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\jsp\org\apache\jsp

여기 들어가보면, 우리가 작성한 jsp 파일이 java 문장으로 번역된 것을 확인할 수 있습니다.

-->

</body>
</html>