<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="food.boardDAO" %>
<%@ page import="food.boardDAOImpl" %>
<%@ page import="food.boardVO" %>
<%
request.setCharacterEncoding("utf-8");
Long no=Long.parseLong(request.getParameter("no"));
String content=request.getParameter("content");
String title=request.getParameter("title");
String name=(String)session.getAttribute("userID");

boardDAOImpl dao=new boardDAOImpl();
int num=dao.likecheck(no, name);
if(num==0){
	dao.likeup(no,name);
	pageContext.forward("boardform.jsp");
}

else{
	dao.likedelete(no,name);
	pageContext.forward("boardform.jsp");
}
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