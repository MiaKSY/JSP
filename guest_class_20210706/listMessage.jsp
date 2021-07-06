<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
	// 전체 메세지 레코드 검색 
	// 싱글톤
	ListMessageService listmsg = ListMessageService.getInstance();
	List <Message> mList =  listmsg.getMessageList();
	// ▲ 역할을 나누었다. 
	// ▼ 한번에 썼다.
	// List <Message> mList = ListMessageService.getInstance().getMessageList();
 	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
	
		<!-- for문을 쓰는 이유 : list애서 하나하나 가져오기 위해서
			list[1]
			list[2]
			....
			list[i]
		 -->
		<!-- 
			기존 for 문 : 
			for(int i=0; i<mList.size(); i++){
				Message m = (Message)mList.get(i);
			}
		 -->	
	
		<!--
		 향상된 for문 :    
		for(Message m : mList) 
		-->
		<% for(int i=0; i<mList.size();i++) { %>
		<tr>	
			<td> <%=mList.get(i).getMessageId() %></td> 
			<td> <%=mList.get(i).getGuestName() %></td> 
			<td> <a href='deleteMessage.jsp?messageId=<%=mList.get(i).getMessageId() %>'>[삭제하기]</a></td>			
						<!-- 파라메터 만들기 ▲ -->
						<!-- delete는 항상 주의! -->
						<!-- 전부 삭제 X 특정 하나 삭제 O -->
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%=mList.get(i).getMessage() %></textarea>
			</td>
		</tr>
			<% } // end of for %>
	</table>
	

	<% } // end of if-else %>

	<p><a href="insertMessage.jsp">글쓰기</a></p>
</body>
</html> 