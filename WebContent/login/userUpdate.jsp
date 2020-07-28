<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="USER1.UserDAO" %>


<%
	
	request.setCharacterEncoding("UTF-8");
	String password = request.getParameter("password");
	String user_num = (String)session.getAttribute("userID");


	
	UserDAO dao = new UserDAO();
	dao.update(user_num, password);
	
	response.sendRedirect("../search/main.jsp");



%>