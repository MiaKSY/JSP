<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  
 
 
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");
 %>
 
 
 
  <!-- 액션태그) Model 1 방식 -->
 <!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>   
 
 <%
	Comment com = new Comment();
 	com.setCommentNo(comment.getCommentNo());
 	com.setUserId(comment.getUserId());
 	com.setCommentContent(comment.getCommentContent());
 	com.setRegDate(comment.getRegDate());
 %> 
 
 


 
  
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정확인</title>
</head>
<body>


잘 수정되었나 확인



<a href="listComment.jsp"><p>목록보기</p></a>

</body>
</html>