<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-image:url('../images/aa222.jpg');
background-size: cover;
}
.font{
font-family:'Nanum Pen Script', cursive; 
font-weight: bold;
font-size: 40pt;
color: black;
}
.font2{
font-size:14pt;
color: black;
font-weight: bold;


}
#chet_form{
border-style: solid;
width: 280px;
position: fixed;
left: 100%;
top: 30%;
margin-left: -300px;
}

</style>
</head>
<body>
<%		
		String userID = null;
		if(session.getAttribute("userID") != null ){
			userID = (String) session.getAttribute("userID");
		}
	%>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="../search/main.jsp" _msthash="238680" _msttexthash="28185131">맛집탐방</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation" _msthidden="A" _msthiddenattr="204581" _mstaria-label="320099">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample05">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active" width =20%>
        <a class="nav-link" href="../search/main.jsp"><font _mstmutation="1" _msthash="699582" _msttexthash="4991896">main </font><span class="sr-only" _msthash="1019902" _msttexthash="11687494">(현재)</span></a>
      </li>
      <li class="nav-item" width =20%>
        <a class="nav-link" href="../board/view.jsp" _msthash="699998" _msttexthash="9876347">board</a>
      </li>
      <li class="nav-item" width =20%>
        <a class="nav-link" href="../ladder/ladder.jsp" _msthash="699998" _msttexthash="9876347">game</a>
      </li>
	</div>
	 <% 
    	if (userID==null){
    %>
			<ul class="navbar-nav mr-auto">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" style="color: white">접속하기</a>
					<ul class="dropdown-menu">
						<li><a href="../login/login.jsp">로그인</a></li>
						<li><a href="../login/join.jsp">회원가입</a></li>

					</ul></li>
			</ul>

			<%
				} else {
			%>
			
			<ul class="navbar-nav mr-auto">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" style="color: white">회원관리</a>
					<ul class="dropdown-menu">
						<li><a href="../login/logoutAction.jsp">로그아웃</a></li>
						<li><a href="../login/checkPwForm.jsp">정보수정</a></li>
					</ul></li>
			</ul>

			<%
				}
			%>
</nav>
		<div style = "text-align:center">
		<label class="font">우리 주변 맛집은</label><br><label class ="font">내가 찾아줄게</label>
		</div>
		<form action= "showFamousRestsForm.jsp" method="post">
			<div class="container">
				<div class="row" style=" width: 400px; left: 50%; margin-left: -150px; position:absolute;">
					<input type="text" placeholder="지역,식당,음식,상호명" style="width: 250px; height: 30px;" name="search">
					<input type="submit" class="btn btn-dark" style = "color: white;" value="검색">
				</div>
			</div>
			
			<br><br>
			
			<div  style = "text-align:center">
			<label class="font">오늘 난 뭘 먹고싶지?</label>
			</div>
				
			<div class="container" style="border:3px solid black; width:500px;height:150px; background-color: white;">
				<div class="row" style=" width: 400px; left: 50%; margin-left: -150px; position:absolute;">
					<div style=" width: 400px; left: 20%; margin-left: -150px; margin-top:0px; position:absolute;">
					<label class="font2" for = "category">분류 : </label>
						<input type = "radio" name = "category" value = "한식"> 한식   
						<input type = "radio" name = "category" value = "중식"> 중식
						<input type = "radio" name = "category" value = "양식"> 양식
						<input type = "radio" name = "category" value = "일식"> 일식
						<input type = "radio" name = "category" value = "분식"> 분식
						<input type = "radio" name = "category" value = "디저트"> 디저트 <br>
					<label class="font2" for = "deliveryStatus"><br>배달 : </label>
						<input type = "radio" name = "deliveryStatus" value = "가능"> 가능
						<input type = "radio" name = "deliveryStatus" value = "불가"> 불가 <br>
					<label class="font2" for = "parkingStatus"><br>주차 : </label>
						<input type = "radio" name = "parkingStatus" value = "가능"> 가능
						<input type = "radio" name = "parkingStatus" value = "불가"> 불가 <br>
					</div>
					<div style="width: 400px; left: 50%; margin-left: -150px; position:absolute; margin-top: 100px; padding-left: 180px;">	
					<input type="submit" class="btn btn-dark" style = "color: white; width:55px;"  value="검색">
					<input style="text-align:center; width:65px;color: white;" type="reset" class="btn btn-dark"  value="초기화">
					</div>
				</div>
			</div>
		</form>

 <!-- 애니매이션 담당 JQUERY -->
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <!-- 부트스트랩 JS  -->
 <script src="../js/bootstrap.js"></script>
 <%if(userID!=null){ %>
 	<div id="chet_form">
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<textarea id="messageTextArea" rows="10" cols="35"></textarea>
		<br />
		<form>
		<!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->

		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="전송" type="button">
		<!-- WebSocket 접속 종료하는 버튼 -->

		<p id="chetmember_num"></p>

	</form>
	</div>
	<script type="text/javascript">
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		var chetmember_num = document.getElementById("chetmember_num");
		// 웹 소켓 접속 함수, url 뒤의 파라미터는 callback 함수를 받는다.
		function connectWebSocket(url, message, open, close, error) {
			// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
			let webSocket = new WebSocket(url);
			// 함수 체크하는 함수
			function call(cb, msg) {
				// cb가 함수 타입인지 확인
				if (cb !== undefined && typeof cb === "function") {
					// 함수 호출
					cb.call(null, msg);
				}
			}
			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function() {
				// callback 호출
				call(open);
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function() {
				// callback 호출
				call(close);
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function() {
				// callback 호출
				call(error);
			};
			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(msg) {
				// callback 호출
				call(message, msg);
			};
			// 웹 소켓 리턴
			return webSocket;
		}
		// 연결 발생 때 사용할 callback 함수
		var open = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "채팅 접속 완료...\n";
		}
		// 종료 발생 때 사용할 callback 함수
		var close = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "채팅 접속 불가...\n";
			// 재 접속을 시도한다.
			setTimeout(function() {
				// 재접속
				webSocket = connectWebSocket(
						"ws://192.168.0.21:8088/FamousRest/broadsocket",
						message, open, close, error);
			});
		}
		// 에러 발생 때 사용할 callback 함수
		var error = function() {
			messageTextArea.value += "error...\n";
		}
		// 메세지를 받을 때 사용할 callback 함수
		var message = function(msg) {
			// 콘솔 텍스트에 메시지를 출력한다.
			var msgdata_split = msg.data.split("||");
			messageTextArea.value += msgdata_split[0] + "\n";
			chetmember_num.innerText = "현재 접속 자 수는 " + msgdata_split[1] + 
										"명 입니다";

		};
		// 웹 소켓 생성, 소켓을 여는 서버의 IP 주소와 톰캣 서버 포트 넣어줘야 합니다.
		var webSocket = connectWebSocket(
				"ws://192.168.0.21:8088/FamousRest/broadsocket", message,
				open, close, error);
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			//var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "<%=session.getAttribute("userID")%>" + "(사용자) => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + "<%=session.getAttribute("userID")%>" + "}}" + message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
	</script>
	<%} %>
</body>
</html>