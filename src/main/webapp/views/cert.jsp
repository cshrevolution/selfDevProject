<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/views/common/header.jsp" %>
  <title>인증 기능</title>
  <style>
    @font-face{font-family:'BMJUA';src:url('../fonts/BMJUA_ttf.ttf') format('truetype')}
    *{font-family:'BMJUA',sans-serif;box-sizing:border-box;margin:0;padding:0}
    body{background:#f7f7f7;padding:30px}
    .container{max-width:500px;margin:auto;text-align:center}
    h2{margin-bottom:20px}
    .mission{background:rgba(153,153,156,0.9);border-radius:20px;padding:30px;margin-bottom:20px}
    .mission p{font-size:1.1em}
    .btn{padding:10px 20px;border:none;border-radius:8px;background:#fff;cursor:pointer;transition:background .2s}
    .btn:hover{background:#e0e0e0}
	
  </style>
</head>
<body>
	<!-- 메인으로 돌아가기 버튼 -->
	<button class="btn-back"
	        onclick="location.href='${pageContext.request.contextPath}/main'">
	  메인으로
	</button>
  <div class="container">
    <h2>오늘의 미션</h2>
    <div class="mission">
      <p>“오늘 5km 걷기”</p>
    </div>
    <button class="btn" onclick="location.href='mission_complete.jsp'">
      미션 인증하기
    </button>
  </div>
</body>
</html>
