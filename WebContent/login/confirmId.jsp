<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="USER1.UserDAO" %>
<%@ page import="java.net.URLEncoder"%>

<script type="text/javascript">
function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    opener.document.userInfo.idDuplication.value ="idCheck";
 
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
}    
</script>

<%
	request.setCharacterEncoding("UTF-8"); 
	String id = request.getParameter("name");
	System.out.println(id);
	String encodeId= URLEncoder.encode(id,"UTF-8");
	UserDAO dao = new UserDAO();
	boolean result = dao.confirmId(id);
	
	if(result) { %>
		<center>
		<br/><br/>
		<h4>이미 사용중인 ID 입니다.</h4>
		</center>
	<% } else { %>
		<center>
		<br/><br/>
		<h4>입력하신 <%=id %>는 사용 가능합니다.</h4>
		<input id=useBtn type="button" value="사용하기" onclick="sendCheckValue()">
		</center>	
	<% } %>