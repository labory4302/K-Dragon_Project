<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="USER1.UserDAO" %>


<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String password = request.getParameter("userPassword");
	String nick_name = request.getParameter("userName");
	String gender = request.getParameter("userGender");
	String mail = request.getParameter("userEmail");
	
	UserDAO vo = new UserDAO();
	
	vo.join(name, password, nick_name,gender,mail);
	
	response.sendRedirect("login.jsp");
	
%>