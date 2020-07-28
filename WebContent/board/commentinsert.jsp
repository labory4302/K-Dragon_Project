<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="food.commentDAO" %>
<%@ page import="food.commentDAOImpl" %>
<%@ page import="food.commentVO" %>
<%
request.setCharacterEncoding("utf-8");
Long no=Long.parseLong(request.getParameter("no"));
String bcomment=request.getParameter("comment");
String content=request.getParameter("content");
String title=request.getParameter("title");
String name=request.getParameter("userid");
commentDAOImpl dao=new commentDAOImpl();
dao.insert(no,bcomment,name);
pageContext.forward("boardform.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>