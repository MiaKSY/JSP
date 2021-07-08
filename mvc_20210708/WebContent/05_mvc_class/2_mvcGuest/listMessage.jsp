<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.guest.model.*" %>    
<%@ page import="java.util.List" %>
 
<%
	// Control에서 param에 저장한 mList 변수에 지정
	List <Message> mList = (List <Message>)request.getAttribute("param");  
    // request로 가져온 것의 자료형은 Object, 형변환 시켜줍니다.
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 2 </title>
</head>
<body>
	
	<!-- 아래 하이퍼링크를 서블릿에 가서 진짜로 지정 -->
	<a href="GuestControl?cmd=input-form">방명록 남기기 </a><br/><br/>
	<!--      서블릿에서 지정한 이름?경로=내 마음대로 이름 -->
	
	<% if( mList == null ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for( Message msg : mList ) { %>
		<tr>	
			<td> <%= msg.getMessageId()%> </td> 
			<td> <%= msg.getGuestName() %></td> 
			<td> <a href="GuestControl?cmd=delete-form&messageId=<%=msg.getMessageId()%>"> [ 삭제하기 ]</a> </td>			
	<!--      서블릿에서 지정한 이름?경로=내 마음대로 이름 &(연결) 생성할 이름=가져올값 -->
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= msg.getMessage() %>
			</textarea>
			</td>
		</tr>
		<% } %>
	</table>
	
 
	<% } // end if-else %>
</body>
</html>