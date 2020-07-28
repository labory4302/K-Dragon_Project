<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="FamousRest.FamousRestDao" %>
<%@ page import="FamousRest.ReviewVo" %>
<%@ page import="FamousRest.ReviewDao" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if(session.getAttribute("userID") != null ){
		userID = (String) session.getAttribute("userID");
	}

	Long restNo = Long.parseLong(request.getParameter("restNo"));
	String search = request.getParameter("search");
	String encodeSearch= URLEncoder.encode(search,"UTF-8");
	String category = request.getParameter("category");
	String encodeCategory= URLEncoder.encode(category,"UTF-8");
	String deliveryStatus = request.getParameter("deliveryStatus");
	String encodeDeliveryStatus= URLEncoder.encode(deliveryStatus,"UTF-8");
	String parkingStatus = request.getParameter("parkingStatus");
	String encodeParkingStatus= URLEncoder.encode(parkingStatus,"UTF-8");
	
	String content = request.getParameter("content");
	int userRating =  Integer.parseInt(request.getParameter("userRating"));
	
	ReviewVo vo = new ReviewVo(null, restNo, content, userRating, null, userID);
	
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.insert(vo);
	
	float rating = Float.parseFloat(String.format("%.1f", (float)reviewDao.getReviewsTotalScore(restNo)/(float)reviewDao.getReviewsNumber(restNo)));
	
	FamousRestDao famousRestDao = new FamousRestDao();
	famousRestDao.updateRating(rating, restNo);
	
	response.sendRedirect("reviewForm.jsp?restNo=" + restNo +
						  "&search=" + encodeSearch +
						  "&category=" + encodeCategory +
						  "&deliveryStatus=" + encodeDeliveryStatus +
						  "&parkingStatus=" + encodeParkingStatus);
%>